<%@page import="hotsource.domain.Seller"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Seller seller = (Seller)request.getAttribute("seller");
%>
<!DOCTYPE html>
<html>
<head>
	<!-- Basic -->
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	
	<!-- Mobile Metas -->
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	
	<title>HotSource Seller</title>
	
	<%@ include file="../inc/head_link.jsp" %>
<title>Insert title here</title>
</head>
<body>
	
	<!-- 헤더 영역 시작 -->
	<div class="hero_area">
		<!-- 헤더 영역 시작 -->
		<%@ include file="../inc/header.jsp" %>
		<!-- 헤더 영역 끝-->
	</div>
	<!-- 헤더 영역 끝 -->
	
	<!-- 컨텐츠 영역 시작 -->
	<h1>작가 상세 페이지</h1>
	<h3><%= seller.getSeller_name() %></h3>

	<!-- 컨텐츠 영역 끝 -->
	
	<!-- 푸터 영역 시작 -->
	<%@ include file="../inc/footer.jsp" %>
	<!-- 푸터 영역 끝 -->

	<!-- Js Plugins 시작 -->
	<%@ include file="../inc/footer_link.jsp" %>
	<!-- Js Plugins 끝 -->
</body>
</html>