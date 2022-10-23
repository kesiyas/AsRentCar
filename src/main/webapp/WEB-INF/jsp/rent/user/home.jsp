<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>As렌터카 - 메인 화면</title>
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
		
		<section class="contents home-bg">
			<div class="p-5">
				<div class="d-flex">
					<div class="content">
						<div class="txt01">
							<strong>가을 바람</strong> 타고<br>
							<strong>AS렌터카</strong> 타고
						</div>
						<img class="main_banner mt-5 ml-4" src="/static/img/main_banner.jpg" src="메인 배너 사진">
					</div>
				
					<!-- 빠른 예약 -->
					<div class="reservation d-flex flex-column">				
						<div class="d-flex">
							<a href="#" class="btn firsttab-font w-50" id="jeju">제주</a>
							<a href="#" class="btn secondtab-font w-50" id="inland">내륙</a>
						</div>
						
						<div class="p-5" id="reservation_input">
							<div class="d-flex align-items-center">
								<i class="bi bi-calendar2-check"></i>
								<div class="font-margin reservation_font">언제 필요하세요?</div>
							</div>
							<input class="input_style btn form-control mt-3 text-left" id="sDate" placeholder="대여일시">
							<input class="input_style btn form-control mt-3 text-left" id="eDate" placeholder="반납일시">
						
							<!-- 지점 선택 -->
							<div class="font-weight-bold mt-4">
								<div class="d-flex align-items-center">
									<i class="bi bi-geo-alt"></i>
									<span class="font-margin reservation_font">어디에서 이용하세요?</span>
								</div>
								
								<!-- 제주 지점 -->
								<div id="branch_jeju">
									<div class="input_style btn form-control mt-3 text-left d-flex align-items-center branch_select" id="jeju_input">제주/제주지점</div>
								</div>
								
								<!-- 내륙 지점 -->
								<div id="branch_inland" class="d-none">
									<a href="#" class="input_style btn form-control mt-3 text-left d-flex align-items-center branch_select" id="inland_input"></a>
								</div>
							</div>
							<!-- 지점 선택 -->
							
							<!-- 지점 선택 레이어 팝업 -->
							<div class="layerPopWrap d-none" id="branchSelectPop">
								<div class="selectWrap">
									<div class="font-weight-bold reservation_font">대여지점 선택</div>
									<div class="d-flex mt-5">
										<!-- 지역 선택-->
										<div class="selectDepth1">
											<ul>
												<li><a href="#" class="region_tabBtn tabBtn" data-branch-city="서울">서울</a></li>
												<li class="mt-4"><a href="#" class="region_tabBtn tabBtn" data-branch-city="경기도">경기</a></li>
												<li class="mt-4"><a href="#" class="region_tabBtn tabBtn" data-branch-city="인천">인천</a></li>
											</ul>
										</div>
										<!-- 지역 선택-->
										
										<div id="region_box">
											<ul id="region_lis"></ul>
										</div>
									</div>
								</div>
							</div>
							
							<!-- 차량 선택 -->
							<div class="font-weight-bold mt-4">
								<div class="d-flex align-items-center">
									<i class="bi bi-credit-card-2-back-fill"></i>
									<div class="font-margin reservation_font">어떤 차량을 원하세요?</div>
								</div>
								<a href="#" class="input_style btn form-control mt-3 text-left d-flex align-items-center" id="rentCar_select"></a>
							</div>	
							
							<!-- 차량 선택 레이어 팝업 -->
							<div class="layerPopWrap rentCarLayer-margin d-none" id="rentCarSelectPop">
								<div class="selectWrap">
									<h5 class="font-weight-bold">대여차량 선택</h5>
									<div class="d-flex mt-5">
										
										<!-- 차급 선택-->
										<div class="selectDepth1">
											<ul>
												<li><a href="#" class="car_tabBtn tabBtn" data-car-grade="경차">경차</a></li>
												<li class="mt-4"><a href="#" class="car_tabBtn tabBtn" data-car-grade="소형차">소형차</a></li>
												<li class="mt-4"><a href="#" class="car_tabBtn tabBtn" data-car-grade="중형차">중형차</a></li>
												<li class="mt-4"><a href="#" class="car_tabBtn tabBtn" data-car-grade="대형차">대형차</a></li>
											</ul>
										</div>		
										<!-- 차급 선택-->
										
										<div id="rentCar_box">
											<ul id="rentCar_lis"></ul>
										</div>
									</div>
								</div>
							</div>
							<!-- 차량 선택 레이어 팝업-->		
							<button class="btn mt-4 col-7 float-right revBtn_style" id="rev-btn">빠른 예약</button>					
						</div>						
										
					</div>
					<!-- 빠른 예약 -->
				</div>
			</div>
		</section>
	
		<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
	</div>

	<script>
		$(document).ready(function(){
			
			var is_Check = false; // 지역이 선택 되어있는지 확인할 변수
			var is_jeju = true;
			
			$("#jeju").on("click", function(e){				
				e.preventDefault();	
				
				$("#jeju").removeClass("secondtab-font");
				$("#jeju").addClass("firsttab-font");
				
				$("#inland").removeClass("firsttab-font");
				$("#inland").addClass("secondtab-font");
							
				$("#branch_jeju").removeClass("d-none");
			  	$("#branch_inland").addClass("d-none");
			  	
			  	is_jeju = true;
			});
			
			$("#inland").on("click", function(e){				
				e.preventDefault();	
				
				$("#inland").removeClass("secondtab-font");
				$("#inland").addClass("firsttab-font");
				
				$("#jeju").removeClass("firsttab-font");
				$("#jeju").addClass("secondtab-font");
				
				$("#branch_jeju").addClass("d-none");
				$("#branch_inland").removeClass("d-none");
				
				is_jeju = false;
			});
			
			$("#rev-btn").on("click", function(){
				
				let sDate = $("#sDate").val();
				let eDate = $("#eDate").val();
				let centerName = $("#branch_select").text();	
				let modelName = $("#rentCar_select").text();
				
				if(sDate == "") {
					alert("대여할 날짜를 선택해주세요.");
					return ;
				}
				
				if(eDate == "") {
					alert("반납할 날짜를 선택해주세요.");
					return ;
				}
				
				if(centerName == "") {
					alert("지점을 선택해주세요.");
					return ;
				}
				
				if(modelName == "") {
					alert("차량을 선택해주세요.");
					return ;
				}
				
				$.ajax({
					type:"post"
					, url:"/rent/user/home/saveRev"
					, data:{"sDate":sDate, "eDate":eDate, "centerName":centerName, "modelName":modelName}
					, success:function(data){
						if(data.result == "success") {
							alert("성공");
						}else {
							alert("빠른예약 정보저장 실패");
						}
					}
					, error:function(){
						alert("빠른예약 정보저장 에러");
					}						
				});
			});
			
			$("#rentCar_lis").on("click", ".rentCar_btn", function(e){				
				e.preventDefault();
				
				let branch = $(".rentCar_btn").text();
				
				$("#rentCar_select").text(branch);
				$("#rentCarSelectPop").addClass("d-none");
			});	
			
			// 차량 선택 버튼
			$(".car_tabBtn").on("click", function(e){				
				e.preventDefault();			
				
				let centerName = "";
				
				if(is_jeju == false) {
					centerName = $("#inland_input").text();	
				} else {
					centerName = "제주";
				}
				let carGrade = $(this).data("car-grade");
				
				$.ajax({
					type:"post"
					, url:"/rent/user/home/selectCar"
					, dataType:'json'
					, data:{"centerName":centerName, "carGrade":carGrade}
					, success:function(result){					
						if(result != null) {
							// 새로 고침					
							$("#rentCar_lis").html("");
							
							$.each(result, function(){		
								$("#rentCar_lis").append("<li class=mb-3><a href='#' class='rentCar_btn text-dark'>"
										+ this + "</a></li>");
				            });			
						} else {
							alert("차량 불러오기 실패");
						}
					}
					, error:function(){
						alert("차량 불러오기 에러");
					}
				});			
			});
			
			// 대여차량 레이어 팝업 열고 닫기
			var rentCar_popupOpen = false; // 차량 선택 팝업이 열려있는지 확인
			$("#rentCar_select").on("click", function(e){		
				e.preventDefault();
				
				let centerName = $("#inland_input").text();
				
				if(centerName == "" && is_jeju == false){
					
					alert("지점을 먼저 선택해주세요.");
					return ;
				}
				
				if(rentCar_popupOpen == true) { // 팝업이 열려있다면 레이어 팝업 숨김
					
					$("#rentCarSelectPop").addClass("d-none");			
					rentCar_popupOpen = false;
				} else {					

					rentCar_popupOpen = true;
					$("#rentCarSelectPop").removeClass("d-none");			
				}
			});	
			
			$("#region_lis").on("click", ".branch_btn", function(e){				
				e.preventDefault();
				
				let branch = $(".branch_btn").text();
				
				$(".branch_select").text(branch);
				$("#branchSelectPop").addClass("d-none");
			});			
								
			$(".region_tabBtn").on("click", function(e){				
				e.preventDefault();			
		
				let city = $(this).data("branch-city");
				
				$.ajax({
					type:"post"
					, url:"/rent/user/home/selectCity"
					, dataType:'json'
					, data:{"city":city}
					, success:function(result){		
						if(result != null) {
							// 새로 고침					
							$("#region_lis").html("");
							
							$.each(result, function(){		
								$("#region_lis").append("<li class=mb-3><a href='#' class='branch_btn text-dark'>"
										+ this + "</a></li>");
				            });		
						}else {
							alert("지점 불러오기 실패");
						}
					}
					, error:function(){
						alert("지점 불러오기 에러");
					}
				});			
			});
			
			// 지점 선택 팝업창 열고 닫기
			var branch_popupOpen = false; // 지점 팝업이 열려있는지 확인
			$("#inland_input").on("click", function(e){
				
				e.preventDefault();
				
				if(branch_popupOpen == true) { // 팝업이 열려있다면 레이어 팝업 숨김
					
					$("#branchSelectPop").addClass("d-none");
					
					branch_popupOpen = false;
				} else {					

					branch_popupOpen = true;
					
					$("#branchSelectPop").removeClass("d-none");
				}
			});	
			
			$(document).mouseup(function(e){
				
				if($("#branchSelectPop").has(e.target).length == 0){
					
					$("#branchSelectPop").addClass("d-none");
				}
				
				if($("#rentCarSelectPop").has(e.target).length == 0){
					
					$("#rentCarSelectPop").addClass("d-none");
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
						maxTime:jQuery('#eDate').val()?jQuery('#eDate').val():false
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