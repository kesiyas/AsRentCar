package com.kesiyas.spring.AsRentCar.user;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/rent/user")
public class UserController {
	
	// 회원가입
	@GetMapping("/signup/view")
	public String signup() {
		
		return "rent/user/signup";
	}

	// 로그인
	@GetMapping("/signin/view")
	public String signin() {
		
		return "rent/user/signin";
	}
	
	// 로그아웃
	@GetMapping("/signout")
	public String singout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("userId");
		session.removeAttribute("loginId");
		
		return "redirect:/rent/user/signin/view";
	}
	
	// 아이디 찾기
	@GetMapping("/id_search/view")
	public String searchId() {
		
		return "rent/user/searchId";
	}
	
	// 비밀번호 찾기
	@GetMapping("/pw_search/view")
	public String searchPassword() {
		
		return "rent/user/searchPsw";
	}
	
}
