package com.kesiyas.spring.AsRentCar.rentcar.bo;

import java.util.Date;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kesiyas.spring.AsRentCar.rentcar.dao.RentcarDAO;
import com.kesiyas.spring.AsRentCar.rentcar.model.DetailReservation;
import com.kesiyas.spring.AsRentCar.rentcar.model.Reservation;
import com.kesiyas.spring.AsRentCar.user.admin.dao.AdminDAO;
import com.kesiyas.spring.AsRentCar.user.admin.model.Branch;
import com.kesiyas.spring.AsRentCar.user.admin.model.RentalCar;

@Service
public class RentcarBO {
	
	@Autowired
	private RentcarDAO rentcarDAO;
	
	@Autowired
	private AdminDAO adminDAO;

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
	
	public int addShortRent(Reservation reservation, String reservationNumber) {
		
		Random random = new Random();
		int number = random.nextInt(888) + 111;
		String today = reservationNumber;
		
		reservationNumber = today + number;
		
		while(rentcarDAO.selectReservationNumber(reservationNumber) != 0) {
			reservationNumber = "";
			number = random.nextInt(888) + 111;
			
			reservationNumber = today + number;
		}
		
		reservation.setReservationNumber(reservationNumber);
		
		return rentcarDAO.insertReservation(reservation);
	}
	
	public Reservation reservationConfirm(String reservationNumber, String name, String phoneNumber) {
		
		return rentcarDAO.selectReservation(reservationNumber, name, phoneNumber);
	}
	
	public DetailReservation reservationConfirmById(int reservationId, String centerName) {
		
		DetailReservation detail = new DetailReservation();
		
		Reservation reservation = rentcarDAO.selectReservationById(reservationId);
		
		detail.setReservation(reservation);
		detail.setCenterName(centerName);
		
		return detail;
	}
	
	public Reservation selectIdByUserId(int userId) {
		
		return rentcarDAO.selectIdByUserId(userId);
	}
}
