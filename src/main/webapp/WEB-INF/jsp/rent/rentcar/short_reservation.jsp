<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AS렌터카 - 단기렌터카 예약</title>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
		
	<!-- 플러그인에서 제공해주는 css 로딩 -->
	<link rel="stylesheet" href="/static/css/jquery.datetimepicker.min.css" />
	<!-- jquery 로딩 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- 플러그인 javascript 로딩 -->
	<script src="/static/js/jquery.datetimepicker.full.min.js"></script>
			
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>
	
	<div class="container">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp"></c:import>
		
		<section class="contents">
			<div class="p-5 ml-5 short_rev">
				<div class="txt01">단기렌터카 예약/확인</div>
				
				<!-- 메인 TAB -->
				<div class="tab-menu mt-5">
					<ul class="nav nav-fill font-weight-bold">
						<li class="nav-items selected jeju_tab_radius col-4 tab_li">
							<a href="#" class="tab_menu_style nav-link d-flex align-items-center justify-content-center">제주 예약</a>
						</li>
						
						<li class="nav-items col-4 tab_li">
							<a href="#" class="tab_menu_style nav-link d-flex align-items-center justify-content-center">내륙 예약</a>
						</li>
						
						<li class="nav-items confirm_radius col-4 tab_li">
							<a href="#" class="tab_menu_style nav-link d-flex align-items-center justify-content-center">예약 확인</a>
						</li>
					</ul>
				</div>
				
				<!-- 대여기간 선택 -->
				<div class="mt-5 rentDate">
					<div class="header-group">
						<h3>대여기간 선택</h3>
						<hr>
					</div>
	
					<div class="rent_content">
						<div class="d-flex">
							<div class="col-5">
								<input class="input_style btn form-control mt-3 text-left rent_date" id="sDate" placeholder="대여일시">
								<div class="mt-3 d-flex justify-content-between">
									<span class="input_style form-control col-7 jeju_color d-flex align-items-center"><strong>제주/제주지점</strong></span>
									<a href="#" class="map_btn btn d-flex align-items-center">지도보기</a>
								</div>
							</div>
							
							<div class="col-5 mr-2"> 
								<input class="input_style btn form-control mt-3 text-left rent_date" id="eDate" placeholder="반납일시" disabled="disabled">
								<div class="mt-3 d-flex justify-content-between">
									<span class="input_style form-control col-7 jeju_color d-flex align-items-center"><strong>제주/제주지점</strong></span>
									<a href="#" class="map_btn btn d-flex align-items-center">지도보기</a>
								</div>
							</div>
							
							<div class="date col-2 mt-3">
								<div class="">
									<strong>총 대여기간</strong>
									<div>
										<span id="date">0</span>일 
										<span id="hour">0</span>시간 
										<span id="min">0</span>분
									</div>
								</div>
							</div>
						</div>
						
						<div class="px-5 pt-5">
							<div class="date_info">
								<span class="info">차량 인수 시, 운전면허 지참은 필수입니다. (도로교통법상 유효한 운전면허 소지자)</span>
							</div>
						</div>
					</div>					
				</div>
				
				<!-- 차량  선택 -->
				<div class="rentCar mt-5">
					<div class="header-group">
						<h3>차량 선택</h3>
						<hr>
					</div>
					
					<div class="rent_content">
						<div class="mt-5 selectCar-menu">
							<ul class="nav d-flex justify-content-between">
								<li class="nav-items col-2"><a href="#" class="nav-link">전체</a></li>
								<li class="nav-items col-2"><a href="#" class="nav-link">경차</a></li>
								<li class="nav-items col-2"><a href="#" class="nav-link">소형차</a></li>
								<li class="nav-items col-2"><a href="#" class="nav-link">중형차</a></li>
								<li class="nav-items col-2"><a href="#" class="nav-link">대형차</a></li>
							</ul>
						</div>
						<div class="tab-content">
							<ul class="d-flex flex-wrap mt-3">
								<li class="nav-items col-6"><a href="#" class="nav-link">캐스퍼</a></li>
								<li class="nav-items col-6"><a href="#" class="nav-link">11111111</a></li>
								<li class="nav-items col-6"><a href="#" class="nav-link">11111111</a></li>
					
							</ul>
						</div>
					</div>
				</div>
				
				<!-- 제1운전자 정보입력 -->
				<div class="driverInfo mt-5">
					<div class="header-group">
						<h3>계약자 정보입력(제1운전자)</h3>
						<hr>
					</div>
					
					<div class="rent_content contractor_info d-flex mt-5">
						<!-- 기본 정보 입력 -->
						<div>
							<h4 class="mb-4">기본 정보</h4>
							<div>
								<div class="input_wrap">
									<label class="input_name">이름</label>
									<input class="input form-control text-left" id="driverName_Input" placeholder="이름을 입력해주세요.">
								</div>
								
								<div class="input_wrap">
									<label class="input_name">생년월일</label>
									<input class="input form-control text-left" id="birth_Input" placeholder="예) 19900101">
								</div>
								
								<div class="color1 msg d-none" id="ageLimit_msg">만21세이상부터 예약 가능합니다.</div>
								
								<div class="input_wrap">
									<label class="input_name">휴대폰번호</label>
									<input class="input form-control text-left" id="phoneNumber_Input" placeholder="예) 01012345678.">
								</div>
								
								<div class="input_wrap">
									<span class="input_name">주소</span>
									<div class="address-input">
										<div class="d-flex justify-content-between">
											<input class="input form-control text-left w-50 disabled_input" id="postalCod_Input" placeholder="우편번호 검색" disabled="disabled">
											<a href="#" class="w-50">주소검색</a>
										</div>
										<input class="input form-control text-left disabled_input" id="address_Input" placeholder="주소 입력" disabled="disabled">
										<input class="input form-control text-left" id="detail_address_Input" placeholder="나머지 주소를 입력해주세요.">
									</div>
								</div>	
							</div>
						</div>
						
						<!-- 운전자 면허 정보 입력-->
						<div class="license">
							<h4 class="mb-4">운전면허 등록정보</h4>
							<div>
								<div class="input_wrap">
									<label class="input_name">면허종류</label>
									<select class="input" name="license">
										<option>2종보통</option>
										<option>1종보통</option>
										<option>1종대형</option>
									</select>					
								</div>
								
								<div class="input_wrap">
									<label class="input_name">면허번호</label>
									<input class="input form-control text-left disabled_input" id="licenseNumber_Input" placeholder="면허번호를 입력해주세요." disabled="disabled">
								</div>
															
								<div class="input_wrap">
									<label class="input_name">발급일자</label>
									<input class="input form-control text-left" id="license_IssueDate_Input" placeholder="예) 20150101">
								</div>
							</div>
						</div>				
					</div>
					
					<div class="d-flex justify-content-center mt1">
						<button type="button" class="btn btn-color2 mr-2 btn-width1 btn-large d-flex align-items-center justify-content-center" id="cancle-btn">취소</button>
						<button type="button" class="btn btn-color1 btn-width1 btn-large d-flex align-items-center justify-content-center" id="confirm-btn">예약하기</button>
					</div>
				</div>	
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
	</div>
	
	<script>
		$(document).ready(function(){
			var now = new Date();
			var year = now.getFullYear();
			var month = now.getMonth();
			
			// 발급일자에 숫자만 들어가게 하기
			$("#license_IssueDate_Input").on("input", function(){
				let license_IssueDate = $(this).val();
				let checkNumber = /[0-9]+$/;
				
				if(!checkNumber.test(license_IssueDate)){				
					$(this).val('');
				}			
			});
			
			// 면허번호에 숫자만 들어가게 하기
			$("#licenseNumber_Input").on("input", function(){
				let licenseNumber = $(this).val();
				let checkNumber = /[0-9]+$/;
				
				if(!checkNumber.test(licenseNumber)){				
					$(this).val('');
				}			
			});
			
			// 전화번호가 0으로 시작하지 않거나 숫자가 아닐 시 value 초기화
			$("#phoneNumber_Input").on("input", function(){
				let phoneNumber = $(this).val();
				let checkNumber = /[0-9]+$/;
				
				if(!phoneNumber.startsWith(0) || !checkNumber.test(phoneNumber)){				
					$(this).val('');
				}			
			});
			
			// 생년월일에 숫자만 들어가게 하기
			$("#birth_Input").on("input", function(){
				let birth = $(this).val();
				let checkNumber = /[0-9]+$/;
				
				if(!checkNumber.test(birth)){				
					$(this).val('');
				}			
			});
			
			// 만 21세 이상이 아닐 시 메시지 출력 기능
			$("#birth_Input").on("change", function(){
				
				let birth = $(this).val();
				let ageLimit = year - birth.substring(0, 4);
				
				if(ageLimit < 21) {
					$("#ageLimit_msg").removeClass("d-none");

				} else {
					$("#ageLimit_msg").addClass("d-none");
				}
			});
			
			// 이름에 숫자가 들어가면 초기화
			$("#driverName_Input").on("input", function(){		
				let name = $(this).val();
				let checkNumber = /[0-9]+$/;

				if(checkNumber.test(name)){				
					$(this).val('');
				}
			});
			
			// 예약 버튼
			$("#confirm-btn").on("click", function(){	
				let startDate = $("#sDate").val();
				let returnDate = $("#eDate").val();
				let centerName = "제주";
				// let rentCar	= $();		
				let name = $("#driverName_Input").val();
				let birth = $("#birth_Input").val();
				let phoneNumber = $("#phoneNumber_Input").val();						
				let address = $("#address_Input").val() + $("#detail_address_Input").val();
				let license = $("select[name='license']").val();
				let	licenseNumber = $("#licenseNumber_Input").val();
				let license_IssueDate = $("#license_IssueDate_Input").val();
				
				let checkPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
				
				if(startDate == "") {
					alert("대여하실 날짜를 선택해주세요.");
					return ;
				}
				
				if(returnDate == "") {
					alert("반납하실 날짜를 선택해주세요.");
					return ;
				}
				
				//if(rentCar == "") {
				//	alert("대여챠량을 선택해주세요.");
				//	return ;
				//}
				
				if(startDate == "") {
					alert("대여날짜를 선택해주세요.");
					return ;
				}
				
				if(startDate == "") {
					alert("대여날짜를 선택해주세요.");
					return ;
				}
						
				if(name == "" || phoneNumber == "" || birth == "" || address == "" || license == "" || licenseNumber == "" || license_IssueDate == "") {
					alert("예약정보를 입력해주세요.");
					return ;
				}
				
				if(ageLimit < 21) {
					return;
				}
	
				if(!checkPhone.test(phoneNumber)) {				
					alert("전화 번호가 올바른 형식이 아닙니다.")				
					return;
				}
			});
			
			$("#eDate").on("change", function(){
				let startDate = $("#sDate").val();
				let returnDate = $(this).val();
				
				let total = {"01":31, "02":28, "03":30, "04":30, "05":31, "06":30, "07":31, "08":31, "09":30, "10":31, "11":30, "12":31};
				// 윤년일 경우
				if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
					total[2] = 29;
				} else {}	
					
				let startMonth = Number(startDate.substring(6, 8)); // 대여 월
				let returnMonth = Number(returnDate.substring(6, 8)); // 반납 월
				let rentMonth = returnMonth - startMonth;	
				
				let sDate = Number(startDate.substring(10, 12)); // 대여 일
				let eDate = Number(returnDate.substring(10, 12)); // 반납 일				
				let totalDate;
				
				if(rentMonth == 1) { // 반납 월이 다음 달일 경우				
					sDate = Number(total[startMonth]) - sDate;	
					totalDate = sDate + eDate;
				}else if(rentMonth == 2) {			
					sDate = Number(total[startMonth]) - sDate;	
					totalDate = sDate + eDate + Number(total[startMont + 1]);
				}else {	// 같은 달일 경우
					if(sDate == eDate) {
						totalDate = 0;
					} else {
						totalDate = eDate - sDate;
					}
				}
				$("#date").text(totalDate);
				
				let startHour = Number(startDate.substring(13, 15));
				let returnHour = Number(startDate.substring(13, 15));
				let totalHour;
				
				let startMin = Number(startDate.substring(16, 18));
				let returnMin = Number(startDate.substring(16, 18));
				let totalMin;
				
				if(startHour > returnHour) {
					if(startMin == 30 || returnMin == 0) {
						totalHour = (24 - (startHour + 1)) + returnHour;
						totalMin = startMin;
					}else {
						totalHour = (24 - (startHour)) + returnHour;
						totalMin = returnMin;
					}
				} else if(startHour < returnHour){
					if(startMin == 30 || returnMin == 0) {
						totalHour = (returnHour - startHour) - 1;
						totalMin = startMin;
					}else {
						totalHour = returnHour - startHour;
						totalMin = returnMin;
					} 
				}			
				$("#hour").text(totalHour);
				$("#min").text(totalMiN);
			});
			
			$("#sDate").on("change", function(){			
				let startDate = $(this).val();
				
				if(startDate != "") {
					$("#eDate").attr("disabled", false);
				}	
			});
			
			$("#sDate").datetimepicker({
				format: "Y년 m월 d일 H:i"
				,allowTimes:[
					  '08:00', '08:30', '09:00', '09:30','10:00', '10:30',
					  '11:00', '11:30', '12:00', '12:30', '13:00', '13:30',
					  '14:00', '14:30', '15:00', '15:30', '16:00', '16:30',
					  '17:00', '17:30', '18:00', '18:30', '19:00', '19:30',
					  '20:00', '20:30', '21:00', '21:30', '22:00']	
				,minDateTime : 0 // 시작 날짜, 시간을 현재 날짜, 시간으로	
				,onShow:function(ct){
					this.setOptions({
						maxDateTime:jQuery('#eDate').val()?jQuery('#eDate').val():false
					})
				}
			});
			
			$("#eDate").datetimepicker({
				format: "Y년 m월 d일 H:i"	
				,allowTimes:[
					  '08:00', '08:30', '09:00', '09:30','10:00', '10:30',
					  '11:00', '11:30', '12:00', '12:30', '13:00', '13:30',
					  '14:00', '14:30', '15:00', '15:30', '16:00', '16:30',
					  '17:00', '17:30', '18:00', '18:30', '19:00', '19:30',
					  '20:00', '20:30', '21:00', '21:30', '22:00']
				,minDate:0
				,onShow:function(ct){
					this.setOptions({
						minDateTime:jQuery('#sDate').val()?jQuery('#sDate').val():false
					})
				}
			});		
			$.datetimepicker.setLocale('kr');
			
		});
	</script>
</body>
</html>