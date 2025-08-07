<%@page import="hotsource.domain.User"%>
<%@page import="hotsource.domain.Asset"%>
<%@page import="hotsource.domain.OrderedAsset"%>
<%@page import="hotsource.domain.Ordered"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	List<Ordered> orderedList = (List<Ordered>) request.getAttribute("orderedList");
	User user = (User) session.getAttribute("user");
%>

<!-- 마이페이지의 설정 페이지 -->

<div class="col-md-10 content-area">
	<div class="content-box">
	
		<h3 class="header">Orders</h3>
		
		<!-- 기본 정보 섹션 시작 -->
		<table class="asset-table">
			<thead>
				<tr>
					<th>Order Date</th>
					<th>Order ID</th>
					<th>Order Status</th>
					<th>Detail</th>
				</tr>
			</thead>
			<!-- 목록 컨텐츠 한 개 시작 -->
			<tbody>
			<% for (Ordered order : orderedList) { %>
				<tr>
					<td><%= order.getOrder_date().toLocalDateTime().toLocalDate() %></td>
					<td><%=order.getOrder_no() %></td>
					<td><%=order.getOrder_state() %></td>
					<td>
						<div class="download-wrap">
							<a 	class="download active" href="#"
									onclick="openReceiptPopup(this)" 
									data-order-no="<%=order.getOrder_no() %>"
									data-order-date="<%=order.getOrder_date() %>"
									data-order-status="<%=order.getOrder_state() %>"
									data-price-total="<%=order.getTotal_price() %>"
									data-price-paid="<%=order.getTotal_pay() %>"
									data-user-name="<%=user.getUser_name() %>"
									data-user-email="<%=user.getUser_email() %>"
									>
									Receipt</a>
									
						</div>
					</td>
				</tr>
			<%}%>
			</tbody>
			<!-- 목록 컨텐츠 한 개 끝 -->
		</table>
		<!-- 기본 정보 섹션 끝 -->
		
	</div>
</div>

<script type="text/javascript">

// 영수증 버튼 누를 시
function openReceiptPopup(el) {
	// 팝업으로 넘길 데이터 추출하기
	const orderNo = el.getAttribute("data-order-no");
	const orderDate = el.getAttribute("data-order-date");
	const orderStatus = el.getAttribute("data-order-status");
	const priceTotal = el.getAttribute("data-price-total");
	const pricePaid = el.getAttribute("data-price-paid");
	const userName = el.getAttribute("data-user-name");
	const userEmail = el.getAttribute("data-user-email");

	// 팝업에 삽입
	document.getElementById("popupOrderDate").textContent = orderDate;
	document.getElementById("popupOrderStatus").textContent = orderStatus;
	document.getElementById("popupOrderNo").textContent = orderNo;
	document.getElementById("popupBuyerName").textContent = userName;
	document.getElementById("popupTotalPrice").textContent = priceTotal;
	document.getElementById("popupDiscountPrice").textContent = priceTotal-pricePaid;
	document.getElementById("popupPayPrice").textContent = pricePaid;
	
	
	// 팝업 보이기
	document.getElementById("receiptPopup").style.display = "block";
}

//리뷰 작성 팝업에서 닫기 시
function closeReceiptPopup() {
	document.getElementById("receiptPopup").style.display = "none";
}

</script>

<%@ include file="popup_receipt.jsp" %>