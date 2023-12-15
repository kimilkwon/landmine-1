<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="adminFrame/header.jsp"></jsp:include>
</head>
<body>
<div id="wrapper">
	<jsp:include page="adminFrame/left.jsp"></jsp:include>
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">QNA</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">QNA 목록</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>번호</th>
											<th>제목</th>
											<th>등록일</th>
											<th>답변 여부</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${list}">
											<tr onclick="location.href='/landmine/admin/qnaDetail.do?idx=${item.idx}'" style="cursor:pointer;">
												<td>${item.idx}</td>
												<td>${item.title}</td>
												<td><fmt:formatDate value="${item.qdate}" pattern="yyyy-MM-dd"/></td>
												<td>${item.cdate == null ? 'X' : 'O'}</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					<form name="listForm" action="/landmine/admin/qna.do">
						<input type="hidden" name="pageIndex"/>
					</form>
			        <div class="row">
						<div class="col-sm-12" style="text-align:center;">
							<ul class="pagination">
								<ui:pagination paginationInfo="${pi}" type="admin" jsFunction="page"/>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="adminFrame/footer.jsp"></jsp:include>
</body>
<script>
function page(num) {
	document.listForm.pageIndex.value = num;
	document.listForm.submit();
}
</script>
</html>