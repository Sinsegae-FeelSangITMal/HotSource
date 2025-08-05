<%@page import="hotsource.domain.Seller"%>
<%@page import="hotsource.domain.User"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
    Seller seller = (Seller) session.getAttribute("seller");
    String uri = request.getRequestURI();
    boolean isDashboard = uri.contains("/dashboard");
    boolean isAssetList = uri.contains("/dashboard/assetList");
    boolean isAssetCreate = uri.contains("/dashboard/assetCreate");
    boolean isAssetUpdate = uri.contains("/product/registform");
    boolean isNotice = uri.contains("/seller/notice");
    boolean isSettings = uri.contains("index");
%>

<aside class="main-sidebar sidebar-light elevation-4">
  <!-- Brand Logo -->
  <a href="/main/index" class="brand-link d-flex justify-content-center align-items-center" style="background-color: #15161D; height: 60px;">
    <img src="/static/util/subLogo.png" alt="Hot Source Logo" class="brand-image" style="height: 60px; object-fit: contain;">
  </a>

  <!-- Sidebar -->
  <div class="sidebar">
    <!-- User Panel -->
    <div class="user-panel d-flex align-items-center my-3 px-3">
      <% if (seller == null) { %>
        <div class="info ms-2">
          <a href="/seller/registform" class="d-block fw-semibold text-danger">판매자 등록</a>
        </div>
      <% } else { %>
        <div class="image me-2">
          <img src="/data/user_profile_img/<%= seller.getProfile_img_url() %>" class="img-circle elevation-2" alt="User Image" style="width: 50px; height: 50px;">
        </div>
        <div class="info">
          <a href="#" class="d-block fw-semibold text-dark"><%= seller.getSeller_nickname() %> (Seller)</a>
        </div>
      <% } %>
    </div>

    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="True">

        <!-- Dashboard / Assets -->
        <li class="nav-item mb-3 <%= isDashboard ? "menu-open" : "" %>">
          <a href="#" class="nav-link <%= isDashboard ? "active" : "" %>">
            <i class="nav-icon fas fa-tachometer-alt"></i>
            <p>
              Assets
              <i class="fas fa-angle-left right"></i>
            </p>
          </a>
          <ul class="nav nav-treeview ps-3">
		    <li class="nav-item">
			  <a href="/seller/dashboard/assetList?seller_id=<%= (seller != null ? seller.getSeller_id() : "") %>" 
			     class="nav-link <%= isAssetList ? "active" : "" %>">
			    <i class="far fa-circle nav-icon"></i>
			    <p>List</p>
			  </a>
			</li>
            <li class="nav-item">
              <a href="/seller/dashboard/assetCreate" class="nav-link <%= uri.contains("assetCreate") ? "active" : "" %>">
                <i class="far fa-circle nav-icon"></i>
                <p>Create</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="/admin/admin/product/registform" class="nav-link <%= uri.contains("/product/registform") ? "active" : "" %>">
                <i class="far fa-circle nav-icon"></i>
                <p>Update</p>
              </a>
            </li>
          </ul>
        </li>

        <!-- Notice -->
        <li class="nav-item mb-3 <%= isNotice ? "menu-open" : "" %>">
          <a href="#" class="nav-link <%= isNotice ? "active" : "" %>">
            <i class="nav-icon fas fa-bell"></i>
            <p>
              Notice
              <i class="fas fa-angle-left right"></i>
            </p>
          </a>
          <ul class="nav nav-treeview ps-3">
            <li class="nav-item">
              <a href="/seller/notice/list" class="nav-link <%= uri.endsWith("/notice/list") ? "active" : "" %>">
                <i class="far fa-circle nav-icon"></i>
                <p>List</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="/seller/notice/registform" class="nav-link <%= uri.endsWith("/notice/registform") ? "active" : "" %>">
                <i class="far fa-circle nav-icon"></i>
                <p>Create</p>
              </a>
            </li>
          </ul>
        </li>

        <!-- Settings -->
        <li class="nav-item mb-3 <%= isSettings ? "menu-open" : "" %>">
          <a href="#" class="nav-link <%= isSettings ? "active" : "" %>">
            <i class="nav-icon fas fa-cog"></i>
            <p>
              Settings
              <i class="fas fa-angle-left right"></i>
            </p>
          </a>
          <ul class="nav nav-treeview ps-3">
            <li class="nav-item">
              <a href="/static/admin/index.html" class="nav-link <%= uri.endsWith("index.html") ? "active" : "" %>">
                <i class="far fa-circle nav-icon"></i>
                <p>Create Seller</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="/static/admin/index2.html" class="nav-link <%= uri.endsWith("index2.html") ? "active" : "" %>">
                <i class="far fa-circle nav-icon"></i>
                <p>Update Seller</p>
              </a>
            </li>
            <li class="nav-item">
              <a href="/static/admin/index3.html" class="nav-link <%= uri.endsWith("index3.html") ? "active" : "" %>">
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
<style>
  .main-sidebar {
    background-color: #f6f7f9;
    border-right: 1px solid #dcdcdc;
  }

  .brand-link {
    padding: 0;
    border-bottom: none;
  }

  .brand-image {
    max-height: 40px;
    padding: 5px 0;
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
	  background-color: #dcdcdc; /* 더 선명한 회색 */
	  color: #000;
	  font-weight: 700;
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