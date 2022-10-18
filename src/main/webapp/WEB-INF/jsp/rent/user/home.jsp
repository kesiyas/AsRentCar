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
		
	<link rel="stylesheet" href="css/jquery.datetimepicker.min.css" />
	<!-- jquery 로딩 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<!-- 플러그인 javascript 로딩 -->
	<script src="js/jquery.datetimepicker.full.min.js"></script>
			
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
	
	<link rel="stylesheet" href="/static/css/style.css" type="text/css">
</head>
<body>

	<div class="container">
	
		<c:import url="/WEB-INF/jsp/include/header.jsp"></c:import>
		
		<section class="contents">
			<div class="m-5">
				<div class="d-flex">
					<div class="content">
						<div class="txt01">
							<strong>가을 바람</strong> 타고<br>
							<strong>AS렌터카</strong> 타고
						</div>
						<img class="main_banner mt-5 ml-4" src="/static/img/main_banner.jpg" src="메인 배너 사진">
					</div>
				
					<div class="content d-flex flex-column">
						<div class="d-flex">
							<div class="btn" id="jeju">제주</div>
							<div class="btn" id="inland">내륙</div>
						</div>
						<div>
							<div><i class="bi bi-calendar2-check mr-2"></i>언제 필요하세요?</div>
							<a href="#" class="input_style btn form-control mt-3" id="datePopup"></a>
						</div>
						<div class="datePop d-none" id="rentDate">
							<div class="d-flex">
								<div id="datePicker_pop">
								
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
						
			$("#datePicker_pop").datetimepicker({
						    
				
			});
			
			
			
			$("#datePopup").on("click", function(e){
				
				e.preventDefault();
				
				$("#rentDate").removeClass("d-none");
							
			});

			
			
		});
	</script>
</body>
</html>