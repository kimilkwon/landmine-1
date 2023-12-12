<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html data-wf-page="644f37a6ae0890bdb268f0a7" data-wf-site="644a0d29c6872cead0a180f0">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="App_Custermer_list" property="og:title">
<meta content="App_Custermer_list" property="twitter:title">
<jsp:include page="../frame/header.jsp"></jsp:include>
</head>
<body class="app_body">
	<div class="app_section">
		<div class="app_logo"><img src="/landmine/webflow/images/logo_shadow_black.png" loading="lazy" sizes="(max-width: 767px) 18vw, 100px" srcset="/landmine/webflow/images/logo_shadow_black-p-500.png 500w, /landmine/webflow/images/logo_shadow_black-p-800.png 800w, /landmine/webflow/images/logo_shadow_black-p-1080.png 1080w, /landmine/webflow/images/logo_shadow_black-p-1600.png 1600w, /landmine/webflow/images/logo_shadow_black.png 1810w" alt="" class="logo_img"></div>
		<div class="mobile_box">
			<div class="app_screen">
				<div class="app_top">
					<jsp:include page="../frame/top.jsp"></jsp:include>
				</div>
				<jsp:include page="../frame/footer.jsp"></jsp:include>
				<div class="app_content">
					<div class="c_content">
						<c:forEach var="item" items="${list}">
							<div class="list_warp3" onclick="location.href='/landmine/user/app_faq_detail.do?idx=${item.idx}'" style="cursor:pointer;">
								<div class="c_list_title">${item.title}</div>
								<div class="c_date"><fmt:formatDate value="${item.fdate}" pattern="yyyy-MM-dd"/></div>
							</div>
						</c:forEach>
					</div>
					<form name="listForm" action="/landmine/user/app_faq.do">
						<input type="hidden" name="pageIndex"/>
					</form>
					<div class="page_warp">
						<ui:pagination paginationInfo="${pi}" jsFunction="page" type="user"/>
						
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../frame/js.jsp"></jsp:include>
</body>
<script>
function page(num) {
	document.listForm.pageIndex.value = num;
	document.listForm.submit();
}
$(document).ready(function(){
	  $("._home").removeClass('click');
	  $("._wallet").removeClass('click');
	  $("._service").addClass('click');
})
</script>
</html>