<%@page import="hotsource.domain.Asset"%>
<%@page import="hotsource.domain.Wishlist"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Wishlist> wishlists = (List)request.getAttribute("wishlists");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쇼핑몰</title>

	<!-- link Font, CSS -->
    <%@ include file="../inc/head_link.jsp"%>
    <link href="/static/css/wishlist.css" type="text/css" rel="stylesheet">
    <link href="/static/css/wishlist_modal.css" type="text/css" rel="stylesheet">
</head>

<body>
    <!-- Header -->
	<div class="hero_area">
		<%@ include file="../inc/header_search.jsp" %>
	</div>

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="/main/index"><i class="fa fa-home"></i> Home</a>
                        <span>Wishlist</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

     <!-- Wishlist Section Begin --> 
	<div class="wishlist-wrapper">
      
	  	<!-- Wishlist 헤더 -->
		<div class="wishlist-header">
			<h2>Wishlist</h2>
			<button type="button" id="createBtn" class="btn btn-danger">create new list</button>
		</div>

		<!-- 카드 목록 -->
		<div class="wishlist-list">
	    <% for(Wishlist w : wishlists) { %>
	    <% int num = w.getItemList().size() >= 4 ? 4 : w.getItemList().size() ; %>
	    	<a href="/main/wishlist/detail?id=<%=w.getWishlist_id()%>">
		      	<div class="wishlist-card">
		        	<div class="thumbnail-box">
		        		<% //num > 0 이미지 태그 아니면 회색 박스 %>
		        		<%for(int i = 0; i < num ; i++){ %>
		        		<%	Asset asset = w.getItemList().get(i).getAsset(); %>
		        			<img class="thumb" 
		        				 id="thumb_<%=asset.getAsset_id() %>" 
		        				 src="" 
		        				 alt="" 
		        				 style="border-radius:0px"
       							 data-asset-id="<%=asset.getAsset_id()%>"
      							 data-filename="<%=asset.getThumbnail().getAsset_img_url() %>"
		        			>
		          		<%} %>
		          		<%for(int i = num; i < 4; i++){ %>
		          			<div class="thumb placeholder" style="border-radius:0px"></div> 
		          		<%} %>
		        	</div>
		        	<div class="wishlist-info">
		          		<strong><%= w.getList_name() %></strong>
		         		<p><%= w.getItemList().size() %> Assets</p>
		        	</div>
		      	</div>
	   		</a>
	    <% } %>
	  	</div> 
	</div>
    
    <!-- Wishlist Section End -->
    
	<!-- 모달 배경 + 본문 -->
	<form id="wishlist_modal_form">
	<div id="modalOverlay" class="modal-overlay">
	  <div class="modal-content">
	    <h2>Create a new list</h2>
	    <label>목록 이름</label>
	    <input type="text" id="listTitle" name="list_name" placeholder="예: 목록 이름" />
	
	    <label>간단한 설명</label>
	    <textarea id="listDesc" name="description" placeholder="예: 이건 목록에 대한 설명입니다"></textarea>
	    <div class="button-group">
	      <button type="button" id="cancelBtn" class="btn1 cancel">취소</button>
	      <button type="button" id="saveBtn" class="btn1 save" disabled>저장</button>
	    </div>
	  </div>
	</div>
	</form>
    
    <!-- 푸터 영역 시작 -->
	<%@ include file="../inc/footer.jsp" %>
	
<!-- Js Plugins -->
<%@ include file="../inc/footer_link.jsp" %>
    
<script type="text/javascript">

const modal = document.getElementById("modalOverlay");
const cancelBtn = document.getElementById("cancelBtn");
const saveBtn = document.getElementById("saveBtn");
const titleInput = document.getElementById("listTitle");
const descInput = document.getElementById("listDesc");

function createWishlist(){
	let formdata = new FormData(document.querySelector("#wishlist_modal_form"));
	
	$.ajax({
		url: "/main/wishlist/regist",
		type: "post",
		data: formdata,
		processData: false,
	    contentType: false,
		success: function(result, status, xhr){
			alert("찜목록 생성 성공");
			$("#modalOverlay").hide();  //모달 숨기기
			location.reload();
		},
		error: function(xhr, status, err){
			alert("찜목록 생성 실패 ");
		}
	})
}
// 열기
$("#createBtn").click(function(){
	  modal.style.display = "flex";
	  titleInput.value = "";
	  descInput.value = "";
	  saveBtn.disabled = true;
	  saveBtn.classList.remove("enabled");
});

// 취소
cancelBtn.addEventListener("click", () => {
  modal.style.display = "none";
});

//저장
$("#saveBtn").click(function(){
	createWishlist();
});

// 입력 검사
function checkForm() {
  if (titleInput.value.trim() !== "") {
    saveBtn.disabled = false;
    saveBtn.classList.add("enabled");
  } else {
    saveBtn.disabled = true;
    saveBtn.classList.remove("enabled");
  }
}
titleInput.addEventListener("input", checkForm);


//비동기 방식으로, 서버의 이미지를 다운로드 받기 
	function getImgList(asset_id, filename){
		console.log("넘겨받은 파일명은 ", filename);
		$.ajax({
			url:"/data/asset_img/" + asset_id + "/" + filename, 
			type:"GET",
			//서버로부터 가져온 이미지 정보는 img src로 표현되려면, 
			//1) 서버로 부터 가져온 정보를 Blob 형태로 가져와서
			//2) 웹브라우저 지원 객체인 File 로 변환 
			//3) 이 파일을 읽어들인 후 e.target.result 형태로 img src에 대입
			//XMLHttpRequest 객체를 이용해야 함
			xhr: function(){
				const xhr = new XMLHttpRequest();
				xhr.responseType="blob"; 
				return xhr;
			},
			success:function(result, status, xhr){
				console.log("서버로부터 받은 바이너리 정보는 ",result);
				const file = new File([result], filename, {type: result.type});
				
				const reader = new FileReader();
				reader.onload=function(e){
					
					const imgTag = document.querySelector("#thumb_" + asset_id);
					if (imgTag) {
						imgTag.src = e.target.result;
						console.log(imgTag.src);
					}
				}
				reader.readAsDataURL(file);//대상 파일 읽기 
			}
		});
	}

	document.querySelectorAll("img.thumb").forEach(img => {
		    const assetId = img.dataset.assetId;
		    const filename = img.dataset.filename;
		    getImgList(assetId, filename);
	});
	
</script>
    
</body>

</html>