package com.kesiyas.spring.AsRentCar.user;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kesiyas.spring.AsRentCar.user.admin.bo.AdminBO;
import com.kesiyas.spring.AsRentCar.user.admin.model.Branch;
import com.kesiyas.spring.AsRentCar.user.admin.model.RentalCar;
import com.kesiyas.spring.AsRentCar.user.bo.EmailService;
import com.kesiyas.spring.AsRentCar.user.bo.UserBO;
import com.kesiyas.spring.AsRentCar.user.model.User;

@RestController
@RequestMapping("/rent/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
	@Autowired
	private AdminBO adminBO;
	
	@Autowired
	private EmailService emailService;
	
	// 회원가입 기능
	@PostMapping("/signup")
	public Map<String, String> addUser(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("email") String email) {
				
		int count = userBO.addUser(loginId, password, name, phoneNumber, email);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	 }
		
	// 아이디 중복 체크
	@GetMapping("/is_duplicate")
	public Map<String, Boolean> is_duplicate(@RequestParam("loginId") String loginId){
		
		Map<String, Boolean> result = new HashMap<>();
		
		if(userBO.is_duplicate(loginId)) {
			result.put("result", true);
		} else {
			result.put("result", false);			
		}
		
		return result;
	}
	
	// 로그인 기능
	@PostMapping("/signin")
	public Map<String, String> signin(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, HttpServletRequest request)	{
		
		HttpSession session = request.getSession();
		
		User user = userBO.signin(loginId, password);
				
		Map<String, String> result = new HashMap<>();
		
		if(user != null) {
			int userId = user.getId();
		
			session.setAttribute("userId", userId);
			session.setAttribute("loginId", loginId);
			
			int count = adminBO.selectAuthority(userId);
			
			if(count == 1) {
				
				Branch branch = adminBO.selectCenterId(userId);		
				session.setAttribute("centerId", branch.getId());
			} else {}	
			
			result.put("result", "success");		
		} else {
			result.put("result", "fail");
		}
		
		return result;
		
	}

	// 아이디 찾기 기능
	@PostMapping("/id_search")
	public Map<String, String> searchId(
			@RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber){
		
		User user = userBO.searchId(name, phoneNumber);
		
		Map<String, String> result = new HashMap<>();
		
		if(user != null) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@PostMapping("/mailCheck")
	public Map<String, String> mailCheck(
			HttpServletRequest request
			, @RequestParam("email") String email) throws UnsupportedEncodingException, MessagingException{
		
		HttpSession session = request.getSession();
		
		int count = userBO.emailChek(email);
		
		Map<String, String> result = new HashMap<>();
		
		if(count != 0) {
			
			String authNum = emailService.createEmailForm(email);
			
			session.setAttribute("authNum", authNum);
			result.put("result", "success");		
		} else {
			
			result.put("result", "fail");
		}
								
		return result;
	}
	
	@PostMapping("/codeCheck")
	public Map<String, String> codeCheck(HttpServletRequest request
			, @RequestParam("code") int code){
		
		HttpSession session = request.getSession();
		int authNum = Integer.parseInt(String.valueOf(session.getAttribute("authNum")));
		
		Map<String, String> result = new HashMap<>();
	
		if(code == authNum) {
			
			result.put("result", "success");
		} else {
			
			result.put("result", "fail");
		}
	
		session.removeAttribute("authNum");
		
		return result;
	}
	
	@GetMapping("/pw_search")
	public Map<String, String> searchPw(HttpServletRequest request
			, @RequestParam("loginId") String loginId){
		
		HttpSession session = request.getSession();
		
		User user = userBO.searchPw(loginId);
		
		Map<String, String> result = new HashMap<>();
		
		if(user != null) {
			
			session.setAttribute("userId", user.getId());
			result.put("result", "success");
		}else {
			
			result.put("result", "fail");
		}
		
		return result;
	}
	
	// 비밀번호 변경
	@PostMapping("/pw_update")
	public Map<String, String> updatePw(HttpServletRequest request,
			@RequestParam("password") String password) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int count = userBO.updatePw(userId, password);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		}else {			
			result.put("result", "fail");
		}
		
		session.removeAttribute("userId");
		
		return result;
	}
	
	@PostMapping("/home/selectCity")
	public Map<String, String> selectCity(@RequestParam("city") String city) {
		
		List<Branch> regionList = userBO.selectCity(city);
		Branch branch = new Branch();
				
		Map<String, String> result = new HashMap<>();
		
		for(int i = 0; i < regionList.size(); i++) {
			branch = regionList.get(i);
			String centerName = branch.getCenterName();
		
			result.put("centerName" + i, centerName);
		}
	
		return result;
	}
	
	@PostMapping("/home/selectCar")
	public Map<String, String> selectCar(
			@RequestParam("centerName") String centerName
			, @RequestParam("carGrade") String carGrade) {
		
		Branch branch = userBO.selectCenterId(centerName);
		int centerId = branch.getId();
		
		List<RentalCar> rentCarList = userBO.selectCar(centerId, carGrade);
		RentalCar rentCar = new RentalCar();
				
		Map<String, String> result = new HashMap<>();
		
		for(int i = 0; i < rentCarList.size(); i++) {
			rentCar = rentCarList.get(i);
			String modelName = rentCar.getModelName();
		
			result.put("modelName" + i, modelName);
		}

		return result;
	}
	
	@PostMapping("/home/saveRev") 
	public Map<String, String> selectCar(
			@RequestParam("sDate") @DateTimeFormat(pattern="yyyy년 MM월 dd일 HH:mm") Date sDate
			,@RequestParam("eDate")  @DateTimeFormat(pattern="yyyy년 MM월 dd일 HH:mm") Date eDate
			,@RequestParam("centerName") String centerName
			,@RequestParam("modelName") String modelName
			,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		Map<String, String> result = new HashMap<>();
		
		if(sDate != null && eDate != null && centerName != null && modelName != null) {
			session.setAttribute("startDate", sDate);
			session.setAttribute("returnDate", eDate);
			session.setAttribute("centerName", centerName);
			session.setAttribute("modelName", modelName);
			
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}

		return result;
	}
}


