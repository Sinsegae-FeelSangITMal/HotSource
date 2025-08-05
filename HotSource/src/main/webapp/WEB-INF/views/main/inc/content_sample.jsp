<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="hotsource.util.Paging"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%! 
	Paging paging=new Paging();
%>
<%
	List testList = new ArrayList<>(50); 
	paging.init(50, testList, request);
	
	boolean result_re = false;			// false로 변경 시 검색 결과 없을 경우의 화면 볼 수 있음
	boolean isPurchased_re = true;
%>

  <!-- 리소스 검색 결과 페이지 -->

  <div class="container">
  <div class="product-container">
  
	<!-- 필터, 정렬 영역 시작 -->
	<div class="filter-sort-section">
		<!-- 필터 영역 시작 -->
		<div class="filter-section">
			<h6>PRICE</h6>
			<div class="filter-box">	
				<a href="/main/search" class="filter active"> ALL </a>
				<a href="/main/search?price=free" class="filter"> FREE </a>
				<a href="/main/search" class="filter"> SALE </a>
				<a href="/main/search?price=premium" class="filter"> PREMIUM </a>
			</div>
				
			<h6>LICENSE</h6>
			<div class="filter-box">	
				<a href="" class="filter active"> ALL </a>
				<a href="" class="filter"> FREE </a>
				<a href="" class="filter"> PREMIUM </a>
			</div>
		</div>
		<!-- 필터 영역 끝 -->
		
		<!-- 정렬 영역 시작 -->
		<div class="sort-section">
			<select class="input-select" onchange="location.href='/main/search?sort=' + this.value;">
				<option value="">Sort By</option>
				<option value="view_desc">Top Views</option>
				<option value="create_date_desc">Latest</option>
				<option value="rate_avg">Top Rated</option>
				<option value="review_count">Most Reviews</option>
				<option value="price_asc">Low Price</option>
				<option value="price_desc">High Price</option>
			</select>
		</div>
		<!-- 정렬 영역 끝 -->
	</div>
	<!-- 필터, 정렬 영역 끝 -->

    <!-- 검색 결과 섹션 시작 -->
    <section class="search-section">
      
	  <% if (result_re) {%> 
		<%@ include file="all_assets.jsp" %>
      <%} %>
      <%@ include file="all_assets.jsp" %>
      <!-- 목록 출력 끝 -->
    </section>
    <!-- 검색 결과 섹션 끝 -->
    
    <!-- 페이지 영역 시작 -->
	<%@ include file="page.jsp" %>
    <!-- 페이지 영역 끝 -->
  
  </div>
  </div>
  
<script>
	document.querySelector('.input-select').addEventListener('change', function () {
		const params = new URLSearchParams(window.location.search);
		params.set('sort', this.value);
		location.href = '/assets?' + params.toString();
	});
</script>
  