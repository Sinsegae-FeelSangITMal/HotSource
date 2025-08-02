<%@page import="hotsource.domain.UserKeywordMapping"%>
<%@page import="java.util.List"%>
<%@page import="hotsource.domain.Keyword"%>
<%@page import="hotsource.domain.User"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	User user = (User) session.getAttribute("user");
	List<Keyword> keywordList = (List<Keyword>) request.getAttribute("keywordList");
	List<UserKeywordMapping> userKeywordList = (List<UserKeywordMapping>) request.getAttribute("userKeywordList");
%>

<!-- 마이페이지의 설정 페이지 -->

<div class="col-md-10 content-area">
	<div class="content-box">
	
		<h3 class="header">Personal Information</h3>
		
		<!-- 기본 정보 섹션 시작 -->
		<div class="line-box">
			<h3 class="header sub">Basic Info</h3>
			
			<form class="setting" id="basicForm">
				<div class="row mb-3">
					<div class="col-md-3 text-end">
						<label class="col-form-label">Profile Image</label>
					</div>
					<div class="col-md-9">
						<img id="preview" src="<%=(user.getProfile_img_url()!=null) ? ("/data/user/"+user.getProfile_img_url()) : "/static/images/noimg.jpg" %>">
					</div>
				</div>
				
                    
				<div class="row mb-3">
					<div class="col-md-3 text-end">
					</div>
					<div class="col-md-9">          
                       <input type="file" id="photo" name="photo" accept="image/*">
                    </div>
				</div>
                  
                  
				<div class="row mb-3">
					<div class="col-md-3 text-end">
						<label class="col-form-label">Name</label>
					</div>
					<div class="col-md-9">
						<p class="form-control-plaintext"><%=user.getUser_name() %></p>
					</div>
				</div>
				
				<div class="row mb-3">
					<div class="col-md-3 text-end">
						<label for="nickname" class="col-form-label">Nickname</label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control" id="nickname" name="user_nickname" value="<%=user.getUser_nickname() %>">
					</div>
				</div>
				
				<div class="row mb-3">
					<div class="col-md-3 text-end">
						<label class="col-form-label">Email</label>
					</div>
					<div class="col-md-9">
						<p class="form-control-plaintext"><%=user.getUser_email() %></p>
					</div>
				</div>
				
				<div class="row">
					<div class="col-md-12 text-center">
						<button type="button" id="basicBtn" class="btn btn-primary mt-4 px-5">Save</button>
					</div>
				</div>
			</form>
		</div>
		<!-- 기본 정보 섹션 끝 -->
	
		<!-- 키워드 섹션 시작 -->
		<div class="line-box">
			<h3 class="header sub">Keyword</h3>

			<div class="keyword-box">	
				<%
				for (Keyword keyword : keywordList) {
					boolean hasKeyword = false;
					for (UserKeywordMapping userKeyword : userKeywordList) {
						if (userKeyword.getKeyword().getKeyword_name().equals(keyword.getKeyword_name())) {
							hasKeyword = true;
							break;
						}
					}
				%>
					<a href="javascript:void(0);" class="keyword <%= hasKeyword ? "active" : "" %>"><%=keyword.getKeyword_name() %></a>
				<%}%>
			</div>

			<div class="btn-wrapper">
				<button type="button" id="keywordBtn" class="btn btn-primary px-5">Save</button>
			</div>
  		</div>
		<!-- 키워드 섹션 끝 -->

	</div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">

let selectedFile;

function basicRegist() {
	if ($("#nickname").val()==""){
		alert('닉네임을 넣어주세요');
		return;
	}
	if (!confirm('수정하시겠습니까?')) return;
	
	let formData = new FormData(document.getElementById("basicForm"));
	
	formData.delete("user_id");
	formData.delete("user_nickname");
	formData.delete("profile_img_url");
	formData.delete("photo");
	formData.append("user_id", <%=user.getUser_id()%>);
	formData.append("user_nickname", $("#nickname").val());
	formData.append("profile_img_url", "<%=user.getProfile_img_url()%>");
	if (selectedFile)
		formData.append("photo", selectedFile);
	
	$.ajax({
		type: "post",
		url: "/main/user/mypage/basic",
		data: formData,
		processData: false,						// form을 이루는 데이터를 대상으로, 문자열로 변환되는 것을 방지 (바이너리 파일 포함 때문) / 파일이 첨부되었을 때 사용함
		contentType: false,						// 브라우저가 자동으로 content-type을 설정하도록 하는 것을 방지 / 파일이 첨부되었을 때 사용함
		success: function(result, status, xhr) {
			if (result=="success"){
				alert("수정이 완료되었습니다");
				location.reload();
			} else {
				alert("수정에 실패했습니다");
				location.reload();
			}
		},
		error: function(xhr, status, err) {
			console.error("에러: ", err);
			alert("오류가 발생했습니다\n 다시 시도해주세요");
		}
	});
}

function keywordRegist() {
	if (!confirm('수정하시겠습니까?')) return;
	
	const activeKeywords = Array.from(document.querySelectorAll('.keyword.active'))
								.map(el => el.textContent.trim());

	$.ajax({
		type: "POST",
		url: "/main/user/mypage/keyword",
		data: JSON.stringify(activeKeywords),		// JSON 형식으로 전송
		contentType: "application/json; charset=utf-8",
		success: function(result, status, xhr) {
			if (result=="success"){
				alert("수정이 완료되었습니다");
				location.reload();
			} else {
				alert("수정에 실패했습니다");
				location.reload();
			}
		},
		error: function(xhr, status, error) {
			console.error("에러: ", error);
			alert("오류가 발생했습니다\n 다시 시도해주세요");
		}
	});
}

  $(() => {

	// 파일 불러오면 이미지 미리보기를 띄워주는 메서드
    $("#photo").change(function (e) {
      const file = e.target.files[0];
      if (!file) {
    	selectedFile = null;
		return;
	  }
      
      selectedFile = file;
      
      const reader = new FileReader();

      reader.onload = function (e) {
        $("#preview").attr("src", e.target.result);
      };

      reader.readAsDataURL(file); // 이미지 파일을 base64로 읽어와서 미리보기
    });
	
	// 프로필 이미지 수정
	$("#basicBtn").click(() => {
		basicRegist();
	});
	 
	// 클릭 시 active 활성화/비활성화
	 document.querySelectorAll('.keyword').forEach(el => {
	 	el.addEventListener('click', () => {
	 		el.classList.toggle('active');
	 	});
	 });

	// Save 버튼 클릭 시 active 상태 키워드 수집
	$("#keywordBtn").click(() => {
		keywordRegist();
	});
	
});
</script>