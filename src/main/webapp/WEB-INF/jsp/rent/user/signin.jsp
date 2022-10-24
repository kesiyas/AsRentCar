<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AS렌터카 - 로그인</title>
	
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
				<h2 class="text-center">로그인</h2>
				
				<div class="d-flex justify-content-center align-items-center radio_input">
					<input type="radio" class="mr-2 radio_input_style" name="signin" checked="checked" value="member"> <label>개인회원</label>
					<input type="radio" class="mr-2 ml-5 radio_input_style" name="signin" value="none_member"> <label>비회원</label>
				</div>
				
				<!-- 회원 input -->
				<div class="mt-4" id="member_Input">
					<input type="text" class="input_style form-control" id="loginId_Input" placeholder="아이디 입력">
					<input type="password" class="mt-3 input_style form-control" id="password_Input" placeholder="비밀번호 입력">
				</div>
				<!-- 회원 input -->
				
				<!-- 비회원 input -->
				<div class="mt-4 d-none" id="none_member_Input">
					<input type="text" class="input_style form-control" id="name_Input" placeholder="이름 입력" >
					<input type="text" class="mt-3 input_style form-control" id="email_Input" placeholder="이메일 입력">
				</div>		
				<!-- 비회원 input -->
				
				<button class="btn signin-btn" id="login-btn">로그인</button>
				
				<div class="d-flex justify-content-between col-7 signin-menu">
					<a href="/rent/user/signup/view" class="signin-menu-style">회원가입</a>
					<a href="/rent/user/id_search/view" class="signin-menu-style">아이디 찾기</a>
					<a href="/rent/user/pw_search/view" class="signin-menu-style">비밀번호 찾기</a>
				</div>
			</div>
		
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
	</div>
	
	<script>
	$(document).ready(function(){
		
		// 회원, 비회원 라디오 버튼 변경
		$("input[name='signin']").on("change", function(){
					
			if($(this).val() == "member") {
				
				$("#member_Input").removeClass("d-none");
				$("#none_member_Input").addClass("d-none");
			} else {
				$("#none_member_Input").removeClass("d-none");
				$("#member_Input").addClass("d-none");
			}
			
		});
		
		// 로그인 기능
		$("#login-btn").on("click", function(){
			
			let loginId = $("#loginId_Input").val();
			let password = $("#password_Input").val();
			
			if(loginId == ""){
				alert("아이디를 입력해주세요.");
				return ;
			}
			
			if(password == ""){
				alert("비밀번호를 입력해주세요.");
				return ;
			}
			
			$.ajax({
				type:"post"
				, url:"/rent/user/signin"
				, data:{"loginId":loginId, "password":password}				
				, success:function(data){
					if(data.result == "success"){
						location.href="/rent/rentcar/home/view";
					}else {
						alert("로그인 실패");
					}
				}
				, error:function(){
					alert("로그인 에러");
				}
				
			});
			
		});
	});
	
	</script>
</body>


</html>