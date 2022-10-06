package com.kesiyas.spring.AsRentCar.user.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kesiyas.spring.AsRentCar.common.EncryptUtils;
import com.kesiyas.spring.AsRentCar.user.dao.UserDAO;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	public int signup(
			String loginId
			, String password
			, String name
			, String phoneNumber
			, String email) {
				
		String encryptPassword =  EncryptUtils.md5(password);
		
		return userDAO.insertUser(loginId, encryptPassword, name, phoneNumber, email);
		
	}

}
