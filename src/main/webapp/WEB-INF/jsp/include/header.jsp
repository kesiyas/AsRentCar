<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<header>
			<div class="d-flex justify-content-between main-style">
				<h3><a href="/rent/rentcar/home/view" class="main-logo-style text-danger">AS
					<span class="text-info">렌터카</span></a></h3>			
				
				<nav class="main-menu col-7">
					<ul class="nav justify-content-between">
						<li class="nav-item"><a href=/rent/rentcar/short_rent_jeju/view class="nav-link text-dark">단기렌터카</a></li>
						<li class="nav-item"><a href=# class="nav-link text-dark">장기렌터카</a></li>
						<li class="nav-item"><a href=# class="nav-link text-dark">고객센터</a></li>			
					</ul>
				</nav>
				
				<div class="mt-4 d-flex align-items-center justify-content-center">
					<c:choose>
						<c:when test="${empty userId }">
							<a href="/rent/user/signin/view" class="util">로그인</a>
						</c:when>
						<c:otherwise>
							<a href="/rent/user/signout" class="util">로그 아웃</a>
						</c:otherwise>
					</c:choose>
					
					<div class="ml-2">
						<c:choose>
							<c:when test="${not empty authority }">
								<div class="info"><a href="/rent/user/admin/car/view" class="util_2">차량 등록</a></div>
							</c:when>
							<c:otherwise></c:otherwise>
						</c:choose>				
						
						<span><a href=# class="util_2">My렌터카</a></span>
					</div>					
				</div>
			</div>
		</header>