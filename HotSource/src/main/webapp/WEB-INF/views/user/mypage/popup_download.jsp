<%@page import="hotsource.domain.Ordered"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<!-- 리뷰 작성 팝업 -->
<div id="downloadPopup" class="popup-overlay" style="display: none;">
  <div class="popup">
    <h2>Download</h2>
    <div class="review-header">
      <div class="review-info">
        <div class="date" id="popupOrderDate"></div>
      </div>
    </div>
    
    다운로드가 시작됩니다
    
	<div class="btn-wrapper">
		<a class="review-btn" href="#" onclick="closeDownloadPopup()">Close</a>
	</div>
	
  </div>
</div>

<script type="text/javascript">

</script>