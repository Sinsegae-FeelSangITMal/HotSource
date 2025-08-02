<%@ page contentType="text/html; charset=UTF-8"%>
<form id="wishlist_modal_form">
	<div id="modalOverlay" class="modal-overlay">
	  <div class="modal-content">
	    <h2>Create a new list</h2>
	    <label>목록 이름</label>
	    <input type="text" id="listTitle" name="list_name" placeholder="예: 목록 이름" maxlength="60"/>
		  <div id="titleLength" style="text-align: right; margin-top: 4px; font-size: 0.9rem; color: gray;">
		    0/60
		  </div>
	    <label>간단한 설명</label>
	    <textarea id="listDesc" name="description" placeholder="예: 이건 목록에 대한 설명입니다 (최대 300자)" maxlength="300"></textarea>
	    <div class="button-group">
	      <button type="button" id="cancelBtn" class="btn1 cancel">취소</button>
	      <button type="button" id="saveBtn" class="btn1 save" disabled>저장</button>
	    </div>
	  </div>
	</div>
</form>