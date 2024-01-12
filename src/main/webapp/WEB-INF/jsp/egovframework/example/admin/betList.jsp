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
				<h1 class="page-header">배팅리스트</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading"></div>
					<div class="card-body">
									<form action="/spgame/admin/betList.do"
										name="listForm" id="listForm">
										<input type="hidden" name="pageIndex" value="1" /> <input
											type="hidden" name="order" id="order" value="${order}" /> <input
											type="hidden" name="orderAD" id="orderAD" value="${orderAD}" />
										<input type="hidden" name="test" id="test" value="${test}" />
										<div class="row">
											<div class="col-lg-3">
												<div class="form-group">
													<label>기간 검색</label>
													<div>
														<input type="date" name="sdate" id="sdate"
															value="${sdate}" class="form-control"
															style="width: 45%; display: inline-block;"
															autocomplete="off"> ~ <input type="date"
															name="edate" id="edate" value="${edate}"
															class="form-control"
															style="width: 45%; display: inline-block;"
															autocomplete="off">
													</div>
												</div>
											</div>
											<div class="col-lg-3">
												<label>검색</label>
												<div class="form-group input-group">
													<select id="searchSelect" name="searchSelect"
														class="form-control input-sm">
														<option value="name"
															<c:if test="${searchSelect eq 'name'}">selected</c:if>>회원명</option>
														<option value="id"
															<c:if test="${searchSelect eq 'id'}">selected</c:if>>ID</option>
													</select> <input type="text" name="search" class="form-control"
														value="${search}" style="width: auto;">
													<button class="btn btn-default btn-sm"onclick="checkForm()" type="button"><i class="fa fa-search"></i>													</button>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-lg-4">
												<label>결과여부</label>
												<div class="form-group input-group">
													<span class="input-group-btn"> 
													<input type="hidden"
														name="wstat" id="wstat" value="${wstat}" />
														<button class="btn btn-light btn-icon-split"
															onclick="checkForm(4)" type="button">전체</button>
														<button class="btn btn-success btn-sm"
															onclick="checkForm('win')" type="button">승리</button>
														<button class="btn btn-primary btn-sm"
															onclick="checkForm('lose')" type="button">패배</button>
														<button class="btn btn-danger btn-sm"
															onclick="checkForm('adminBoom')" type="button">어드민설정 패배</button>
													</span>
												</div>
											</div>
											
											<!-- <div class="col-lg-1">
												<label>정렬</label>
												<div class="form-group input-group">
													<span class="input-group-btn">
														<button class="btn btn-info btn-sm"
															onclick="setOrder('mdate')" type="button">시간</button>
														<button class="btn btn-success btn-sm"
															onclick="setOrder('coinAmount')" type="button">수량</button>
													</span>
												</div>
											</div> -->
										</div>
									</form>
								</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>아이디</th>
											<th>회원명</th>
											<th>배팅금액</th>
											<th>거미줄 수</th>
											<th>거미줄 위치</th>
											<th>당첨금액</th>
											<th>배팅결과</th>
											<th>배팅시작시간</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${list}">
											<tr>
												
												<td>${item.id}</td>
												<td>${item.name}</td>
												<td><fmt:formatNumber value="${item.betMoney}" pattern="#,###"/></span>KRW</td>
												<td>${item.mineSet}</td>
												<td>${item.mineLocation}</td>
												<td>${item.resultMoney}</td>
												<td>
													<c:if test="${item.result eq 'win'}"> 승리</c:if>
													<c:if test="${item.result eq 'lose'}"> 패배</c:if>
													<c:if test="${item.result eq 'null'}"> 게임중</c:if>
													<c:if test="${item.result eq null}"> 게임중</c:if>
													<c:if test="${item.result eq ''}"> 패배</c:if>
													<c:if test="${item.result eq 'adminBoom'}"> 어드민설정 패배</c:if>
													<c:if test="${item.result eq 'exit'}">게임중나감</c:if>
												</td>
												<td><fmt:formatDate value="${item.bdate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
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
function checkForm(wstat){
	var sdate = $("#sdate").val();
	var edate = $("#edate").val();
	if((sdate == '' && edate != '') || (sdate != '' && edate == '')){
		alert("조회시작기간과 조회종료기간을 설정해주세요.");
		return;
	}
	if(edate < sdate){
		alert("조회종료기간이 조회시작기간보다 작을 수 없습니다.");
		return;
	}
	if(wstat != null || wstat != ""){
		if(wstat == 4){
			$("#wstat").val(null);
		} else {
			$("#wstat").val(wstat);
		}
	}
	$("#listForm").submit();
}
function setOrder(val){
	var order = $("#order").val();
	var orderAD = $("#orderAD").val();
	if(order==val){
		if(orderAD=="asc"){
			$("#orderAD").val("desc");
		}
		else{
			$("#orderAD").val("asc");
		}
	}
	else{
		$("#orderAD").val("desc");
	}
	
	$("#order").val(val);
	checkForm();
}

function checkRequest(widx, stat) {

	jQuery.ajax({
		type : "POST",
		url : "/spgame/admin/depositProcess.do?widx=" + widx
		+ "&stat=" + stat,
		dataType : "json",
		date : {
			widx : widx,
			stat : stat,
		},
		success : function(data) {
			if (data.result == "fail")
				alert("요청을 실패했습니다.");

			if (data.result == "error")
				alert("요청을 실패했습니다.");

			location.reload();

		},
		complete : function(data) {
		},
		error : function(xhr, status, error) {
			console.log("ajax ERROR!!! : ");
		}
	});
	requesting = false;
}
</script>
</html>