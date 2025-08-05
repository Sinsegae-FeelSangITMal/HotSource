<%@page import="hotsource.domain.Asset"%>
<%@page import="hotsource.domain.Wishlist"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Wishlist> wishlists = (List)request.getAttribute("wishlists");
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	    <title>쇼핑몰</title>
	
		<!-- link Font, CSS -->
	    <%@ include file="../inc/head_link.jsp"%>
	    <link href="/static/css/wishlist.css" type="text/css" rel="stylesheet">
	    <link href="/static/css/wishlist_modal.css" type="text/css" rel="stylesheet">
	</head>

	<body>
	    <!-- Header -->
		<div class="hero_area">
			<%@ include file="../inc/header_search.jsp" %>
		</div>
	
	    <!-- Breadcrumb Begin -->
	    <div class="breadcrumb-option">
	        <div class="container">
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="breadcrumb__links">
	                        <a href="/main/index"><i class="fa fa-home"></i> Home</a>
	                        <span>Wishlist</span>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <!-- Breadcrumb End -->
	
	     <!-- Wishlist Section Begin --> 
		<div class="wishlist-wrapper">
	      
		  	<!-- Wishlist 헤더 -->
			<div class="wishlist-header">
				<div class="wishlist-title-line">
					<h2>Wishlist</h2>
					<button type="button" id="createBtn" class="btn btn-danger">create
						new list</button>
				</div>
			</div>

		<!-- 카드 목록 -->
			<div class="wishlist-list">
		    <% for(Wishlist w : wishlists) { %>
		    <% int num = w.getItemList().size() >= 4 ? 4 : w.getItemList().size() ; %>
		    	<a href="/main/wishlist/detail?wishlist_id=<%=w.getWishlist_id()%>">
			      	<div class="wishlist-card">
			        	<div class="thumbnail-box">
			        		<% //num > 0 이미지 태그 아니면 회색 박스 %>
			        		<%for(int i = 0; i < num ; i++){ %>
			        		<%	Asset asset = w.getItemList().get(i).getAsset(); %>
			        			<img class="thumb" 
			        				 src="/data/asset_img/<%=asset.getThumbnail().getAsset_img_url() %>" 
			        				 alt="" 
			        				 style="border-radius:0px"
	       							 data-asset-id="<%=asset.getAsset_id()%>"
	      							 data-filename="<%=asset.getThumbnail().getAsset_img_url() %>"
			        			>
			          		<%} %>
			          		<%for(int i = num; i < 4; i++){ %>
			          			<div class="thumb placeholder" style="border-radius:0px"></div> 
			          		<%} %>
			        	</div>
			        	<div class="wishlist-info">
			          		<strong><%= w.getList_name() %></strong>
			         		<p><%= w.getItemList().size() %> Assets</p>
			        	</div>
			      	</div>
		   		</a>
		    <% } %>
		  	</div> 
		</div>
	    <!-- Wishlist Section End -->
	    
		<!-- 모달 배경 + 본문 -->
		<%@ include file="./create_form.jsp" %>
	    
	    <!-- 푸터 영역 시작 -->
		<%@ include file="../inc/footer.jsp" %>
		
		<!-- js plugin -->
		<%@ include file="../inc/footer_link.jsp" %>
		<script src="/static/js/wishlist_create_modal.js"></script>
		<script type="text/javascript">
			
			// 열기
			$("#createBtn").click(function(){
				  modal.style.display = "flex";
				  titleInput.value = "";
				  descInput.value = "";
				  saveBtn.disabled = true;
				  saveBtn.classList.remove("enabled");
			});
		
		</script>
    
	</body>
</html>