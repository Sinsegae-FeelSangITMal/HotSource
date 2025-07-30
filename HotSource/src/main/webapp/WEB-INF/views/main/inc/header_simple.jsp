<%@page import="hotsource.domain.User"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	User loginUser = (User) session.getAttribute("user");
%>

<header class="header_section">
	<div class="">		<!-- container엿음 -->
		<nav class="navbar navbar-expand-lg custom_nav-container ">
		
			<!-- 왼쪽 상단 로고 시작-->
			<a class="navbar-brand" href="/main/index">
				<img src="/static/images/main_logo.png" alt="" style="width:200px">
			</a>
			<!-- 왼쪽 상단 로고 끝 -->
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<!-- 우측 버튼들 시작 -->
			<div class="user_option simple">
				<!-- My Account 메뉴 시작 -->
				<div class="nav-item dropdown">
						<%@ include file="login_menu.jsp" %>
                   	</div>
				<!-- My Account 메뉴 끝 -->
			</div>
			<!-- 우측 버튼들 끝 -->
			</div>
			
		</nav>
	</div>
</header>