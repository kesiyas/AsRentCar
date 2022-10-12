<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AS렌터카 - 비밀번호 찾기</title>
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>	
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div class="contaier">
		<c:import url="/WEB-INF/jsp/include/header.jsp"></c:import>
		
		<section class="contents d-flex align-items-center justify-content-center">
			<div class="box d-flex flex-column">
				<h2 class="text-center">비밀번호 찾기</h2>
				
				<div class="text-center my-4">회원 가입 시 사용하신 회원 정보로 비밀번호를 찾을 수 있습니다.</div>
			
				<div class="mt-4">
					<input type="text" class="input_style form-control" id="loginId_Input" placeholder="아이디 입력">
					<input type="text" class="mt-3 input_style form-control" id="email_Input" placeholder="이메일">
					
					<div class="d-none" id="checkMail-div">
						<div class="d-flex align-items-center mt-2">
							<label class="mr-2 mt-1 info text-success">인증번호 : </label>
							<input type="text" class="form-control col-4" id="code_Input">
							<span class="text-primary ml-2" id="time"></span>
							<button class="btn ml-2 btn-secondary info" id="confirm-btn">확인</button>
						</div>
					</div>
					
					<div class="text-primary info d-none mt-2" id="checkedEmail">인증 완료</div>
					<button class="btn mt-2 info" id="mailCheck-btn">인증하기</button>
				</div>
				
				<button class="btn signin-btn btn-danger" id="pw_search-btn">비밀번호 찾기</button>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
	</div>

	<script>
		$(document).ready(function(){
			
			var timer = null;
			
			is_EmailCheck = false;
			is_CodeCheck = false;
						
			$("#pw_search-btn").on("click",function(){
				
				let loginId = $("#loginId_Input").val();
				
				if(loginId == "") {
					alert("아이디를 입력하세요.");
					return ;
				}
				
				if(!is_EmailCheck) {
					alert("이메일이 인증되지 않았습니다.");
				}
				
				if(!is_CodeCheck) {
					alert("이메일이 인증되지 않았습니다.");
				}
				
				$.ajax({
					type:"get"
					, url:"/rent/user/pw_search"
					, data:{"loginId":loginId}
					, success:function(data){
						
						if(data.result == "success") {
							alert("비밀번호 찾기 성공");
						}else {
							alert("비밀번호 찾기 실패");
						}
					}
					, error:function(){
						alert("비밀번호 찾기 에러");
					}
				});
				
			});
					
			// 이메일 코드 인증
			$("#confirm-btn").on("click",function(){				
				is_CodeCheck = false;
				
				let code = $("#code_Input").val();
				
				if(code == "") {
					
					alert("인증코드를 입력해주세요.");
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/rent/user/codeCheck"
					, data:{"code":code}
					, success:function(data) {
						
						if(data.result == "success") {
							
							$("#checkedEmail").removeClass("d-none");	
							$("#checkMail-div").addClass("d-none");
							
							alert("인증되었습니다.");	
							
							is_CodeCheck = true;
						} else {						
							alert("이메일 인증 실패");						
						}
					} 
					, error:function(){
						alert("이메일 코드 인증 에러");
					}
				});
				
			});
			
			$("#mailCheck-btn").on("click",function(){
				is_EmailCheck = false;
				
				let email = $("#email_Input").val();
				let checkEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
				
				if(email == "") {
					alert("이메일 주소를 입력하세요.")
					return ;
				}
				
				if(!checkEmail.test(email)) {			
					alert("이메일 주소가 올바른 형식이 아닙니다.")				
					return;
				}
				
				$.ajax({
					type:"post"
					, url:"/rent/user/mailCheck"
					, data:{"email":email}
					, success:function(data){
						if(data.result == "success"){
							alert("인증번호가 전송되었습니다.")
							
							$("#checkMail-div").removeClass("d-none");
							$("#mailCheck-btn").addClass("d-none");
							
							is_EmailCheck = true;
						}else {
							alert("가입된 이메일 주소가 아닙니다.");
						}						
					}
					, error:function(){
						alert("인증 에러");
					}
				});
									    
			  var display = $("#time");
			  var leftSec = 180;
			
			  // 인증시간 타이머
			  startTimer(leftSec, display);
			  
			});
			
			function startTimer(count, display) {  
				 
				  let minutes;
				  let seconds;
				  
				  timer = setInterval(function () {
				    minutes = parseInt(count / 60, 10);
				    seconds = parseInt(count % 60, 10);

				    minutes = minutes < 10 ? "0" + minutes : minutes;
				    seconds = seconds < 10 ? "0" + seconds : seconds;
				    
				    let time = minutes + ":" + seconds;

				    display.html(minutes + ":" + seconds);

				    // 타이머 종료
				    if (--count < 0) {
				      clearInterval(timer);
				      alert("인증 시간이 초과되었습니다.");
					  location.reload();
				      
				    }
				  }, 1000);			 
			}
		
		});
	</script>
</body>
</html>