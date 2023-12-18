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
				<h1 class="page-header">공지사항 상세 보기</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
				<div class="panel-heading"></div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<div class="row">
									<div class="col-lg-5">
										<div class="form-group">
											<label>제목</label> 
											<pre>${info.title}&nbsp;</pre>
										</div>
									</div>
									<div class="col-lg-1">
										<div class="form-group">
											<label>등록일</label> 
											<pre><fmt:formatDate value="${info.ndate}" pattern="yyyy-MM-dd"/>&nbsp;</pre>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label>내용</label> 
											<pre style="word-wrap:break-word; white-space:pre-wrap; white-space:-moz-pre-wrap; white-space:-pre-wrap; white-space:-o-pre-wrap; word-break:break-all;">${text}&nbsp;</pre>
										</div>
									</div>
								</div>
							</div>
						</div>
						<br>
						<button type="button" onclick="location.href='/spgame/admin/notice.do'" class="btn btn-primary">목록</button>
						<button type="button" onclick="location.href='/spgame/admin/noticeUpdate.do?idx=${info.idx}'" class="btn btn-success">수정</button>
						<button type="button" onclick="deleteNotice(${info.idx})" class="btn btn-danger">삭제</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="adminFrame/footer.jsp"></jsp:include>
</body>
<script>
function deleteNotice(idx){
	if(confirm("삭제하시겠습니까? 복구할 수 없습니다")){
		$.ajax({
			type : 'post',
			url : '/spgame/admin/deleteNoticeProcess.do?idx='+idx,
			success : function(data){
				alert(data.msg);
				if(data.result == 'suc')location.href='/spgame/admin/notice.do';
			}
		})
	}
}
</script>
</html>