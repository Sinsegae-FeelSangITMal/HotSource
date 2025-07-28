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

  <!-- 작가 검색 결과 페이지 -->

  <div class="container">
  <div class="product-container">
  
    <!-- 검색 결과 섹션 시작 -->
    <section class="search-section">
      
	  <% if (result) {%> 
		<%@ include file="search_artist_all.jsp" %>
      <%} %>
      <!-- 목록 출력 끝 -->
    </section>
    <!-- 검색 결과 섹션 끝 -->
    
    <!-- 페이지 영역 시작 -->
	<%@ include file="page.jsp" %>
    <!-- 페이지 영역 끝 -->
  
  </div>
  </div>
  