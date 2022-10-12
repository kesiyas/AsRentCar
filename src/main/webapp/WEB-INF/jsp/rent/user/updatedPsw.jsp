<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AS렌터카 - 비밀번호 변경</title>
	
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
			<div class="box d-flex flex-column">
				<h2 class="text-center">비밀번호 변경</h2>
				
				<div class="mt-4">
					<input type="password" class="input_style form-control" id="newPw_Input" placeholder="새 비밀번호">
					<div class="d-none text-danger ml-2" id="passwordChk"><small>필수 정보입니다.</small></div>
					<div class="d-none text-warning ml-2" id="passwordChk_2"><small>영문, 숫자, 특수문자(! @ # $ % ^ & + =) 포함 8~20자 이내로 등록해 주십시오.</small></div>
					<div class="d-none text-info ml-2" id="passwordChk_3"><small>사용 가능한 비밀번호입니다.</small></div>
					
					<input type="password" class="mt-3 input_style form-control" id="newPwCheck_Input" placeholder="새 비밀번호 확인">
				</div>
				
				<button class="btn signin-btn" id="pw_update-btn">비밀번호 변경</button>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
	</div>
	
	<script>
		$(document).ready(function(){
			
			$("#newPw_Input").on("change", function(){

				let password = $("#newPw_Input").val();
				let pswLength = password.length;
				let checkPsw = /^[a-z0-9!@$!%*#^?&\\(\\)\-_=+]{8,20}$/;
											
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
			
			$("#pw_update-btn").on("click", function(){
				
				let password = $("#newPw_Input").val();
				let passwordCheck = $("#newPwCheck_Input").val();
				let checkPsw = /^[a-z0-9!@$!%*#^?&\\(\\)\-_=+]{8,20}$/;
				
				if(password == "") {
					
					alert("비밀번호를 입력해주세요.");
					return ;
				}
				
				if(password != passwordCheck) {
					
					alert("비밀번호가 맞지 않습니다.");
					return ;
				}
				
				if(!checkPsw.test(password)) {				
					return ; 
				}
				
				$.ajax({
					type:"post"
					, url:"/rent/user/pw_update"
					, data:{"password":password}
					, success:function(data){
						if(data.result == "success") {
							alert("비밀번호 변경 성공");
							location.href="/rent/user/signin/view";
						}else {
							alert("비밀번호 변경 실패");
						}											
					}
					, error:function(){
						alert("비밀번호 변경 에러");
					}
				});	
				
			});	
		});
	</script>
</body>
</html>