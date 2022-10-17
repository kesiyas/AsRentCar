<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AS렌터카 - 차량 등록</title>
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
				
				<h2 class="text-center">챠량정보 입력</h2>	
				
				<div class="mt-4">
					<div class="d-flex flex-column">
						<label class="info">차급<span class="font-color ml-1">*</span></label>
						<select class="center_selectBox_style form-control" name="grade">
							<option>경차</option>
							<option>소형차</option>
							<option>중형차</option>
							<option>대형차</option>
						</select>
					</div>			
					
					<label class="info mt-3">차종<span class="font-color ml-1">*</span></label>
					<input type="text" class="form-control center_input_style" placeholder="차종" id="modelName_Input">
					
					<label class="info mt-3">차량 번호<span class="font-color ml-1">*</span></label>
					<input type="text" class="form-control center_input_style" placeholder="차량 번호" id="carNumber_Input">
					
					<label class="info mt-3">연식<span class="font-color ml-1">*</span></label>
					<input type="text" class="form-control center_input_style" placeholder="연식" id="modelYear_Input">
					
					<label class="info mt-3">대여료<span class="font-color ml-1">*</span></label>
					<input type="text" class="form-control center_input_style" placeholder="대여료" id="rentalFee_Input">
					
					<!-- 이미지 업로드 -->
					<div class="mt-3">
						<div class="info mb-2">첨부파일<span class="font-color ml-1">*</span></div>
						<label for="fileInput" class="btn btn-success text-white w-100">파일 추가</label>
						<input type="file" class="d-none" id="fileInput">
					</div>
					<!-- 이미지 업로드 -->
				</div>
				
				<button class="btn mt-3 col-4 branch-btn" id="car-btn">등록</button>
			</div>
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
		
	</div>
	
	<script>
		$(document).ready(function(){
			$("#car-btn").on("click", function(){
				let carGrade = $("select[name = 'grade']").val();
				let modelName = $("#modelName_Input").val();
				let carNumber = $("#carNumber_Input").val();
				let modelYear = $("#modelYear_Input").val();
				let rentalFee = $("#rentalFee_Input").val();
				let file = $("#fileInput")[0].files[0];
				
				if(carGrade == "") {
					alert("해당하는 차급을 선택해주세요.");
					return ;
				}
				
				if(modelName == "") {
					alert("차종을 입력해주세요.");
					return ;
				}
				
				if(carNumber == "") {
					alert("차량 번호를 입력해주세요.");
					return ;
				}
				
				if(modelYear == "") {
					alert("차량 연식을 입력해주세요.");
					return ;
				}
				
				if(rentalFee == "") {
					alert("대여료를 입력해주세요.");
					return ;
				}
				
				if(file == "") {
					alert("해당하는 차급을 선택해주세요.");
					return ;
				}
				
				var formData = new FormData();
				formData.append("carGrade", carGrade);
				formData.append("modelName", modelName);
				formData.append("carNumber", carNumber);
				formData.append("modelYear", modelYear);
				formData.append("rentalFee", rentalFee);
				formData.append("file", $("#fileInput")[0].files[0]);
				
				$.ajax({
					type:"post"
					, url:"/rent/user/admin/car"
					, data:formData
					, enctype:"multipart/form-data"
					, processData:false
					, contentType:false
					, success:function(data){
						if(data.result == "success") {
							location.href = "/rent/user/signin/view";						
						} else {
							alert("차량 등록 실패");
						}
					}
					, error:function(){
						alert("차량 등록 에러");
					}
					
				});
				
			});
		});
	</script>
	
</body>
</html>