<%@page import="hotsource.domain.AssetKeywordMapping"%>
<%@page import="java.util.List"%>
<%@page import="hotsource.domain.AssetFile"%>
<%@page import="hotsource.domain.AssetImg"%>
<%@page import="hotsource.domain.Asset"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
  	Asset asset = (Asset) request.getAttribute("asset");
	List<AssetKeywordMapping> keywordList = asset.getKeywordList();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>에셋 수정</title>
  <%@ include file="../inc/head_link.jsp" %>
   <style>
    body {
      background-color: #f5f7fa;
      font-family: 'Segoe UI', sans-serif;
    }

    .container {
      max-width: 1000px;
      margin: 50px auto;
      display: flex;
      gap: 10px;
    }

    .left-form {
      flex: 2;
      background: #fff;
      padding: 40px 30px;
      border-radius: 12px;
      box-shadow: 0 6px 16px rgba(0, 0, 0, 0.06);
    }

    .left-form h2 {
      font-size: 24px;
      margin-bottom: 30px;
    }

    .form-section {
      margin-bottom: 24px;
    }

    .form-section label {
      font-weight: 600;
      margin-bottom: 8px;
      display: block;
    }

    .form-control {
      width: 100%;
      padding: 11px 14px;
      border: 1px solid #ccc;
      border-radius: 6px;
      font-size: 15px;
      transition: border-color 0.2s;
    }

    .form-control:focus {
      outline: none;
      border-color: #3b82f6;
    }

    select.form-control {
      background-color: #fff;
    }

     .btn-submit {
      background-color: #c8102e;
      color: white;
      padding: 14px 20px;
      border: none;
      border-radius: 6px;
      font-weight: bold;
      width: 20%;
      transition: background-color 0.2s ease;
      font-size: 10px;
      float: right;
    }

    .btn-submit:hover {
      background-color: #a10d25;
    }

    .right-preview {
      flex: 1;
      display: flex;
      flex-direction: column;
      gap: 20px;
    }

    .preview-box {
      background: white;
      padding: 20px;
      border-radius: 12px;
      box-shadow: 0 6px 16px rgba(0, 0, 0, 0.05);
    }

    .preview-box img {
      width: 100%;
      border-radius: 8px;
      margin-top: 12px;
      object-fit: cover;
    }

    textarea.form-control {
      resize: vertical;
      height: 140px;
    }

    .radio-group {
      display: flex;
      align-items: center;
      gap: 16px;
      margin-top: 10px;
    }

    .form-note {
      font-size: 13px;
      color: #888;
      margin-top: 6px;
    }
    
    .drop-zone {
	  border: 2px dashed #ccc;
	  border-radius: 8px;
	  padding: 30px;
	  text-align: center;
	  color: #666;
	  cursor: pointer;
	  transition: background-color 0.3s ease;
	  background-color: #fafafa;
	}
	
	.drop-zone.dragover {
	  background-color: #f0f8ff;
	  border-color: #3b82f6;
	  color: #333;
	}
	
	input[type="file"].hidden-file {
	  display: none;
	}
    

  </style>
</head>
<body>
<div class="wrapper">
  <%@ include file="../inc/navbar.jsp" %>
  <%@ include file="../inc/left_bar.jsp" %>

  <div class="content-wrapper">
    <section class="content">
      <form id="form1">
        <div class="container">
          <div class="left-form">
            <h2>Update Asset</h2>

            <div class="form-section">
              <label for="title">Title</label>
              <input type="text" id="title" name="title" class="form-control" value="<%= asset.getTitle() %>" />
            </div>

            <div class="form-section">
              <label for="topcategory">TopCategory</label>
              <select id="topcategory" name="topcategory" class="form-control">
              </select>
            </div>
            
            <div class="form-section">
              <label for="subcategory">SubCategory</label>
              <select id="subcategory" name="subCategory.subcategory_id" class="form-control">
              </select>
            </div>

            <div class="form-section">
              <label>Price</label>
              <div class="radio-group">
                <label><input type="radio" name="isPaid" value="true" <%= asset.getPrice() > 0 ? "checked" : "" %> /> Paid asset</label>
                <label><input type="radio" name="isPaid" value="false" <%= asset.getPrice() == 0 ? "checked" : "" %> /> Free asset</label>
              </div>
              <input type="number" name="price" class="form-control mt-2" placeholder="$ price (유료인 경우만)" value="<%= asset.getPrice() %>" <%= asset.getPrice() == 0 ? "disabled" : "" %> />
            </div>

            <div class="form-section">
              <label for="sale">Sale</label>
              <select id="sale" name="sale.sale_value" class="form-control">
                <option value="0" <%= asset.getSale() != null && asset.getSale().getSale_value() == 0 ? "selected" : "" %>>No Sale</option>
                <option value="10" <%= asset.getSale() != null && asset.getSale().getSale_value() == 10 ? "selected" : "" %>>10%</option>
                <option value="20" <%= asset.getSale() != null && asset.getSale().getSale_value() == 20 ? "selected" : "" %>>20%</option>
                <option value="30" <%= asset.getSale() != null && asset.getSale().getSale_value() == 30 ? "selected" : "" %>>30%</option>
              </select>
            </div>

            <div class="form-section">
              <label for="keywords">Keywords</label>
              	<%
				    StringBuilder keywordString = new StringBuilder();
				    if (keywordList != null) {
				        for (int i = 0; i < keywordList.size(); i++) {
				            keywordString.append(keywordList.get(i).getKeyword().getKeyword_name());
				            if (i < keywordList.size() - 1) {
				                keywordString.append(", ");
				            }
				        }
				    }
				%>
				<input type="text" id="keywords" name="keywords" class="form-control"
				       placeholder="Enter keywords (comma-separated)"
				       value="<%= keywordString.toString() %>" />
				<small class="form-note">최대 15개까지 입력 가능</small>
            </div>

            <div class="form-section">
              <label for="summary">Summary</label>
              <input type="text" id="summary" name="summary" class="form-control" value="<%= asset.getSummary() %>" />
            </div>

            <div class="form-section">
              <label for="uploadFiles">Asset Uploads</label>
              <div id="dropZone" class="drop-zone">업로드 파일 재지정 또는 변경</div>
              <input type="file" name="uploadFiles" id="uploadFiles" multiple class="hidden-file" />
            </div>

            <div class="form-section">
              <label for="description">Description</label>
              <textarea id="description" name="description" class="form-control"><%= asset.getDescription() %></textarea>
            </div>

            <input type="hidden" name="asset_id" value="<%= asset.getAsset_id() %>"/>
            <button type="button" class="btn-submit" id="bt_update">Update Asset</button>
          </div>

          <div class="right-preview">
            <div class="form-section">
              <label for="youtube_url">youtubeUrl</label>
              <input type="text" id="youtube_url" name="youtube_url" class="form-control" value="<%= asset.getYoutube_url() %>" />
            </div>

            <div class="preview-box">
              <div class="input-group">
                <div class="custom-file">
                  <input type="file" class="custom-file-input" name="photo" id="photo" multiple="multiple">
                  <label class="custom-file-label">에셋 이미지 선택</label>
                </div>
              </div>
              <div id="preview" style="width:100%;"></div>
            </div>
          </div>
        </div>
      </form>
    </section>
  </div>
</div>

<%@ include file="../inc/footer_link.jsp" %>
<script src="/static/admin/custom/ProductImg.js"></script>
<script>

let selectedFile = [];

function printCategory(obj, list, v){
	let tag="<option value='0'>카테고리 선택</option>";
	
	for(let i=0;i<list.length;i++){
		if(obj=="#topcategory"){
			tag+="<option value='"+list[i].topcategory_id+"'>"+list[i].top_name+"</option>";
		}else if(obj=="#subcategory"){
			tag+="<option value='"+list[i].subcategory_id+"'>"+list[i].sub_name+"</option>";
		}
	}
	
	$(obj).html(tag);  // innerHTML=태그 동일
	
	$(obj).val(v);
}

function getTopCategory(v){
	$.ajax({
		url:"/main/asset/topcategory/list",
		type :"get",
		success:function(result, status, xhr){ //200번대의 성공 응답 시, 이 함수 실행
			console.log("서버로부터 받은 결과는 ", result);
			//화면에 출력하기 
			printCategory("#topcategory",result,v);
		},
		error:function(xhr, status, err){
		}
	});
}

 function getSubCategory(topcategory_id, v){
	$.ajax({
		url : "/main/asset/subcategory/list?topcategory_id="+topcategory_id,
		type:"get",
		success:function(result, status, xhr){
			console.log(result);
			printCategory("#subcategory",result,v);
		}
	});
} 
  // 동일한 getTopCategory, getSubCategory 등 유지
  // 단, 기존 선택값 반영 필요

  function updateAsset() {
    const formData = new FormData(document.getElementById("form1"));
    formData.delete("photo");

    for(let i=0;i<selectedFile.length;i++){
      formData.append("photo", selectedFile[i]);
    }

    $.ajax({
      url: "/seller/dashboard/asset/update",
      type: "post",
      data: formData,
      processData: false,
      contentType: false,
      success: function(result) {
        if(result.status === "success") {
          alert("수정 완료");
          location.href = "/seller/dashboard/assetList?seller_id=<%= asset.getSeller().getSeller_id() %>";
        } else {
          alert("수정 실패");
        }
      },
      error: function(xhr, status, err) {
        alert(err);
      }
    });
  }
  
  function handleFiles(files) {
	  for (let i = 0; i < files.length; i++) {
	    const file = files[i];

	    // 이미 동일한 이름의 파일이 있는지 확인 (중복 방지)
	    if (selectedFile.some(f => f.name === file.name)) continue;

	    selectedFile.push(file);

	    const fileEntry = document.createElement("div");
	    fileEntry.classList.add("uploaded-file-name");
	    fileEntry.style.display = "flex";
	    fileEntry.style.justifyContent = "space-between";
	    fileEntry.style.alignItems = "center";
	    fileEntry.style.marginBottom = "5px";

	    const fileNameSpan = document.createElement("span");
	    fileNameSpan.textContent = file.name;

	    const deleteBtn = document.createElement("button");
	    deleteBtn.type = "button";
	    deleteBtn.textContent = "❌";
	    deleteBtn.style.marginLeft = "10px";
	    deleteBtn.style.border = "none";
	    deleteBtn.style.background = "none";
	    deleteBtn.style.cursor = "pointer";
	    deleteBtn.style.color = "red";

	    deleteBtn.onclick = function () {
	      selectedFile = selectedFile.filter(f => f.name !== file.name);
	      fileEntry.remove();
	    };

	    fileEntry.appendChild(fileNameSpan);
	    fileEntry.appendChild(deleteBtn);
	    document.getElementById("dropZone").appendChild(fileEntry);
	  }
	}

//비동기 방식으로, 서버의 이미지를 다운로드 받기 
function getImgList(dir, filename, type){
  console.log("넘겨받은 파일명은 ", dir, "/", filename);
  $.ajax({
    url: "/data/" + dir + "/" + filename,
    type: "GET",
    xhr: function () {
      const xhr = new XMLHttpRequest();
      xhr.responseType = "blob"; // blob 형태로 받음
      return xhr;
    },
    success: function (result, status, xhr) {
      console.log("서버로부터 받은 바이너리 정보는 ", result);
      const file = new File([result], filename, { type: result.type });
      selectedFile.push(file);

      const reader = new FileReader();
      reader.onload = function (e) {
        console.log("읽어들인 정보 ", e);
        if (type === "img") {
          // 이미지일 경우 썸네일 생성
          new ProductImg(document.getElementById("preview"), file, e.target.result, 100, 100);
        } else if (type === "file") {
        	  // 일반 파일일 경우 파일명 + 삭제 버튼 추가
        	  const fileEntry = document.createElement("div");
        	  fileEntry.classList.add("uploaded-file-name");
        	  fileEntry.style.display = "flex";
        	  fileEntry.style.justifyContent = "space-between";
        	  fileEntry.style.alignItems = "center";
        	  fileEntry.style.marginBottom = "5px";

        	  const fileNameSpan = document.createElement("span");
        	  fileNameSpan.textContent = filename;

        	  const deleteBtn = document.createElement("button");
        	  deleteBtn.type = "button";
        	  deleteBtn.textContent = "❌";
        	  deleteBtn.style.marginLeft = "10px";
        	  deleteBtn.style.border = "none";
        	  deleteBtn.style.background = "none";
        	  deleteBtn.style.cursor = "pointer";
        	  deleteBtn.style.color = "red";
        	  
        	  deleteBtn.onclick = function () {
        	    // selectedFile 배열에서 해당 파일 제거
        	    selectedFile = selectedFile.filter(f => f.name !== filename);
        	    fileEntry.remove();
        	  };

        	  fileEntry.appendChild(fileNameSpan);
        	  fileEntry.appendChild(deleteBtn);
        	  document.getElementById("dropZone").appendChild(fileEntry);
        	}

      };
      reader.readAsDataURL(file);
    }
  });
}


  $(function() {
	 getTopCategory(<%= asset.getSubCategory().getTopcategory().getTopcategory_id() %>);
    getSubCategory(<%= asset.getSubCategory().getTopcategory().getTopcategory_id() %>, <%= asset.getSubCategory().getSubcategory_id()%>);
    
    $("#topcategory").change(function() {
      getSubCategory($(this).val());
    });

    if (<%= asset.getSubCategory() != null %>) {
   		getSubCategory(<%= asset.getSubCategory().getTopcategory().getTopcategory_id() %>);
      	setTimeout(() => {
        $("#subcategory").val(<%= asset.getSubCategory().getSubcategory_id() %>);
      }, 200); // 약간의 지연 필요할 수 있음
    }
    //현재 우리가 가진 정보는,filename밖에 없으므로 실제 이미지를 onLoad 시점에 서버로 부터 다운로드 받자
  <%-- 이미지 파일 목록 --%>
	<% for (AssetImg assetImg : asset.getImgList()) { %>
	  getImgList("asset_img/<%= asset.getAsset_id() %>", "<%= assetImg.getAsset_img_url() %>", "img");
	<% } %>
	
	<%-- 일반 파일 목록 --%>
	<% for (AssetFile assetfile : asset.getFileList()) { %>
	  getImgList("asset/<%= asset.getAsset_id() %>", "<%= assetfile.getFile_url() %>", "file");
	<% } %>

	//파일 컴포넌트의 값 변경 시 이벤트 연결 
	   $("#photo").change(function(e){
			console.log(e);
			//e.target.files 안에는 브라우저가 읽어들인, 파일의 정보가 배열유사 객체인 FileList에 담겨져 있다.
			
			let files=e.target.files;//배열 유사 객체 얻기
			
			//첨부된 파일 수 만큼 반복
			for(let i=0;i<files.length;i++){
				selectedFile[i]=files[i]; //읽기 전용에 들어있었던 각 file들을,우리만의 배열로 옮기자 
				
				//파일을 읽기위한 스트림 객체 생성 
				const reader = new FileReader();
				
				reader.onload=function(e){ //파일을 스트림으로 읽어들인 정보가 e에 들어있음 
					console.log("읽은 결과 ", e);		
					
					//개발자 정의 클래스 인스턴스 생성 container, src, width, height 
					let productImg = new ProductImg(document.getElementById("preview"), files[i], e.target.result, 100,100);
				}				
				reader.readAsDataURL(files[i]); //지정한 파일을 읽기
			}
	   });

    $("input[name='isPaid']").change(function() {
      const isPaid = $(this).val() === "true";
      $("input[name='price']").prop("disabled", !isPaid);
    });

    $("#bt_update").click(() => {
      updateAsset();
    });
  });
  
  const dropZone = document.getElementById("dropZone");
  const hiddenFileInput = document.getElementById("uploadFiles");

  // 드롭 시 파일 처리
  dropZone.addEventListener("drop", function(e) {
    e.preventDefault();
    dropZone.classList.remove("dragover");

    const files = e.dataTransfer.files;
    handleFiles(files);
  });

  // 드래그 상태 UI
  dropZone.addEventListener("dragover", function(e) {
    e.preventDefault();
    dropZone.classList.add("dragover");
  });

  dropZone.addEventListener("dragleave", function(e) {
    e.preventDefault();
    dropZone.classList.remove("dragover");
  });

  // 클릭으로 파일 선택
  dropZone.addEventListener("click", function() {
    hiddenFileInput.click();
  });

  hiddenFileInput.addEventListener("change", function() {
    const files = this.files;
    handleFiles(files);
  });
  
  const isPaidRadios = document.querySelectorAll("input[name='isPaid']");
  const priceInput = document.querySelector("input[name='price']");
  const saleSelect = document.getElementById("sale");

  isPaidRadios.forEach(radio => {
    radio.addEventListener("change", () => {
      if (radio.value === "true" && radio.checked) {
        priceInput.disabled = false;
        saleSelect.disabled = false;
      } else if (radio.value === "false" && radio.checked) {
        priceInput.disabled = true;
        priceInput.value = ""; // 가격 초기화

        saleSelect.value = "0"; // "No Sale"로 선택
        saleSelect.disabled = true; // 선택 비활성화
      }
    });
  });

</script>
</body>
</html>
