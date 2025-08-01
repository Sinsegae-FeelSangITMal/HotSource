<%@page import="hotsource.domain.Asset"%>
<%@page import="hotsource.domain.AssetImg"%>
   <%@page import="hotsource.domain.Cart"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Cart> cartList = (List)request.getAttribute("cartList");
	List<Integer> discountList = (List)request.getAttribute("discountList");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쇼핑몰</title>

	<!-- link Font, CSS -->
    <%@ include file="../inc/head_link.jsp"%>
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>
	<!-- 헤더 및 배너 영역 시작 -->
	<div class="hero_area">

		<!-- 헤더 영역 시작 -->
		<%@ include file="../inc/header_search.jsp" %>
		
		<!-- 헤더 영역 끝-->

	</div>
	<!-- 헤더 및 배너 영역 끝 -->

    <!-- Breadcrumb Begin -->
    <div class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__links">
                        <a href="./index.html"><i class="fa fa-home"></i> Home</a>
                        <span>Shopping cart</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb End -->

     <!-- Shop Cart Section Begin --> 
    <section class="shop-cart spad">
        <div class="container">
            <div class="row">
            	<!-- ✅ 왼쪽: 장바구니 목록 (8칸) -->
                <div class="col-lg-8">
                	<div class="shop__cart__table">
                    	<div class="cart-header">
                    		<input type="checkbox" class="cart-header-check" checked>
  							<h3>장바구니에 <span id="selectedCount"><%=cartList.size() %></span>개 상품이 있습니다</h3>
						</div>
                        <table>
                            <tbody>
                            <%for(int i = 0; i < cartList.size(); i++){ %>
                            <%Cart cart = cartList.get(i); %>
                           
                          
                            	<tr>
                                    <td class="cart__product__item">
									    <div class="cart-item-wrapper">
									  		<!-- 장바구니 아이템의 기본키 값  -->
									  		<input type="hidden" class="cart-id" value="<%=cart.getCart_id()%>">
									    	<!-- 체크박스 -->
									    	<input type="checkbox" class="cart-check" checked>
									
									    	<!-- 이미지 -->
									    	<img id="thumb_<%=cart.getAsset().getAsset_id() %>" src=""  style="width: 100px; height: 100px;" alt="">
									
									    	<!-- 텍스트 영역 --> 
									    	<div class="cart__product__item__content">
										      	<div class="author-name"><%=cart.getAsset().getSeller().getSeller_name() %></div>
										      	<div class="cart__product__item__title">
										        <h6><%= cart.getAsset().getTitle() %></h6>
										 		</div>
										      
										     	<!-- 삭제, 찜 버튼 영역 -->
										      	<div class="button-group">
										        	<button class="icon-button bt_delete" type="button">
										          		<i class="bi bi-trash"></i> delete
										       		</button>
										        	<button class="icon-button bt_jjim" type="button" >
										         	<i class="bi bi-heart"></i> jjim
										        	</button>
										      	</div>
									    	</div>
									  </div>
									</td>
                                    <td class="cart__price">
                                    <% 
                                    int originalPrice = cart.getAsset().getPrice(); 
                                    int discountPrice = discountList.get(i); 
                                    boolean isDiscounted = discountPrice > 0 && discountPrice < originalPrice;
                                    %>
	                                    <span class="original-price" style="<%= isDiscounted ? "" : "color: black; text-decoration: none;" %>">
									      $<%= originalPrice %>
									    </span>
									    <span class="sale-price" style="<%= isDiscounted ? "" : "display: none;" %>">
									      $<%= discountPrice %>
									    </span>
                                    </td>
                                </tr>
                                <%} %>
                            </tbody>
                        </table>
                        
                        <div class="cart__btn mt-3" id="bt_delete_selected">
                        	<a href="#">선택 에셋 장바구니에서 제외</a>
                    	</div>
                    </div>
                </div>
                
                <!-- ✅ 오른쪽: 결제 영역 (4칸) -->     
                <div class="col-lg-4">
	                <div class="cart__total__procced">
	                    <h6>Cart total</h6>
	                    <ul>
	                        <li>Subtotal <span></span></li>
	                        <li>Total <span></span></li>
	                    </ul>
	                    <a href="#" class="primary-btn">Proceed to checkout</a>
	                </div>
            	</div>
			</div>
		</div>
    </section>
    <!-- Shop Cart Section End -->
    
    <!-- 푸터 영역 시작 -->
	<%@ include file="../inc/footer.jsp" %>
	<!-- 푸터 영역 끝 -->
	
<!-- Js Plugins -->
<%@ include file="../inc/footer_link.jsp" %>
    
<script type="text/javascript">
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
	<% for (int i = 0; i < cartList.size(); i++) {
		Asset asset = cartList.get(i).getAsset(); %>
		getImgList( <%= asset.getAsset_id() %>, "<%= asset.getThumbnail().getAsset_img_url() %>");
	<% } %>
</script>
    
</body>

</html>