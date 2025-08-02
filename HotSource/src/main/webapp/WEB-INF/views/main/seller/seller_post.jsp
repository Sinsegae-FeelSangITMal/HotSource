<%@page import="hotsource.domain.NoticeLike"%>
<%@page import="hotsource.domain.NoticeComment"%>
<%@page import="java.util.List"%>
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
				
				<!-- 공지 댓글 -->
				<% List<NoticeComment> commentList = notice.getCommentList(); %>
				<% if (notice.getCommentList() != null && !notice.getCommentList().isEmpty()) { %>
				    <div class="comment-box">
				        <h6>댓글 (<%= commentList.size() %>)</h6>
				        <ul>
				            <% for (NoticeComment comment : commentList) { 
				                if (comment != null) { %> <!-- 이 부분도 안전하게 -->
				                    <li><strong><%= comment.getUser().getUser_name() %>:</strong> <%= comment.getContent() %></li>
				            <%  } } %>
				        </ul>
				    </div>
				<% } else { %>
				    <div class="comment-box">
				        <p>댓글이 없습니다.</p>
				    </div>
				<% } %>

		        
		        <!-- 공지 좋아요 -->
				<% List<NoticeLike> likeList = notice.getLikeList(); %>
				<div class="seller-post-footer">
					<button class="like-btn">
						<i class="fas fa-thumbs-up"></i>
						<span><%= (likeList != null) ? likeList.size() : 0 %></span>
					</button>
					<button class="send-btn">
						<i class="bi bi-send-fill"></i>
					</button>
					<button class="comment-btn">
						<i class="fas fa-comment"></i> <span><%= commentList.size() %></span>
					</button>
				</div>
				
				<!-- 공지 댓글 작성 -->
				<div class="comment-form mt-2">
				    <% if (loginUser != null) { %>
				        <form id="commentForm">
				            <input type="hidden" name="notice_id" value="<%= notice.getNotice_id() %>">
				            <input type="hidden" name="user_id" value="<%= loginUser.getUser_id() %>">
				            <textarea name="content" id="commentContent" class="form-control mb-2" rows="2" placeholder="댓글을 입력하세요..."></textarea>
				            <button type="button" id="btnSubmitComment" class="btn btn-primary btn-sm">댓글 등록</button>
				        </form>
				    <% } else { %>
				        <textarea class="form-control mb-2" rows="2" placeholder="댓글을 입력하려면 로그인하세요..." readonly></textarea>
				        <button type="button" class="btn btn-secondary btn-sm" onclick="alert('로그인이 필요합니다.'); location.href='/main/user/login';">로그인 하러가기</button>
				    <% } %>
				</div>
				
			</div>
		<% } %>
	<% } %>
	<%--} --%>
</div>

<!-- 페이지 영역 시작 -->
<%@ include file="../inc/page.jsp"%>
<!-- 페이지 영역 끝 -->

<script>
    
        $("#btnSubmitComment").click(function () {
            let form = document.getElementById("commentForm");
            let formData = new FormData(form);

            $.ajax({
                url: "/main/noticeComment/insert",
                type: "POST",
                data: formData,
                processData: false,
                contentType: false,
                success: function (response) {
                    // 예시: JSON 형태의 댓글 객체를 응답받는다고 가정
                    // { comment_id, content, user_name, create_date }

                    // 폼 초기화
                    form.reset();

                    // 댓글 HTML 생성
                    let html = `
                        <div class="comment-item mb-2 border p-2 rounded">
                            <div class="fw-bold">${response.user_name}</div>
                            <div class="text-muted small">${response.create_date}</div>
                            <div>${response.content}</div>
                        </div>
                    `;

                    // 댓글 리스트에 추가
                    $("#commentList").prepend(html);
                },
                error: function (xhr, status, err) {
                    alert("댓글 등록 실패: " + xhr.responseText);
                }
            });
        });
</script>