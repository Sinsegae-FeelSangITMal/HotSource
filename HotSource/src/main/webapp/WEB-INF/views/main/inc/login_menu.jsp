<% if (loginUser == null) { %>
  <a href="/main/user/login"><span>Login</span></a>
  <a href="/main/user/registform"><span>Register</span></a>
<% } else { %>
  <!-- My Account 메뉴 시작 -->
  <a href="#" class="nav-link dropdown-toggle" role="button" id="pages" data-toggle="dropdown" aria-expanded="false">
    <%= loginUser.getUser_name() %>
  </a>
  <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
    <li><a href="/main/user/mypage" class="dropdown-item">My Page</a></li>
    <li><a href="/seller/dashboard/assetList" class="dropdown-item">Dashboard</a></li>
    <li><a href="/main/user/logout" class="dropdown-item">Log-out</a></li>
  </div>
<% } %>
