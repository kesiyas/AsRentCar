package com.kesiyas.spring.AsRentCar.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/rent/user")
public class UserController {
	
	@GetMapping("/signup/view")
	public String signup() {
		
		return "rent/user/signup";
	}

	@GetMapping("/signin/view")
	public String signin() {
		
		return "rent/user/signin";
	}
	
	@GetMapping("/signout")
	public String singout(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("userId");
		session.removeAttribute("loginId");
		
		return "redirect:/rent/user/signin/view";
	}
}
