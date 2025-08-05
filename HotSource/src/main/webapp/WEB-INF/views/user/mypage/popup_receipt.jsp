<%@page import="hotsource.domain.Ordered"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<!-- 리뷰 작성 팝업 -->
<div id="receiptPopup" class="popup-overlay" style="display: none;">
  <div class="popup">
    <h2>Receipt</h2>
    <div class="review-header">
      <img id="popupThumb" src="" alt="Asset thumbnail" class="thumb">
      <div class="review-info">
        <div class="date" id="popupOrderDate"></div>
      </div>
    </div>
    
	<div class="btn-wrapper">
		<a class="review-btn" href="#" onclick="closeReceiptPopup()">Close</a>
	</div>
	
  </div>
</div>

<script type="text/javascript">

</script>