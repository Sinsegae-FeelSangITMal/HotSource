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
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f9f9f9;
        }

        .dashboard-container {
            padding: 30px;
            margin: 0 auto 16px auto; /* 가운데 정렬 */
            margin-left: 400px;
		    max-width: 800px; /* 카드 최대 너비 제한 */
		    width: 100%; /* 반응형 */
        }

        .dashboard-header {
            font-size: 22px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .dashboard-tabs {
            display: flex;
            gap: 20px;
            border-bottom: 1px solid #ddd;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }

        .dashboard-tabs div {
            cursor: pointer;
            color: #555;
            font-size: 15px;
        }

        .dashboard-tabs .active {
            color: #000;
            font-weight: bold;
            border-bottom: 2px solid #cc092f;
        }
        .asset-card {
		    display: flex;
		    align-items: center;
		    background: white;
		    border: 1px solid #eee;
		    border-radius: 8px;
		    padding: 14px 16px;
		    margin: 0 auto 16px auto; /* 가운데 정렬 */
		    max-width: 800px; /* 카드 최대 너비 제한 */
		    width: 100%; /* 반응형 */
		}

        .asset-card img {
            width: 70px;
            height: 70px;
            object-fit: cover;
            border-radius: 6px;
            margin-right: 18px;
        }

        .asset-info {
            flex-grow: 1;
        }

        .asset-title {
            font-weight: 600;
            color: #333;
            margin-bottom: 4px;
        }

        .asset-actions a {
            font-size: 14px;
            margin-right: 14px;
            color: #555;
            text-decoration: none;
            float: right;
        }

        .asset-actions a:hover {
            color: #cc092f;
        }

        .upload-section {
            text-align: center;
            padding: 80px 20px;
            background: white;
            border: 1px dashed #ccc;
            border-radius: 8px;
        }

        .upload-section h2 {
            color: #333;
            font-size: 20px;
            margin-bottom: 20px;
        }

        .upload-section button {
            background-color: #cc092f;
            color: white;
            border: none;
            padding: 12px 26px;
            font-size: 14px;
            font-weight: bold;
            border-radius: 6px;
            cursor: pointer;
        }

        .upload-section p {
            margin-top: 20px;
            color: #666;
            font-size: 13px;
        }

        .create-btn-container {
            text-align: right;
            margin-top: 30px;
        }

       .create-btn {
		    background-color: #cc092f;
		    color: white;
		    border: none;
		    padding: 6px 12px;      
		    font-size: 14px;     
		    font-weight: 500;     
		    border-radius: 4px;   
		    cursor: pointer;
		    width: auto;           
		    height: auto;          
		}
    </style>
</head>
<body class="hold-transition sidebar-mini">

<%@ include file="../inc/navbar.jsp" %>
<%@ include file="../inc/left_bar.jsp" %>

<div class="dashboard-container">
    <div class="dashboard-header">Creator Dashboard</div>

    <div class="dashboard-tabs">
        <div class="active">Projects</div>
        <div>Analytics</div>
        <div>Earnings</div>
    </div>

    <% if (hasAssets) { %>
        <%-- Asset 리스트 카드 UI --%>
        <% for (Asset asset : list) { %>
            <div class="asset-card">
                <% if (asset.getThumbnail() != null) { %>
                    <img src="/data/asset_img/<%= asset.getAsset_id() %>/<%= asset.getThumbnail().getAsset_img_url() %>" alt="Thumbnail">
                <% } else { %>
                    <img src="/images/default-thumbnail.png" alt="No Thumbnail">
                <% } %>
                <div class="asset-info">
                    <div class="asset-title"><%= asset.getTitle() %></div>
                    <div class="asset-actions">
                        <a href="/asset/delete?asset_id=<%= asset.getAsset_id() %>">Delete</a>
                        <a href="/asset/earnings?id=<%= asset.getAsset_id() %>">Earnings</a>
                        <a href="/asset/analytics?id=<%= asset.getAsset_id() %>">Analytics</a>
                        <a href="asset/update?asset_id=<%= asset.getAsset_id() %>">Edit</a>
                    </div>
                </div>
            </div>
        <% } %>

        <div class="create-btn-container">
            <form action="/seller/dashboard/assetCreate" method="get">
                <button type="submit" class="create-btn">Create new project</button>
            </form>
        </div>

    <% } else { %>
        <%-- 업로드 권장 메시지 --%>
        <div class="upload-section">
            <h2>Upload your first game</h2>
            <form action="/seller/dashboard/assetCreate" method="get">
                <button type="submit">Create new project</button>
            </form>
            <p>Or <a href="/feed">go to games feed</a></p>
        </div>
    <% } %>
</div>

</body>
</html>
