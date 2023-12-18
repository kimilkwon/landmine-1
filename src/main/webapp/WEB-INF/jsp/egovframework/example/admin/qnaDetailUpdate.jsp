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
				<h1 class="page-header">QNA 상세 보기</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
				<div class="panel-heading"></div>
					<div class="panel-body">
					<form name="updateForm" id="updateForm" method="post">
							<input type="hidden" name="idx" value="${info.idx}"> 
						<div class="row">
							<div class="col-lg-12">
								<div class="row">
									<div class="col-lg-3">
										<div class="form-group">
											<label>작성일</label> 
											<pre><fmt:formatDate value="${info.qdate}" pattern="yyyy-MM-dd"/>&nbsp;</pre>
										</div>
									</div>
									<div class="col-lg-3">
										<div class="form-group">
											<label>답변 여부</label> 
											<pre>${info.cdate == null ? 'X' : 'O'}&nbsp;</pre>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-3">
										<div class="form-group">
											<label>작성자</label> 
											<pre>${info.qname}&nbsp;</pre>
										</div>
									</div>
									<div class="col-lg-3">
										<div class="form-group">
											<label>작성ID</label> 
											<pre>${info.qid}&nbsp;</pre>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label>제목</label> 
											<pre>${info.title}&nbsp;</pre>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-6">
										<div class="form-group">
											<label>내용</label> 
											<pre>${info.text}&nbsp;</pre>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-12">
											<div class="form-group">
												<label>답변 내용 수정</label>
												<textarea class="form-control" rows="20" name="answer" id="answer"></textarea>
											</div>
									</div>
								</div>
							</div>
						</div>
						<br>
						<button type="button" onclick="javascript:sendAnswer()" class="btn btn-warning">수정</button>
						<button type="button" onclick="location.href='/spgame/admin/qna.do'" class="btn btn-primary">목록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="adminFrame/footer.jsp"></jsp:include>
</body>
<script>
function sendAnswer(){
	var data = $("#updateForm").serialize();
	var url = "/spgame/admin/qnaAnswer.do";
	$.ajax({
		type:'post',
		url : url,
		data: data,
		success:function(data){
			console.log('ajax success');
			if(data.result == 'success'){
				alert("답변  완료되었습니다.");
				location.href = '/spgame/admin/qna.do';
			}else{
				alert(data.msg);
				location.reload();
			}
		
		},
		error:function(e){
			console.log('ajax Error'+ JSON.stringify(e));
		}
	})
}
</script>
</html>