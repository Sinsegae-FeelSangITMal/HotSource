<%@ page contentType="text/html; charset=UTF-8"%>
<%
	boolean result = true;			// false로 변경 시 검색 결과 없을 경우의 화면 볼 수 있음
	boolean isPurchased = true;
%>

<!-- 종합 검색 결과 페이지 -->

<div class="container">
	<div class="product-container">
		<% if (!result) { %>
			<h2 class="result-heading not-found">No search results found</h2>
		<% } %>

		<% if (result) { %>
			<h2 class="result-heading">13 results</h2>
		<% } %>

		<% if (true) { %> <!-- ARTIST 섹션 -->
			<section class="search-section">
				<div class="search-section-header">
					<h3>ARTIST</h3>
					<% if (result) { %>
						<a href="#">More ></a>
					<% } %>
				</div>

				<% if (!result) { %>
					<h2 class="result-heading not-found">No results</h2>
				<% } %>

				<% if (result) { %>
					<%@ include file="search_artist_mini.jsp"%>
				<% } %>
			</section>
		<% } %>

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
					<%@ include file="search_resource_mini.jsp"%>
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
					<%@ include file="search_resource_mini.jsp"%>
				<% } %>
			</section>
		<% } %>

	</div>
</div>
