<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AS렌터카 - 지점 등록</title>
	
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
			
				<h2 class="text-center">지점정보 입력</h2>	
				
				<div class="mt-4">
					<label class="info">지점 명<span class="font-color ml-1">*</span></label>
					<input type="text" class="form-control center_input_style" placeholder="지점 명" id="centerName_Input">
					
					<div class="d-flex flex-column">
						<label class="info mt-3">장/단기<span class="font-color ml-1">*</span></label>
						<select class="center_selectBox_style form-control w-25" name="term">
							<option>단기렌터카</option>
							<option>장기렌터카</option>
							<option>장/단기렌터카</option>
						</select>
					</div>
					
					<div class="d-flex flex-column">
						<label class="info mt-3">지역<span class="font-color ml-1">*</span></label>
						<select class="center_selectBox_style form-control" name="city">
							<option>서울</option>
							<option>경기도</option>
							<option>제주도</option>
							<option>인천</option>
						</select>
					</div>
					
					<label class="info mt-3">상세주소<span class="font-color ml-1">*</span></label>
					<input type="text" class="form-control center_input_style" placeholder="상세 주소" id="address_Input">
					
					<label class="info mt-3">대표자 명<span class="font-color ml-1">*</span></label>
					<input type="text" class="form-control center_input_style" placeholder="이름" id="name_Input">
					
					<label class="info mt-3">대표 번호<span class="font-color ml-1">*</span></label>
					<input type="text" class="form-control center_input_style" placeholder="대표 번호" id="phoneNumber_Input">
				</div>
				
				<button class="btn mt-3 col-4 branch-btn" id="next-btn">다음</button>
			</div>
		
		</section>
		
		<c:import url="/WEB-INF/jsp/include/footer.jsp"></c:import>
	</div>	

	<script>
		$(document).ready(function(){
			
			$("#next-btn").on("click", function(){
		
				let centerName = $("#centerName_Input").val();
				let term = $("select[name = 'term']").val();
				let city = $("select[name = 'city']").val();
				let address = $("#address_Input").val();
				let name = $("#name_Input").val();
				let phoneNumber = $("#phoneNumber_Input").val();
				
				let checkPhone = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;				
				
				if(centerName == "") {
					alert("지점 명을 입력해주세요.");
					return ;
				}
				
				if(term == "") {
					alert("장/단기 여부를 지정해주세요.");
					return ;
				}
				
				if(city == "") {
					alert("도시명을 선택해주세요.");
					return ;
				}
				
				if(address == "") {
					alert("상세 주소를 입력해주세요.");
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
				
				if(!checkPhone.test(phoneNumber)) {				
					alert("전화 번호가 올바른 형식이 아닙니다.")				
					return;
				}
				
			$.ajax({
				type:"post"
				, url:"/rent/user/admin/branch"
				, data:{"centerName":centerName, "term":term, "city":city, "address":address, "name":name, "phoneNumber":phoneNumber}
				, success:function(data) {
					
					if(data.result == "success") {
						location.href = "/rent/user/admin/car/view";
					}else {
						alert("지점등록 실패");
					}
				}
				, error:function(){
					alert("지점등록 에러");
				}
			});	
		
			}); 
	
		});
	
	</script>
</body>
</html>