<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AS렌터카 - 회원가입</title>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div class="container">
		<c:import url="/WEB-INF/jsp/include/header.jsp"></c:import>
		
		<section class="contents d-flex align-items-center justify-content-center">
			<div class="d-flex flex-column box">			

				<h2 class="text-center">기본 정보 입력</h2>

				<div class="mt-5">
					<input type="text" class="signup-input form-control" id="loginId_Input" placeholder="아이디 입력 (띄어쓰기 없이 영문 소문자,숫자 포함 4~20자 이내)">
					<input type="password" class="mt-3 signup-input form-control" id="password_Input" placeholder="비밀번호 입력 (띄어쓰기 없이 영문,숫자,특수문자 포함 10~20자 이내)">
					<input type="password" class="mt-3 signup-input form-control" id="check_Input" placeholder="비밀번호 재입력">
					<input type="text" class="mt-3 signup-input form-control" id="name_Input" placeholder="이름">
					<input type="text" class="mt-3 signup-input form-control" id="phoneNumber_Input" placeholder="휴대폰 번호">
					<input type="text" class="mt-3 signup-input form-control" id="email_Input" placeholder="이메일 주소">					
				</div>
				
				<button class="btn btn-style" id="signup-btn">가입 완료</button>
				
				<div class="info text-center mt-4">
					회원가입이 어려우신 경우 AS렌터카 고객센터로 연락주시기 바랍니다.<br>
					<span class="point_1">고객센터 1234-5678</span> (월 ~ 금 08:30 ~ 18:00/토요일 및 공휴일 휴무)
				</div>
			</div>
		</section>		
	
		<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
	</div>
	
	<script>
		$(document).ready(function(){
			
			$("#signup-btn").on("click", function(){
				
				let loginId = $("#loginId_Input").val();
				let password = $("#password_Input").val();
				let checkPassword = $("#check_Input").val();
				let name = $("#name_Input").val();
				let phoneNumber = $("#phoneNumber_Input").val();
				let email = $("#email_Input").val();
				
				if(loginId == "") {
					alert("아이디를 입력하세요.")
					return ;
				}
				
				if(password == "") {
					alert("비밀번호를 입력하세요.")
					return ;
				}
				
				if(password != checkPassword) {
					alert("비밀번호를 확인해주세요.")
					return ;
				}
				
				if(name == "") {
					alert("이름을 입력하세요.")
					return ;
				}
				
				if(phoneNumber == "") {
					alert("휴대폰 번호를 입력하세요.")
					return ;
				}
				
				if(email == "") {
					alert("이메일 주소를 입력하세요.")
					return ;
				}
				
				$.ajax({
					type:"post"
					, url:"/rent/user/signup"
					, data:{"loginId":loginId, "password":password, "name":name, "phoneNumber":phoneNumber, "email":email}
					, success:function(){
						if(data.result == "success") {
							alert("회원가입 성공");
						}else {
							alert("회원가입 실패");
						}
					}
					, error:function(data){
						alert("회원가입 에러");
					}
					
					
				});
				
			});
			
			
			
		});
	
	
	</script>

</body>
</html>