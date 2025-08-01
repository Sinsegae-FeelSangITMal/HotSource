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
	titleLengthDisplay.textContent = `${currentLen}/${maxLen}`;

	checkForm(); // 기존 저장 버튼 활성화 여부 확인
});
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


document.querySelectorAll("img.thumb").forEach(img => {
	    const assetId = img.dataset.assetId;
	    const filename = img.dataset.filename;
	    getImgList(assetId, filename);
});

