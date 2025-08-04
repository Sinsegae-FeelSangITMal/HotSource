<%@page import="hotsource.domain.Asset"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" %>
 <%
    List<Asset> list = (List<Asset>) request.getAttribute("assets");
    boolean hasAssets = (list != null && !list.isEmpty());
%>

<!DOCTYPE html>

<html>
<head>
    <title>Creator Dashboard</title>
    <link rel="stylesheet" href="/static/admin/plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="/static/admin/dist/css/adminlte.min.css">
    <script src="/static/admin/plugins/jquery/jquery.min.js"></script>
    <script src="/static/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="/static/admin/dist/js/adminlte.min.js"></script>
    <style>
        .dashboard-container {
            margin-left: 250px;
            padding: 20px;
        }
        .dashboard-header {
            font-size: 24px;
            font-weight: bold;
        }
        .dashboard-stats {
            display: flex;
            justify-content: flex-end;
            gap: 40px;
            font-size: 14px;
            color: #555;
            margin-top: 10px;
        }
        .dashboard-tabs {
            display: flex;
            border-bottom: 1px solid #ddd;
            margin-top: 20px;
        }
        .dashboard-tabs div {
            padding: 12px 18px;
            cursor: pointer;
            color: #555;
        }
        .dashboard-tabs .active {
            border-bottom: 3px solid #cc092f;
            color: black;
            font-weight: bold;
        }
        .tips {
            background-color: #ffe5e5;
            color: #cc092f;
            padding: 10px;
            margin-top: 10px;
        }
        .tips a {
            color: #cc092f;
            float: right;
        }
        .upload-section {
            text-align: center;
            padding: 60px 20px;
        }
        .upload-section h2 {
            color: #555;
            margin-bottom: 20px;
        }
        .upload-section button {
            background-color: #cc092f;
            color: white;
            border: none;
            padding: 12px 24px;
            font-size: 14px;
            font-weight: bold;
            border-radius: 5px;
            cursor: pointer;
        }
        .upload-section p {
            margin-top: 20px;
            color: #888;
        }
    </style>
</head>
<body class="hold-transition sidebar-mini">
<%@ include file="../inc/navbar.jsp" %>
<%@ include file="../inc/left_bar.jsp" %>
<div class="dashboard-container">
    <div class="dashboard-header">Creator Dashboard</div>
    <div class="dashboard-stats">
        <div><strong>0</strong><br>Views</div>
        <div><strong>0</strong><br>Downloads</div>
        <div><strong>0</strong><br>Followers</div>
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

   
  
<% if (hasAssets) { %>
    <%-- asset이 있을 경우: 리스트 출력 --%>
    <div class="upload-section" style="padding-top: 10px;">
        <% for (Asset asset : list) { %>
            <div style="display: flex; align-items: center; border: 1px solid #ccc; padding: 10px; margin-bottom: 10px;">
                <img src="/data/asset_img/<%= asset.getAsset_id() %>/<%= asset.getThumbnail().getAsset_img_url() %>" alt="Thumbnail" style="width: 80px; height: 80px; object-fit: cover; margin-right: 15px;">
                <div style="flex-grow: 1;">
                    <div style="font-weight: bold;"><%= asset.getTitle() %></div>
                </div>
                <div style="white-space: nowrap;">
                    <a href="asset/update?asset_id=<%= asset.getAsset_id() %>" style="margin-right: 10px;">Edit</a>
                    <a href="/asset/analytics?id=<%= asset.getAsset_id() %>" style="margin-right: 10px;">Analytics</a>
                    <a href="/asset/earnings?id=<%= asset.getAsset_id() %>" style="margin-right: 10px;">Earnings</a>
                    <a href="/asset/delete?asset_id=<%= asset.getAsset_id() %>">Delete</a>
                </div>
            </div>
        <% } %>
        <form action="/seller/dashboard/assetCreate" method="get" style="text-align: right; margin-top: 20px;">
            <button type="submit" style="background-color: #cc092f; color: white; border: none; padding: 10px 20px; font-weight: bold; border-radius: 5px;">Create new project</button>
        </form>
    </div>
<% } else { %>
    <%-- asset이 없을 경우: 업로드 권장 메시지 --%>
    <div class="upload-section">
        <h2>Upload your first game</h2>
        <form action="/seller/dashboard/assetCreate" method="get">
            <button type="submit">Create new project</button>
        </form>
        <p>Nah, take me to the games feed</p>
    </div>
<% } %>
</div>
</body>
</html>
