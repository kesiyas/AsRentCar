package com.kesiyas.spring.AsRentCar.user.admin;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.kesiyas.spring.AsRentCar.user.admin.bo.AdminBO;
import com.kesiyas.spring.AsRentCar.user.admin.model.Admin;
import com.kesiyas.spring.AsRentCar.user.admin.model.Branch;
import com.kesiyas.spring.AsRentCar.user.model.User;

@RestController
@RequestMapping("/rent/user/admin")
public class AdminRestController {

	@Autowired
	private AdminBO adminBO;
	
	@PostMapping("/signup")
	public Map<String, String> addAdmin(
			@RequestParam("loginId") String loginId
			, @RequestParam("password") String password
			, @RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("email") String email
			, HttpServletRequest request
			, User user) {
		
		String authority = "admin";	
		
		user = new User();	
		user.setLoginId(loginId);
		user.setName(name);
		user.setPhoneNumber(phoneNumber);
		user.setEmail(email);
				
		int addUserCount = adminBO.addAdminUser(user, password);
		
		int adminUserId = user.getId(); 
		int addAdminCount = adminBO.addAdmin(userId, authority);
		
		Map<String, String> result = new HashMap<>();
		
		if(addUserCount == 1 && addAdminCount == 1) {
			Admin admin = new Admin();
						
			HttpSession session = request.getSession();
			session.setAttribute("adminUserId", adminUserId);
			session.setAttribute("authority", admin.getAuthority());
			
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	 }
	
	// 지점 등록
	@PostMapping("/branch")
	public Map<String, String> addBranch(
			@RequestParam("centerName") String centerName
			, @RequestParam("term") String term	
			, @RequestParam("city") String city
			, @RequestParam("address") String address
			, @RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber
			, HttpServletRequest request
			, Branch branch) {
		
		HttpSession session = request.getSession();
		int adminUserId = (Integer)session.getAttribute("adminUserId");
		
		branch = new Branch();
		branch.setUserId(adminUserId);
		branch.setCenterName(centerName);
		branch.setTerm(term);
		branch.setCity(city);
		branch.setAddress(address);
		branch.setName(name);
		branch.setPhoneNumber(phoneNumber);
		
		int count = adminBO.addBranch(branch);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			session.setAttribute("centerId", branch.getId());
			result.put("result", "success");
		}else {			
			result.put("result", "fail");
		}
		
		return result;	
	}
	
	// 지점 차량 등록
	@PostMapping("/car")
	public Map<String, String> addBranch_Car(
			@RequestParam("carGrade") String carGrade
			, @RequestParam("modelName") String modelName
			, @RequestParam("carNumber") String carNumber
			, @RequestParam("modelYear") int modelYear
			, @RequestParam("rentalFee") int rentalFee
			, @RequestParam("file") MultipartFile file
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int adminUserId = (Integer)session.getAttribute("adminUserId");
		int centerId = (Integer)session.getAttribute("centerId");
				
		int count = adminBO.addBranch_Car(adminUserId, centerId, carGrade, modelName, carNumber, modelYear, rentalFee, file);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			
			session.removeAttribute("adminUserId");
			session.removeAttribute("centerId");
			session.removeAttribute("authority");
			result.put("result", "success");			
		}else {			
			result.put("result", "fail");
		}
		
		return result;	
		
	}
}
