/**
 * 
 */

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

function checkForm() {
	if (titleInput.value.trim() !== "") {
	    saveBtn.disabled = false;
	    saveBtn.classList.add("enabled");
	} else {
	    saveBtn.disabled = true;
	    saveBtn.classList.remove("enabled");
	}
}

const modal = document.getElementById("modalOverlay");
const cancelBtn = document.getElementById("cancelBtn");
const saveBtn = document.getElementById("saveBtn");
const titleInput = document.getElementById("listTitle");
const descInput = document.getElementById("listDesc");


// 입력 검사
titleInput.addEventListener("input", checkForm);

const titleLengthDisplay = document.getElementById("titleLength");

titleInput.addEventListener("input", () => {
	const maxLen = 60;
	const currentLen = titleInput.value.length;

	// 실시간 길이 표시
	titleLengthDisplay.textContent = currentLen + "/" + maxLen;

	checkForm(); // 기존 저장 버튼 활성화 여부 확인
});



// 취소
cancelBtn.addEventListener("click", () => {
  modal.style.display = "none";
});

//저장
$("#saveBtn").click(function(){
	createWishlist();
});