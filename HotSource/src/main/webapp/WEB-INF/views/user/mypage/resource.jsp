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
	
		<h3 class="header">Resources</h3>
		
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
							<a class="download active" href="#">Download</a>
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
