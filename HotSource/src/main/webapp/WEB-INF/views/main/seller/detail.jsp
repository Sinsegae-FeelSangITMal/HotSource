<%@page import="hotsource.domain.User"%>
<%@page import="hotsource.domain.NoticeComment"%>
<%@page import="hotsource.domain.NoticeLike"%>
<%@page import="hotsource.domain.Notice"%>
<%@page import="hotsource.domain.Seller"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	User user = (User)request.getAttribute("user");
	Seller seller = (Seller)request.getAttribute("seller");
	Notice notice = (Notice)request.getAttribute("notice");
	NoticeLike noticeLike = (NoticeLike)request.getAttribute("noticeLike");
	NoticeComment noticeComment = (NoticeComment)request.getAttribute("noticeComment");
	
	a = true;
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
		<%@ include file="../inc/header_search.jsp" %>
		<!-- 헤더 영역 끝-->
	</div>
	<!-- 헤더 영역 끝 -->
	
	<!-- 컨텐츠 영역 시작 -->
	
	<!-- 판매자 프로필 카드 영역 시작 -->
	<section class="seller-profile py-5">
		<div class="container bg-white shadow rounded p-4" style="max-width: 900px; margin: auto;">
			<div class="row align-items-center">
				<!-- 프로필 이미지 -->
				<div class="col-md-3 text-center mb-3 mb-md-0">
					<img class="artist-avatar" src="/static/images/big_logo.png" alt="작가 프로필"
						class="img-fluid rounded-circle"
						style="width: 150px; height: 150px;">
				</div>

				<!-- 정보 텍스트 -->
				<div class="col-md-9">
					<h2 class="fw-bold"><%= seller.getSeller_nickname() %></h2>
					<p class="mb-1 fw-semibold">2D Pixel Artist</p>
					<p class="text-muted mb-2">
						<%= seller.getSeller_bio() %>
					</p>

					<!-- SNS 및 이메일 -->
					<p class="mb-2">
						<i class="bi bi-instagram"></i>
						<%= seller.getSeller_insta_url() %><br> <i class="bi bi-envelope"></i>
						<%= seller.getSeller_email() %>
					</p>

				</div>
			</div>

			<!-- 하단 통계 및 버튼 -->
			<div class="row mt-4 text-center">
				<div class="col-md-4">
					<p class="fw-bold mb-0 fs-5">## 구독자수 ##</p>
					<p class="text-muted">Subscriber</p>
				</div>
				<div class="col-md-4">
					<p class="fw-bold mb-0 fs-5">## 작업수 ##</p>
					<p class="text-muted">Works</p>
				</div>
				<div class="col-md-4">
					<p class="fw-bold mb-0 fs-5">
						⭐
						 ##리뷰</p>
					<p class="text-muted">Reviews</p>
				</div>
			</div>

			<!-- 버튼 -->
			<div class="text-center mt-3">
				<button class="btn btn-danger me-2">+ Follow</button>
				<button class="btn btn-outline-secondary">
					<i class="bi bi-currency-dollar"></i> Donation
				</button>
				<% if (a == true) %><button class="follow-btn false">+ Follow</button>
      			<% if (a == false) %><button class="follow-btn true">Followed</button>
			</div>
		</div>
	</section>
	
	<%@ include file="../inc/search_artist_all.jsp" %>
	
	<%@ include file="../inc/search_artist_mini.jsp" %>
	
	<%@ include file="../search_artist.jsp" %>
	
	<
	<!-- 판매자 프로필 카드 영역 끝 -->
	
	<!-- 데이터 매핑 테스트 영역 시작-->
	<div>
		<h1>작가 상세 페이지</h1>
		<h3><%= seller.getSeller_name() %></h3>
		
		<% if (notice != null) { %>
		  	Notice ID: <%= notice.getNotice_id() %>, <br>
		  	Notice Content: <%= notice.getContent()%> <br>
		<% } else { %>
		  <h3>Notice 객체가 없습니다.</h3>
		<% } %>
		
		<% if (noticeLike != null) { %>
		  	NoticeLike isLike: <%= noticeLike.getIs_like() %>, <br>
		  	NoticeLike userID: <%= noticeLike.getUser().getUser_id()%>, <br>
		  	NoticeLike userName: <%= noticeLike.getUser().getUser_name()%> <br>
		<% } else { %>
		  <h3>NoticeLike 객체가 없습니다.</h3>
		<% } %>
		
		<% if (noticeComment != null) { %>
		  	NoticeComment ID: <%= noticeComment.getNotice_comment_id()%>, <br>
		  	NoticeComment Content: <%= noticeComment.getContent()%> <br>
		<% } else { %>
		  <h3>NoticeComment 객체가 없습니다.</h3>
		<%} %>
	</div>
	<!-- 데이터 매핑 테스트 영역 끝 -->
	

	<!-- 컨텐츠 영역 끝 -->
	
	<!-- 푸터 영역 시작 -->
	<%@ include file="../inc/footer.jsp" %>
	<!-- 푸터 영역 끝 -->

	<!-- Js Plugins 시작 -->
	<%@ include file="../inc/footer_link.jsp" %>
	<!-- Js Plugins 끝 -->
</body>
</html>