<%@ page contentType="text/html; charset=UTF-8"%>

<!-- 마이페이지의 사이드바, 컨텐츠 영역 -->

<div class="mypage-container">
  <div class="row">
  
    <!-- 사이드바 시작 -->
    <div class="col-md-2 sidebar">
      <div class="sidebar-menu">
        <h5 class="sidebar-title">My Account</h5>
        <ul class="menu-list">
          <li class="my-item ${mymenu == 'info' ? 'active' : ''}"><a class="my-link" href="/user/mypage?mymenu=info">Personal Info<span class="sr-only">(current)</span></a></li>
          <li class="my-item ${mymenu == 'order' ? 'active' : ''}"><a class="my-link" href="/user/mypage?mymenu=order">Orders</a></li>
          <li class="my-item ${mymenu == 'review' ? 'active' : ''}"><a class="my-link" href="/user/mypage?mymenu=review">Reviews</a></li>
          <li class="my-item ${mymenu == 'resource' ? 'active' : ''}"><a class="my-link" href="/user/mypage?mymenu=resource">Resources</a></li>
  		  <li class="my-item ${mymenu == 'subscription' ? 'active' : ''}"><a class="my-link" href="/user/mypage?mymenu=subscription">Subscriptions</a></li>
        </ul>
      </div>
    </div>
    <!-- 사이드바 끝 -->

    <!-- 콘텐츠 영역 시작 -->
	<jsp:include page="${myContent}"/>
    <!-- 콘텐츠 영역 끝 -->

  </div>
</div>