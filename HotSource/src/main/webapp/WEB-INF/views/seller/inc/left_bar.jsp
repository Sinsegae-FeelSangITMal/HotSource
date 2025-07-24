<%@ page contentType="text/html; charset=UTF-8"%>
<aside class="main-sidebar sidebar-light elevation-4">
    <!-- Brand Logo -->
  <a href="/static/admin/index3.html" class="brand-link" style="display: block; padding: 0;">
    <img src="/static/util/subLogo.png" alt="Hot Source Logo" style="width: 100%; height: auto; display: block;">
  </a>
  
      <!-- Sidebar -->
    <div class="sidebar">
      <!-- Sidebar user panel (optional) -->
      <div class="user-panel mt-3 pb-3 mb-3 d-flex">
        <div class="image">
          <img src="/static/admin/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image">
        </div>
        <div class="info">
          <a href="#" class="d-block">양현직 (Seller)</a>  <!-- 현재 유저의 정보 설정해야함!! -->
        </div>
      </div>

      <!-- Sidebar Menu -->
      <nav class="mt-2">
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
          <!-- Add icons to the links using the .nav-icon class
               with font-awesome or any other icon font library -->
         
          <!-- Dashboard 메뉴 시작-->
          <li class="nav-item menu-open">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
               Dashboard
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/static/admin/index.html" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Projects</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/admin/admin/product/registform" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Analytics</p>
                </a>
              </li>
               <li class="nav-item">
                <a href="/admin/admin/product/registform" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Earnings</p>
                </a>
              </li>
            </ul>
          </li>
          <!--Dashboard 메뉴 끝-->
      
          <!--Notice 메뉴 시작-->
          <li class="nav-item menu-open">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Notice
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/seller/notice/list" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>List</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/seller/notice/registform" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Create</p>
                </a>
              </li>
  
            </ul>
          </li>
          <!--Notice  메뉴 끝-->
      
          <!-- Settings 메뉴 시작-->
          <li class="nav-item menu-open">
            <a href="#" class="nav-link active">
              <i class="nav-icon fas fa-tachometer-alt"></i>
              <p>
                Settings
                <i class="right fas fa-angle-left"></i>
              </p>
            </a>
            <ul class="nav nav-treeview">
              <li class="nav-item">
                <a href="/static/admin/index.html" class="nav-link active">
                  <i class="far fa-circle nav-icon"></i>
                  <p>createSeller</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/static/admin/index2.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>updateSeller</p>
                </a>
              </li>
              <li class="nav-item">
                <a href="/static/admin/index3.html" class="nav-link">
                  <i class="far fa-circle nav-icon"></i>
                  <p>Paypal</p>
                </a>
              </li>
            </ul>
          </li>
          <!--Settings 메뉴 끝-->
      
        
        </ul>
      </nav>
      <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
  </aside>
  
  <style>
  /* 현재 선택된 메뉴(active)도 흰 배경 + 검정 글자로 변경 */
  .main-sidebar .nav-sidebar .nav-link.active {
    background-color: #fff !important;
    color: #000 !important;
  }

  /* 아이콘 색상도 검정색 */
  .main-sidebar .nav-icon,
  .main-sidebar .nav-link .far,
  .main-sidebar .nav-link .fas {
    color: #000 !important;
  }

  /* Hover 효과도 흰 배경에 회색 글자 */
  .main-sidebar .nav-sidebar .nav-link:hover {
    background-color: #f0f0f0 !important;
    color: #333 !important;
  }
</style>