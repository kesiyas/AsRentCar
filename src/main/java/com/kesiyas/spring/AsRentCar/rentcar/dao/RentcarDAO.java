package com.kesiyas.spring.AsRentCar.rentcar.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.kesiyas.spring.AsRentCar.user.admin.model.Branch;
import com.kesiyas.spring.AsRentCar.user.admin.model.RentalCar;

@Repository
public interface RentcarDAO {

	public List<Branch> selectCity(@Param("city") String city);
	
	// 차량 선택
	public List<RentalCar> selectCar(
			@Param("centerId") int centerId
			, @Param("carGrade") String carGrade);
	
	// 모든 차량
	public List<RentalCar> selectAllCar(@Param("centerId") int centerId);
	
	// centerId 찾기
	public int selectCenterId(@Param("centerName") String centerName);
	
	public int insertReservation(
			@Param("userId") int userId
			, @Param("rentCenterId") int rentCenterId
			, @Param("startDate") Date startDate
			, @Param("returnDate") Date returnDate
			, @Param("rentCar") String rentCar
			, @Param("name") String name
			, @Param("birth") String birth
			, @Param("phoneNumber") String phoneNumber
			, @Param("address") String address
			, @Param("license") String license
			, @Param("licenseNumber") String licenseNumber
			, @Param("license_IssueDate") String license_IssueDate);
}
