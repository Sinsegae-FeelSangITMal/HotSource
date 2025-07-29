<%@ page contentType="text/html; charset=UTF-8"%>
<div class="tap-artist-card">
					<%-- for (int i=1; i<=2; i++) {--%>
	<% for (int i=1; i<=2; i++) { %>
	<div class="seller-post-card">
		<div class="seller-post-header">
			<img class="seller-post-avatar" src="/static/images/big_logo.png" alt="작가 프로필" />
			<div class="seller-post-info">
				<h5 class="seller-post-author">Pomodoro</h5> &nbsp &nbsp
				<span class="seller-post-time">2 Month Ago</span> &nbsp &nbsp
				<% if (true) %><span class="badge">NEW</span>
			</div>
		</div>

		<div class="seller-post-body d-flex">
			<!-- <img src="/static/images/cozy_tileset_preview.png" alt="tileset" class="seller-post-image">-->
			<img class="seller-post-image" src="/static/images/test1.gif" alt="썸네일" />
			<div class="post-text ms-3">
				<h4 class="seller-post-title">New Cozy Village Tileset Coming This Friday!</h4>
				<hr>
				<p class="seller-post-description">
					Get ready for a brand-new tileset designed for cozy farming or
					slice-of-life games!<br> The "Cozy Village" pack includes
					houses, gardens, shops, and decorative elements — all in warm,
					pixel-perfect detail.<br>
					<br>Release Date: Friday, July 12th<br>
					<br> Stay tuned, and thank you for supporting indie art!
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
	<%--} --%>
</div>

<!-- 페이지 영역 시작 -->
<%@ include file="../inc/page.jsp"%>
<!-- 페이지 영역 끝 -->