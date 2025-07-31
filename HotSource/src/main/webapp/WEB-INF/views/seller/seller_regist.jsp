<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>판매자 등록</title>
  <%@ include file="./inc/head_link.jsp" %>
  <style>
    body {
      background-color: #f6f9fc;
    }
    .form-wrapper {
      max-width: 700px;
      margin: 60px auto;
    }
    .card {
      background: white;
      border: 1px solid #e0e0e0;
      border-radius: 10px;
      padding: 40px;
      box-shadow: 0 4px 12px rgba(0, 0, 0, 0.04);
    }
    .form-control {
      border-radius: 6px;
      padding: 12px 14px;
      border: 1px solid #ccc;
      font-size: 15px;
    }
    .form-label {
      font-weight: 600;
      margin-bottom: 6px;
      display: block;
    }
    .btn-submit {
      background-color: #c8102e;
      color: white;
      border: none;
      padding: 12px 20px;
      font-weight: bold;
      border-radius: 6px;
      width: 100%;
      transition: background-color 0.2s ease;
    }
    .btn-submit:hover {
      background-color: #a10d25;
    }
  </style>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Navbar -->
  <%@ include file="./inc/navbar.jsp" %>

  <!-- Sidebar -->
  <%@ include file="./inc/left_bar.jsp" %>

  <!-- Content Wrapper -->
  <div class="content-wrapper">
    <section class="content">
      <div class="form-wrapper">
        <div class="card">
          <h3 class="text-center mb-4">판매자 등록</h3>
			<form id="formCreate" enctype="multipart/form-data" method="post" action="/seller/sellerCreate">
		  <div class="mb-3">
		    <label for="seller_name" class="form-label">이름 (name)</label>
		    <input type="text" class="form-control" id="seller_name" name="seller_name" required />
		  </div>
		
		  <div class="mb-3">
		    <label for="seller_nickname" class="form-label">닉네임 (nickname)</label>
		    <input type="text" class="form-control" id="seller_nickname" name="seller_nickname" required />
		  </div>
		
		  <div class="mb-3">
		    <label for="seller_bio" class="form-label">판매자 소개 (bio)</label>
		    <textarea class="form-control" id="seller_bio" name="seller_bio" rows="4" required></textarea>
		  </div>
		
		  <div class="form-group">
		    <label for="profile_img_url">프로필 이미지</label>
		    <input type="file" id="seller_profile" name="seller_profile" accept="image/*" />
		  </div>
		
		  <div class="mb-3">
		    <label for="seller_insta_url" class="form-label">인스타그램 URL</label>
		    <input type="url" class="form-control" id="seller_insta_url" name="seller_insta_url" />
		  </div>
		
		  <div class="mb-3">
		    <label for="seller_email" class="form-label">판매자 이메일</label>
		    <input type="email" class="form-control" id="seller_email" name="seller_email" required />
		  </div>
		
		  <div class="mb-3">
		    <label for="bank_name" class="form-label">은행명</label>
		    <input type="text" class="form-control" id="bank_name" name="bank_name" required />
		  </div>
		
		  <div class="mb-4">
		    <label for="account_number" class="form-label">계좌번호</label>
		    <input type="text" class="form-control" id="account_number" name="account_number" required />
		  </div>
		
		  <button type="submit" class="btn btn-submit">판매자 등록하기</button>
		</form>

        </div>
      </div>
    </section>
  </div>

  <!-- Footer -->
  <%@ include file="./inc/footer.jsp" %>
</div>

<%@ include file="./inc/footer_link.jsp" %>
<script type="text/javascript">
	$(() => {
	  $("#formCreate").on("submit", function (e) {
	    // 유효성 체크 등 가능
	  });

	  $(".btn-submit").click(() => {
	    $("#formCreate").submit();
	  });
	});
</script>
</body>
</html>
