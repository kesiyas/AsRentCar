package com.kesiyas.spring.AsRentCar.user;

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
}
