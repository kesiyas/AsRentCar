package com.kesiyas.spring.AsRentCar.user.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kesiyas.spring.AsRentCar.common.EncryptUtils;
import com.kesiyas.spring.AsRentCar.user.admin.model.Branch;
import com.kesiyas.spring.AsRentCar.user.admin.model.RentalCar;
import com.kesiyas.spring.AsRentCar.user.dao.UserDAO;
import com.kesiyas.spring.AsRentCar.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public int addUser(
			String loginId
			, String password
			, String name
			, String phoneNumber
			, String email) {
				
		String encryptPassword =  EncryptUtils.sha(password);
		
		return userDAO.insertUser(loginId, encryptPassword, name, phoneNumber, email);		
	}
	
	public boolean is_duplicate(String loginId){
		
		return (userDAO.selectCheckLoginId(loginId) != 0)?true:false;
	}
	
	// 로그인
	public User signin(String loginId, String password) {
		
		String encryptPassword = EncryptUtils.sha(password);
		
		return userDAO.selectUser(loginId, encryptPassword);
	}
	
	// 아이디 찾기
	public User searchId(String name, String phoneNumber) {
		
		return userDAO.selectLoginId(name, phoneNumber);
	}
	
	// 이메일 인증
	public int emailChek(String email) {
		
		return userDAO.selectEmail(email);
	}
	
	// 비밀번호 찾기
	public User searchPw(String loginId) {
		
		return userDAO.selectPassowrdByLoginId(loginId);
	}
	
	// 비밀번호 변경
	public int updatePw(int userId, String password) {
		
		String encryptPassword = EncryptUtils.sha(password);
		
		return userDAO.updatePassword(userId, encryptPassword);
	}
	
}
