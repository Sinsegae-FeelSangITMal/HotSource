<%@page import="java.util.List"%>
<%@page import="hotsource.domain.Keyword"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
	List<Keyword> keywordList = (List<Keyword>) request.getAttribute("keywordList");
%>

<section class="slider_section ">
	<div id="customCarousel1" class="carousel slide" data-ride="carousel">
		<div class="carousel-inner">
		
			<!-- 첫번째 배너 영역 시작 -->
			<div class="carousel-item active">
			  <div class="container">
			    <div class="row align-items-center"> <!-- 수직 가운데 정렬 -->
			      <div class="col-md-6">
			        <div class="detail-box">
			          <h1>AI 맞춤 검색으로<br> 원하는 리소스를 쉽게 찾아보세요</h1>
			          <p>다양한 키워드에 어울리는 리소스를 추천해드립니다</p>
			          <div class="btn-box">
			            <a href="/main/images">이미지 둘러보기</a>
			            <a href="/main/sounds">사운드 둘러보기</a>
			          </div>
			        </div>
			      </div>
			      <div class="col-md-6">
			        <div class="img-box">
			          <img src="/static/images/big_logo.png" alt="샘플 이미지" />
			        </div>
			      </div>
			    </div>
			  </div>
			</div>
			<!-- 첫번째 배너 영역 끝 -->

			<!-- 두번째 배너 영역 시작 -->
			<div class="carousel-item">
			  <div class="container">
			    <div class="text-center detail-box">
			      <h1>인기 에셋들을 만나보세요</h1>
			    </div>
			    <div class="row text-center">
			      <div class="col-md-4">
			        <img src="/static/images/asset_thumb/fantasyWeapons.jpg" class="img-fluid" alt="이미지1">
			      </div>
			      <div class="col-md-4">
			        <img src="/static/images/asset_thumb/pixelBackgrounds.jpg" class="img-fluid" alt="이미지2">
			      </div>
			      <div class="col-md-4">
			        <img src="/static/images/asset_thumb/realisticCharacter.jpg" class="img-fluid" alt="이미지3">
			      </div>
			    </div>
			  </div>
			</div>
			<!-- 두번째 배너 영역 끝 -->

			<!-- 세번째 배너 영역 시작 -->
			<div class="carousel-item">
			  <div class="container">
			    <div class="text-center detail-box">
			      <h1>최신 에셋들 둘러보기</h1>
			    </div>
			    <div class="row text-center">
			      <div class="col-md-4">
			        <img src="/static/images/asset_thumb/sfCharacter.jpg" class="img-fluid" alt="이미지1">
			      </div>
			      <div class="col-md-4">
			        <img src="/static/images/asset_thumb/forestBGM.jpg" class="img-fluid" alt="이미지2">
			      </div>
			      <div class="col-md-4">
			        <img src="/static/images/asset_thumb/robotEffects.jpg" class="img-fluid" alt="이미지3">
			      </div>
			    </div>
			  </div>
			</div>
			<!-- 세번째 배너 영역 끝 -->
		</div>
		
		<!-- 검색바 영역 시작 -->
		<div class="container">
			<div class="header-search">
				<form>
					<select class="input-select">
						<option value="0">CATEGORY</option>
						<option value="1">IMAGE</option>
						<option value="2">SOUND</option>
						<option value="3">ARTIST</option>
					</select>
					<input class="input" placeholder="2D 노란머리 남자 캐릭터">
					<button class="search-btn">Search</button>
				</form>
			</div>
			<!-- 검색바 영역 끝 -->
			
			<!-- 검색 태그 영역 시작 -->
			<div class="tag-box">	
				<% for (int i=0;i<10;i++) {%>
					<a href="" class="tag"> #<%=keywordList.get(i).getKeyword_name() %> </a>
				<%} %>
			<!-- 
				<a href="" class="tag"> #도트 </a>
				<a href="" class="tag"> #신나는 </a>
				<a href="" class="tag"> #귀여운 </a>
				<a href="" class="tag"> #배경 </a>
				<a href="" class="tag"> #마법사 </a>
				<a href="" class="tag"> #여름 </a>
				<a href="" class="tag"> #뉴에이지 </a>
				<a href="" class="tag"> #초록색 </a>
				<a href="" class="tag"> #몽환적인 </a>
				<a href="" class="tag"> #화려한 </a>
				 -->
			</div>
			<!-- 검색 태그 영역 끝 -->
			
			<!-- 배너 넘김 버튼 영역 시작 -->
			<ol class="carousel-indicators mine">
				<li data-target="#customCarousel1" data-slide-to="0"
					class="active"></li>
				<li data-target="#customCarousel1" data-slide-to="1"></li>
				<li data-target="#customCarousel1" data-slide-to="2"></li>
			</ol>
			<!-- 배너 넘김 버튼 영역 끝 -->
		</div>
		<!-- 검색바 영역 끝 -->
	</div>
</section>
<!-- 배너 영역 끝 -->