<%@page import="hotsource.domain.AssetImg"%>
<%@page import="hotsource.domain.Asset"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>

	<div class="product-grid">
	<!-- 한 컨텐츠 시작 -->
	<%
    List<Asset> list = (List<Asset>) request.getAttribute("resourceList");  // 이름 고정
    List<AssetImg> thumbList = (List<AssetImg>) request.getAttribute("thumbList");
    
    boolean isPurchasedAsset = false;
    
    int max = Math.min(5, list.size());  // 출력 갯수 정하기
    for (int i = 0; i < max; i++) {
        Asset asset = list.get(i);
        isPurchasedAsset = false;
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
		if (isPurchasedAsset) {
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
		    if (true) {
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
	      <a href=""><img src="<%=(asset.getImgList()!=null) ? ("/data/asset_img/"+asset.getImgList().get(0).getAsset_img_url()) : "/static/images/noimg.jpg" %>" alt="썸네일" /></a>
	    </div>
	    <div class="product-meta mini">
	      <a href=""><h6 class="author"><%=asset.getSeller().getSeller_name()%></h6></a>
	      <a href=""><h6 class="title"><%=asset.getTitle()%></h6></a>
	      <% if (oriPrice==0) { %>
	      		<span class="price free">FREE</span>
	      <% } else if (salePer>0) { %>
		      <span class="price sale"><%=salePrice%></span>
		      <span class="price original"><%=oriPrice%></span>
	      <% } else { %>
	      	  <span class="price sale"><%=oriPrice%></span>
	      <% } %>
	    </div>
	  </div>
	<% } %>
	<!-- 한 컨텐츠 끝 -->
	</div>
	
	<!-- 
<script type="text/javascript">
	function getThumb(asset_id, filename) {
		$.ajax({
			url: "/data/asset_img/" + asset_id + "/" + filename,
			type: "GET",
			xhr: function() {
				const xhr = new XMLHttpRequest();
				xhr.responseType = "blob";
				return xhr;
			},
			success: function(result, status, xhr){
				const file = new File([result], filename, {type: result.type});
				const reader = new FileReader();
				reader.onload = function(e) {
					const img = document.querySelector("img");
					if (img) {
						img.src = e.target.result;
						console.log(img.src);
					}
				}
				reader.readAsDataURL(file);
			}
		});
	}
	<%--
		for (int i=0; i<list.size(); i++){
			Asset asset = list.get(i);
			AssetImg thumb = thumbList.get(i);
	%>
			getThumb(<%= asset.getAsset_id()%>, "<%=thumb.getAsset_img_url()%>");
	<%}--%>
</script>
 -->