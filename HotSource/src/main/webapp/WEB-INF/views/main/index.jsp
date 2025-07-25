<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>

	<!-- Basic -->
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	
	<!-- Mobile Metas -->
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	
	<title>HotSource</title>
	
	<%@ include file="./inc/head_link.jsp" %>

</head>

<body>

	<!-- 헤더 및 배너 영역 시작 -->
	<div class="hero_area">
		<!-- 배너 배경 이미지 시작 -->			
		<div class="bg-box">
			<img src="/static/images/big_logo.png" alt="">
		</div>
		<!-- 배너 배경 이미지 끝 -->			
	
		<!-- 헤더 영역 시작 -->
		<%@ include file="./inc/header.jsp" %>
		<!-- 헤더 영역 끝-->
		
		<!-- 배너 영역 시작 -->
		
		<%@ include file="./inc/banner.jsp" %>
		<!-- 배너 영역 끝 -->
	</div>
	<!-- 헤더 및 배너 영역 끝 -->
	
	<!-- 컨텐츠 영역 시작 -->
	<!-- 컨텐츠 영역 끝 -->
	
	<!-- 푸터 영역 시작 -->
	<%@ include file="./inc/footer.jsp" %>
	<!-- 푸터 영역 끝 -->

	<!-- Js Plugins 시작 -->
	<%@ include file="./inc/footer_link.jsp" %>
	<!-- Js Plugins 끝 -->

</body>

</html>