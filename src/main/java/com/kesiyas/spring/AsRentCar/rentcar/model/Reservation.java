package com.kesiyas.spring.AsRentCar.rentcar.model;

import java.util.Date;

public class Reservation {
	
	private int id;
	private int userId;
	private int rentCenterId;
	private int returnCenterId;
	private Date startDate;
	private Date reuturnDate;
	private String rentCar;
	private String name;
	private String birth;
	private String phoneNumber;
	private String address;
	private String license;
	private String licenseNumber;
	private String license_IssueDate;
	private Date createdAt;
	private Date updatedAt;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getRentCenterId() {
		return rentCenterId;
	}
	public void setRentCenterId(int rentCenterId) {
		this.rentCenterId = rentCenterId;
	}
	public int getReturnCenterId() {
		return returnCenterId;
	}
	public void setReturnCenterId(int returnCenterId) {
		this.returnCenterId = returnCenterId;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getReuturnDate() {
		return reuturnDate;
	}
	public void setReuturnDate(Date reuturnDate) {
		this.reuturnDate = reuturnDate;
	}
	public String getRentCar() {
		return rentCar;
	}
	public void setRentCar(String rentCar) {
		this.rentCar = rentCar;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLicense() {
		return license;
	}
	public void setLicense(String license) {
		this.license = license;
	}
	public String getLicenseNumber() {
		return licenseNumber;
	}
	public void setLicenseNumber(String licenseNumber) {
		this.licenseNumber = licenseNumber;
	}
	public String getLicense_IssueDate() {
		return license_IssueDate;
	}
	public void setLicense_IssueDate(String license_IssueDate) {
		this.license_IssueDate = license_IssueDate;
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
