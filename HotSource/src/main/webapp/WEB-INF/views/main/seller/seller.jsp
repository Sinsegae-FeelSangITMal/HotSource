<%@page import="hotsource.domain.User"%>
<%@page import="hotsource.domain.NoticeComment"%>
<%@page import="hotsource.domain.NoticeLike"%>
<%@page import="hotsource.domain.Notice"%>
<%@page import="hotsource.domain.Seller"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	User user = (User)request.getAttribute("user");
	Seller seller = (Seller)request.getAttribute("seller");
	Notice notice = (Notice)request.getAttribute("notice");
	NoticeLike noticeLike = (NoticeLike)request.getAttribute("noticeLike");
	NoticeComment noticeComment = (NoticeComment)request.getAttribute("noticeComment");
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
	
	<title>HotSource_작가페이지</title>
	
	<%@ include file="../inc/head_link.jsp" %>
</head>
<body>
	<!-- 헤더 영역 시작 -->
	<div class="hero_area">
		<!-- 헤더 영역 시작 -->
		<%@ include file="../inc/header_search.jsp" %>
		<!-- 헤더 영역 끝-->
	</div>
	<!-- 헤더 영역 끝 -->
	
	<!-- 컨텐츠 영역 시작 -->
		<a href="/main/seller/detail?seller_id=<%= 1 %>">상세 페이지 이동(테스트용, seller_id==1)</a>
	<!-- 컨텐츠 영역 끝 -->
	
	<!-- 푸터 영역 시작 -->
	<%@ include file="../inc/footer.jsp" %>
	<!-- 푸터 영역 끝 -->

	<!-- Js Plugins 시작 -->
	<%@ include file="../inc/footer_link.jsp" %>
	<!-- Js Plugins 끝 -->
</body>
</html>