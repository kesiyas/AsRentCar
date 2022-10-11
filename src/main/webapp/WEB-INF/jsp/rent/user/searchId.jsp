<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AS렌터카 - 아이디 찾기</title>

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
				<h2 class="text-center">아이디 찾기</h2>
				
				<div class="text-center my-4">회원 가입 시 사용하신 회원 정보로 아이디를 찾을 수 있습니다.</div>
			
				<div class="mt-4">
					<input type="text" class="input_style form-control" id="name_Input" placeholder="이름">
					<input type="text" class="mt-3 input_style form-control" id="phoneNumber_Input" placeholder="전화번호">
				</div>
				
				<button class="btn signin-btn btn-danger" id="id_search-btn">아이디 찾기</button>
			
				<div class="info mt-4">
					위 방법으로 아이디를 찾을 수 없는 경우 SK렌터카 고객센터로 연락주시기 바랍니다.<br>
					<span class="font-color">고객센터 1599-9111</span> (월 ~ 금 09:00 ~ 18:00/토요일 및 공휴일 휴무)
				</div>
			</div>
			
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
	</div>
	
	<script>
	
		$(document).ready(function(){
			
			$("#id_search-btn").on("click", function(){
				
				let name = $("#name_Input").val();
				let phoneNumber = $("#phoneNumber_Input").val();
				
				if(name == "") {
					alert("이름을 입력하세요.")
					return ;
				}
				
				if(phoneNumber == "") {
					alert("전화번호를 입력하세요.")
					return ;
				}
				
				$.ajax({
					type:"post"
					, url:"/rent/user/id_search"
					, data:{"name":name, "phoneNumber":phoneNumber}
					, success:function(data){
						if(data.result == "success"){
							alert("아이디 찾기 성공");
						}else {
							alert("아이디 찾기 실패");
						}
					}
					, error:function(){
						alert("아이디 찾기 에러");
					}
					
				});
			});		
		});
	</script>
</body>
</html>