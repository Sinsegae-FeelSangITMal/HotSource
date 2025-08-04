<%@page import="hotsource.domain.Asset"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
	Asset asset = (Asset) request.getAttribute("asset");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>에셋 등록</title>
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
      width: 100%;
      transition: background-color 0.2s ease;
      font-size: 16px;
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

          <!-- 왼쪽 폼 영역 -->
          <div class="left-form">
            <h2>Create Asset</h2>

            <div class="form-section">
              <label for="title">Title</label>
              <input type="text" id="title" name="title" class="form-control" />
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
                <label><input type="radio" name="isPaid" value="true" /> Paid asset</label>
                <label><input type="radio" name="isPaid" value="false" checked /> Free asset</label>
              </div>
              <input type="number" name="price" class="form-control mt-2" placeholder="$ price (유료인 경우만)" />
            </div>

            <div class="form-section">
              <label for="sale">Sale</label>
              <select id="sale" name="sale.sale_value" class="form-control">
                <option value="">Select discount</option>
                <option value="0">No Sale</option>
                <option value="10">10%</option>
                <option value="20">20%</option>
                <option value="30">30%</option>
              </select>
            </div>

            
             <div class="form-section">
              <label for="keywords">Keywords</label>
              <input type="text" id="keywords" name="keywords" class="form-control"
                     placeholder="Enter keywords (comma-separated)" />
              <small class="form-note">최대 15개까지 입력 가능</small>
            </div>
            
            <div class="form-section">
              <label for="summary">Summary</label>
              <input type="text" id="summary" name="summary" class="form-control"
                     placeholder="summary" />
            </div>

            <div class="form-section">
			  <label for="uploadFiles">Asset Uploads</label>
			
			  <div id="dropZone" class="drop-zone">
			    이곳에 파일을 드래그하거나 클릭하여 업로드하세요<br />
			    <small class="form-note">최대 1GB. 압축 권장</small>
			  </div>
			
			  <input type="file" name="uploadFiles" id="uploadFiles" multiple class="hidden-file" />
			</div>


            <div class="form-section">
              <label for="description">Description</label>
              <textarea id="description" name="description" class="form-control"
                        placeholder="summary&#10;&#10;description&#10;&#10;#desc #desc #desc"></textarea>
            </div>

            <button type="button" class="btn-submit" id="bt_regist">Create new Asset</button>
          </div>

          <!-- 오른쪽 이미지 미리보기 영역 -->
          <div class="right-preview">
     	     <div class="form-section">
              <label for="youtube_url">youtubeUrl</label>
              <input type="text" id="youtube_url" name="youtube_url" class="form-control"
                     placeholder="youtube_url" />
            </div>
             <div class="preview-box">
               <div class="input-group">
               
                 <div class="custom-file">                      
                   <input type="file" class="custom-file-input" name="photo" id="photo" multiple="multiple">
                   <label class="custom-file-label" for="exampleInputFile">에셋 이미지 선택 </label>
                 </div>
                 
                 <div class="input-group-append">
                   <span class="input-group-text">Upload</span>
                 </div>
               </div>
               
               <div id="preview" style="width:100%;">
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
	function printCategory(obj, list){
		let tag="<option value='0'>카테고리 선택</option>";
		
		for(let i=0;i<list.length;i++){
			if(obj=="#topcategory"){
				tag+="<option value='"+list[i].topcategory_id+"'>"+list[i].top_name+"</option>";
			}else if(obj=="#subcategory"){
				tag+="<option value='"+list[i].subcategory_id+"'>"+list[i].sub_name+"</option>";
			}
		}
		
		$(obj).html(tag);  // innerHTML=태그 동일
	}
	
	function getTopCategory(){
		$.ajax({
			url:"/main/asset/topcategory/list",
			type:"get",
			success:function(result, status, xhr){ //200번대의 성공 응답 시, 이 함수 실행
				console.log("서버로부터 받은 결과는 ", result);
				//화면에 출력하기 
				printCategory("#topcategory",result);
			},
			error:function(xhr, status, err){
			}
		});
	}
	
	 function getSubCategory(topcategory_id){
		$.ajax({
			url :"/main/asset/subcategory/list?topcategory_id="+topcategory_id,
			type:"get",
			success:function(result, status, xhr){
				console.log(result);
				printCategory("#subcategory",result);
			}
		});
	} 
	 
	let selectedFile=[];
	
	function regist(){
		//기존 폼을 이용하되, file 컴포넌트 파라미터만 새로 교체(selectedFile 배열로 대체)
		//js에서 프로그래밍 적 form 생성 
		let formData = new FormData(document.getElementById("form1"));
		
		//formData 동기/비동기 둘다 지원하지만, 대부분은 비동기방식을 많이 씀 
		//Jquery Ajax 자체에서 formData 를 비동기방식으로 간단하게 사용할 수 있는 코드를 지원 
		//기존 photo 버리고, 우리가 선언한 배열로 대체 
		//formData.append("email", "zino11198@naver.com"); // <input type="text" name="email">
		//formData는 개발자가 명시하지 않아도, 디폴트로 multipart/form-data 가 지정되어 잇음
		
		formData.delete("photo");//기존의 photo 파라미터 제거하기 append의 반대
		
		for(let i=0;i<selectedFile.length;i++){
			formData.append("photo", selectedFile[i]); 
		}
		
		//파일마저도 비동기로 업로드 가능!!!
		$.ajax({
			url:"/main/asset/regist",
			type:"post",
			data:formData,
			processData:false, /*form 이루는 대상으로 , 문자열로 변환되는 것을 방지(바이너리 파일포함때문)*/
			contentType:false, /*브라우저가 자동으로 content-type 을 설정하도록 하는 것 방지*/
			success:function(result, status, xhr){
				if(result.status === "success") {
		            alert("업로드 성공");
		            window.location.href = "/seller/dashboard/assetList";  // 고정 URL 이동
		        } else {
		            alert("업로드 실패");
		        }
			},
			error:function(xhr, status, err){
				alert(err);
			}
		});
	}
	 
	$(()=>{
	  	getTopCategory(); //상위 카테고리 가져오기 
	  	
	  	 $("#topcategory").change(function(){
				getSubCategory($(this).val());
		});
	  	
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
	  	 
		 //등록버튼 이벤트 연결 
		   $("#bt_regist").click(()=>{		
				regist();
		   });
	});

  const dropZone = document.getElementById("dropZone");
  const fileInput = document.getElementById("uploadFiles");

  // 클릭 시 input 열기
  dropZone.addEventListener("click", () => fileInput.click());

  // input 변경 시 텍스트 표시
  fileInput.addEventListener("change", () => {
    if (fileInput.files.length > 0) {
      dropZone.textContent = [...fileInput.files].map(f => f.name).join(", ");
    }
  });

  // 드래그 시 시각적 피드백
  dropZone.addEventListener("dragover", (e) => {
    e.preventDefault();
    dropZone.classList.add("dragover");
  });

  dropZone.addEventListener("dragleave", () => {
    dropZone.classList.remove("dragover");
  });

  // 파일 드롭 처리
  dropZone.addEventListener("drop", (e) => {
    e.preventDefault();
    dropZone.classList.remove("dragover");

    const files = e.dataTransfer.files;
    fileInput.files = files;
    dropZone.textContent = [...files].map(f => f.name).join(", ");
  });
</script>

</body>
</html>
