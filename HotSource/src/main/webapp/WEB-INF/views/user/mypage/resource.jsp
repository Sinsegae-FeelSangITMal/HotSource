<%@ page contentType="text/html; charset=UTF-8"%>

<div class="col-md-10 content-area">
  <div class="content-box">

    <h3 class="header">My Assets</h3>

    <div class="d-flex justify-content-between align-items-center mb-3">
      <div class="filter-tags">
        <span class="keyword">FREE</span>
        <span class="keyword">Single-Entity</span>
        <span class="keyword">Multi-Entity</span>
      </div>
    </div>

    <!-- 리스트 반복 -->
    <div class="asset-item row mb-4 align-items-center border-bottom pb-3">
      <div class="col-md-1 text-center">
        <input type="checkbox" checked />
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
        <button class="btn btn-outline-secondary btn-sm">Download as ZIP</button>
        <button class="btn btn-outline-secondary btn-sm">Download as File</button>
      </div>
    </div>

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
        <button class="btn btn-outline-secondary btn-sm">Download as ZIP</button>
        <button class="btn btn-outline-secondary btn-sm">Download as File</button>
      </div>
    </div>
    <% } %>

  </div>
</div>
