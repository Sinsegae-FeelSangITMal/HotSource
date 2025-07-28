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
	boolean result = true;			// false로 변경 시 검색 결과 없을 경우의 화면 볼 수 있음
	boolean isPurchased = true;
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
				<a href="" class="filter active"> ALL </a>
				<a href="" class="filter"> FREE </a>
				<a href="" class="filter"> SALE </a>
				<a href="" class="filter"> PREMIUM </a>
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
			<select class="input-select">
				<option value="0">Sort By</option>
				<option value="1">Most Popular</option>
				<option value="2">Latest</option>
				<option value="3">Top Views</option>
				<option value="4">Most Downloads</option>
				<option value="5">Top Rated</option>
				<option value="6">Most Reviews</option>
				<option value="7">Low Price</option>
				<option value="8">High Price</option>
			</select>
		</div>
		<!-- 정렬 영역 끝 -->
	</div>
	<!-- 필터, 정렬 영역 끝 -->

    <!-- 검색 결과 섹션 시작 -->
    <section class="search-section">
      
	  <% if (result) {%> 
		<%@ include file="search_resource_all.jsp" %>
      <%} %>
      <!-- 목록 출력 끝 -->
    </section>
    <!-- 검색 결과 섹션 끝 -->
    
    <!-- 페이지 영역 시작 -->
	<%@ include file="page.jsp" %>
    <!-- 페이지 영역 끝 -->
  
  </div>
  </div>
  