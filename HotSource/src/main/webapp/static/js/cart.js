// 선택된 체크박스 개수 세서 텍스트 변경
function countChecked(){
	let count = $(".cart-check:checked").length;
	$("#selectedCount").text(count);
}

function calculateTotals(){
	let total = 0;
	let subtotal = 0;
	
	$(".cart-check:checked").each(function(){
		//$ Jquery 객체임을 표시 (jquery 객체는 js dom api와 jquery 특화 메서드를 모두 사용 가능 )
		$row = $(this).closest("tr");
		
		//정가 
		origin = parseInt($row.find(".original-price").text().replace(/[$,]/g, "").trim());
		subtotal += origin;
		
		//할인 적용된 최종 가격 
		total += (
				$row.find(".sale-price").is(":visible") 
				? parseInt($row.find(".sale-price").text().replace(/[$,]/g, "").trim())
				: origin
			);
	});
	
	 $(".cart__total__procced li:contains('Subtotal') span").text(subtotal);
	 $(".cart__total__procced li:contains('Total') span").text(total);
}

function removeFromCart(bt){
	const cartId = $(bt).closest(".cart-item-wrapper").find(".cart-id").val();
	console.log(cartId);
	
	$.ajax({
		url:"/main/cart/delete",
		type:"post",
		data: { cart_id : cartId },
		success: function(result, status, xhr){
			$(bt).closest("tr").remove();
			countChecked();
		},
		error: function(xhr, status, err){
			alert("장바구니 아이템 한 건 삭제 실패");
		}
	})
}

function removeSelectedFromCart(){
	let cart_ids = [];
	
	$(".cart-check:checked").each(function(){
		let cartId = $(this).closest(".cart-item-wrapper").find(".cart-id").val();
		cart_ids.push(cartId);
	});
	
	$.ajax({
		url: "/main/cart/deleteSelected",
		type: "post",
		traditional: true,   //폼 방식으로 전송 시, 스프링에서 List로 자동 매핑 가능하게 해줌 
		data : {
			cart_ids :cart_ids
		},
		success: function(result, status, xhr){
			$(".cart-check:checked").each(function(){
				$(this).closest("tr").remove();
				console.log("A");
			});
			console.log("B");
			countChecked();
		},
		error: function(xhr, status, err){
			alert("장바구니 아이템 여러 건 삭제 실패");
		}
	});
}

$(()=>{
	
	calculateTotals();

	//전체 체크박스 클릭시 전체 선택/해제  
	$(".cart-header-check").change(function(){
		const isChecked = $(this).is(":checked");
		$(".cart-check").prop("checked", isChecked);
		countChecked();
	});
	
	//개별 체크박스 change 이벤트
	$(".cart-check").change(function(){
		const total = $(".cart-check").length;   //총 체크박스 개수 
		const checked = $(".cart-check:checked").length;  //선택된 체크박스 개수
		
		// 개별 체크박스가 변경될 때 → 전체 선택 상태도 맞춰주기
		$(".cart-header-check").prop("checked", total === checked);
		countChecked();
		calculateTotals();
	});
	
	//한 건 삭제 이벤트
	$(".bt_delete").click(function(){
		removeFromCart(this);
	});
	
	//여러 건 삭제
	$("#bt_delete_selected").click(function(){
		if($(".cart-check:checked").length < 1) {
			alert("선택한 항목이 없습니다!");
			return;
		} else {
			removeSelectedFromCart();
		}
	});
	
});



