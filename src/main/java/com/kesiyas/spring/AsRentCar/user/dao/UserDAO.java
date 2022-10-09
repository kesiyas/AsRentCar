package com.kesiyas.spring.AsRentCar.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kesiyas.spring.AsRentCar.user.model.User;

@Repository
public interface UserDAO {
	
	public int insertUser(@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("phoneNumber") String phoneNumber
			, @Param("email") String email);
	
	public int selectLoginId(@Param("loginId") String loginId);

	public User selectUser(@Param("loginId") String loginId
			, @Param("password") String password);
}
