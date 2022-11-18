package com.kesiyas.spring.AsRentCar.rentcar.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kesiyas.spring.AsRentCar.rentcar.model.Reservation;
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
	
	public int insertReservation(Reservation reservation);
	
	public int selectReservationNumber(@Param("reservationNumber") String reservationNumber);

	public Reservation selectReservation(
			@Param("reservationNumber") String reservationNumber
			, @Param("name") String name
			, @Param("phoneNumber") String phoneNumber);
	
	public Reservation selectReservationById(@Param("reservationId") int reservationId);
	
	public Reservation selectIdByUserId(@Param("userId") int userId);
	
}
