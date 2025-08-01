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
	
		<h3 class="header">Personal Information</h3>
		
		<!-- 기본 정보 섹션 시작 -->
		<div class="line-box">
			<h3 class="header sub">Basic Info</h3>
			
			<form class="setting">
				<div class="row mb-3">
					<div class="col-md-3 text-end">
						<label class="col-form-label">Profile Image</label>
					</div>
					<div class="col-md-9">
						<img id="preview" src="/static/images/noimg.jpg">
					</div>
				</div>
				
                    
				<div class="row mb-3">
					<div class="col-md-3 text-end">
					</div>
					<div class="col-md-9">          
                       <input type="file" id="photo" accept="image/*">
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
						<input type="text" class="form-control" id="nickname" name="nickname" value="<%=user.getUser_nickname() %>">
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
						<button type="submit" class="btn btn-primary mt-4 px-5">Save</button>
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
					<a href="" class="keyword <%= hasKeyword ? "active" : "" %>"><%=keyword.getKeyword_name() %></a>
				<%}%>
			</div>

			<div class="btn-wrapper">
				<button type="submit" class="btn btn-primary px-5">Save</button>
			</div>
  		</div>
		<!-- 키워드 섹션 끝 -->
		
	</div>
</div>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
  $(() => {
    $("#photo").change(function (e) {
      const file = e.target.files[0];
      if (!file) return;

      const reader = new FileReader();

      reader.onload = function (e) {
        $("#preview").attr("src", e.target.result);
      };

      reader.readAsDataURL(file); // 이미지 파일을 base64로 읽어와서 미리보기
    });
  });
</script>