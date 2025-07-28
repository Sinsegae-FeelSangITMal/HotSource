<%@ page contentType="text/html; charset=UTF-8"%>

<header class="header_section">
	<div class="">		<!-- container엿음 -->
		<nav class="navbar navbar-expand-lg custom_nav-container ">
		
			<!-- 왼쪽 상단 로고 시작-->
			<a class="navbar-brand" href="index.html">
				<img src="/static/images/main_logo.png" alt="" style="width:200px">
			</a>
			<!-- 왼쪽 상단 로고 끝 -->
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<!-- 우측 버튼들 시작 -->
			<div class="user_option simple">
				<!-- My Account 메뉴 시작 -->
				<div class="nav-item dropdown">
					<a href="#" class="nav-link dropdown-toggle" role="button" id="pages" data-toggle="dropdown" aria-expanded="false">My Account</a>
						<!-- 드롭다운 메뉴 시작 -->
						<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                        		<li><a href="/main/mypage" class="dropdown-item">My Page </a></li>
                        		<li><a href="index.html" class="dropdown-item">Dashboard </a></li>
                        		<li><a href="index.html" class="dropdown-item">Log-out </a></li>
						</div>
						<!-- 드롭다운 메뉴 끝 -->
                    	</div>
				<!-- My Account 메뉴 끝 -->
			</div>
			<!-- 우측 버튼들 끝 -->
			</div>
			
		</nav>
	</div>
</header>