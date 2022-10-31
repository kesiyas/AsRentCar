<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AS렌터카 - 예약 확인</title>
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
				<div class="txt01">단기렌터카 예약/확인</div>
				
				<!-- 메인 TAB -->
				<div class="tab-menu mt-5">
					<ul class="nav nav-fill font-weight-bold">
						<li class="nav-items jeju_tab_radius col-4 tab_li">
							<a href="/rent/rentcar/short_rent_jeju/view" class="tab_menu_style nav-link d-flex align-items-center justify-content-center">제주 예약</a>
						</li>
						
						<li class="nav-items col-4 tab_li">
							<a href="/rent/rentcar/short_rent_inland/view" class="tab_menu_style nav-link d-flex align-items-center justify-content-center">내륙 예약</a>
						</li>
						
						<li class="nav-items confirm_radius col-4 tab_li selected">
							<a href="/rent/rentcar/short_rent_confirm/view" class="tab_menu_style nav-link d-flex align-items-center justify-content-center">예약 확인</a>
						</li>
					</ul>
				</div>
				
				<div class="confirm p-5">
					<div class="info-deafult">
						예약번호와 예약 시 등록하신 이름, 휴대폰 번호를 입력 하시면 확인 가능합니다.
					</div>
					
					<div class="mt-4">
						<input type="text" class="form-control" id="revNumber_Input" placeholder="예약번호 입력">
						<input type="text" class="form-control mt-3" id="name_Input" placeholder="이름 입력">
						<input type="text" class="form-control mt-3" id="phoneNumber_Input" placeholder="휴대폰 번호 입력">				
					</div>
				</div>
				
				<div class="d-flex justify-content-center">
					<button type="button" class="btn btn-color1 col-3 btn-large btn_text" id="confirm-btn">예약하기</button>
				</div>		
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
	</div>
	
	<script>
	$(document).ready(function(){
		
		// 예약번호에 숫자만 들어가게 하기
		$("#revNumber_Input").on("input", function(){
			let revNumber = $(this).val();
			let checkNumber = /[0-9]+$/;
			
			if(!checkNumber.test(revNumber)){				
				$(this).val('');
			}			
		});
		
		// 이름에 숫자가 들어가면 초기화
		$("#name_Input").on("input", function(){		
			let name = $(this).val();
			let checkNumber = /[0-9]+$/;

			if(checkNumber.test(name)){				
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
		
		$("#confirm-btn").on("click", function(){
			let revNumber = $("#revNumber_Input").val();
			let name = $("#name_Input").val();
			let phoneNumber = $("#phoneNumber_Input").val();
			
			let checkPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;

			if(revNumber == "") {
				alert("예약번호를 입력해주세요.");
				return;
			}
			
			if(name == "") {
				alert("이름을 입력해주세요.");
				return;
			}
			
			if(phoneNumber == "") {
				alert("휴대폰 번호를 입력해주세요.");
				return;
			}
			
			if(!checkPhone.test(phoneNumber)) {				
				alert("휴대폰 번호가 올바른 형식이 아닙니다.")				
				return;
			}
			
		});
		
	});
	</script>

</body>
</html>