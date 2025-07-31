<%@page import="hotsource.domain.Seller"%>
<%@page import="hotsource.domain.User"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
	Seller seller = (Seller) session.getAttribute("seller");
%>
<aside class="main-sidebar sidebar-light elevation-4">
<!-- Brand Logo -->
<a href="/main/index" class="brand-link px-3 py-2" style="background-color: #15161D;">
  <div style="background-color: #15161D; display: flex; justify-content: center; align-items: center;">
    <img src="/static/util/subLogo.png" alt="Hot Source Logo" style="max-width: 100%; height: auto;">
  </div>
</a>

  <!-- Sidebar -->
  <div class="sidebar">
    <!-- Sidebar user panel -->
    <div class="user-panel d-flex align-items-center my-3 px-3">
     	<% if(seller == null){ %>
        <a href="/seller/create" class="d-block fw-semibold text-dark">판매자 등록</a>
        <% } else { %>
	      <div class="image">
	        <img src="/static/admin/dist/img/user2-160x160.jpg" class="img-circle elevation-2" alt="User Image" style="width: 35px; height: 35px;">
	      </div>
	      <div class="info ms-2">
        <a href="#" class="d-block fw-semibold text-dark"><%= seller.getSeller_nickname() %> (Seller)</a>
        
      </div>
        <% } %>
    </div>

    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">

        <!-- Dashboard -->
        <li class="nav-item">
          <a href="#" class="nav-link">
            <i class="nav-icon fas fa-tachometer-alt"></i>
            <p>
              Dashboard
              <i class="fas fa-angle-left right"></i>
            </p>
          </a>
          <ul class="nav nav-treeview ps-3">
            <li class="nav-item">
              <a href="/static/admin/index.html" class="nav-link">
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

        <!-- Notice -->
        <li class="nav-item">
          <a href="#" class="nav-link">
            <i class="nav-icon fas fa-bell"></i>
            <p>
              Notice
              <i class="fas fa-angle-left right"></i>
            </p>
          </a>
          <ul class="nav nav-treeview ps-3">
            <li class="nav-item">
              <a href="/seller/notice/list" class="nav-link">
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

        <!-- Settings -->
        <li class="nav-item">
          <a href="#" class="nav-link">
            <i class="nav-icon fas fa-cog"></i>
            <p>
              Settings
              <i class="fas fa-angle-left right"></i>
            </p>
          </a>
          <ul class="nav nav-treeview ps-3">
            <li class="nav-item">
              <a href="/static/admin/index.html" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>Create Seller</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="/static/admin/index2.html" class="nav-link">
                <i class="far fa-circle nav-icon"></i>
                <p>Update Seller</p>
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

      </ul>
    </nav>
  </div>
</aside>

<!-- 세련된 스타일 개선 -->
<style>
  .main-sidebar {
    background-color: #f9f9f9;
    border-right: 1px solid #e0e0e0;
  }

  .main-sidebar .nav-sidebar .nav-link {
    color: #444;
    font-weight: 500;
    transition: background-color 0.2s, color 0.2s;
    border-radius: 4px;
    margin: 2px 8px;
    padding: 8px 12px;
  }

  .main-sidebar .nav-sidebar .nav-link:hover {
    background-color: #e0e0e0;
    color: #000;
  }

  .main-sidebar .nav-sidebar .nav-link.active {
    background-color: #fff;
    color: #000;
    font-weight: 600;
  }

  .main-sidebar .nav-icon,
  .main-sidebar .nav-link .far,
  .main-sidebar .nav-link .fas {
    color: #444;
    transition: color 0.2s;
  }

  .main-sidebar .nav-link.active .nav-icon,
  .main-sidebar .nav-link.active .far,
  .main-sidebar .nav-link.active .fas {
    color: #000;
  }

  .main-sidebar .user-panel .info a {
    color: #222;
    font-size: 15px;
  }

  .main-sidebar .user-panel .image img {
    border-radius: 50%;
    object-fit: cover;
  }
</style>
