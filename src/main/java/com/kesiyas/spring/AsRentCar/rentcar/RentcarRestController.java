package com.kesiyas.spring.AsRentCar.rentcar;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kesiyas.spring.AsRentCar.rentcar.bo.RentcarBO;
import com.kesiyas.spring.AsRentCar.rentcar.model.Reservation;
import com.kesiyas.spring.AsRentCar.user.admin.bo.AdminBO;
import com.kesiyas.spring.AsRentCar.user.admin.model.Branch;
import com.kesiyas.spring.AsRentCar.user.admin.model.RentalCar;

@RestController
@RequestMapping("/rent/rentcar")
public class RentcarRestController {
	
	@Autowired
	private RentcarBO rentcarBO;
	
	@Autowired
	private AdminBO adminBO;
	
	@PostMapping("/home/selectCity")
	public Map<String, String> selectCity(@RequestParam("city") String city) {
		
		List<Branch> regionList = rentcarBO.selectCity(city);
		Branch branch = new Branch();
				
		Map<String, String> result = new HashMap<>();
		
		for(int i = 0; i < regionList.size(); i++) {
			branch = regionList.get(i);
			String centerName = branch.getCenterName();
		
			result.put("centerName" + i, centerName);
		}
	
		return result;
	}
	
	@PostMapping("/home/selectCar")
	public Map<String, String> selectCar(@RequestParam("centerName") String centerName 
			,@RequestParam("carGrade") String carGrade) {
		
		int centerId = rentcarBO.selectCenterId(centerName);
		
		List<RentalCar> rentCarList = new ArrayList<>();
		
		rentCarList = rentcarBO.selectCar(centerId, carGrade);
				
		RentalCar rentCar = new RentalCar();
				
		Map<String, String> result = new HashMap<>();
		
		for(int i = 0; i < rentCarList.size(); i++) {
			rentCar = rentCarList.get(i);
			String modelName = rentCar.getModelName();

			result.put("modelName" + i, modelName);			
		}
		return result;
	}
	
	@PostMapping("/home/saveRev") 
	public Map<String, String> selectCar(
			@RequestParam("sDate") @DateTimeFormat(pattern="yyyy-MM-dd HH:mm") Date sDate
			,@RequestParam("eDate")  @DateTimeFormat(pattern="yyyy-MM-dd HH:mm") Date eDate
			,@RequestParam("centerName") String centerName
			,@RequestParam("modelName") String modelName
			,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		Map<String, String> result = new HashMap<>();
		
		if(sDate != null && eDate != null && centerName != null && modelName != null) {
			session.setAttribute("startDate", sDate);
			session.setAttribute("returnDate", eDate);
			session.setAttribute("centerName", centerName);
			session.setAttribute("modelName", modelName);
			
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}

		return result;
	}
	
	@PostMapping("/short_rent") 
	public Map<String, Object> addShortRent(
			@RequestParam("startDate") @DateTimeFormat(pattern="yyyy-MM-dd HH:mm") Date startDate
			, @RequestParam("returnDate") @DateTimeFormat(pattern="yyyy-MM-dd HH:mm") Date returnDate
			, @RequestParam("rentCenter") String rentCenter
			, @RequestParam("rentCar") String rentCar
			, @RequestParam("name") String name
			, @RequestParam("birth") String birth
			, @RequestParam("phoneNumber") String phoneNumber
			, @RequestParam("address") String address
			, @RequestParam("license") String license
			, @RequestParam("licenseNumber") String licenseNumber
			, @RequestParam("license_IssueDate") String license_IssueDate
			, @RequestParam("reservationNumber") String reservationNumber
			, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId = (Integer)session.getAttribute("userId");
		
		int rentCenterId = rentcarBO.selectCenterId(rentCenter);
		
		Reservation reservation = new Reservation();
		reservation.setUserId(userId);
		reservation.setStartDate(startDate);
		reservation.setReturnDate(returnDate);
		reservation.setRentCenterId(rentCenterId);
		reservation.setRentCar(rentCar);
		reservation.setName(name);
		reservation.setBirth(birth);
		reservation.setPhoneNumber(phoneNumber);
		reservation.setAddress(address);
		reservation.setLicense(license);
		reservation.setLicenseNumber(licenseNumber);
		reservation.setLicense_IssueDate(license_IssueDate);
	
		int count = rentcarBO.addShortRent(reservation, reservationNumber);
		int reservationId = reservation.getId();
		
		Map<String, Object> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
			result.put("reservationId", reservationId);
		} else {
			result.put("result", "fail");
		}
		return result;	
	}
	
	@PostMapping("/short_rent_confirm")
	public Map<String, Object> reservationConfirm(
			@RequestParam("reservationNumber") String reservationNumber
			, @RequestParam("name") String name
			, @RequestParam("phoneNumber") String phoneNumber) {
		
		Reservation rev = rentcarBO.reservationConfirm(reservationNumber, name, phoneNumber);
		
		Branch branch = adminBO.selectCenterById(rev.getRentCenterId());
		String centerName = branch.getCenterName();
		
		Map<String, Object> result = new HashMap<>();
		
		if(rev != null) {
			result.put("reservationId", rev.getId());
			result.put("centerName", centerName);
		} else {
			result.put("reservationId", null);
		}
		return result;	
	}
	
}
