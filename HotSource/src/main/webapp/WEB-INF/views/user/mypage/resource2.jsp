<%@ page contentType="text/html; charset=UTF-8"%>

<div class="col-md-10 content-area">
  <div class="content-box">

    <h3 class="header">My Resources</h3>
    <!-- 복사해서 반복 -->
    <% for (int i = 0; i < 3; i++) { %>
    <div class="asset-item row mb-4 align-items-center border-bottom pb-3">
      <div class="col-md-1 text-center">
        <input type="checkbox" <%= (i % 2 == 0 ? "checked" : "") %> />
      </div>
      <div class="col-md-2">
        <img src="/static/images/main_logo.png" alt="asset" class="img-fluid rounded" />
      </div>
      <div class="col-md-5">
        <p class="mb-1 fw-bold">배부른 하치와래</p>
        <p class="text-muted mb-1">minji kim</p>
        <p class="text-muted small">Purchase date : 2025.07.14</p>
        <p class="text-muted small">15.4 MB</p>
      </div>
      <div class="col-md-4 d-flex flex-column gap-2">
		<div class="download-wrap">
			<a class="download" href="">Download as ZIP</a>
		</div>
      </div>
    </div>
    <% } %>

  </div>
</div>
