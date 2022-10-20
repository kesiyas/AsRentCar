package com.kesiyas.spring.AsRentCar.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.kesiyas.spring.AsRentCar.user.admin.model.Branch;
import com.kesiyas.spring.AsRentCar.user.model.User;

@Repository
public interface UserDAO {
	
	public int insertUser(@Param("loginId") String loginId
			, @Param("password") String password
			, @Param("name") String name
			, @Param("phoneNumber") String phoneNumber
			, @Param("email") String email);
	
	public int selectCheckLoginId(@Param("loginId") String loginId);

	public User selectUser(@Param("loginId") String loginId
			, @Param("password") String password);
	
	public User selectLoginId(@Param("name") String name, 
			@Param("phoneNumber") String phoneNumber);
	
	public int selectEmail(@Param("email") String email);
	
	public User selectPassowrdByLoginId(@Param("loginId") String loginId);
	
	public int updatePassword(@Param("userId") int userId, @Param("password") String password);
	
	public List<Branch> selectCity(@Param("city") String city);
		
}
