<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AS렌터카 - 관리자 회원가입</title>

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

				<h2 class="text-center">관리자 정보 입력</h2>

				<div class="mt-4">
					<input type="text" class="input_style form-control" id="loginId_Input" placeholder="아이디 입력 (띄어쓰기 없이 영문 소문자,숫자 포함 4~20자 이내)">
						<div class="d-none text-danger ml-2" id="userIdchk"><small>필수 정보입니다.</small></div>
						<div class="d-none text-warning ml-2" id="userIdchk_2"><small>4~16자 이내의 영문 소문자, 숫자만 입력 가능합니다.</small></div>
						<div class="d-none text-warning ml-2" id="userIdchk_3"><small>이미 가입된 정보입니다.</small></div>
						<div class="d-none text-info ml-2" id="userIdchk_4"><small>사용 가능한 아이디입니다.</small></div>

					<input type="password" class="mt-3 input_style form-control" id="password_Input" placeholder="비밀번호 입력 (띄어쓰기 없이 영문,숫자,특수문자 포함 10~20자 이내)">
						<div class="d-none text-danger ml-2" id="passwordChk"><small>필수 정보입니다.</small></div>
						<div class="d-none text-warning ml-2" id="passwordChk_2"><small>영문, 숫자, 특수문자(! @ # $ % ^ & + =) 포함 8~20자 이내로 등록해 주십시오.</small></div>
						<div class="d-none text-info ml-2" id="passwordChk_3"><small>사용 가능한 비밀번호입니다.</small></div>
						
					<input type="password" class="mt-3 input_style form-control" id="check_Input" placeholder="비밀번호 재입력">
					<input type="text" class="mt-3 input_style form-control" id="name_Input" placeholder="이름">
					<input type="text" class="mt-3 input_style form-control" id="phoneNumber_Input" placeholder="전화번호">
					<input type="text" class="mt-3 input_style form-control" id="email_Input" placeholder="이메일 주소">					
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
			
			// 중복 체크 확인 상태 저장 변수
			var isCheck = false;
			// 중복 상태 저장 변수
			var isDuplicateLoginId = true;
			
			// 로그인 아이디 중복 검사
			$("#loginId_Input").on("change", function(){	
				
				isCheck = false;
				isDuplicateLoginId = true;
				
				let loginId = $("#loginId_Input").val();
				let loginIdLength = loginId.length;
				let checkId = /^[a-z0-9A-Z]{4,16}$/;
								
				if(loginIdLength == 0 ) {					
					
					$("#userIdchk").removeClass("d-none");
					
					$("#userIdchk_2").addClass("d-none");	
					$("#userIdchk_3").addClass("d-none");
					$("#userIdchk_4").addClass("d-none");
					return ;
				} 
				
				if(!checkId.test(loginId)) {
					
					$("#userIdchk_2").removeClass("d-none");	
					
					$("#userIdchk").addClass("d-none");
					$("#userIdchk_3").addClass("d-none");
					$("#userIdchk_4").addClass("d-none");
					return ;
				}
				
				$.ajax({
					type:"get"
					, url:"/rent/user/is_duplicate"
					, data:{"loginId":loginId}
					, success:function(data){
						isCheck = true;
						
						if(data.result) {							
							$("#userIdchk_3").removeClass("d-none");
							
							$("#userIdchk").addClass("d-none");
							$("#userIdchk_2").addClass("d-none");
							$("#userIdchk_4").addClass("d-none");
							
							isDuplicateLoginId = true;
						} else {							
							$("#userIdchk_4").removeClass("d-none");
							
							$("#userIdchk").addClass("d-none");
							$("#userIdchk_2").addClass("d-none");
							$("#userIdchk_3").addClass("d-none");
							
							isDuplicateLoginId = false;
						}					
					}
					, error:function(){
						
						alert("아이디 중복체크 에러");
					}					
				});
			});
			
			// 비밀번호 정규식 검사
			$("#password_Input").on("change", function(){
			
				let loginId = $("#loginId_Input").val();
				let loginIdLength = loginId.length;
				
				let password = $("#password_Input").val();
				let pswLength = password.length;
				let checkPsw = /^[a-z0-9!@$!%*#^?&\\(\\)\-_=+]{8,20}$/;
								
				if(loginIdLength == 0 ) {					
					
					$("#userIdchk").removeClass("d-none");
					
					$("#userIdchk_2").addClass("d-none");	
					$("#userIdchk_3").addClass("d-none");
					$("#userIdchk_4").addClass("d-none");
					return ;
				} 
				
				if(pswLength == 0) {
					
					$("#passwordChk").removeClass("d-none");	
					
					$("#passwordChk_2").addClass("d-none");
					$("#passwordChk_3").addClass("d-none");
					return ;
				} 
				
				if(!checkPsw.test(password)) {
					
					$("#passwordChk_2").removeClass("d-none");	
					
					$("#passwordChk").addClass("d-none");
					$("#passwordChk_3").addClass("d-none");
					return ; 
				} else {
					
					$("#passwordChk_3").removeClass("d-none");	
					
					$("#passwordChk").addClass("d-none");
					$("#passwordChk_2").addClass("d-none");		
					return ;
				}
		});
			
		// 회원 가입
		$("#signup-btn").on("click", function(){
			
			let loginId = $("#loginId_Input").val();
			let password = $("#password_Input").val();
			let checkPassword = $("#check_Input").val();
			let name = $("#name_Input").val();
			let phoneNumber = $("#phoneNumber_Input").val();
			let email = $("#email_Input").val();
			
			// 정규식(로그인 아이디, 패스워드, 연락처, 이메일 주소)
			let checkId = /^[a-z0-9]{4,16}$/;
			let checkPsw = /^[a-z0-9!@$!%*#^?&\\(\\)\-_=+]{8,20}$/;
			let checkPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
			let checkEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			
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
				alert("전화번호를 입력하세요.")
				return ;
			}
			
			if(email == "") {
				alert("이메일 주소를 입력하세요.")
				return ;
			}
			
			if(!checkId.test(loginId)) {				
				return ;
			}
			
			if(!checkPsw.test(password)) {				
				return ; 
			} 
			
			if(!checkPhone.test(phoneNumber)) {				
				alert("휴대폰 번호가 올바른 형식이 아닙니다.")				
				return;
			}
			
			if(!checkEmail.test(email)) {			
				alert("이메일 주소가 올바른 형식이 아닙니다.")				
				return;
			}
			
			if(!isCheck) {				
				alert("아이디 중복 확인을 해주세요.");
				return ; 
			}
			
			if(isDuplicateLoginId) {				
				return ; 
			}
						
			$.ajax({
				type:"post"
				, url:"/rent/user/admin_signup"
				, data:{"loginId":loginId, "password":password, "name":name, "phoneNumber":phoneNumber, "email":email}
				, success:function(data){
					if(data.result == "success") {
						location.href = "/rent/user/signin/view";
					}else {
						alert(data.result);
					}
				}
				, error:function(){
					alert("회원가입 에러");
				}						
			});				
		});
	
	});	
	</script>

</body>
</html>