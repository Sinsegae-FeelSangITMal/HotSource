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
<%
	boolean result = true;			// false로 변경 시 검색 결과 없을 경우의 화면 볼 수 있음
	boolean isPurchased = true;
%>
<!DOCTYPE html>
<html>
<head>
<!-- Basic -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<!-- Mobile Metas -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />

<title>HotSource Seller</title>

<%@ include file="../inc/head_link.jsp"%>

<title>Seller Page</title>
</head>

<body>

	<!-- 헤더 영역 시작 -->
	<div class="hero_area">
		<%@ include file="../inc/header_search.jsp"%>
	</div>
	<!-- 헤더 영역 끝 -->

	<!-- 컨텐츠 영역 시작 -->

	<!-- 판매자 프로필 카드 영역 시작 -->
	<section class="seller-profile py-5">
		<div class="container bg-white shadow rounded p-4" style="max-width: 900px; margin: auto;">
			<div class="row align-items-center">
				<!-- 프로필 이미지 -->
				<div class="col-md-3 text-center mb-3 mb-md-0">
					<img class="artist-avatar" src="/static/images/big_logo.png" alt="작가 프로필" class="img-fluid rounded-circle" style="width: 150px; height: 150px;">
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
						<i class="bi bi-instagram"></i> &nbsp
						<%= seller.getSeller_insta_url() %>
						<br> <i class="bi bi-envelope"></i> &nbsp
						<%= seller.getSeller_email() %>
					</p>
				</div>
			</div>

			<!-- 하단 통계 및 버튼 -->
			<div class="row mt-4 text-center">
				<div class="col-md-4">
					<p class="text-muted">Subscriber</p>
					<p class="fw-bold mb-0 fs-5"><%= request.getAttribute("subscribeCount") %></p>
				</div>
				<div class="col-md-4">
					<p class="text-muted">Works</p>
					<p class="fw-bold mb-0 fs-5"><%= request.getAttribute("assetCount") %></p>
				</div>
				<div class="col-md-4">
					<p class="text-muted">Reviews</p>
					<!-- 별점 -->
					<div class="seller-rating">
					    <span class="seller-rating-result"></span>
					    <p class="fw-bold mb-0 fs-5">
					    	<%= request.getAttribute("assetRate") != null ? request.getAttribute("assetRate") : "0.0" %>
					    </p>
					    <i class="seller-rating-star far fa-star"></i>
					    <i class="seller-rating-star far fa-star"></i>
					    <i class="seller-rating-star far fa-star"></i>
					    <i class="seller-rating-star far fa-star"></i>
					    <i class="seller-rating-star far fa-star"></i>
					</div>
				</div>
			</div>

			<!-- 버튼 -->
			<div class="text-center mt-3">
				<button id="follow-btn" class="follow-btn false me-2">+ Follow</button>
				<button id="donation-btn" class="donation-btn">
					<i class="bi bi-cash-coin"></i>Donation
				</button>
			</div>
		</div>
	</section>
	<!-- 판매자 프로필 카드 영역 끝 -->

	<!-- 버튼 탭 영역 시작 -->
	<section>
		<div class="container mt-4">
			<div class="d-flex justify-content-start border-bottom">
				<button class="tab-btn active me-3" data-tab="1">Assets</button>
				<button class="tab-btn me-3" data-tab="2">List</button>
				<button class="tab-btn" data-tab="3">Post</button>
			</div>
		</div>

		<!-- 탭 콘텐츠 영역 -->
		<div class="container">
			<!-- Asset TAP 영역 시작-->
			<div class="tab-content active" id="1">
				<%@ include file="seller_assets.jsp"%>				
			</div>
			<!-- Asset TAP 영역 끝-->
			
			<!-- List TAP 영역 시작-->
			<div class="tab-content" id="2" >
				<%@ include file="seller_list.jsp"%>
			</div>
			<!-- List TAP 영역 끝-->
			
			<!-- Post TAP 영역 -->
			<div class="tab-content" id="3">
				<%@ include file="seller_post.jsp"%>
			</div>
			<!-- Post TAP 영역 끝-->
		</div>
	</section>
	<!-- 버튼 탭 영역 끝 -->

	<!-- 데이터 매핑 테스트 영역 시작-->
	<div>
		<h1>작가 상세 페이지</h1>
		<h3><%= seller.getSeller_name() %></h3>

		<% if (notice != null) { %>
			Notice ID:
			<%= notice.getNotice_id() %>, <br> Notice Content:
			<%= notice.getContent()%>
			<br>
		<% } else { %>
			<h3>Notice 객체가 없습니다.</h3>
		<% } %>

		<% if (noticeLike != null) { %>
			NoticeLike isLike:
			<%= noticeLike.is_like() %>, <br> NoticeLike userID:
			<%= noticeLike.getUser().getUser_id()%>, <br> NoticeLike
			userName:
			<%= noticeLike.getUser().getUser_name()%>
			<br>
		<% } else { %>
			<h3>NoticeLike 객체가 없습니다.</h3>
		<% } %>

		<% if (noticeComment != null) { %>
			NoticeComment ID:
			<%= noticeComment.getNotice_comment_id()%>, <br> NoticeComment
			Content:
			<%= noticeComment.getContent()%>
			<br>
		<% } else { %>
			<h3>NoticeComment 객체가 없습니다.</h3>
		<% } %>
	</div>
	<!-- 데이터 매핑 테스트 영역 끝 -->


	<!-- 컨텐츠 영역 끝 -->

	<!-- 푸터 영역 시작 -->
	<%@ include file="../inc/footer.jsp"%>
	<!-- 푸터 영역 끝 -->

	<!-- Js Plugins 시작 -->
	<%@ include file="../inc/footer_link.jsp"%>
	<!-- Js Plugins 끝 -->
</body>
<script>
	document.addEventListener("DOMContentLoaded", function () {
		// 팔로우 버튼
    	const followBtn = document.getElementById('follow-btn');

		followBtn.addEventListener('click', function () {
    	    const isFollowing = followBtn.classList.contains('true');

    	    if (isFollowing) {
	    	      followBtn.classList.remove('true');
	    	      followBtn.classList.add('false');
	    	      followBtn.textContent = '+ Follow';
    	    } else {
    	      followBtn.classList.remove('false');
    	      followBtn.classList.add('true');
    	      followBtn.textContent = 'Followed';
    	    }
		});
    	
		// 탭 이동 버튼
		const buttons = document.querySelectorAll('.tab-btn');
		const contents = document.querySelectorAll('.tab-content');

		buttons.forEach(btn => {
		  	btn.addEventListener('click', () => {
			    const tab = btn.dataset.tab.trim();
	
			    buttons.forEach(b => b.classList.remove('active'));
			    btn.classList.add('active');

			    contents.forEach(content => {
		    	    if (content.id.trim() === tab) {
		    	    	content.classList.add('active');
		    	    } else {
		    	    	content.classList.remove('active');
		    	    }
		    	});
		  	});
		});
	});
	
	// 별점
	const ratingStars = [...document.getElementsByClassName("seller-rating-star")];
	const ratingResult = document.querySelector(".seller-rating-result");
	
	printRatingResult(ratingResult);
	
	function executeRating(stars, resultStar) {
	   const starClassActive = "seller-rating-star fas fa-star";
	   const starClassUnactive = "seller-rating-star far fa-star";
	   const starsLength = stars.length;
	   let i;
	   stars.map((star) => {
	      star.onclick = () => {
	         i = stars.indexOf(star);
	
	         if (star.className.indexOf(starClassUnactive) !== -1) {
	            printRatingResult(resultStar, i + 1);
	            for (i; i >= 0; --i) stars[i].className = starClassActive;
	         } else {
	            printRatingResult(resultStar, i);
	            for (i; i < starsLength; ++i) stars[i].className = starClassUnactive;
	         }
	      };
	   });
	}
	
	function printRatingResult(resultStar, num = 0) {
		resultStar.textContent = `${num}/5`;
	}
	
	executeRating(ratingStars, ratingResult);
</script>
</html>