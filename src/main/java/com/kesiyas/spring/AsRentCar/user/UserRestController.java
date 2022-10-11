package com.kesiyas.spring.AsRentCar.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kesiyas.spring.AsRentCar.user.bo.UserBO;
import com.kesiyas.spring.AsRentCar.user.model.User;

@RestController
@RequestMapping("/rent/user")
public class UserRestController {
	
	@Autowired
	private UserBO userBO;
	
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
		
		User user = userBO.signin(loginId, password);		
		
			
		Map<String, String> result = new HashMap<>();
		
		if(user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("userId", user.getId());
			session.setAttribute("loginId", loginId);
			
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
		
	}

	// 아이디 찾기 기능
	@PostMapping("/id_search")
	public  Map<String, String> searchId(
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
}
