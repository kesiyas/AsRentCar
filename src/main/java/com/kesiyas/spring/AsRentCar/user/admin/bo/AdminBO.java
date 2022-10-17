package com.kesiyas.spring.AsRentCar.user.admin.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kesiyas.spring.AsRentCar.common.EncryptUtils;
import com.kesiyas.spring.AsRentCar.common.FileManagerService;
import com.kesiyas.spring.AsRentCar.user.admin.dao.AdminDAO;
import com.kesiyas.spring.AsRentCar.user.admin.model.Branch;
import com.kesiyas.spring.AsRentCar.user.model.User;

@Service
public class AdminBO {
	
	@Autowired
	private AdminDAO adminDAO;
	
	public int addAdminUser(
			User user
			, String password) {
				
		String encryptPassword =  EncryptUtils.sha(password);
		user.setPassword(encryptPassword);
		
		return adminDAO.insertAdminUser(user);
		
	}
	
	public int addAdmin(int userId, String authority) {
		
		return adminDAO.insertAdmin(userId, authority);
	}
	
	// 지점 등록
	public int addBranch(Branch branch) {
		
		return adminDAO.insertBranch(branch);
	}
	
	// 지점 차량 등록
	public int addBranch_Car(
			int centerUserId
			, int centerId
			, String carGrade
			, String modelName
			, String carNumber
			, int modelYear
			, int rentalFee
			, MultipartFile file)	{
		
		String imgPath = null;
		
		if(file != null) {
			
			imgPath = FileManagerService.saveFile(centerUserId, file);
			
			if(imgPath == null) {
				// 파일 저장 실패
				return 0;
			}
		}
		
		return adminDAO.insertBranchCar(centerUserId, centerId, carGrade, modelName, carNumber, modelYear, rentalFee, imgPath);
	}
}
