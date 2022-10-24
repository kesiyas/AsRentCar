<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<header>
			<div class="d-flex justify-content-between main-style">
				<h3><a href="/rent/rentcar/home/view" class="main-logo-style text-danger">AS
					<span class="text-info">렌터카</span></a></h3>			
				
				<nav class="main-menu col-7">
					<ul class="nav justify-content-between">
						<li class="nav-item"><a href=# class="nav-link text-dark">단기렌터카</a></li>
						<li class="nav-item"><a href=# class="nav-link text-dark">장기렌터카</a></li>
						<li class="nav-item"><a href=# class="nav-link text-dark">고객센터</a></li>			
					</ul>
				</nav>
				
				<div class="mt-4">
					<c:choose>
						<c:when test="${empty userId }">
							<a href="/rent/user/signin/view" class="util">로그인</a>
							<span><a href="/rent/user/signin/view" class="util_2">My렌터카</a></span>
						</c:when>
						<c:otherwise>
							<a href="/rent/user/signout" class="util">로그 아웃</a>
							<span><a href=# class="util_2">My렌터카</a></span>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</header>