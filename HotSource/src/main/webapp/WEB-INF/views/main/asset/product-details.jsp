<%@page import="hotsource.domain.Review"%>
<%@page import="hotsource.domain.AssetKeywordMapping"%>
<%@page import="hotsource.domain.Keyword"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="hotsource.model.asset.AssetDetailDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<%
	boolean loggined = (session.getAttribute("user") != null);
	AssetDetailDTO dto = (AssetDetailDTO)request.getAttribute("assetDetailDTO");

%>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HotSource</title>
	
	<!-- link Font, CSS -->
	<%@ include file="../inc/head_link.jsp" %>
	<link rel="stylesheet" href="/static/css/asset_detail.css" type="text/css">
	<link rel="stylesheet" href="/static/css/toast.css" type="text/css">
	<link href="/static/css/wishlist_modal.css" type="text/css" rel="stylesheet">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
    
	<!-- 헤더 및 배너 영역 시작 -->
	<div class="hero_area">
		<%@ include file="../inc/header_search.jsp" %>
	</div>
    <!-- 헤더 및 배너 영역 끝 -->

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="/main/index"><i class="fa fa-home"></i> Home</a>
                        <a href="#">Asset </a>
                        <span><%=dto.getAsset().getTitle() %></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
			<div class="row">
				<div class="col-lg-8">

					<div class="product__details__pic">
						
						<div class="product__details__slider__content">
							<div class="product__details__pic__slider owl-carousel">
								<% for(int i = 0; i < dto.getAsset().getImgList().size(); i++){ %>
								<img class="product__big__img big_pic" style="width:800px; height:400px"
									src="/data/asset_img/<%=dto.getAsset().getImgList().get(i).getAsset_img_url() %>"
									data-hash="product-<%=i%>" 
								> 
								<%} %>
							</div>
						</div>
						
						<div class="product__details__pic__thumb product__thumb nice-scroll">
							<% for(int i = 0; i < dto.getAsset().getImgList().size(); i++){ %>
							<a class="pt active" href="#product-<%=i%>"> 
								<img class="my_pic" style="width:100px; height:100px"
								 	src="/data/asset_img/<%=dto.getAsset().getImgList().get(i).getAsset_img_url() %>" alt="">
							</a> 
							<%} %>
						</div>
						
						
					</div>
				</div>
				<div class="col-lg-4">
					<div class="product__details__text">
						<h3><%=dto.getAsset().getTitle() %> <span><img src="/data/user_profile_img/<%=dto.getAsset().getSeller().getProfile_img_url() %>"
								style="width: 30px; height: 30px; border-radius: 50%; object-fit: cover"> <%=dto.getAsset().getSeller().getSeller_name() %></span>
						</h3>
						<div class="rating">
						<%if(dto.getReview_count() >= 5){ %>
							<%int fullStars = (int)Math.floor(dto.getAverage_rate());  %>
							<%for(int i = 0; i < fullStars; i++) {%>
							<i class="fa fa-star"></i>
							<%} %> 
							<%for(int i = fullStars; i < 5; i++) {%>
							<i class="fa fa-star-o"></i>
							<%} %> 
							<span>( <%=dto.getReview_count() %> reviews ) | </span> 
						<%} else { %>
							<span>(Not Enough Ratings) | </span>
						<%} %>
							<span>
								<i class="fa fa-heart" style="color: black; margin-right: 3px;"></i> 
								( <%= dto.getWish_count() %> )
							</span>
						</div>
						<div class="product__details__price">
						<%if(dto.getAsset().getPrice() == 0){ %>
							  Free
						<%} else{%>
							<%if(dto.getSale_price() != 0) {%>
								$ <%=dto.getSale_price() %> <span>$ <%=dto.getAsset().getPrice() %></span>
							<%} else {%>
								 <%=dto.getAsset().getPrice() %>
							<%} %>
						<%} %>
						</div>
						<p><%=dto.getAsset().getSummary() %></p>
						<div class="product__details__button" ">
							<a href="#" class="cart-btn"
								style="width: 200px; text-align: center;"> 결제하기</a>
							<ul>
								<li> 								
									<button id="cart_btn" class="circle-icon-button" 
										data-is-cart="<%=dto.isCart() %>"
										data-asset-id="<%=dto.getAsset().getAsset_id() %>">
											<i class="bi <%= dto.isCart() ? "bi-bag-check-fill" : "bi-bag-plus" %> icon-dynamic"></i>
									</button>
								</li>
								<li>
									<button id="wish_btn" class="circle-icon-button"
											data-asset-id="<%=dto.getAsset().getAsset_id() %>"  
											data-is-wished="<%=dto.isWished()%>"> 
											<i class="bi <%= dto.isWished() ? "bi-heart-fill" : "bi-heart" %> icon-dynamic"></i>
									</button>
								</li>
							</ul>
						</div>
						<div class="product__details__widget">
							<ul>
								<li><span>라이선스</span>
									<div class="stock__checkbox">
										<label for="stockin"> 싱글 엔티티 </label>
									</div></li>
								<li><span>파일 크기 </span>
									<div class="stock__checkbox">
										<label for="stockin"> ... </label>
									</div></li>
								<li><span> 등록일</span>
									<div class="stock__checkbox">
										<%
										SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 M월 d일");
									    String formattedDate = sdf.format(dto.getAsset().getCreate_date());
										%>
										<label for="stockin"><%=formattedDate%> </label>
									</div></li>

							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-12" style="margin-top: 50px;">
				<!-- 탭 버튼 -->
					<div class="custom-tab-buttons">
						<button class="custom-tab-btn active" data-target="tab-home">Overview</button>
						<button class="custom-tab-btn" data-target="tab-profile">Review</button>
						<button class="custom-tab-btn" data-target="tab-contact">Publisher Info</button>
					</div>

					<!-- 탭 콘텐츠 -->
					<div class="custom-tab-contents">
						<div id="tab-home" class="custom-tab-panel active">
							<div id="summary" class="overview">
								<%=dto.getAsset().getSummary()%>
							</div>
							<div id="asset_description" class="overview">
								<h5>설명</h5>
								<%=dto.getAsset().getDescription()%>
							</div>
							<div id="keywords" class="overview">
								<h5>관련 키워드</h5>
								<div>
									<% for(int i = 0; i < dto.getAsset().getKeywordList().size(); i++){ %>
									<%		 Keyword keyword =  dto.getAsset().getKeywordList().get(i).getKeyword(); %>
										<span class="keyword-tag"><%= keyword.getKeyword_name() %></span>
									<%}%>
								</div>
							</div>
						</div>
						
						<!-- 리뷰 탭 -->
						<div id="tab-profile" class="custom-tab-panel">
							<%for(Review review : dto.getAsset().getReviewList()) { %>
							<div class="review-item">
								<div class="review-header">
									<img src="/data/user/<%=review.getUser().getProfile_img_url()%>" alt="user profile" class="review-profile-img">
									<div class="review-meta">
										<div class="review-user">
											   <%
											        double rate = review.getRate();  // 예: 3.5
											        int fullStars = (int)rate;      // 정수 부분만 full star
											        boolean hasHalf = (rate - fullStars) == 0.5;
											        int emptyStars = 5 - fullStars - (hasHalf ? 1 : 0);
											    %>
											
											    <% for (int i = 0; i < fullStars; i++) { %>
											        <i class="fa fa-star review-stars"></i>
											    <% } %>
											
											    <% if (hasHalf) { %>
											        <i class="fa fa-star-half-o review-stars"></i>
											    <% } %>
											
											    <% for (int i = 0; i < emptyStars; i++) { %>
											        <i class="fa fa-star-o review-stars"></i>
											    <% } %>
											 <span class="review-score"><%=review.getRate() %></span>
										</div>
										<div class="review-author-date">
											<span class="review-author"><%=review.getUser().getUser_nickname() %></span>
											<%	sdf = new SimpleDateFormat("yyyy.MM.dd");
										    	formattedDate = sdf.format(review.getCreate_date());
										    %> 
											<span class="review-date"><%=formattedDate%></span>
										</div>
									</div>
								</div>

								<div class="review-content">
									<%=review.getComment() %>
								</div>
							</div>
							<%} %>
						</div>
						
						<!-- 작가 Info 탭 -->
						<div id="tab-contact" class="custom-tab-panel">
							<div class="publisher-tab">
								<div class="publisher-box">
									<img src="/data/user_profile_img/<%=dto.getAsset().getSeller().getProfile_img_url() %>" alt="profile" class="publisher-profile-img">
									<div class="publisher-name">
										<%=dto.getAsset().getSeller().getSeller_name() %>
									</div>
									<!-- sns 링크 -->
									<div class="publisher-contact">
										<div>
											<i class="bi bi-envelope"></i> 
											<i class="bi bi-instagram"></i>
										</div>
									</div>
								</div>
								<div class="publisher-description">
									<p><%=dto.getAsset().getSeller().getSeller_bio() %>	</p>
								</div>
							</div>
							<div class="publisher-profile-btn-wrap" style="margin-left:50px;">
								<a href="/main/seller/detail?seller_id=<%=dto.getAsset().getSeller().getSeller_id()%>" class="publisher-profile-btn">view publisher’s profile</a>
							</div>
						</div>
					</div>
				</div>
	
			<div id="toast" class="toast"></div>
			<!-- 찜 모달 -->
				<div id="wishlist-modal" class="wishlist-modal">
					<div class="wishlist-modal-header">
						<span>Save to list</span>
						<button class="wishlist-close-btn">&times;</button>
					</div>
					<div class="wishlist-list" id="wishlist-list-container">
						<!-- 반복되는 찜 목록 항목 -->
					
						<!-- 추가 항목들... -->
					</div>
					<div class="wishlist-modal-footer">
						<button class="add-list-btn">새 리스트 추가</button>
						<button class="save-btn">저장</button>
					</div>
				</div></section>
				
				<!-- 찜 목록 생성 모달 -->
				<%@ include file="../wishlist/create_form.jsp" %>
				
    <!-- Product Details Section End -->
    
    <!-- 푸터 영역 시작 -->
	<%@ include file="../inc/footer.jsp" %>
	<!-- 푸터 영역 끝 -->
	
	<!-- Js Plugins -->
	<%@ include file="../inc/footer_link.jsp" %>
	<script src="/static/js/wishlist_create_modal.js"></script>
	
<script>



document.addEventListener("DOMContentLoaded", function () {
	  const tabButtons = document.querySelectorAll('.custom-tab-btn');
	  const tabPanels = document.querySelectorAll('.custom-tab-panel');

	  // 🔥 초기화: 첫 번째 탭만 보이게
	  tabButtons.forEach(b => b.classList.remove('active'));
	  tabPanels.forEach(p => {
	    p.classList.remove('active');
	    p.style.display = 'none';
	  });

	  // 첫 번째 탭/패널 활성화
	  if (tabButtons.length > 0 && tabPanels.length > 0) {
	    tabButtons[0].classList.add('active');
	    tabPanels[0].classList.add('active');
	    tabPanels[0].style.display = 'block';
	  }

	  // 클릭 시 동작
	  tabButtons.forEach((btn) => {
	    btn.addEventListener('click', function () {
	      tabButtons.forEach(b => b.classList.remove('active'));
	      tabPanels.forEach(p => {
	        p.classList.remove('active');
	        p.style.display = 'none';
	      });

	      btn.classList.add('active');
	      const targetId = btn.getAttribute('data-target');
	      const targetPanel = document.getElementById(targetId);
	      targetPanel.classList.add('active');
	      targetPanel.style.display = 'block';
	    });
	  });
	});
	
function loginCheck(){
    if (!<%=loggined%>) {
        alert("로그인 후 이용 가능합니다. 로그인 페이지로 이동합니다.");
        location.href = "/main/user/login";
        return false;
    }
    return true;
}
	
	$("#cart_btn").click(function(){
	    if (!loginCheck()) return; // 로그인 안 되어 있으면 여기서 중단
	
	    const isCart = $(this).data("is-cart");
	    if (isCart) {
	        showToast("이미 담긴 상품입니다.");
	    } else {
	        addToCart(this);
	    }
	});
	
	function showToast(msg){
		const toast = document.getElementById("toast");
	    toast.textContent = msg;
	    toast.style.visibility = "visible";
	    toast.style.opacity = "1";
	    
	    setTimeout(() => {
	        toast.style.opacity = "0";
	        toast.style.visibility = "hidden";
	    }, 2000);
	}
	
	function addToCart(btn){
		const assetId = $(btn).data("asset-id");
		$.ajax({
			url: "/main/cart/regist",
			type: "post",
			data: { "asset_id" : assetId },
			success: function(result, status, xhr){
				//장바구니 버튼 바꾸고
				$(btn).attr("data-is-cart", "true");   // DOM 속성 변경
				$(btn).data("is-cart", true);          // jQuery 캐시도 동기화
				
				const icon = $(btn).find(".icon-dynamic");
				icon.removeClass("bi-bag-plus").addClass("bi-bag-check-fill");

				showToast("장바구니에 담았습니다.");
			},
			error: function(xhr, status, err){
				console.log(err);
			}
		});
	}
	
	function showToast(msg){
		const toast = document.getElementById("toast");
	    toast.textContent = msg;
	    toast.style.visibility = "visible";
	    toast.style.opacity = "1";
	    
	    setTimeout(() => {
	        toast.style.opacity = "0";
	        toast.style.visibility = "hidden";
	    }, 2000);
	}
	
	// 모달 열기 (찜 버튼에서 호출)
	function openWishlistModal() {
	  document.getElementById("wishlist-modal").style.display = "block";
	  
	  $.ajax({
		  url: "/main/wishlist/json?asset_id=" + "<%=dto.getAsset().getAsset_id()%>",
		  type: "get",
		  dataType: "json",
		  success: function(wishlists){
			  console.log(wishlists);
			  const container = document.getElementById("wishlist-list-container");
			  container.innerHTML = "";

			  wishlists.forEach(w => {
	 			  const checkedAttr = w.contained ? ' checked' : '';
	 			 	console.log(checkedAttr);
	              console.log(w);

			    const thumb = w.thumbUrl
			      ? '<img src="/data/asset_img/' + w.thumbUrl + '" class="wishlist-thumb" alt="썸네일">'
			      : '<div class="wishlist-thumb no-thumb"></div>';

			      const html =
			    	  '<label class="wishlist-item">' +
			    	    '<input type="checkbox" class="wishlist-checkbox" value="' + w.wishlist_id + '"' + checkedAttr + '>' +
			    	    thumb +
			    	    '<div class="wishlist-info">' +
			    	      '<div class="wishlist-title">' + w.title + '</div>' +
			    	      '<div class="wishlist-subtitle">' + w.itemCount + ' Assets</div>' +
			    	    '</div>' +
			    	  '</label>';

			    container.insertAdjacentHTML("beforeend", html);
			  });
			  
		  }
	  });
	}
	 document.getElementById("wishlist-modal").style.display = "none";
	// 닫기 버튼 이벤트
	document.querySelector(".wishlist-close-btn").addEventListener("click", function() {
	  document.getElementById("wishlist-modal").style.display = "none";
	});
	
	$(()=>{
		// 찜 목록 생성 모달 열기
		$(".add-list-btn").click(function(){
			 document.getElementById("wishlist-modal").style.display = "none";
			  modal.style.display = "flex";
			  titleInput.value = "";
			  descInput.value = "";
			  saveBtn.disabled = true;
			  saveBtn.classList.remove("enabled");
		});
		
	})
	
	function updateWishlistItem(asset_id, list_ids){
				
		$.ajax({
			url: "/main/wishlist/item/add",
			type: "post",
			traditional: "true",  //리스트 전송 시 필수 
			data: {
				"asset_id": asset_id,
				"list_ids": list_ids
			},
			success: function(result){
				console.log("업데이트 성공", result);
				const wishBtn = $("#wish_btn");
				const icon = wishBtn.find(".icon-dynamic");
				
				if(result.isWished){
					icon.removeClass("bi-heart").addClass("bi-heart-fill");
					wishBtn.attr("data-is-wished", "true");
					showToast("찜 목록에 추가되었습니다.");
				}else {
					icon.removeClass("bi-heart-fill").addClass("bi-heart");
					wishBtn.attr("data-is-wished", "false");
					showToast("찜 목록에서 제거되었습니다.");
				}
				document.getElementById("wishlist-modal").style.display = "none";
			},
			error: function(xhr){
				console.log("업데이트 실패", xhr);
			}
		});
	}
	
	// 찜 버튼 클릭 이벤트
	$("#wish_btn").click(function(){
		if(!loginCheck()) return;
		openWishlistModal();
	});
	
	$(".save-btn").click(function(){
		const selectedListIds = $(".wishlist-checkbox:checked").map(function() {
		    return parseInt($(this).val());
		}).get();
		console.log(selectedListIds);
		updateWishlistItem(<%=dto.getAsset().getAsset_id()%>,selectedListIds);
	}); 
	
</script>

</body>

</html>