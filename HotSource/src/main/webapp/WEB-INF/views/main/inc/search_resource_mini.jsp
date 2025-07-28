<%@ page contentType="text/html; charset=UTF-8"%>

<div class="product-grid">
<!-- 한 컨텐츠 시작 -->
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
      <% if (false) %><span class="price free">FREE</span>
      <% if (true) %><span class="price sale">￦1,600</span>
      <% if (false) %><span class="price original">￦3,200</span>
    </div>
  </div>
<!-- 한 컨텐츠 끝 -->
  <!-- 예시를 보여주기 위해 컨텐츠 하나씩 추가 -->
  <div class="product-card mini">
    <div class="badge-wrapper">
      <% if (false) %><span class="badge">NEW</span>
      <% if (false) %><span class="badge">HOT</span>
      <% if (false) %><span class="badge">SALE</span>
      <% if (false) %><span class="badge">FREE</span>
      <% if (true) %><span class="nobadge">NO BADGE</span>
      <% if (false) %><span class="badge purchased">PURCHASED</span>
    </div>
    <div class="img-wrapper">
      <a href=""><img src="/static/images/big_logo.png" alt="썸네일" /></a>
    </div>
    <div class="product-meta mini">
      <a href=""><h6 class="author">작가 이름</h6></a>
      <a href=""><h6 class="title">오래전 출시된 리소스</h6></a>
      <% if (false) %><span class="price free">FREE</span>
      <% if (true) %><span class="price sale">￦1,600</span>
      <% if (false) %><span class="price original">￦3,200</span>
    </div>
  </div>
  <!-- 예시를 보여주기 위해 컨텐츠 하나씩 추가 -->
  <div class="product-card mini<%= isPurchased ? " purchased-product" : "" %>">
    <div class="badge-wrapper">
      <% if (false) %><span class="badge">NEW</span>
      <% if (false) %><span class="badge">HOT</span>
      <% if (false) %><span class="badge">SALE</span>
      <% if (false) %><span class="badge">FREE</span>
      <% if (false) %><span class="nobadge">NO BADGE</span>
      <% if (true) %><span class="badge purchased">PURCHASED</span>
    </div>
    <div class="img-wrapper">
      <a href=""><img src="/static/images/test1.gif" alt="썸네일" /></a>
    </div>
    <div class="product-meta mini">
      <a href=""><h6 class="author">작가 이름</h6></a>
      <a href=""><h6 class="title">이미 구매한 리소스</h6></a>
      <% if (false) %><span class="price free">FREE</span>
      <% if (true) %><span class="price sale">￦1,600</span>
      <% if (true) %><span class="price original">￦3,200</span>
    </div>
  </div>
  <!-- 예시를 보여주기 위해 컨텐츠 하나씩 추가 -->
  <div class="product-card mini">
    <div class="badge-wrapper">
      <% if (false) %><span class="badge">NEW</span>
      <% if (true) %><span class="badge">HOT</span>
      <% if (false) %><span class="badge">SALE</span>
      <% if (true) %><span class="badge">FREE</span>
      <% if (false) %><span class="nobadge">NO BADGE</span>
      <% if (false) %><span class="badge purchased">PURCHASED</span>
    </div>
    <div class="img-wrapper">
      <a href=""><img src="/static/images/test1.gif" alt="썸네일" /></a>
    </div>
    <div class="product-meta mini">
      <a href=""><h6 class="author">작가 이름</h6></a>
      <a href=""><h6 class="title">무료 인기 리소스</h6></a>
      <% if (true) %><span class="price free">FREE</span>
      <% if (false) %><span class="price sale">￦1,600</span>
      <% if (false) %><span class="price original">￦3,200</span>
    </div>
  </div>
  <!-- 예시를 보여주기 위해 컨텐츠 하나씩 추가 -->
  <div class="product-card mini">
    <div class="badge-wrapper">
      <% if (false) %><span class="badge">NEW</span>
      <% if (false) %><span class="badge">HOT</span>
      <% if (true) %><span class="badge">SALE</span>
      <% if (false) %><span class="badge">FREE</span>
      <% if (false) %><span class="nobadge">NO BADGE</span>
      <% if (false) %><span class="badge purchased">PURCHASED</span>
    </div>
    <div class="img-wrapper">
      <a href=""><img src="/static/images/test1.gif" alt="썸네일" /></a>
    </div>
    <div class="product-meta mini">
      <a href=""><h6 class="author">작가 이름</h6></a>
      <a href=""><h6 class="title">할인 중인 리소스</h6></a>
      <% if (false) %><span class="price free">FREE</span>
      <% if (true) %><span class="price sale">￦1,600</span>
      <% if (true) %><span class="price original">￦3,200</span>
    </div>
  </div>
  <!-- 예시를 보여주기 위해 컨텐츠 하나씩 추가 끝 -->
</div>
