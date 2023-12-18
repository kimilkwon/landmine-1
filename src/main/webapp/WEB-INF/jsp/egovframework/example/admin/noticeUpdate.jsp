<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="/spgame/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<jsp:include page="adminFrame/header.jsp"></jsp:include>
</head>
<body>
<div id="wrapper">
	<jsp:include page="adminFrame/left.jsp"></jsp:include>
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">공지사항 수정</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
				<div class="panel-heading"></div>
					<div class="panel-body">
						<div class="row">
							<form id="noticeForm">
								<input type="hidden" name="idx" value="${info.idx}">
								<div class="col-lg-12">
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label>제목</label> 
												<input type="text" name="title" class="form-control" value="${info.title}"/>
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group">
												<label>내용</label> 
												<textarea name="text" id="smartEditor" rows="10">${info.text}</textarea>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
						<br>
						<button type="button" onclick="location.href='/spgame/admin/noticeDetail.do?idx=${info.idx}'" class="btn btn-primary">뒤로</button>
						<button type="button" onclick="updateNotice()" class="btn btn-success">수정</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="adminFrame/footer.jsp"></jsp:include>
</body>
<script>
var oEditors = []; 
nhn.husky.EZCreator.createInIFrame({ 
  oAppRef : oEditors, 
  elPlaceHolder : "smartEditor",  
  sSkinURI : "${pageContext.request.contextPath}/se2/SmartEditor2Skin.html",  
  fCreator : "createSEditor2", 
  htParams : {  
    bUseToolbar : true,   // 툴사용여부 
    bUseVerticalResizer : false, // 입력창 크기 조절 바 
    //bSkipXssFilter : true, // xss 필터 
    bUseModeChanger : false  // 텍스트 모드 변경 
    },
});
function updateNotice(){
	oEditors.getById["smartEditor"].exec("UPDATE_CONTENTS_FIELD",[]);
	$.ajax({
		type : 'post',
		url : '/spgame/admin/noticeUpdateProcess.do',
		data : $("#noticeForm").serialize(),
		success : function(data){
			alert(data.msg);
			if(data.result == 'suc')location.href='/spgame/admin/noticeDetail.do?idx=${info.idx}';
		}
	})
}
</script>
</html>