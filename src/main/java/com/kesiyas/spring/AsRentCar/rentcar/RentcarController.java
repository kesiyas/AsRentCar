package com.kesiyas.spring.AsRentCar.rentcar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kesiyas.spring.AsRentCar.rentcar.bo.RentcarBO;
import com.kesiyas.spring.AsRentCar.rentcar.model.DetailReservation;
import com.kesiyas.spring.AsRentCar.rentcar.model.Reservation;

@Controller
@RequestMapping("/rent/rentcar")
public class RentcarController {
	@Autowired
	private RentcarBO rentcarBO;
	
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
	
	@GetMapping("/short_rent_info/view") 
	public String rent_confirmInfo(
			Model model
			, HttpServletRequest request
			, @RequestParam(value="reservationId") Integer reservationId
			, @RequestParam("rentCenter") String centerName) {
		
		DetailReservation reservation = rentcarBO.reservationConfirmById(reservationId, centerName);
		
		model.addAttribute("DetailReservation", reservation);
		
		return "rent/rentcar/short_reservation_confirm";
	}
	

}
