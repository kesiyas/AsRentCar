<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AS렌터카 - 단기렌터카 예약정보 화면</title>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div class="container">
		<c:import url="/WEB-INF/jsp/include/header.jsp"></c:import>
	
		<section class="contents">
			<div class="p-5 ml-5 short_rev">
				<div class="txt01">단기렌터카 예약정보</div>
				
				<div class="confirmInfo d-flex justify-content-center">
					<div class="table_Style">
						<table class="table">					
							<tr>
								<th>예약번호</th>
								<td><span>${DetailReservation.reservation.reservationNumber }</span></td>
							</tr>
								
							<tr>
								<th>대여일시</th>
								<td>
									<span><fmt:formatDate value="${DetailReservation.reservation.startDate }" pattern="yyyy년 MM월 dd일 HH시 mm분" /></span>
								</td>
							</tr>
						
							<tr>
								<th>반납일시</th>
								<td>
									<span><fmt:formatDate value="${DetailReservation.reservation.returnDate }" pattern="yyyy년 MM월 dd일 HH시 mm분" /></span>
								</td>
							</tr>
							
							<tr>
								<th>대여지점</th>
								<td><span>${DetailReservation.centerName }</span></td>
							</tr>
							
							<tr>
								<th>반납지점</th>
								<td><span>${DetailReservation.centerName }</span></td>
							</tr>
							
							<tr>
								<th>대여차량</th>
								<td><span>${DetailReservation.reservation.rentCar }</span></td>
							</tr>
							
							<tr>
								<th>계약자명</th>
								<td><span>${DetailReservation.reservation.name }</span></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
	</div>

</body>
</html>