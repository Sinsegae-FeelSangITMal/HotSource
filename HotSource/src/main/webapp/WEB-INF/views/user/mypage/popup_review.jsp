<%@page import="hotsource.domain.Ordered"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<!-- 리뷰 작성 팝업 -->
<div id="reviewPopup" class="popup-overlay" style="display: none;">
  <div class="popup">
    <h2>Write a Review</h2>
    <div class="review-header">
      <img id="popupThumb" src="" alt="Asset thumbnail" class="thumb">
      <div class="review-info">
        <div class="date" id="popupOrderDate"></div>
        <div class="title" id="popupAssetTitle"></div>
        <div class="user" id="popupSellerName"></div>
      </div>
    </div>

	<h5>Share Your Experience!</h5>
	<div class="btn-wrapper">
		<a href="#" class="review-btn recommend" data-recommend="0">Disrecommend</a>
		<a href="#" class="review-btn recommend active" data-recommend="1">Recommend</a>
	</div>

	<!-- 별점 -->
	<div class="review-rating">
	    <span class="review-rating-result"></span>
	    <div id="star-container">
		    <i class="review-rating-star far fa-star"></i>
		    <i class="review-rating-star far fa-star"></i>
		    <i class="review-rating-star far fa-star"></i>
		    <i class="review-rating-star far fa-star"></i>
		    <i class="review-rating-star far fa-star"></i>
	    </div>
	</div>
					
    <textarea id="comment" class="review-comment" placeholder="Please describe your experience in terms of quality, design, composition, etc."></textarea>

	<div class="btn-wrapper">
		<a class="review-btn" href="#" onclick="closeReviewPopup()">Cancel</a>
		<a id="saveBtn" class="review-btn save" href="javascript:void(0)">Save</a>
	</div>
  </div>
</div>


<script type="text/javascript">

// 별점 이벤트
let selectedRating = 0.5;

// 별점 변수들 초기화
const starContainer = document.getElementById("star-container");
const stars = [...starContainer.getElementsByClassName("review-rating-star")];
const ratingResult = document.querySelector(".review-rating-result");

function renderStars(rating) {
	stars.forEach((star, i) => {
		const starIndex = i + 1;
		if (rating >= starIndex) {
			star.className = "review-rating-star fas fa-star";
		} else if (rating >= starIndex - 0.5) {
			star.className = "review-rating-star fas fa-star-half-alt";
		} else {
			star.className = "review-rating-star far fa-star";
		}
	});
	//ratingResult.textContent = `${rating.toFixed(1)}/5.0`;
}
	
starContainer.addEventListener("click", (e) => {
	const rect = starContainer.getBoundingClientRect();
	const offsetX = e.clientX - rect.left;
	const totalWidth = rect.width;
	const percent = offsetX / totalWidth;
	selectedRating = Math.ceil(percent * 10) / 2;  // 0.5 단위 반올림
	if (selectedRating < 0.5) selectedRating = 0.5;
	renderStars(selectedRating);
	console.log("별점 선택됨:", selectedRating);
});

document.addEventListener("DOMContentLoaded", () => {
	// 추천 버튼 이벤트
	const recommendButtons = document.querySelectorAll(".recommend");
	
	recommendButtons.forEach(btn => {
	    btn.addEventListener("click", (e) => {
			e.preventDefault(); // 기본 이벤트 막기
			
			recommendButtons.forEach(b => b.classList.remove("active"));
			btn.classList.add("active");
			
			isRec = btn.getAttribute("data-recommend");
			console.log("isRec:", isRec); // 확인용 로그
		});	
	});
	
	$(document).on("click", "#saveBtn", function(e) {
		e.preventDefault();
	    regist(e);
	});

});

function regist(e) {
    if (selectedRating < 0.5) {
        alert("별점을 선택해주세요");
        return;
    }
	if (!confirm('리뷰를 등록하시겠습니까?')) return;

	// 전송할 데이터 쌓기
	const formData = new FormData();
	formData.append("recommend", isRec);
	formData.append("comment", document.getElementById("comment").value);
	formData.append("rating", selectedRating);
	formData.append("asset_id", selectedAssetId);
	formData.append("orderAsset_id", selectedOrderAssetId);

	$.ajax({
		type: "post",
		url: "/main/user/mypage/review/regist",  // 실제 리뷰 등록 처리 URL로 수정
		data: formData,
		processData: false,
		contentType: false,
		success: function(result) {
			if (result === "success") {
				alert("리뷰가 등록되었습니다");
				location.reload();
			} else
				alert("리뷰 등록에 실패했습니다");
		},
		error: function(xhr, status, err) {
			console.error("에러: ", err);
			alert("오류가 발생했습니다\n다시 시도해주세요");
		}
	});
}

</script>