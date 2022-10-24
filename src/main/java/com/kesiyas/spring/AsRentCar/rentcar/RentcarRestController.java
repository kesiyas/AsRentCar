package com.kesiyas.spring.AsRentCar.rentcar;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.kesiyas.spring.AsRentCar.rentcar.bo.RentcarBO;
import com.kesiyas.spring.AsRentCar.user.admin.model.Branch;
import com.kesiyas.spring.AsRentCar.user.admin.model.RentalCar;

@RestController
@RequestMapping("/rent/rentcar")
public class RentcarRestController {
	
	@Autowired
	private RentcarBO rentcarBO;
	
	@PostMapping("/home/selectCity")
	public Map<String, String> selectCity(@RequestParam("city") String city) {
		
		List<Branch> regionList = rentcarBO.selectCity(city);
		Branch branch = new Branch();
				
		Map<String, String> result = new HashMap<>();
		
		for(int i = 0; i < regionList.size(); i++) {
			branch = regionList.get(i);
			String centerName = branch.getCenterName();
		
			result.put("centerName" + i, centerName);
		}
	
		return result;
	}
	
	@PostMapping("/home/selectCar")
	public Map<String, String> selectCar(
			@RequestParam("centerName") String centerName
			, @RequestParam("carGrade") String carGrade) {
		
		Branch branch = rentcarBO.selectCenterId(centerName);
		int centerId = branch.getId();
		
		List<RentalCar> rentCarList = rentcarBO.selectCar(centerId, carGrade);
		RentalCar rentCar = new RentalCar();
				
		Map<String, String> result = new HashMap<>();
		
		for(int i = 0; i < rentCarList.size(); i++) {
			rentCar = rentCarList.get(i);
			String modelName = rentCar.getModelName();
		
			result.put("modelName" + i, modelName);
		}

		return result;
	}
	
	@PostMapping("/home/saveRev") 
	public Map<String, String> selectCar(
			@RequestParam("sDate") @DateTimeFormat(pattern="yyyy년 MM월 dd일 HH:mm") Date sDate
			,@RequestParam("eDate")  @DateTimeFormat(pattern="yyyy년 MM월 dd일 HH:mm") Date eDate
			,@RequestParam("centerName") String centerName
			,@RequestParam("modelName") String modelName
			,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		Map<String, String> result = new HashMap<>();
		
		if(sDate != null && eDate != null && centerName != null && modelName != null) {
			session.setAttribute("startDate", sDate);
			session.setAttribute("returnDate", eDate);
			session.setAttribute("centerName", centerName);
			session.setAttribute("modelName", modelName);
			
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}

		return result;
	}
}
