<%@ page contentType="text/html; charset=UTF-8"%>

<div class="artist-list">
<!-- 한 컨텐츠 시작 -->
<%-- for (int i=1; i<=2; i++) {--%>  
  <div class="artist-card">
    <img class="artist-avatar" src="/static/images/big_logo.png" alt="작가 프로필" />
    <div class="artist-info">
      <a href=""><h4 class="artist-name">작가명</h4></a>
      <h6 class="artist-role">2D Pixel Artist</h6>
      <% if (true) %><button class="follow-btn false">+ Follow</button>
      <% if (false) %><button class="follow-btn true">Followed</button>
      <div class="artist-stats">
        <span>Subscriber <br><strong>420.1k</strong></span>
        <span>Works <br><strong>250</strong></span>
        <span>Reviews <br><strong>★ 4.5 (13)</strong></span>
      </div>
    </div>
    <div class="artist-preview">
    <%-- for() { --%>
      <div class="thumb">
        <a href=""><% if (false) %><img src="/static/images/big_logo.png" alt="썸네일" /></a>
      </div>
      <div class="thumb">
        <a href=""><% if (false) %><img src="/static/images/big_logo.png" alt="썸네일" /></a>
      </div>
      <div class="thumb">
        <a href=""><% if (true) %><img src="/static/images/big_logo.png" alt="썸네일" /></a>
      </div>
    <%--} --%>
    </div>
  </div>
<%--} --%>
<!-- 한 컨텐츠 끝 -->
<!-- 예시를 보여주기 위해 컨텐츠 하나씩 추가 -->
  <div class="artist-card">
    <img class="artist-avatar" src="/static/images/big_logo.png" alt="작가 프로필" />
    <div class="artist-info">
      <a href=""><h4 class="artist-name">작가명</h4></a>
      <h6 class="artist-role">2D Pixel Artist</h6>
      <% if (false) %><button class="follow-btn false">+ Follow</button>
      <% if (true) %><button class="follow-btn true">Followed</button>
      <div class="artist-stats">
        <span>Subscriber <br><strong>420.1k</strong></span>
        <span>Works <br><strong>250</strong></span>
        <span>Reviews <br><strong>★ 4.5 (13)</strong></span>
      </div>
    </div>
    <div class="artist-preview">
    <% for(int i=1; i<=3; i++) { %>
      <div class="thumb">
        <a href=""><% if (true) %><img src="/static/images/big_logo.png" alt="썸네일" /></a>
      </div>
    <%} %>
    </div>
  </div>
  <!-- 예시를 보여주기 위해 컨텐츠 하나씩 추가 끝 -->
</div>
