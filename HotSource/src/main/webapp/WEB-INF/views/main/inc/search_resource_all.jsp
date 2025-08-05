<%@page import="hotsource.domain.AssetImg"%>
<%@page import="hotsource.domain.Asset"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>

	<div class="product-grid">
	<!-- 한 컨텐츠 시작 -->
	<%
    List<Asset> list = (List<Asset>) request.getAttribute("resourceList");  // 이름 고정
    List<AssetImg> thumbList = (List<AssetImg>) request.getAttribute("thumbList");
    int max = Math.min(25, list.size());  // 출력 갯수 정하기
    for (int i = 0; i < max; i++) {
        Asset asset = list.get(i);
        boolean isPurchased = false;
        int salePer = 0;
        if (asset.getSaleList().size() > 0)
            salePer = asset.getSaleList().get(0).getSale_value();
        int oriPrice = asset.getPrice();
        int salePrice = 0;
        if (oriPrice > 0 && salePer > 0) {
            salePrice = (int) Math.ceil(oriPrice - (oriPrice * ((float) salePer / 100)));
            salePrice = salePrice - (salePrice % 10);
        }
	  %>
	  <div class="product-card mini">
	    <div class="badge-wrapper">
	    <%
		if (isPurchased) {
		%>
		    <span class="badge purchased">PURCHASED</span>
		<%
		} else {
			// 뱃지의 유무에 따라 no badge 출력을 정할 변수
		    boolean printed = false;
			
		    if (oriPrice == 0) {
		%>
		        <span class="badge">FREE</span>
		<%
		        printed = true;
		    } else if (salePer > 0) {
		%>
		        <span class="badge">SALE</span>
		<%
		        printed = true;
		    }
		
		    // NEW
		    if (false) {
		%>
		        <span class="badge">NEW</span>
		<%
		        printed = true;
		    }
		
		    // HOT
		    if (false) {
		%>
		        <span class="badge">HOT</span>
		<%
		        printed = true;
		    }
		
		    // 아무것도 출력되지 않았으면 NO BADGE
		    if (!printed) {
		%>
		        <span class="nobadge">NO BADGE</span>
		<%
		    }
		}
		%>
	    </div>
	    <div class="img-wrapper">
	      <a href=""><img src="<%=(asset.getImgList().size() != 0) 
		    ? ("/data/asset_img/" + asset.getAsset_id() + "/" + asset.getImgList().get(0).getAsset_img_url()) 
		    : "/static/images/noimg.jpg" %>" alt="썸네일" /></a>
	    </div>
	    <div class="product-meta mini">
	      <a href="/main/seller/detail?seller_id=<%= asset.getSeller().getSeller_id()%>"><h6 class="author"><%=asset.getSeller().getSeller_name()%></h6></a>
	      <a href="/main/asset/detail?asset_id=<%=asset.getAsset_id()%>"><h6 class="title"><%=asset.getTitle()%></h6></a>
      	  <h6 class="review"><span class="star">★</span> 4.5 (13)</h6>
	      <% if (oriPrice==0) { %>
	      		<span class="price free">FREE</span>
	      <% } else if (salePer>0) { %>
		      <span class="price sale"><%=salePrice%></span>
		      <span class="price original"><%=oriPrice%></span>
	      <% } else { %>
	      	  <span class="price sale"><%=oriPrice%></span>
	      <% } %>
	    </div>
	    
    <div class="cart-wish-wrapper">
      <a href="" class="cart-btn"><img src="/static/images/cart_black.png" class="cart_link"> Add to Cart </a>
      <a href="" class="wish-btn"><img src="/static/images/heart1.png" class="wish_link"></a>      
    </div>
	  </div>
	<% } %>
	<!-- 한 컨텐츠 끝 -->
	</div>
