<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<!-- 마이페이지 -->

<head>

	<!-- Basic -->
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	
	<!-- Mobile Metas -->
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	
	<title>HotSource</title>
	
	<%@ include file="../../main/inc/head_link.jsp" %>

</head>

<body>

	<!-- 헤더 및 배너 영역 시작 -->
	<div class="hero_area">
		<!-- 헤더 영역 시작 -->
		<%@ include file="../../main/inc/header_simple.jsp" %>
		<!-- 헤더 영역 끝-->
	</div>
	<!-- 헤더 및 배너 영역 끝 -->
	
	<!-- 사이드바, 컨텐트 영역 시작 -->
	<%@ include file="content.jsp" %>
	<!-- 사이드바, 컨텐트 영역 끝 -->

	<!-- 푸터 영역 시작 -->
	<%@ include file="../../main/inc/footer.jsp" %>
	<!-- 푸터 영역 끝 -->

	<!-- Js Plugins 시작 -->
	<%@ include file="../../main/inc/footer_link.jsp" %>
	<!-- Js Plugins 끝 -->
</script>
</body>

</html>