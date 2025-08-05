<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Dashboard</title>
  <%@ include file="../inc/head_link.jsp" %>
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

  <!-- Preloader -->
  <div class="preloader flex-column justify-content-center align-items-center">
    <img class="animation__shake" src="/static/admin/dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
  </div>

  <!-- Navbar -->
  <%@ include file="../inc/navbar.jsp" %>

  <!-- Main Sidebar Container -->
  <%@ include file="../inc/left_bar.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">(판매자) 공지글 작성</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">공지글 관리 > 공지글 작성</li>
            </ol>
          </div>
        </div>
      </div>
    </div>

    <!-- Form Section -->
    <div class="row justify-content-center">
      <div class="col-md-9">
        <div class="card card-primary card-outline">
          <form action="/seller/notice/regist" method="POST" enctype="multipart/form-data">
            <div class="card-header">
              <h3 class="card-title">공지글 작성폼</h3>
            </div>

            <div class="card-body">
              <div class="form-group">
                <input class="form-control" name="title" placeholder="제목을 입력해주세요" required>
              </div>

              <div class="form-group">
                <textarea id="compose-textarea" name="content" class="form-control" style="height: 300px"></textarea>
              </div>

              <div class="form-group">
                <div class="btn btn-default btn-file">
                  <i class="fas fa-paperclip"></i> 이미지 업로드
              	<input type="file" name="notice_profile">
                </div>
                <p class="help-block">Max. 32MB</p>
              </div>
            </div>

            <div class="card-footer">
              <div class="float-right">
                <button type="submit" class="btn btn-primary">
                  <i class="far fa-envelope"></i> 등록
                </button>
              </div>
              <button type="button" class="btn btn-default" id="btn-cancel">
                <i class="fas fa-times"></i> 취소
              </button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>

  <%@ include file="../inc/footer.jsp" %>
</div>
<%@ include file="../inc/footer_link.jsp" %>

<script type="text/javascript">
  $(() => {
    $('#compose-textarea').summernote({
      height: 280
    });

    $('#btn-cancel').click(() => {
      location.href = "/seller/notice/list";
    });
  });
</script>
</body>
</html>
