<%@ page contentType="text/html; charset=UTF-8"%>

<header class="header_section">
	<div class="">		<!-- container엿음 -->
		<nav class="navbar navbar-expand-lg custom_nav-container ">
		
			<!-- 왼쪽 상단 로고 시작-->
			<a class="navbar-brand" href="/main/index/">
				<img src="/static/images/main_logo.png" alt="" style="width:200px">
			</a>
			<!-- 왼쪽 상단 로고 끝 -->
		
			<!-- 중앙 메뉴 시작 -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class=""> </span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav  mx-auto ">
					<li class="nav-item active"><a class="nav-link"
						href="main.html">Home <span class="sr-only">(current)</span></a>
					</li>
					<li class="nav-item"><a class="nav-link" href="menu.html">Image</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="about.html">Sound</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="book.html">Sale</a>
					</li>
				</ul>
				<!-- 중앙 메뉴 끝 -->
				
				<!-- 우측 버튼들 시작 -->
				<div class="user_option">
				
					<!-- 알림 시작 -->
					<div class="nav-item dropdown">
						<a class="" data-toggle="dropdown" href="#">
							<img class="bell_link" src="/static/images/bell.png" alt="">
							<div class="qty">4</div>
						</a>
						<!-- 드롭다운 메뉴 시작 -->
						<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						
						<%for (int i=0;i<3;i++) {%>
			            	<!-- 상품 하나 시작 -->
							<a href="#" class="dropdown-item">
								<div class="media">
									<img src="/static/images/test1.gif" style="width:60px;" alt="User Avatar" class="img-size-50 mr-3 img-circle">
									<div class="media-body">
										<p class="text-sm">개짱멋진 작가의 알림 "똥 싸고 있습니다"</p>
										<p class="text-sm text-muted">개쩌는 작가 이름</p>
					              	</div>
				            	</div>
							</a>
							<!-- 상품 하나 끝 -->
							<div class="dropdown-divider"></div><!-- 구분선 -->
						<%} %>
				          
						<a href="#" class="dropdown-item dropdown-footer">알림 지우기</a>
						</div>
						<!-- 드롭다운 메뉴 끝 -->
					</div>
					<!-- 알림 끝 -->
					
					<!-- 찜 시작 -->
					<a class="" data-toggle="" href="#">
						<img class="wish_link" src="/static/images/wish.png" alt="">
						<div class="qty">2</div>
					</a>
					
					<!-- 장바구니 시작 -->
					<div class="nav-item dropdown">
						<a class="" data-toggle="dropdown" href="#">
							<img class="cart_link" src="/static/images/cart.png" alt="">
							<div class="qty">3</div>
						</a>
						<!-- 드롭다운 메뉴 시작 -->
						<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
						
						<%for (int i=0;i<3;i++) {%>
			            	<!-- 상품 하나 시작 -->
							<a href="#" class="dropdown-item">
								<div class="media">
									<img src="/static/images/test1.gif" style="width:60px;" alt="User Avatar" class="img-size-50 mr-3 img-circle">
									<div class="media-body">
										<p class="text-sm">개짱멋진 리소스 이름</p>
										<p class="text-sm text-muted">개쩌는 작가 이름</p>
					              	</div>
				            	</div>
							</a>
							<!-- 상품 하나 끝 -->
							<div class="dropdown-divider"></div><!-- 구분선 -->
						<%} %>
				          
						<a href="#" class="dropdown-item dropdown-footer">장바구니로 이동</a>
						</div>
						<!-- 드롭다운 메뉴 끝 -->
					</div>
					<!-- 장바구니 끝 -->
					
					<!-- My Account 메뉴 시작 -->
					<div class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" role="button" id="pages" data-toggle="dropdown" aria-expanded="false">My Account</a>
							<!-- 드롭다운 메뉴 시작 -->
							<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                        		<li><a href="index.html" class="dropdown-item">Orders </a></li>
                        		<li><a href="index.html" class="dropdown-item">My Assets </a></li>
                        		<li><a href="index.html" class="dropdown-item">Dashboard </a></li>
                        		<li><a href="index.html" class="dropdown-item">Settings </a></li>
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