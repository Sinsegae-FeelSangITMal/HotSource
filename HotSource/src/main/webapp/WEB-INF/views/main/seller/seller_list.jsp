<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hotsource.util.Paging"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<!-- 에셋 리스트 영역 시작 -->
<div class="row row-cols-1 row-cols-md-2 row-cols-lg-4 g-4 mt-3 justify-content-center">
  <% for (int i = 0; i < 8; i++) { %>
  <div class="col d-flex justify-content-center">
    <div class="card list-custom-card">
      <div class="list-image-grid">
        <img src="/static/images/test1.gif" class="list-asset-image" alt="asset-thumbnail">
        <img src="/static/images/test1.gif" class="list-asset-image" alt="asset-thumbnail">
        <img src="/static/images/test1.gif" class="list-asset-image" alt="asset-thumbnail">
        <img src="/static/images/test1.gif" class="list-asset-image" alt="asset-thumbnail">
      </div>
      <div class="card-body p-2">
        <h6 class="card-title mb-1">개쩡멋진 에셋 리스트 이름</h6>
        <p class="card-text text-muted mb-0">14 Assets</p>
      </div>
    </div>
  </div>
  <% } %>
</div>
<!-- 에셋 리스트 영역 끝 -->

<% if (true) { %> <!-- IMAGE 섹션 -->
	<section class="search-section">
		<div class="search-section-header">
			<h3>IMAGE</h3>
			<% if (result) { %>
				<a href="#">More ></a>
			<% } %>
		</div>

		<% if (!result) { %>
			<h2 class="result-heading not-found">No results</h2>
		<% } %>

		<% if (result) { %>
			<%@ include file="search_resource_mini-seller.jsp"%>
		<% } %>
	</section>
<% } %>

<% if (true) { %> <!-- SOUND 섹션 -->
	<section class="search-section">
		<div class="search-section-header">
			<h3>SOUND</h3>
			<% if (result) { %>
				<a href="#">More ></a>
			<% } %>
		</div>

		<% if (!result) { %>
			<h2 class="result-heading not-found">No results</h2>
		<% } %>

		<% if (result) { %>
			<%@ include file="search_resource_mini-seller.jsp"%>
		<% } %>
	</section>
<% } %>

<!-- 페이지 영역 시작 -->
<%@ include file="../inc/page.jsp"%>
<!-- 페이지 영역 끝 -->