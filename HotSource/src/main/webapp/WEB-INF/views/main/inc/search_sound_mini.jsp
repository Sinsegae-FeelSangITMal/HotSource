<%
    int limit = 50;
%>

<div class="product-grid">
<!-- 한 컨텐츠 시작 -->
<% for (int i = 1; i <= limit; i++) { %>
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
      <a href=""><img src="/static/images/test1.gif" alt="썸네일" /></a>
    </div>
    <div class="product-meta mini">
      <a href=""><h6 class="author">작가 이름</h6></a>
      <a href=""><h6 class="title">새로 나온 리소스</h6></a>
      <h6 class="review"><span class="star">★</span> 4.5 (13)</h6>
      <% if (false) %><span class="price free">FREE</span>
      <% if (true) %><span class="price sale">￦1,600</span>
      <% if (false) %><span class="price original">￦3,200</span>
    </div>
    <div class="cart-wish-wrapper">
      <a href="" class="cart-btn"><img src="/static/images/cart_black.png" class="cart_link"> Add to Cart </a>
      <a href="" class="wish-btn"><img src="/static/images/heart1.png" class="wish_link"></a>      
    </div>
  </div>
<%} %>
<!-- 한 컨텐츠 끝 -->
</div>