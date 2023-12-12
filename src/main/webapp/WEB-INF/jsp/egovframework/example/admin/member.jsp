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
				<h1 class="page-header">회원 목록</h1>
			</div>
		</div>
		<div class="row">
			<div class="container-fluid">
				<div class="card shadow mb-4">
					<div class="card-header py-3"></div>
					<div class="card-body">
						   <form action="/landmine/admin/member.do" name="listForm" id="listForm">
								<input type="hidden" name="pageIndex" value="1">
								<div class="row">
									<div class="col-lg-4">										
										<label>검색</label>
										<div class="form-group input-group">
											<select id="searchSelect" name="searchSelect" class="form-control ">
												<option value="name" selected="">회원명</option>
												<option value="id">아이디</option>
												<option value="idx">UID</option>
											</select>
											<input type="text" name="search" class="form-control" value=""> 
											<button class="btn btn-default" style="padding: 6px 12px;" type="submit"> <i class="fa fa-search"></i> </button>
										</div>
									</div>						
								</div>
							</form>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>이름</th>
											<th>아이디</th>
											<th>가입일</th>
											<th>가입승인</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${list}">
											<tr onclick="location.href='/landmine/admin/memberDetail.do?idx=${item.idx}'" style="cursor:pointer;">
												<td>${item.name}</td>
												<td>${item.id}</td>
												<td><fmt:formatDate value="${item.mdate}" pattern="yyyy-MM-dd"/></td>
												<td>
													<c:if test="${item.isApproval eq '0'}">
	                                            		<button type="button" class="btn btn-info btn-sm pEventSkip" onclick="changeIsApproval(${item.idx} , 1)">가입승인</button>
	                                            		<button type="button" class="btn btn-danger btn-sm pEventSkip" onclick="changeIsApproval(${item.idx} , 2)">가입미승인</button>
	                                            	</c:if>
	                                            	<c:if test="${item.isApproval eq '1'}">
	                                            		승인
	                                            	</c:if>
	                                            	<c:if test="${item.isApproval eq '2'}">
	                                            		미승인
	                                            	</c:if>
                                            	</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					<form name="listForm" action="/landmine/admin/member.do">
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
function page(pageNo){
	$("input[name='pageIndex']").val(pageNo);
	submitForm('listForm');
}
function submitForm(form){
	$("#"+form).submit();
}

function changeIsApproval(idx , kind){

	if(confirm("변경하시겠습니까")){
		$.ajax({
			type : 'get',
			url : '/landmine/admin/changeIsApproval.do?idx='+idx+'&aprroval='+kind,
			success:function(data){
				alert(data.msg);
				location.reload();
			}
		})
	}
}

</script>
</html>