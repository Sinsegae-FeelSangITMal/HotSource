<%@page import="hotsource.model.wishlist.BadgeType"%>
<%@page import="hotsource.model.wishlist.AssetCardDTO"%>
<%@page import="java.util.List"%>
<%@page import="hotsource.model.wishlist.WishlistDetailDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	WishlistDetailDTO dto = (WishlistDetailDTO)request.getAttribute("dto");
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
<link href="/static/css/wishlist_modal.css" type="text/css"rel="stylesheet">
<link href="/static/css/toast.css" type="text/css"rel="stylesheet">
</head>

<body>
	<!-- Header -->
	<div class="hero_area">
		<%@ include file="../inc/header_search.jsp"%>
	</div>

	<!-- Breadcrumb Begin -->
	<div class="breadcrumb-option">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="breadcrumb__links">
						<a href="/main/index"><i class="fa fa-home"></i> Home</a> <a
							href="/main/wishlist"> Wish List</a> <span><%=dto.getList_name()%>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->

	<!-- 특정 Wishlist Section Begin -->
	<div class="wishlist-wrapper">
		<!-- Wishlist 헤더 -->
		<div class="wishlist-header">
			<div class="wishlist-title-line">
				<div class="wishlist-title-text">
					<h2><%=dto.getList_name()%></h2>
				</div>
				<i class="bi bi-gear-fill" id="bt_setting1" style="color: black; font-size: 20px;"></i>
			</div>
			<div class="wishlist-description"><%=dto.getDescription()%></div>
		</div>
		<!-- Asset 없는 경우 -->
		<%if(dto.getAssetList().size() == 0) { %>
		<h4 style="margin-bottom: 300px;">Nothing saved yet</h4>
		<%} else { %>
		<!-- Asset 목록 시작 -->
		<div class="product-grid">
		<%
			List<AssetCardDTO> list = dto.getAssetList();
			for (int i = 0; i < list.size(); i++) { 
				request.setAttribute("card", list.get(i));
				request.setAttribute("wishlistPage", true);
				request.setAttribute("wishlist_id", dto.getWishlist_id());
		%> 		
				<!-- 상품 카드 -->				
				<jsp:include page="./asset_card.jsp" />
		<%} %>
		<%} %>
		<!-- Asset 목록 끝 -->
	</div>
	<!-- Wishlist Section End -->

	<!-- 수정 모달 (기본 숨겨짐) -->
	<%@ include file="./update_form.jsp"%>
	<!-- 수정 모달 끝 -->
	
	<!-- 푸터 영역 시작 -->
	<%@ include file="../inc/footer.jsp"%>

	<!-- js plugin -->
	<%@ include file="../inc/footer_link.jsp"%>
	<script src="/static/js/asset_card.js"></script>
	
	<script type="text/javascript">
		
		function updateWishlist(){
			
			let formdata = new FormData(document.querySelector("#wishlist_modal_form"));
			formdata.append("wishlist_id", "<%=dto.getWishlist_id()%>");
			$.ajax({
				url:"/main/wishlist/update",
				type: "post",
				data: formdata,
				processData: false,   
				contentType: false, 
				success: function(result, status, xhr){
					$("#modalOverlay").hide();  //모달 숨기기
					location.reload();
				},
				error: function(xhr, status, err){
					console.log(err);
				} 
			});
		}
		function deleteWishlist(){
			$("#delete_form input[type='hidden']").val(<%=dto.getWishlist_id()%>);
			$("#delete_form").attr({
				action: "/main/wishlist/delete",
				method: "post"
			});
			$("#delete_form").submit();
		}
			
		function checkForm() {
			const title = $("#listTitle").val().trim();
			$("#saveBtn").prop("disabled", title === "");
		}
	
		// 수정 모달 열기
 		$("#bt_setting1").click(() => { 
			console.log("click"); 			
			    $("#listTitle").val("<%=dto.getList_name()%>");
			    $("#listDesc").val("<%=dto.getDescription()%>");
			    $("#titleLength").text("<%=dto.getList_name().length()%>/60");
			    $("#modalOverlay").css("display", "flex");
			    checkForm();
		});

		// 입력 검사
		document.getElementById("listTitle").addEventListener("input", () => {
			$("#titleLength").text($("#listTitle").val().length + "/60");
			checkForm(); // 기존 저장 버튼 활성화 여부 확인
		});

		//수정
		$("#saveBtn").click(function(){
			updateWishlist();
		});
		
		// 취소
		$("#cancelBtn").click(function(){
			$("#modalOverlay").css("display", "none");
		});
		
		$("#delete_modal_a").click(function(){
			$("#modalOverlay").css("display", "none");
			
			$("#deleteModal h6").text("<%=dto.getList_name()%>");
			$("#deleteModal").css("display", "flex");
		});
		
		$("#cancelDelBtn").click(function(){
			$("#deleteModal").css("display", "none");
		});
		
		$("#deleteBtn").click(function(){
			console.log("삭제 버튼 클릭");
			deleteWishlist();
		})
		
		</script>
		
		<div id="toast" class="toast"></div>
	</body>
</html>