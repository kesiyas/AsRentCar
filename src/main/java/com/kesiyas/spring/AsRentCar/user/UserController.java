package com.kesiyas.spring.AsRentCar.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kesiyas.spring.AsRentCar.user.admin.model.Branch;

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
	
	// 비밀번호 변경
	@GetMapping("/pw_update/view") 
	public String updatePassword() {
		
		return "rent/user/updatedPsw";
	}
	
	
	// 메인 화면
	@GetMapping("/home/view")
	public String home() {
		
		return "rent/user/home";
	}
	
}
