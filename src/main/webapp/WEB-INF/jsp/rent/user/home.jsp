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
				
					<div class="reservation d-flex flex-column">
						
						<div class="d-flex">
							<div class="btn firsttab-font w-50" id="jeju">제주</div>
							<div class="btn secondtab-font w-50" id="inland">내륙</div>
						</div>
						
						<div class="p-5">
							<div class="font-weight-bold">
								<i class="bi bi-calendar2-check mr-2"></i>언제 필요하세요?
							</div>
							<input class="input_style btn form-control mt-3 text-left" id="sDate" placeholder="대여일시">
							<input class="input_style btn form-control mt-3 text-left" id="eDate" placeholder="반납일시">
						
							<div class="font-weight-bold mt-4">
								<i class="bi bi-geo-alt mr-2"></i>어디에서 이용하세요?
								<a href="#" class="input_style btn form-control mt-3" id="branch_select"></a>
							</div>
							
							<div class="layerPopWrap d-none" id="branchSelectPop">
								<div class="selectWrap">
									<h5 class="font-weight-bold">대여지점 선택</h5>
									<div class="d-flex mt-5">
										<!-- 지역 선택-->
										<div class="selectDepth1">
											<ul>
												<li><a href="#" class="tabBtn" data-branch-city="서울">서울</a></li>
												<li class="mt-4"><a href="#" class="tabBtn" data-branch-city="경기도">경기</a></li>
												<li class="mt-4"><a href="#" class="tabBtn" data-branch-city="인천">인천</a></li>
											</ul>
										</div>
										
										<div id="region_box">
											<ul class="region_lis"></ul>
										</div>
									</div>
								</div>
							</div>
						</div>											
					</div>
				</div>
			</div>
		</section>
	
		<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
		
	</div>

	<script>
		$(document).ready(function(){
				
			$(".tabBtn").on("click", function(e){
				
				e.preventDefault();			
		
				let city = $(this).data("branch-city");
				
				$.ajax({
					type:"post"
					, url:"/rent/user/home/selectCity"
					, dataType:'json'
					, data:{"city":city}
					, success:function(result){	
						
						// 새로 고침
						// $("#region_box").load(location.href + " #region_box");
						
						$(".region_lis").html("");
						
						$.each(result, function() {
		
							$(".region_lis").append("<li class=mb-3>"+ this + "</li>");
			            });
						
					}
					, error:function(){
						alert("지점 불러오기 에러");
					}
				});			
			});
			
			$("#branch_select").on("click", function(e){
				
				e.preventDefault();
				
				$("#branchSelectPop").removeClass("d-none");		
			});
			
			$(document).on("click", function(e){				

		        if($("#branchSelectPop" !== currentTarget) { 

		    	   $("#branchSelectPop").addClass("d-none");

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