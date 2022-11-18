package com.kesiyas.spring.AsRentCar.rentcar.model;

public class DetailReservation {
	private Reservation reservation;
	private String centerName;
	
	public Reservation getReservation() {
		return reservation;
	}
	public void setReservation(Reservation reservation) {
		this.reservation = reservation;
	}
	
	public String getCenterName() {
		return centerName;
	}
	public void setCenterName(String centerName) {
		this.centerName = centerName;
	}
	
}
