<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html data-wf-page="644f3f620014988627b2af8c" data-wf-site="644a0d29c6872cead0a180f0">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="App_Custermer_detail" property="og:title">
<meta content="App_Custermer_detail" property="twitter:title">
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
					<div class="c_titleblcok">
						<div class="c_list_title">${info.title}</div>
						<div class="c_date">
							<fmt:formatDate value="${info.fdate}" pattern="yyyy-MM-dd"/> <span class="color_span">Ver.02</span>
						</div>
					</div>
					<div class="c_contentblcok">
						<div>${text}</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../frame/js.jsp"></jsp:include>
</body>
<script>
$(document).ready(function(){
	  $("._home").removeClass('click');
	  $("._wallet").removeClass('click');
	  $("._service").addClass('click');
})
</script>
</html>