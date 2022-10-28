package com.kesiyas.spring.AsRentCar.rentcar.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		
		return rentcarDAO.selectCar(centerId, carGrade);
	}
	
	// 차량 선택
	public List<RentalCar> selectAllCar(int centerId) {
		
		return rentcarDAO.selectAllCar(centerId);
	}
	
	public Branch selectCenterId(String centerName) {
		return rentcarDAO.selectCenterId(centerName);
	}
}
