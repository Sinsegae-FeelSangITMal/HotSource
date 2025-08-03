<%@page import="hotsource.domain.Asset"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
  Asset asset = (Asset) request.getAttribute("asset");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>에셋 수정</title>
  <%@ include file="../inc/head_link.jsp" %>
  <style>
    /* 동일한 스타일 그대로 재사용 */
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
                <option value="">Select discount</option>
                <option value="0" <%= asset.getSale() != null && asset.getSale().getSale_value() == 0 ? "selected" : "" %>>No Sale</option>
                <option value="10" <%= asset.getSale() != null && asset.getSale().getSale_value() == 10 ? "selected" : "" %>>10%</option>
                <option value="20" <%= asset.getSale() != null && asset.getSale().getSale_value() == 20 ? "selected" : "" %>>20%</option>
                <option value="30" <%= asset.getSale() != null && asset.getSale().getSale_value() == 30 ? "selected" : "" %>>30%</option>
              </select>
            </div>

            <div class="form-section">
              <label for="keywords">Keywords</label>
              <input type="text" id="keywords" name="keywords" class="form-control" placeholder="Enter keywords (comma-separated)" value="<%= asset.getKeywordList() %>" />
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
                <div class="input-group-append">
                  <span class="input-group-text">Upload</span>
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
		type :"get",
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
  // 동일한 getTopCategory, getSubCategory 등 유지
  // 단, 기존 선택값 반영 필요

  function updateAsset() {
    const formData = new FormData(document.getElementById("form1"));
    formData.delete("photo");

    for(let i=0;i<selectedFile.length;i++){
      formData.append("photo", selectedFile[i]);
    }

    $.ajax({
      url: "/main/asset/update",
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

  $(function() {
    getTopCategory();
    $("#topcategory").change(function() {
      getSubCategory($(this).val());
    });

    if (<%= asset.getSubCategory() != null %>) {
   		getSubCategory(<%= asset.getSubCategory().getTopcategory().getTopcategory_id() %>);
      	setTimeout(() => {
        $("#subcategory").val(<%= asset.getSubCategory().getSubcategory_id() %>);
      }, 200); // 약간의 지연 필요할 수 있음
    }

    $("input[name='isPaid']").change(function() {
      const isPaid = $(this).val() === "true";
      $("input[name='price']").prop("disabled", !isPaid);
    });

    $("#bt_update").click(() => {
      updateAsset();
    });
  });
</script>
</body>
</html>
