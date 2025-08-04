<%@page import="hotsource.util.Paging"%>
<%@page import="hotsource.domain.Notice"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	List<Notice> noticeList = (List) request.getAttribute("noticeList");
	Paging paging = (Paging) request.getAttribute("paging");
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Notice</title>
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
            <h1 class="m-0">Notice List</h1>
          </div><!-- /.col -->
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Notice > List</li>
            </ol>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>
    <!-- /.content-header -->


    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
      
          <!-- 상품 목록 시작 -->
         	 <div class="dashboard-container">
        <div class="dashboard-header">Creator Dashboard</div>

        <div class="dashboard-stats">
            <div>
                <strong>0</strong><br>Views
            </div>
            <div>
                <strong>0</strong><br>Downloads
            </div>
            <div>
                <strong>0</strong><br>Followers
            </div>
        </div>

        <div class="dashboard-tabs">
            <div class="active">Projects</div>
            <div>Analytics</div>
            <div>Earnings</div>
        </div>

        <div class="tips">
            <strong>HotSource tips</strong>&nbsp;&nbsp;
            Want to do a limited run? · Our exclusive content system lets you sell limited tiers
            <a href="#">learn more</a>
        </div>

        <div class="upload-section">
            <h2>Upload your first game</h2>
            <form action="/project/create" method="get">
                <button type="submit">Create new project</button>
            </form>
            <p>Nah, take me to the games feed</p>
        </div>
    </div>
          <!-- 상품 목록 끝-->
        
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
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
		
			// 공지글 작성 버튼 연결
			$("#bt_regist").click(()=>{
				$(location).attr("href", "/seller/notice/registform");
			})
		})
	</script>
	
</body>
</html>