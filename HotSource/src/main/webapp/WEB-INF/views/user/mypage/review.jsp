<%@page import="hotsource.domain.Asset"%>
<%@page import="hotsource.domain.OrderedAsset"%>
<%@page import="hotsource.domain.Ordered"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	List<Ordered> orderedList = (List<Ordered>) request.getAttribute("orderedList");
%>

<!-- 마이페이지의 설정 페이지 -->

<div class="col-md-10 content-area">
	<div class="content-box">
	
		<h3 class="header">Reviews</h3>
		
		<!-- 기본 정보 섹션 시작 -->
		<table class="asset-table">
			<thead>
				<tr>
					<th>Order Date</th>
					<th>Asset</th>
					<th>Order ID</th>
					<th>Detail</th>
				</tr>
			</thead>
			<!-- 목록 컨텐츠 한 개 시작 -->
			<tbody>
			<% 
				for (Ordered order : orderedList) {
				     if (order.getOrderedAssetList() != null && !order.getOrderedAssetList().isEmpty()) 
					for (OrderedAsset oa : order.getOrderedAssetList()) {
						Asset asset = oa.getAsset();	 
			%>
				<tr>
					<td><%= order.getOrder_date().toLocalDateTime().toLocalDate() %></td>
					<td class="asset-info">
						<img src="/data/asset_img/<%=asset.getThumbnail().getAsset_img_url()%>" alt="Asset thumbnail" class="thumb">
						<div class="asset-text">
							<div class="creator"><%= oa.getSeller_name() %></div>
							<div class="title"><%= oa.getAsset_title() %></div>
						</div>
					</td>
					<td><%=order.getOrder_no() %></td>
					<td>
						<div class="download-wrap">
							<a  class="download active" href="#" 
							    onclick="openReviewPopup(this)" 
							    data-asset-id="<%=asset.getAsset_id() %>"
							    data-order-asset-id="<%=oa.getOrder_asset_id() %>"
							    data-order-thumb="<%=asset.getThumbnail().getAsset_img_url()%>" 
							    data-asset-title="<%= oa.getAsset_title() %>" 
							    data-seller-name="<%= oa.getSeller_name() %>"
							    data-order-date="<%= order.getOrder_date().toLocalDateTime().toLocalDate() %>"
							    data-recommend="<%= (oa.getReview() != null && oa.getReview().getReviewLike() != null) 
							                        ? (oa.getReview().getReviewLike().getIs_like() == 1 ? "1" : "0") : "" %>"
							    data-rate="<%= (oa.getReview() != null) ? oa.getReview().getRate() : "" %>"
							    data-comment="<%= (oa.getReview() != null) ? oa.getReview().getComment() : "" %>">
							    Review
							</a>
						</div>
					</td>
				</tr>
			<%	}
				}
			%>
			</tbody>
			<!-- 목록 컨텐츠 한 개 끝 -->
		</table>
		<!-- 기본 정보 섹션 끝 -->
		
	</div>
</div>

<script type="text/javascript">

let selectedAssetId = null;
let selectedOrderAssetId = null;
let isRec = 1;

//리뷰 등록 버튼 누를 시
function openReviewPopup(el) {
	// 팝업으로 넘길 데이터 추출하기
	selectedAssetId = el.getAttribute("data-asset-id");
	selectedOrderAssetId = el.getAttribute("data-order-asset-id");
    isRec = el.getAttribute("data-recommend") ;
	
	const thumbnail = el.getAttribute("data-order-thumb");
	const orderDate = el.getAttribute("data-order-date");
	const assetTitle = el.getAttribute("data-asset-title");
	const sellerName = el.getAttribute("data-seller-name");
	const rate = el.getAttribute("data-rate");
	const comment = el.getAttribute("data-comment");

	// 이미지, 텍스트 초기화
	document.getElementById("popupThumb").src = "/data/asset_img/" +thumbnail;
	document.getElementById("popupOrderDate").textContent = orderDate;
	document.getElementById("popupAssetTitle").textContent = assetTitle;
	document.getElementById("popupSellerName").textContent = sellerName;
	
    // 별점 세팅
    if (rate && !isNaN(rate)) {
        selectedRating = parseFloat(rate);
    } else {
        selectedRating = 0.0;
    }
    renderStars(selectedRating);
	
    // 코멘트 초기화
    document.getElementById("comment").value = comment;
	
	// 추천 버튼 세팅
	const recommendButtons = document.querySelectorAll(".review-btn.recommend");
	recommendButtons.forEach(btn => {
	    btn.classList.remove("active");
	    if (btn.getAttribute("data-recommend") === String(isRec)) {
	        btn.classList.add("active");
	    }
	});
	
	// 팝업 보이기
	document.getElementById("reviewPopup").style.display = "block";
}

//리뷰 작성 팝업에서 닫기 시
function closeReviewPopup() {
	document.getElementById("reviewPopup").style.display = "none";
	document.getElementById("comment").textContent = "";
}


</script>

<%@ include file="popup_review.jsp" %>