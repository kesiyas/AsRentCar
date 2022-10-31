package com.kesiyas.spring.AsRentCar.rentcar.bo;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.annotation.JacksonInject.Value;
import com.kesiyas.spring.AsRentCar.rentcar.dao.RentcarDAO;
import com.kesiyas.spring.AsRentCar.user.admin.model.Branch;
import com.kesiyas.spring.AsRentCar.user.admin.model.RentalCar;

@Service
public class RentcarBO {
	
	@Autowired
	private RentcarDAO rentcarDAO;

	// 지역 선택
	public List<Branch> selectCity(String city) {
		
		return rentcarDAO.selectCity(city);
	}
	
	// 차량 선택
	public List<RentalCar> selectCar(int centerId, String carGrade) {
		
		if(carGrade.equals("전체")) {
			
			return rentcarDAO.selectAllCar(centerId);
		}else {
			
			return rentcarDAO.selectCar(centerId, carGrade);
		}
	}
	
	public int selectCenterId(String centerName) {
		return rentcarDAO.selectCenterId(centerName);
	}
	
	public int addShortRent(
			int userId , int rentCenterId, Date startDate, Date returnDate 
			, String rentCar, String name, String birth, String phoneNumber
			, String address, String license, String licenseNumber, String license_IssueDate, String reservationNumber) {
		
		return rentcarDAO.insertReservation(userId, rentCenterId, startDate, returnDate, rentCar, name, birth, phoneNumber, address, license, licenseNumber, license_IssueDate, reservationNumber);
	}
	
	public boolean is_Duplicate(String reservationNumber) {
		
		return (rentcarDAO.selectReservationNumber(reservationNumber) != 0)?true:false;
	}
}
