<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.Date"%>
<%@page import="hotsource.domain.Notice"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	SimpleDateFormat sdf;
	String formattedDate;
    Date createDate = seller.getCreate_date(); // java.util.Date 또는 Timestamp 라고 가정
    Calendar cal = java.util.Calendar.getInstance();
    Date now = cal.getTime(); // 오늘 날짜

    // 한 달 전으로 이동
    cal.add(Calendar.MONTH, -1);
    Date oneMonthAgo = cal.getTime();

    // 조건: 한 달 이내에 생성된 경우
    boolean isNew = createDate.after(oneMonthAgo) && !createDate.after(now);
%>
<div class="tap-artist-card">
					<%-- for (int i=1; i<=2; i++) {--%>
	<%-- notice_id, seller_id, title, content, create_date, notice_img_url --%>
	<% if (noticeList != null) { %>
		<% for (Notice notice :noticeList) { %>
			<div class="seller-post-card">
				<div class="seller-post-header">
					<img class="seller-post-avatar" src="/static/images/big_logo.png" alt="작가 프로필" />
					<div class="seller-post-info">
						<%
							sdf = new SimpleDateFormat("yyyy/ M / d HH:mm");
							formattedDate = sdf.format(seller.getCreate_date());
						%>
						<h5 class="seller-post-author"><%= seller.getSeller_name() %></h5> &nbsp &nbsp
						<span class="seller-post-time"><%= formattedDate %></span> &nbsp &nbsp
						
						<% if (isNew) %><span class="badge">NEW</span> <!-- 작성일 오늘을 기준으로 한달 내 일 경우 NEW 뱃지 부여 -->
					</div>
				</div>
				<div class="seller-post-body d-flex">
					<!-- <img src="/static/images/cozy_tileset_preview.png" alt="tileset" class="seller-post-image">-->
					<img class="seller-post-image" src="/static/images/test1.gif" alt="썸네일" />
					<div class="post-text ms-3">
						<h4 class="seller-post-title"><%= notice.getTitle() %></h4>
						<hr>
						<p class="seller-post-description">
							<%= notice.getContent() %>
						</p>
					</div>
				</div>
		
				<div class="seller-post-footer">
					<button class="like-btn">
						<i class="fas fa-thumbs-up"></i> <span>1,020</span>
					</button>
					<button class="dislike-btn">
						<i class="fas fa-thumbs-down"></i>
					</button>
					<button class="send-btn">
						<i class="bi bi-send-fill"></i>
					</button>
					<button class="comment-btn">
						<i class="fas fa-comment"></i> <span>37</span>
					</button>
				</div>
			</div>
		<% } %>
	<% } %>
	<%--} --%>
</div>

<!-- 페이지 영역 시작 -->
<%@ include file="../inc/page.jsp"%>
<!-- 페이지 영역 끝 -->