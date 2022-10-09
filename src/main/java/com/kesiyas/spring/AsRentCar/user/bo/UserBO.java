package com.kesiyas.spring.AsRentCar.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kesiyas.spring.AsRentCar.common.EncryptUtils;
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
		
		return (userDAO.selectLoginId(loginId) != 0)?true:false;
	}
	
	public User signin(String loginId, String password) {
		
		String encryptPassword = EncryptUtils.sha(password);
		
		return userDAO.selectUser(loginId, encryptPassword);
	}

}
