package com.kesiyas.spring.AsRentCar.rentcar.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kesiyas.spring.AsRentCar.user.admin.model.Branch;
import com.kesiyas.spring.AsRentCar.user.admin.model.RentalCar;

@Repository
public interface RentcarDAO {

	public List<Branch> selectCity(@Param("city") String city);
	
	// 차량 선택
	public List<RentalCar> selectCar(
			@Param("centerId") int centerId
			, @Param("carGrade") String carGrade);
	
	// centerId 찾기
	public Branch selectCenterId(@Param("centerName") String centerName);
}
