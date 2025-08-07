<%@page import="hotsource.domain.UserKeywordMapping"%>
<%@page import="java.util.List"%>
<%@page import="hotsource.domain.Keyword"%>
<%@page import="hotsource.domain.User"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	User user = (User) request.getAttribute("user");
	List<Keyword> keywordList = (List<Keyword>) request.getAttribute("keywordList");
	List<UserKeywordMapping> userKeywordList = (List<UserKeywordMapping>) request.getAttribute("userKeywordList");
%>

<!-- 마이페이지의 설정 페이지 -->

<div class="col-md-10 content-area">
	<div class="content-box">
	
		<h3 class="header">Security</h3>
		
		<!-- 기본 정보 섹션 시작 -->
		<div class="line-box">
			<h3 class="header sub">Password</h3>
			
			<form class="setting" id="basicForm">
                  
				<div class="row mb-3">
					<div class="col-md-3 text-end">
						<label for="nickname" class="col-form-label">Password</label>
					</div>
					<div class="col-md-9">
						<input type="password" class="form-control" id="oriPwd" name="password">
					</div>
				</div>
				<br><br>
				<div class="row mb-3">
					<div class="col-md-3 text-end">
						<label for="nickname" class="col-form-label">New Password</label>
					</div>
					<div class="col-md-9">
						<input type="password" class="form-control" id="newPwd1" name="password">
					</div>
				</div>
				
				<div class="row mb-3">
					<div class="col-md-3 text-end">
						<label for="nickname" class="col-form-label">New Password Confirm</label>
					</div>
					<div class="col-md-9">
						<input type="password" class="form-control" id="newPwd2" name="password">
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12 text-center">
						<button type="button" onclick="check()" class="btn btn-primary mt-4 px-5">Save</button>
					</div>
				</div>
			</form>
		</div>
		<!-- 기본 정보 섹션 끝 -->
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">

function check() {
	var oriPwd = $("#oriPwd").val();
	var newPwd1 = $("#newPwd1").val();
	var newPwd2 = $("#newPwd2").val();
	
	// 칸이 모두 채워져 있지 않을 때
	if (!oriPwd || !newPwd1 || !newPwd2){
		alert("빈 칸을 모두 입력해주세요"); return;
	}

	// 비밀번호가 4글자보다 작을 때
	if (newPwd1.length < 4 || newPwd1.length > 8) {
		alert("비밀번호는 4~8글자 사이여야 합니다"); return;
	}
	
	// 새로운 비밀번호 작성 칸 2개가 서로 같지 않을 때
	if (newPwd1 !== newPwd2) {
		alert("새 비밀번호를 다시 확인해주세요"); return;
	}

	
	$.ajax({
		// 기존 비밀번호가 올바르게 입력됐는지 확인
		url: "/main/user/password/check",
		type: "POST",
		data: {
			oriPwd: oriPwd
		},
		success: function (result, status, xhr) {
			// 기존 비밀번호가 올바르게 입력되었을 시 새 비밀번호와 겹치는지 확인 요청
			if (result === "match"){
				$.ajax({
					url: "/main/user/password/confirm",
					type: "POST",
					data: {
						newPwd: newPwd1
					},
					success: function(result, status, xhr) {
						// 기존 비밀번호가 올바르게 입력되었을 시 새 비밀번호와 겹치는지 확인 요청
						if (result === "isNew"){
							if (confirm("비밀번호를 변경하시겠습니까?")) {
								$.ajax({
									url: "/main/user/password/update",
									type: "POST",
									data: {
										newPwd: newPwd1
									},
									success: function(result, status, xhr) {
										alert("비밀번호가 변경되었습니다\n다시 로그인해주세요");
										location.href = "/main/user/logout";
									}
								});
							}
						}
						else
							alert("기존 비밀번호와 같습니다");
					}
				});
			} else
				alert("기존 비밀번호를 다시 확인해주세요");
		}
	});
}
</script>