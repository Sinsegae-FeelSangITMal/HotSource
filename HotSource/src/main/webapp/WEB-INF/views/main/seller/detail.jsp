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

<style>
.tab-btn {
	background: none;
	border: none;
	font-weight: bold;
	font-size: 1.1rem;
	padding: 10px 20px;
	cursor: pointer;
	color: #333;
	border-bottom: 3px solid transparent;
}

.tab-btn.active {
	color: #e53935;
	border-bottom: 3px solid #e53935;
}

.tab-content {
	display: none;
	background-color: white;
	transition: all 0.3s ease-in-out;
	height: auto; /* 고정 높이 제거 */
	padding: 20px 0; /* 위아래 여백 추가 */
}

.tab-content.active {
  	display: block;
}

.artist-card {
  display: block;
  justify-content: center; /* 중앙 정렬 */
  margin-top: 30px;
  gap: 20px; /* artist-card와 내부 요소 사이 여백 */
}

.rating {
   position: relative;
   width: 180px;
   background: transparent;
   display: flex;
   justify-content: center;
   align-items: center;
   gap: .3em;
   padding: 5px;
   overflow: hidden;
}

.rating__result {
   position: absolute;
   top: 0;
   left: 0;
   transform: translateY(-10px) translateX(-5px);
   z-index: -9;
   font: 3em Arial, Helvetica, sans-serif;
   color: #ebebeb8e;
   pointer-events: none;
}

.rating__star {
   font-size: 1.3em;
   cursor: pointer;
   color: #dabd18b2;
   transition: filter linear .3s;
}

.rating__star:hover {
   filter: drop-shadow(1px 1px 4px gold);
}





  .custom-card {
    width: 100%;
    aspect-ratio: 4 / 2; /* 가로:세로 비율을 2:1로 설정 */
    max-width: 300px;
    margin: 12px;
  }

  .asset-image {
    width: 50%;
    height: 50%;
    box-sizing: border-box;
    padding: 2px;
    border: 1px solid #ccc;
    object-fit: cover;
  }

  .image-grid {
    display: flex;
    flex-wrap: wrap;
    width: 100%;
    height: 100%;
  }






.post-card {
  background-color: white;
  border-radius: 10px;
  padding: 20px;
  margin-bottom: 20px;
  box-shadow: 0 0 10px #ccc;
  
  width: 100%;
  border-radius: 10px;
}

.post-header {
  display: flex;
  align-items: center;
  margin-bottom: 15px;
}

.post-avatar {
  width: 45px;
  height: 45px;
  border-radius: 50%;
}

.post-info {
  margin-left: 10px;
  display: flex;
}

.post-author {
  margin: 0;
  font-weight: bold;
  font-size: 1.1rem;
}

.post-time {
  font-size: 0.85rem;
  color: gray;
}

.post-body {
  display: flex;
  align-items: flex-start;
  gap: 20px;
}

.post-image {
  width: 200px;
  height: auto;
  border-radius: 5px;
  border: 1px solid #ddd;
}

.post-title {
  font-weight: bold;
  font-size: 1.1rem;
  margin-bottom: 10px;
}

.post-description {
  font-size: 0.85rem;
  color: #333;
}

.post-footer {
  margin-top: 15px;
  display: flex;
  gap: 15px;
}

.like-btn, .dislike-btn, .comment-btn, .send-btn {
  border: none;
  background: none;
  cursor: pointer;
  font-size: 1rem;
  color: #666;
  transition: color 0.2s ease-in-out;
}

.like-btn.active i, .dislike-btn.active i {
  color: red;
}

</style>

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
					<p class="fw-bold mb-0 fs-5">## 구독자수 ##</p>
				</div>
				<div class="col-md-4">
					<p class="text-muted">Works</p>
					<p class="fw-bold mb-0 fs-5">## 작업수 ##</p>
				</div>
				<div class="col-md-4">
					<p class="text-muted">Reviews</p>
					<!-- 별점 -->
					<!-- <p class="fw-bold mb-0 fs-5"> ##리뷰⭐⭐⭐⭐⭐</p> -->
					<div class="rating">
					    <span class="rating__result"></span> 
					    <i class="rating__star far fa-star"></i>
					    <i class="rating__star far fa-star"></i>
					    <i class="rating__star far fa-star"></i>
					    <i class="rating__star far fa-star"></i>
					    <i class="rating__star far fa-star"></i>
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
				<%@ include file="../inc/content_search_resource.jsp"%>				
			</div>
			<!-- Asset TAP 영역 끝-->
			
			<!-- List TAP 영역 시작-->
			<div class="tab-content" id="2" >
				<!-- 에셋 리스트 영역 시작 -->
				<div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4 mt-3 justify-content-center">
				  <% for (int i = 0; i < 8; i++) { %>
				  <div class="col d-flex justify-content-center">
				    <div class="card custom-card">
				      <div class="image-grid">
				        <img src="/static/images/test1.gif" class="asset-image" alt="asset-thumbnail">
				        <img src="/static/images/test1.gif" class="asset-image" alt="asset-thumbnail">
				        <img src="/static/images/test1.gif" class="asset-image" alt="asset-thumbnail">
				        <img src="/static/images/test1.gif" class="asset-image" alt="asset-thumbnail">
				      </div>
				      <div class="card-body p-2">
				        <h6 class="card-title mb-1">개쩡멋진 에셋 리스트 이름</h6>
				        <p class="card-text text-muted mb-0">14 Assets</p>
				      </div>
				    </div>
				  </div>
				  <% } %>
				</div>
				<!-- 에셋 리스트 영역 끝 -->
				
				<% if (true) { %> <!-- IMAGE 섹션 -->
					<section class="search-section">
						<div class="search-section-header">
							<h3>IMAGE</h3>
							<% if (result) { %>
								<a href="#">More ></a>
							<% } %>
						</div>
		
						<% if (!result) { %>
							<h2 class="result-heading not-found">No results</h2>
						<% } %>
		
						<% if (result) { %>
							<%@ include file="../inc/search_resource_mini.jsp"%>
						<% } %>
					</section>
				<% } %>
		
				<% if (true) { %> <!-- SOUND 섹션 -->
					<section class="search-section">
						<div class="search-section-header">
							<h3>SOUND</h3>
							<% if (result) { %>
								<a href="#">More ></a>
							<% } %>
						</div>
		
						<% if (!result) { %>
							<h2 class="result-heading not-found">No results</h2>
						<% } %>
		
						<% if (result) { %>
							<%@ include file="../inc/search_resource_mini.jsp"%>
						<% } %>
					</section>
				<% } %>
				
				<!-- 페이지 영역 시작 -->
				<%@ include file="../inc/page.jsp"%>
				<!-- 페이지 영역 끝 -->
			</div>
			<!-- List TAP 영역 끝-->
			
			<!-- Post TAP 영역 -->
			<div class="tab-content" id="3">
				<div class="artist-card">
					<%-- for (int i=1; i<=2; i++) {--%>
					<% for (int i=1; i<=2; i++) { %>
					<div class="post-card">
						<div class="post-header">
							<img class="artist-post-avatar" src="/static/images/big_logo.png" alt="작가 프로필" />
							<div class="post-info">
								<h5 class="post-author">Pomodoro</h5> &nbsp &nbsp
								<span class="post-time">2 Month Ago</span> &nbsp &nbsp
								<% if (true) %><span class="badge">NEW</span>
							</div>
						</div>

						<div class="post-body d-flex">
							<!-- <img src="/static/images/cozy_tileset_preview.png" alt="tileset" class="post-image">-->
							<img class="post-image" src="/static/images/test1.gif" alt="썸네일" />
							<div class="post-text ms-3">
								<h4 class="post-title">New Cozy Village Tileset Coming This Friday!</h4>
								<hr>
								<p class="post-description">
									Get ready for a brand-new tileset designed for cozy farming or
									slice-of-life games!<br> The "Cozy Village" pack includes
									houses, gardens, shops, and decorative elements — all in warm,
									pixel-perfect detail.<br>
									<br>Release Date: Friday, July 12th<br>
									<br> Stay tuned, and thank you for supporting indie art!
								</p>
							</div>
						</div>

						<div class="post-footer">
							<button class="like-btn">
								<i class="fas fa-thumbs-up"></i> <span>1,020</span>
							</button>
							<button class="dislike-btn">
								<i class="fas fa-thumbs-down"></i>
							</button>
							<button class="send-btn">
								<i class="bi bi-send-fill"></i>
							</button>
							<button class="comment-btn">
								<i class="fas fa-comment"></i> <span>37</span>
							</button>
						</div>
					</div>
					<% } %>
					<%--} --%>
				</div>
				
				<!-- 페이지 영역 시작 -->
				<%@ include file="../inc/page.jsp"%>
				<!-- 페이지 영역 끝 -->
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
		<%} %>
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
		const contents = document.querySelectorAll('.tab-content'); // 변수 이름 content → contents

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
	const ratingStars = [...document.getElementsByClassName("rating__star")];
	const ratingResult = document.querySelector(".rating__result");
	
	printRatingResult(ratingResult);
	
	function executeRating(stars, resultStar) {
	   const starClassActive = "rating__star fas fa-star";
	   const starClassUnactive = "rating__star far fa-star";
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