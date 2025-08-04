/**
 * 
 */

function addToCart(btn){
	const assetId = $(btn).closest(".cart-wish-wrapper").data("asset-id");
	const cartTextSpan = $(btn).find("span");
	$.ajax({
		url: "/main/cart/regist",
		type: "post",
		data: { "asset_id" : assetId },
		success: function(result, status, xhr){
			//장바구니 버튼 바꾸고
			$(btn).attr("data-is-in-cart", "true");   // DOM 속성 변경
			$(btn).data("is-in-cart", true);          // jQuery 캐시도 동기화
			cartTextSpan.text("장바구니 이동");
			showToast("장바구니에 담았습니다.");
		},
		error: function(xhr, status, err){
			console.log(err);
		}
	});
}

function showToast(msg){
		const toast = document.getElementById("toast");
	    toast.textContent = msg;
	    toast.style.visibility = "visible";
	    toast.style.opacity = "1";
	    
	    setTimeout(() => {
	        toast.style.opacity = "0";
	        toast.style.visibility = "hidden";
	    }, 2000);
	}

$(".cart-btn").click(function(){
	const isCart = $(this).data("is-in-cart");
	
	
	if(isCart){
		location.href = "/main/cart";
	} else {
		addToCart(this);
	}
});

$(".wish-btn").click(function(){
	const isWished = $(this).data("is-wished");
	
	if(isWished){
		showToast("이미 찜한 상품입니다!");
	} else {
		
		//addToWishlist(this);
	}
});


$(".remove-btn").click(function(){
	const assetId = $(this).data("asset-id");
	const wishlistId = $(this).data("wishlist-id"); 
	const btn = $(this);
	$.ajax({
		url: "/main/wishlist/item/delete",
		type: "post",
		data: {
			"asset_id" : assetId,
			"wishlist_id" : wishlistId
		},
		success: function(result, status, xhr){
			//location.reload();
			btn.closest(".product-card").remove();
			showToast("목록에서 삭제되었습니다.");
		},
		error: function(xhr, status, err){
			console.log(err);
		}
	})
});
