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
	
	// 단기렌터카 예약 화면_제주
	@GetMapping("/short_rent_jeju/view")
	public String short_reservation_jeju() {
		return "rent/rentcar/short_reservation_jeju";
	}
	
	// 단기렌터카 예약 화면_내륙
	@GetMapping("/short_rent_inland/view")
	public String short_reservation_inland() {
		return "rent/rentcar/short_reservation_inland";
	}
	
	@GetMapping("/short_rent_confirm/view")
	public String rent_confirm() {
		return "rent/rentcar/rent_confirm";
	}
}
