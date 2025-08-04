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
    //Date createDate = notice.getCreate_date(); // 공지 생성일로 변경
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
				        <input type="hidden" id="notice_id_<%= notice.getNotice_id() %>" value="<%= notice.getNotice_id() %>">
						<input type="hidden" id="user_id_<%= notice.getNotice_id() %>" value="<%= loginUser.getUser_id() %>">
						<textarea id="comment_content_<%= notice.getNotice_id() %>" class="form-control mb-2" rows="2" placeholder="댓글을 입력하세요..."></textarea>
						<button type="button" class="btn btn-primary btn-sm" onclick="registComment(<%= notice.getNotice_id() %>)">댓글 등록</button>

				    <% } else { %>
				        <textarea class="form-control mb-2" rows="2" placeholder="댓글을 입력하려면 로그인하세요..." readonly></textarea>
				        <button type="button" class="btn btn-secondary btn-sm" onclick="alert('로그인이 필요합니다.'); location.href='/main/user/login';">로그인 하러가기</button>
				    <% } %>
				</div>
				
								
				<!-- 댓글 리스트 -->
				<ul id="comment_list_<%= notice.getNotice_id() %>" class="mt-3">
				    <% for (NoticeComment comment : commentList) { %>
				        <li class="mb-2 d-flex justify-content-between align-items-start">
				            <div>
				                <strong><%= comment.getUser().getUser_name() %></strong> 
				                <span class="text-muted" style="font-size: 0.8em;"><%= sdf.format(comment.getCreate_date()) %></span><br>
				                <%= comment.getContent() %>
				            </div>
				            
				            <%-- 로그인한 사용자가 작성한 댓글일 경우에만 삭제 버튼 노출 --%>
				            <% if (loginUser != null && loginUser.getUser_id() == comment.getUser().getUser_id()) { %>
				                <button class="btn btn-sm btn-danger ms-2" onclick="deleteComment(<%= comment.getNotice_comment_id() %>)">X</button>
				            <% } %>
				        </li>
				    <% } %>
				</ul>

			</div>
		<% } %>
	<% } %>
	<%--} --%>
</div>

<!-- 페이지 영역 시작 -->
<%@ include file="../inc/page.jsp"%>
<!-- 페이지 영역 끝 -->

<script>
function registComment(noticeId) {
    const userId = $("#user_id_" + noticeId).val();
    const content = $("#comment_content_" + noticeId).val();
    
    console.log(userId);

    if (!content.trim()) {
        alert("댓글을 입력하세요.");
        return;
    }

    $.ajax({
        url: "/main/seller/comment/regist",
        type: "post",
        data: {
            notice_id: noticeId,
            user_id: userId,
            content: content
        },
        success:function(result, status, xhr){
        	alert('댓글이 등록되었습니다.');
        	location.reload();  // 새로고침
		},
		error:function(xhr, status, err){
			alert(err);
		}
    });
}

function deleteComment(notice_comment_id) {
    if (!confirm("댓글을 삭제하시겠습니까?")) return;

    $.ajax({
        url: "/main/seller/comment/delete",
        type: "post",
        data: {
            notice_comment_id: notice_comment_id
        },
        success: function(result, status, xhr) {
            alert("댓글이 삭제되었습니다.");
            // 댓글만 부분 갱신하고 싶다면 Ajax로 commentList 다시 불러오는 식으로 해도 좋음
            location.reload();
        },
        error: function(xhr, status, err) {
            alert("삭제 실패: " + err);
        }
    });
}

</script>