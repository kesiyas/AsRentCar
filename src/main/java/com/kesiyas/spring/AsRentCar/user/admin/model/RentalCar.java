package com.kesiyas.spring.AsRentCar.user.admin.model;

import java.util.Date;

public class RentalCar {

	private int id;
	private int centerUserId;
	private int centerId;
	private String carGrade;
	private String modelName;
	private String carNumber;
	private int modelYear;
	private int rentalFee;
	private String imgPath;
	private Date createdAt;
	private Date updatedAt;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCenterUserId() {
		return centerUserId;
	}
	public void setCenterUserId(int centerUserId) {
		this.centerUserId = centerUserId;
	}
	public int getCenterId() {
		return centerId;
	}
	public void setCenterId(int centerId) {
		this.centerId = centerId;
	}
	public String getCarGrade() {
		return carGrade;
	}
	public void setCarGrade(String carGrade) {
		this.carGrade = carGrade;
	}
	public String getModelName() {
		return modelName;
	}
	public void setModelName(String modelName) {
		this.modelName = modelName;
	}
	public String getCarNumber() {
		return carNumber;
	}
	public void setCarNumber(String carNumber) {
		this.carNumber = carNumber;
	}
	public int getModelYear() {
		return modelYear;
	}
	public void setModelYear(int modelYear) {
		this.modelYear = modelYear;
	}
	public int getRentalFee() {
		return rentalFee;
	}
	public void setRentalFee(int rentalFee) {
		this.rentalFee = rentalFee;
	}
	public String getImgPath() {
		return imgPath;
	}
	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
}
