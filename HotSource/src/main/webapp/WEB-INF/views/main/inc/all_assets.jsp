<%@page import="hotsource.domain.AssetImg"%>
<%@page import="hotsource.domain.Asset"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>

	<div class="product-grid">
	<!-- 한 컨텐츠 시작 -->
	<%
    List<Asset> list = (List<Asset>) request.getAttribute("assetList");  // 이름 고정
    List<AssetImg> thumbList = (List<AssetImg>) request.getAttribute("thumbList");
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
	      <a href=""><img src="/static/images/test1.gif" alt="썸네일" /></a>
	    </div>
	    <div class="product-meta mini">
	      <a href="/main/seller/detail?seller_id=<%= asset.getSeller().getSeller_id()%>"><h6 class="author"><%=asset.getSeller().getSeller_name()%></h6></a>
	      <a href="/main/asset/detail?asset_id=<%=asset.getAsset_id()%>"><h6 class="title"><%=asset.getTitle()%></h6></a>
	      		<span class="price free">FREE</span>
		      <span class="price sale"><%=%></span>
		      <span class="price original"><%=%></span>
	      	  <span class="price sale"><%=%></span>
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