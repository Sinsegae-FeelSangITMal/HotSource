<%@page import="hotsource.model.wishlist.BadgeType"%>
<%@page import="hotsource.model.wishlist.AssetCardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	AssetCardDTO card = (AssetCardDTO)request.getAttribute("card");
	boolean isWishlistPage = Boolean.TRUE.equals(request.getAttribute("wishlistPage"));  // true가 아니면 전부 false로 취급(null도)
	long wishlist_id = (Long)request.getAttribute("wishlist_id");
%>	

<div class="product-card mini">
	<!-- 뱃지 영역 -->
	<div class="badge-wrapper">
		<%
		for (BadgeType badge : card.getBadges()) {
		%>
		<span
			class="<%=badge == BadgeType.NO_BADGE ? "nobadge" : "badge" + (badge == BadgeType.PURCHASED ? " purchased" : "")%>">
			<%=badge.name()%>
		</span>
		<%
		}
		%>
	</div>
	<!-- 썸네일 -->
	<div class="img-wrapper">
		<%if(isWishlistPage){ %>
		<!-- 찜 목록에서 삭제 버튼 (X표시) -->
		<button class="remove-btn" data-wishlist-id=<%=wishlist_id%> data-asset-id=<%=card.getAsset_id() %>> 
			<i class="bi bi-x-square-fill"></i>
		</button>
		<%} %>
		<a><img class="thumb" src="/data/asset_img/<%=card.getThumbnail_url() %>" alt="썸네일"
			data-asset-id="<%=card.getAsset_id()%>"
			data-filename="<%=card.getThumbnail_url()%>" /></a>

	</div>
	<!-- 상품 정보 -->
	<div class="product-meta mini">
		<a href="/main/seller/detail?seller_id=<%=card.getSeller_id()%>"><h6 class="author"><%=card.getSeller_name()%></h6></a>
		<a href="/main/asset/detail?asset_id=<%=card.getAsset_id()%>"><h6 class="title"><%=card.getTitle()%></h6></a>

		<!-- 리뷰 수 5개 이하면 별점 표시   -->
		<%
		if (card.getReview_count() <= 1) {
		%>
		<h6 class="review" style="color: #bbb;">(Not Enough Ratings)</h6>
		<%
		} else {
		%>
		<h6 class="review">
			<span class="star">★</span>
			<%=card.getAverage_rate()%>
			(<%=card.getReview_count()%>)
		</h6>
		<%
		}
		%>


		<%
		if (card.getPrice() == 0) {
		%>
		<span class="price free">Free</span>
		<%
		} else if (card.getSale_value() == 0) {
		%>
		<span class="price sale"><%=card.getPrice()%></span>
		<%
		} else {
		%>
		<span class="price sale"><%=card.getSalePrice()%></span> <span
			class="price original"><%=card.getPrice()%></span>
		<%
		}
		%>
	</div>
	<!-- 장바구니, 찜 버튼 -->
	<div class="cart-wish-wrapper" data-asset-id="<%=card.getAsset_id()%>">
		<button class="cart-btn" data-is-in-cart="<%=card.isInCart()%>">
			<img src="/static/images/cart_black.png" class="cart_link"> 
			<span><%=card.isInCart() ? "장바구니 이동" : "장바구니 담기"%></span>
		</button> 
		<button class="wish-btn" data-is-wished="<%=card.isWished()%>">
			<img class="wish_link"
			src="<%=card.isWished() ? "/static/images/heart2.png" : "/static/images/heart1.png"%>">
		</button>
	</div>
</div>
