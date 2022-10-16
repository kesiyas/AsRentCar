package com.kesiyas.spring.AsRentCar.user.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.kesiyas.spring.AsRentCar.user.model.User;

@Repository
public interface UserDAO {
	
	public int insertUser(@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("phoneNumber") String phoneNumber
			, @Param("email") String email);
	
	public int insertAdminUser(User user);
	
	public int insertAdmin(@Param("userId") int userId, @Param("authority") String authority);
	
	public int selectCheckLoginId(@Param("loginId") String loginId);

	public User selectUser(@Param("loginId") String loginId
			, @Param("password") String password);
	
	public User selectLoginId(@Param("name") String name, 
			@Param("phoneNumber") String phoneNumber);
	
	public int selectEmail(@Param("email") String email);
	
	public User selectPassowrdByLoginId(@Param("loginId") String loginId);
	
	public int updatePassword(@Param("userId") int userId, @Param("password") String password);
	
	public int insertBranch(
			@Param("userId") int userId
			, @Param("centernName") String centerName
			, @Param("term") String term
			, @Param("city") String city
			, @Param("address") String address
			, @Param("name") String name
			, @Param("phoneNumber") String phoneNumber);
	
}
