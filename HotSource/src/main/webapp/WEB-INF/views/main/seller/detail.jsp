<%@page import="hotsource.domain.Asset"%>
<%@page import="hotsource.domain.User"%>
<%@page import="hotsource.domain.NoticeComment"%>
<%@page import="hotsource.domain.NoticeLike"%>
<%@page import="hotsource.domain.Notice"%>
<%@page import="hotsource.domain.Seller"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	Seller seller = (Seller)request.getAttribute("seller");
	List<Asset> assetList = (List<Asset>)request.getAttribute("assetList");
	List<Notice> noticeList = (List<Notice>)request.getAttribute("noticeList");

	User user = (User)request.getAttribute("user");
%>
<%
	boolean result = true;			// false로 변경 시 검색 결과 없을 경우의 화면 볼 수 있음
	//isPurchased = true;
	//boolean isPurchased = true;
	
	// 별점 가져오기
	double assetRate = 0.0;
	if (request.getAttribute("assetRate") != null) {
		assetRate = Double.parseDouble(request.getAttribute("assetRate").toString());
	}

	Boolean isFollowing = (Boolean) request.getAttribute("isFollowing");
	if (isFollowing == null) isFollowing = false;
	
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
		<div class="container bg-white shadow rounded p-4 overflow-hidden" style="max-width: 1100px; margin: auto;">
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
						<i class="bi bi-instagram"></i> &nbsp;
						<a href="<%= seller.getSeller_insta_url() != null ? seller.getSeller_insta_url() : "-" %>"  style="color: red; ">
							<%= seller.getSeller_insta_url() != null ? seller.getSeller_insta_url() : "-" %>
						</a>
						
						<br> 
						<i class="bi bi-envelope"></i> &nbsp;
						<%= seller.getSeller_email() != null ? seller.getSeller_email() : "-" %>
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
					<div class="seller-rating mx-auto">
					    <span class="seller-rating-result"><%= assetRate %>/5</span>
					    <p class="fw-bold mb-0 fs-5"><%= assetRate %></p>
					
					    <%	for (int i = 1; i <= 5; i++) {
					            if (assetRate >= i) {
					                // 꽉 찬 별
					    %>			<i class="fas fa-star seller-rating-star"></i>
					    <%		} else if (assetRate >= i - 0.5) {
					                // 반 별
					    %>			<i class="fas fa-star-half-alt seller-rating-star"></i>
					    <%		} else {
					                // 빈 별
					    %>			<i class="far fa-star seller-rating-star"></i>
					    <%		}
					        }
					    %>
					</div>
				</div>
					
					
					
			</div>
			<!-- 버튼 -->
			<div class="text-center mt-3">
				<!-- 구독 버튼 -->
				<% if (loginUser != null) { %>
					<%if(isFollowing) { %>
						<button class="follow-btn true" onclick="registSubscribe(<%= loginUser.getUser_id() %>, <%= seller.getSeller_id() %>)">
							<%= isFollowing ? "Followed" : "+ Follow" %>
						</button>
					<% } else { %>
						<button class="follow-btn false" onclick="registSubscribe(<%= loginUser.getUser_id() %>, <%= seller.getSeller_id() %>)">
							<%= isFollowing ? "Followed" : "+ Follow" %>
						</button>
					<% } %>
					
					
				<% } else { %>
				    <button class="follow-btn false" onclick="alert('로그인이 필요합니다.'); location.href='/main/user/login';">
				        + Follow
				    </button>
				<% } %>
				
				
				<!-- 도네이션 버튼-->
				<button id="donation-btn" class="donation-btn">
					<i class="bi bi-cash-coin"></i>Donation
				</button>
			</div>
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

	
	<!-- 컨텐츠 영역 끝 -->

	<!-- 푸터 영역 시작 -->
	<%@ include file="../inc/footer.jsp"%>
	<!-- 푸터 영역 끝 -->

	<!-- Js Plugins 시작 -->
	<%@ include file="../inc/footer_link.jsp"%>
	<!-- Js Plugins 끝 -->
</body>


<script>

	function registSubscribe(userId, sellerId){
		if (!userId || !sellerId) {
			  alert("로그인 정보가 유효하지 않거나 seller 정보를 찾을 수 없습니다.");
			  return;
		}
	
	    $.ajax({
	        url: "/main/seller/subscribe",
	        type: "post",
	        data: {
	            user_id: userId,
	            seller_id: sellerId
	        },
	        success: function(result, status, xhr){
	            
	            location.reload();  // 새로고침
	        },
	        error:function(xhr, status, err){
	            
	            location.reload();  // 새로고침
	        }
	    });
	}


	// 탭 이동 버튼 ---------------------------------------------------------------
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
	
	// 별점 클릭 함수 시작 ---------------------------------------------------------------
	const ratingStars = [...document.getElementsByClassName("seller-rating-star")];
	const ratingResult = document.querySelector(".seller-rating-result");

	printRatingResult(ratingResult);

	function executeRating(stars, resultStar) {
		const starsLength = stars.length;
		let selectedRating = parseFloat(resultStar.textContent); // 초기값 고정

		stars.forEach((star, index) => {
			star.addEventListener("mousemove", (e) => {
				const rect = star.getBoundingClientRect();
				const offsetX = e.clientX - rect.left;
				const isHalf = offsetX < rect.width / 2;
				const rating = isHalf ? index + 0.5 : index + 1;

				highlightStars(stars, rating);
				printRatingResult(resultStar, rating);
			});

			star.addEventListener("click", (e) => {
				const rect = star.getBoundingClientRect();
				const offsetX = e.clientX - rect.left;
				const isHalf = offsetX < rect.width / 2;
				const rating = isHalf ? index + 0.5 : index + 1;

				selectedRating = rating; // 🔥 클릭한 값을 저장
				highlightStars(stars, rating);
				printRatingResult(resultStar, rating);
			});
		});

		// 마우스가 별점 영역 벗어나면 클릭된 값으로 고정 표시
		const container = document.querySelector(".seller-rating");
		container.addEventListener("mouseleave", () => {
			highlightStars(stars, selectedRating);
			printRatingResult(resultStar, selectedRating);
		});
	}

	function highlightStars(stars, score) {
		stars.forEach((star, i) => {
			if (score >= i + 1) {
				star.className = "seller-rating-star fas fa-star"; // full star
			} else if (score >= i + 0.5) {
				star.className = "seller-rating-star fas fa-star-half-alt"; // half star
			} else {
				star.className = "seller-rating-star far fa-star"; // empty star
			}
		});
	}

	function printRatingResult(resultStar, num = 0) {
		resultStar.textContent = `${num}/5`;
	}

	//executeRating(ratingStars, ratingResult);
	// 별점 클릭 함수 끝 ---------------------------------------------------------------

</script>
</html>