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
            <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">여기에 메인페이지 작가 공지글 리스트로 넘어가는 링크 걸어주면 굿</h3>

                <div class="card-tools">
                  <div class="input-group input-group-sm" style="width: 150px;">
                    <input type="text" name="table_search" class="form-control float-right" placeholder="Search">

                    <div class="input-group-append">
                      <button type="submit" class="btn btn-default">
                        <i class="fas fa-search"></i>
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body table-responsive p-0">
                <table class="table table-hover text-nowrap">
                  <thead>
                    <tr>
                      <th>No</th>
                      <th>공지글 제목</th>
                      <th>내용</th>
                      <th>등록일</th>
                    </tr>
                  </thead>
                  <tbody>
                  	<% 
					  int num = paging.getNum();
					  int start = paging.getCurPos();
					  for(int i = 0; i < noticeList.size(); i++) {
					    Notice notice = noticeList.get(i); 
					%>
					  <tr>
					    <td><a href="/seller/notice/detail?notice_id=<%= notice.getNotice_id()%>">공지글 ID: <%= notice.getNotice_id() %></a></td>
					    <td><%= notice.getTitle() %></td>
					    <td><%= notice.getContent() %></td>
					    <td><%= notice.getCreate_date() %></td>
					  </tr>
					<% } %>

                  </tbody>
                </table>
              </div>
              <!-- /.card-body -->
              <div class="card-footer clearfix">
                <ul class="pagination pagination-sm m-0 float-left">
                  <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
                  
                  <% for(int i=paging.getFirstPage(); i<= paging.getLastPage(); i++){ %>
                  <% if(i > paging.getTotalPage()) break; // 총 페이지 수를 넘으면 반복문 빠져나오기 %>
                  <li class="page-item"><a class="page-link" href="#"><%= i %></a></li>
                  <% } %>
                  <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
                </ul>
                  <!-- 오른쪽 끝 배치 -->
				  <div class="float-right">
				    <button type="button" class="btn btn-info" id="bt_regist">공지글 작성</button>
				  </div>
              </div>
              
            </div>
            <!-- /.card -->
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