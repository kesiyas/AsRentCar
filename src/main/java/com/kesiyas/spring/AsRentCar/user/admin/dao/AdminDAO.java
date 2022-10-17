package com.kesiyas.spring.AsRentCar.user.admin.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kesiyas.spring.AsRentCar.user.admin.model.Branch;
import com.kesiyas.spring.AsRentCar.user.model.User;

@Repository
public interface AdminDAO {
	
	public int insertAdminUser(User user);
	
	public int insertAdmin(@Param("userId") int userId, @Param("authority") String authority);

	public int insertBranch(Branch branch);
	
	public int insertBranchCar(
			@Param("centerUserId") int centerUserId
			, @Param("centerId") int centerId
			, @Param("carGrade") String carGrade
			, @Param("modelName") String modelName
			, @Param("carNumber") String carNumber
			, @Param("modelYear") int modelYear
			, @Param("rentalFee") int rentalFee
			, @Param("imgPath") String imgPath);
	
}
