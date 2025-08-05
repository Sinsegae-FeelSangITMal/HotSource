<%@page import="hotsource.domain.Ordered"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<!-- 리뷰 작성 팝업 -->
<div id="receiptPopup" class="popup-overlay" style="display: none;">
  <div class="popup">
        <h4 class="mt-4">주문 정보</h4>

        <!-- 주문 정보 섹션 -->
        <div class="line-box">
            <div class="row mb-2">
                <div class="col-md-4 text-end"><label class="col-form-label">주문 날짜</label></div>
                <div class="col-md-8"><p id="popupOrderDate" class="form-control-plaintext"></p></div>
            </div>
            <div class="row mb-2">
                <div class="col-md-4 text-end"><label class="col-form-label">주문 상태</label></div>
                <div class="col-md-8"><p id="popupOrderStatus" class="form-control-plaintext"></p></div>
            </div>
            <div class="row mb-2">
                <div class="col-md-4 text-end"><label class="col-form-label">주문 번호</label></div>
                <div class="col-md-8"><p id="popupOrderNo" class="form-control-plaintext"></p></div>
            </div>
            <div class="row mb-2">
                <div class="col-md-4 text-end"><label class="col-form-label">주문자명</label></div>
                <div class="col-md-8"><p id="popupBuyerName" class="form-control-plaintext"></p></div>
            </div>
        </div>
<!-- 
        주문 상품 목록
        <h4 class="mt-4">주문 상품</h4>
        <table class="table table-bordered text-center">
            <thead>
                <tr>
                    <th>이름</th>
                    <th>작가</th>
                    <th>할인 적용 금액</th>
                    <th>원래 금액</th>
                </tr>
            </thead>
            <tbody id="popupProductList">
                JS로 상품 목록 동적 생성
            </tbody>
        </table>
 -->
        <!-- 결제 정보 -->
        <h4 class="mt-4">결제 정보</h4>
        <div class="line-box">
            <div class="row mb-2">
                <div class="col-md-4 text-end"><label class="col-form-label">총 금액</label></div>
                <div class="col-md-8"><p id="popupTotalPrice" class="form-control-plaintext"></p></div>
            </div>
            <div class="row mb-2">
                <div class="col-md-4 text-end"><label class="col-form-label">할인 금액</label></div>
                <div class="col-md-8"><p id="popupDiscountPrice" class="form-control-plaintext"></p></div>
            </div>
            <div class="row mb-2">
                <div class="col-md-4 text-end"><label class="col-form-label">결제 금액</label></div>
                <div class="col-md-8"><p id="popupPayPrice" class="form-control-plaintext"></p></div>
            </div>
        </div>

        <!-- 버튼 -->
        <div class="text-center mt-4">
            <button class="btn btn-secondary" onclick="closeReceiptPopup()">Close</button>
        </div>
    </div>
</div>