<%@ page contentType="text/html; charset=UTF-8"%>

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
						<img src="/static/images/main_logo.png">
					</div>
				</div>
				
				<div class="row mb-3">
					<div class="col-md-3 text-end">
						<label class="col-form-label">Name</label>
					</div>
					<div class="col-md-9">
						<p class="form-control-plaintext">홍길동</p>
					</div>
				</div>
				
				<div class="row mb-3">
					<div class="col-md-3 text-end">
						<label for="nickname" class="col-form-label">Nickname</label>
					</div>
					<div class="col-md-9">
						<input type="text" class="form-control" id="nickname" name="nickname" value="길동이">
					</div>
				</div>
				
				<div class="row mb-3">
					<div class="col-md-3 text-end">
						<label class="col-form-label">Email</label>
					</div>
					<div class="col-md-9">
						<p class="form-control-plaintext">gildong@example.com</p>
					</div>
				</div>
				
				<div class="row mb-3">
					<div class="col-md-3 text-end">
						<label for="password" class="col-form-label">Password</label>
					</div>
					<div class="col-md-9">
						<input type="password" class="form-control" id="password" name="password" placeholder="Password">
					</div>
				</div>
				
				<div class="row mb-3">
					<div class="col-md-3 text-end">
						<label for="passwordConfirm" class="col-form-label">Confirm</label>
					</div>
					<div class="col-md-9">
						<input type="password" class="form-control" id="passwordConfirm" name="passwordConfirm" placeholder="Confirm">
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
				<a href="" class="keyword active"> #키워드 0 </a>
				<% for (int i=0; i<=50; i++) {%>
				<a href="" class="keyword"> #키워드 <%=i %> </a>
				<%} %>
			</div>

			<div class="btn-wrapper">
				<button type="submit" class="btn btn-primary px-5">Save</button>
			</div>
  		</div>
		<!-- 키워드 섹션 끝 -->
		
	</div>
</div>