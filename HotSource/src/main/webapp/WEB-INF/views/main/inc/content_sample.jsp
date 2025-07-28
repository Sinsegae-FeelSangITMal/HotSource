<%@ page contentType="text/html; charset=UTF-8"%>
<%
	boolean result = true;			// false로 변경 시 검색 결과 없을 경우의 화면 볼 수 있음
	boolean isPurchased = true;
%>

<!-- 종합 검색 결과 페이지 -->

<div class="container">
	<div class="product-container">

		<% if (!result) %><h2 class="result-heading not-found">No search
			results found</h2>
		<!-- 검색 결과 없을 시 문구 출력-->
		<% if (result) %><h2 class="result-heading">13 results</h2>
		<!-- 검색 결과 있을 시 검색 갯수 출력 -->

		<% if (true) { %>
		<!-- 카테고리가 Artist이거나 선택하지 않았을 시 -->
		<!-- 작가 검색 결과 섹션 시작 -->
		<section class="search-section">
			<div class="search-section-header">
				<h3>ARTIST</h3>
				<% if (result) %><a href="#">More ></a>
				<!-- 검색 결과 있을 시 더보기 버튼 출력 -->
			</div>

			<!-- 검색 결과 있을 시 작가 목록 출력 -->
			<% if (!result) %><h2 class="result-heading not-found">No results</h2>
			<% if (result) {%>
			<%@ include file="../search_artist.jsp"%>
			<%} %>
			<!-- 작가 목록 출력 끝 -->
		</section>
		<!-- 작가 검색 결과 섹션 끝 -->
		<%} %>

		<% if (true) { %>
		<!-- 카테고리가 Image이거나 선택하지 않았을 시 -->
		<!-- 이미지 검색 결과 섹션 시작 -->
		<section class="search-section">
			<div class="search-section-header">
				<h3>IMAGE</h3>
				<% if (result) %><a href="#">More ></a>
				<!-- 검색 결과 있을 시 더보기 버튼 출력 -->
			</div>

			<!-- 검색 결과 있을 시 이미지 목록 출력 -->
			<% if (!result) %><h2 class="result-heading not-found">No results</h2>
			<% if (result) {%>
			<%@ include file="../search_resource.jsp"%>
			<%} %>
			<!-- 이미지 목록 출력 끝 -->
		</section>
		<!-- 이미지 검색 결과 섹션 끝 -->
		<%} %>

		<% if (true) { %>
		<!-- 카테고리가 Sound이거나 선택하지 않았을 시 -->
		<!-- 사운드 검색 결과 섹션 시작 -->
		<section class="search-section">
			<div class="search-section-header">
				<h3>SOUND</h3>
				<% if (result) %><a href="#">More ></a>
				<!-- 검색 결과 있을 시 더보기 버튼 출력 -->
			</div>

			<!-- 검색 결과 있을 시 사운드 목록 출력 -->
			<% if (!result) %><h2 class="result-heading not-found">No results</h2>
			<% if (result) {%>
			<%@ include file="../search_resource.jsp"%>
			<%} %>
			<!-- 사운드 목록 출력 끝 -->
		</section>
		<!-- 사운드 검색 결과 섹션 끝 -->
		<%} %>

	</div>
</div>
