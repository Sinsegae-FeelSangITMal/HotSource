<%@ page contentType="text/html; charset=UTF-8"%>

<!-- 마이페이지의 사이드바, 컨텐츠 영역 -->

<div class="mypage-container">
  <div class="row">
  
    <!-- 사이드바 시작 -->
    <div class="col-md-2 sidebar">
      <div class="sidebar-menu">
        <h5 class="sidebar-title">My Account</h5>
        <ul class="menu-list">
          <li class="my-item active"><a class="my-link" href="/main/mypage">Personal Info<span class="sr-only">(current)</span></a></li>
          <li class="my-item"><a class="my-link" href="#">Orders</a></li>
          <li class="my-item"><a class="my-link" href="#">Reviews</a></li>
          <li class="my-item"><a class="my-link" href="#">Resources</a></li>
          <li class="my-item"><a class="my-link" href="#">Subscriptions</a></li>
        </ul>
      </div>
    </div>
    <!-- 사이드바 끝 -->

    <!-- 콘텐츠 영역 시작 -->
    <%--
	<%@ include file="mypage_order_content.jsp" %>
	<%@ include file="mypage_review_content.jsp" %>
	<%@ include file="mypage_resource_content.jsp" %>
	<%@ include file="mypage_subscription_content.jsp" %>
     --%>
    <!-- 콘텐츠 영역 끝 -->
	<%@ include file="mypage_info_content.jsp" %>

  </div>
</div>