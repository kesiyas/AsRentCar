package com.kesiyas.spring.AsRentCar.user.admin;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/rent/user/admin")
public class AdminController {
	
	// 관리자 회원가입
	@GetMapping("/signup/view")
	public String adminSignup() {
		
		return "rent/user/admin/signup";
	}
	
	// 지점 등록
	@GetMapping("/branch/view")
	public String branchRegist() {
		
		return "rent/user/admin/branch_registration";
	}
	
	// 지점 차량 등록
	@GetMapping("/car/view")
	public String carRegist() {
		
		return "rent/user/admin/car";
	}
}
