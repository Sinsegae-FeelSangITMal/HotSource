<%@page import="hotsource.domain.Seller"%>
<%@page import="hotsource.domain.User"%>
<% 
	User loginUser = (User) session.getAttribute("user");
	Seller loginSeller = (Seller) session.getAttribute("seller");
%>

<% if (loginUser == null) { %>
  <a href="/main/user/login"><span>Login</span></a>
  <a href="/main/user/registform"><span>Register</span></a>
<% } else { %>
  <!-- My Account 메뉴 시작 -->
  <a href="#" class="nav-link dropdown-toggle" role="button" id="pages" data-toggle="dropdown" aria-expanded="false">
    <%= loginUser.getUser_name() %>
  </a>
  <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
    <li><a href="/main/mypage" class="dropdown-item">My Page</a></li>
    <% if (loginSeller != null) { %>
	  <li><a href="/seller/dashboard/assetList?seller_id=<%= loginSeller.getSeller_id() %>" class="dropdown-item">Dashboard</a></li>
	<% } else{ %>
    <li><a href="/seller/create" class="dropdown-item">Dashboard</a></li>
    <% } %>
    <li><a href="/main/user/logout" class="dropdown-item">Log-out</a></li>
  </div>
<% } %>
