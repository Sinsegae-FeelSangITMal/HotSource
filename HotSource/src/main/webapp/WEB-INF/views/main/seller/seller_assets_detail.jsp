<%@page import="hotsource.domain.Asset"%>
<%@page import="hotsource.domain.Review"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
    // assetCount를 int로변환
    Integer assetCount = (Integer) request.getAttribute("assetCount");
    int limit = (assetCount != null) ? assetCount : 0;
%>
<div class="product-grid">
    <% if (assetList != null) {
        for (Asset asset : assetList) {

            // asset의 평균 평점 구하기
            double averageRate = 0.0;
			int totalRate = 0;
			int reviewCount = 0;
			if (asset.getReviewList() != null && !asset.getReviewList().isEmpty()) {
			    for (Review review : asset.getReviewList()) {
			        totalRate += review.getRate();
			        reviewCount++;
			    }
			    averageRate = (reviewCount > 0) ? ((double) totalRate / reviewCount) : 0.0;
			}
    %>
    <div class="product-card mini">
        <!-- 상품 뱃지 -->
        <div class="badge-wrapper">
            <% if (true) { %><span class="badge">NEW</span><% } %>
            <% if (false) { %><span class="badge">HOT</span><% } %>
            <% if (false) { %><span class="badge">SALE</span><% } %>
            <% if (false) { %><span class="badge">FREE</span><% } %>
            <% if (false) { %><span class="nobadge">NO BADGE</span><% } %>
            <% if (false) { %><span class="badge purchased">PURCHASED</span><% } %>
        </div>

        <!-- 상품 이미지 -->
        <div class="img-wrapper">
            <img class="product__big__img big_pic" src="/data/asset_img/<%=asset.getThumbnail().getAsset_img_url()%>">
        </div>

        <!-- 상품 정보 -->
        <div class="product-meta mini">
            <a href="">
                <h6 class="author"><%= seller.getSeller_name() %></h6>
            </a>
            <a href="/main/asset/detail?asset_id=<%=asset.getAsset_id()%>">
                <h6 class="title"><%= asset.getTitle() %></h6>
            </a>
            <h6 class="review">
                <span class="star">★</span> <%= String.format("%.1f", averageRate) %>
            </h6>
            <% if (false) { %><span class="price free">FREE</span><% } %>
            <% if (true) { %><span class="price sale">￦<%= asset.getPrice() %></span><% } %>
            <% if (false) { %><span class="price original">￦<%= asset.getPrice() %></span><% } %>
        </div>

        <!-- 카트, 찜 등록 -->
        <div class="cart-wish-wrapper">
            <a href="" class="cart-btn">
                <img src="/static/images/cart_black.png" class="cart_link"> Add to Cart
            </a>
            <a href="" class="wish-btn">
                <img src="/static/images/heart1.png" class="wish_link">
            </a>
        </div>
    </div>
    <%  } // for
      } else { %>
        <p>등록된 상품이 없습니다.</p>
    <% } %>
</div>