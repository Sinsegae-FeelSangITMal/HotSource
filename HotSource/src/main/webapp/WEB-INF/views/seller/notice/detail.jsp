<%@page import="hotsource.domain.Notice"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Notice notice = (Notice) request.getAttribute("notice");
%>
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
  <!-- /.navbar -->

  <!-- Main Sidebar Container -->
	<%@ include file="../inc/left_bar.jsp" %>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    
    <!-- Content Header (Page header) -->
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0">(판매자) 공지글 확인</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">공지글 관리 > 공지글 확인</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->

	<div class="row justify-content-center"> <!-- 여기만 추가 -->
	 <!-- /.col -->
          <div class="col-md-9">
            <div class="card card-primary card-outline">
              <form action="/action_page.php">
              <div class="card-header">
                <h3 class="card-title"><%= notice.getNotice_id() %>번째 공지글 </h3>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <div class="form-group">
                  <input class="form-control" name="title" value="<%= notice.getTitle()%>">
                </div>
                <div class="form-group">
                    <textarea id="compose-textarea" name="content" class="form-control" style="height: 300px">
                    	<%= notice.getContent() %>
                    </textarea>
                </div>
                <div class="form-group">
                  <div class="btn btn-default btn-file">
                    <i class="fas fa-paperclip"></i> Attachment
                    <input type="file" name="attachment">
                  </div>
                  <p class="help-block">Max. 32MB</p>
                </div>
              </div>
              <!-- /.card-body -->
              <div class="card-footer">
				  <div class="float-right">
				    <button type="button" class="btn btn-primary">
				      <i class="far fa-envelope"></i> 변경
				    </button>
				  </div>
				  <button type="reset" class="btn btn-default">
				    <i class="fas fa-times"></i> List
				  </button>
				</div>
              </form>
              <!-- /.card-footer -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
   	</div>
  </div>
  <!-- /.content-wrapper -->
	<%@ include file="../inc/footer.jsp" %>

  <!-- Control Sidebar -->
	<%//@ include file="../inc/right_bar.jsp" %>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->
	<%@ include file="../inc/footer_link.jsp" %>
	
<script type="text/javascript">
$(()=>{
    $('#compose-textarea').summernote({
    	height: 280
    })
    
    $("button.btn-primary").click(()=>{
        $("form").attr({
            action:"/seller/notice/regist",
            method:"POST"
        });
        $("form").submit(); 
    });
    
    $("button.btn-default").click(()=>{
    	$(location).attr("href", "/seller/notice/list");
    })
});

</script>\\
</body>
</html>