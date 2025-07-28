<%@ page contentType="text/html; charset=UTF-8"%>

<div class="product-grid">
<!-- 한 컨텐츠 시작 -->
<% for (int i=1; i<=5; i++) {%>
  <div class="product-card mini">
    <div class="badge-wrapper">
      <% if (true) %><span class="badge">NEW</span>
      <% if (false) %><span class="badge">HOT</span>
      <% if (false) %><span class="badge">SALE</span>
      <% if (false) %><span class="badge">FREE</span>
      <% if (false) %><span class="nobadge">NO BADGE</span>
      <% if (false) %><span class="badge purchased">PURCHASED</span>
    </div>
    <div class="img-wrapper">
      <img src="/static/images/test1.gif" alt="썸네일" />
    </div>
    <div class="product-meta mini">
      <h6 class="author">작가 이름</h6>
      <h6 class="title">리소스 이름</h6>
      <% if (false) %><span class="price free">FREE</span>
      <% if (true) %><span class="price sale">￦1,600</span>
      <% if (false) %><span class="price original">￦3,200</span>
    </div>
  </div>
<%} %>
<!-- 한 컨텐츠 끝 -->
</div>
