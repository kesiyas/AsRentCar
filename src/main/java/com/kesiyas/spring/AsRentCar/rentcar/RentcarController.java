package com.kesiyas.spring.AsRentCar.rentcar;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/rent/rentcar")
public class RentcarController {
	
	// 메인 화면
	@GetMapping("/home/view")
	public String home() {
		
		return "rent/rentcar/home";
	}
	
	// 단기렌터카 예약 화면
	@GetMapping("/short_rent/view")
	public String short_reservation() {
		return "rent/rentcar/short_reservation";
	}
}
