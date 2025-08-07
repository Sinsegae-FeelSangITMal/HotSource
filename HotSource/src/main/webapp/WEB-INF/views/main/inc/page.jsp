<%@ page contentType="text/html; charset=UTF-8"%>

<div class="paging">
	<a href="#">〈</a>
		<%for(int i=paging.getFirstPage();i<=paging.getLastPage();i++){
				if(i>paging.getTotalPage())break; %>
			<a  <%if(paging.getCurrentPage()==i){%>class="pageNum"<%}%>  href="#"><%=i%></a>
		<%} %>
	<a href="#">〉</a>
</div>