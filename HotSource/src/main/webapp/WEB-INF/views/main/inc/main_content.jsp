<%@ page contentType="text/html; charset=UTF-8"%>
	  <!-- 파라미터로 상품 출력하고 싶은 갯수, 정렬/필터 등 보내야 함 limit -->
<%
	boolean result = true;			// false로 변경 시 검색 결과 없을 경우의 화면 볼 수 있음
	boolean isPurchased = true;
%>

  <!-- 메인 컨텐트 페이지 -->

  <div class="container">
  <div class="product-container">
  
    <h4 class="main-heading"><strong>IMAGE</strong></h4>
  
    <!-- 인기 섹션 시작 -->
    <section class="search-section">
      <div class="search-section-header">
      	<h3>Hot Resource</h3>
        <a href="#">More ></a>
      </div>
      
      <!-- 이미지 목록 출력 시작 -->
	  <%@ include file="search_resource_mini.jsp" %>
      <!-- 이미지 목록 출력 끝 -->
    </section>
    <!-- 인기 섹션 끝 -->
    
    <!-- 무료 섹션 시작 -->
    <section class="search-section">
      <div class="search-section-header">
      	<h3>Freebie</h3>
        <a href="#">More ></a>
      </div>
      
      <!-- 이미지 목록 출력 시작 -->
	  <%@ include file="search_resource_mini.jsp" %>
      <!-- 이미지 목록 출력 끝 -->
    </section>
    <!-- 무료 섹션 끝 -->
    
    <!-- 신상 섹션 시작 -->
    <section class="search-section">
      <div class="search-section-header">
      	<h3>New Arrivals</h3>
        <a href="#">More ></a>
      </div>
      
      <!-- 이미지 목록 출력 시작 -->
	  <%@ include file="search_resource_mini.jsp" %>
      <!-- 이미지 목록 출력 끝 -->
    </section>
    <!-- 신상 섹션 끝 -->
    
    <!-- 세일 섹션 시작 -->
    <section class="search-section">
      <div class="search-section-header">
      	<h3>On Sale</h3>
        <a href="#">More ></a>
      </div>
      
      <!-- 이미지 목록 출력 시작 -->
	  <%@ include file="search_resource_mini.jsp" %>
      <!-- 이미지 목록 출력 끝 -->
    </section>
    <!-- 세일 섹션 끝 -->
    
    
    
    <h4 class="main-heading"><strong>SOUND</strong></h4>
  
    <!-- 인기 섹션 시작 -->
    <section class="search-section">
      <div class="search-section-header">
      	<h3>Hot Resource</h3>
        <a href="#">More ></a>
      </div>
      
      <!-- 이미지 목록 출력 시작 -->
	  <%@ include file="search_resource_mini.jsp" %>
      <!-- 이미지 목록 출력 끝 -->
    </section>
    <!-- 인기 섹션 끝 -->
    
    <!-- 무료 섹션 시작 -->
    <section class="search-section">
      <div class="search-section-header">
      	<h3>Freebie</h3>
        <a href="#">More ></a>
      </div>
      
      <!-- 이미지 목록 출력 시작 -->
	  <%@ include file="search_resource_mini.jsp" %>
      <!-- 이미지 목록 출력 끝 -->
    </section>
    <!-- 무료 섹션 끝 -->
    
    <!-- 신상 섹션 시작 -->
    <section class="search-section">
      <div class="search-section-header">
      	<h3>New Arrivals</h3>
        <a href="#">More ></a>
      </div>
      
      <!-- 이미지 목록 출력 시작 -->
	  <%@ include file="search_resource_mini.jsp" %>
      <!-- 이미지 목록 출력 끝 -->
    </section>
    <!-- 신상 섹션 끝 -->
    
    <!-- 세일 섹션 시작 -->
    <section class="search-section">
      <div class="search-section-header">
      	<h3>On Sale</h3>
        <a href="#">More ></a>
      </div>
      
      <!-- 이미지 목록 출력 시작 -->
	  <%@ include file="search_resource_mini.jsp" %>
      <!-- 이미지 목록 출력 끝 -->
    </section>
    <!-- 세일 섹션 끝 -->
    
    
  </div>
  </div>
  