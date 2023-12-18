<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html data-wf-page="644b9aa35c010686f5b6b886" data-wf-site="644a0d29c6872cead0a180f0">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="App_Start" property="og:title">
<meta content="App_Start" property="twitter:title">
<jsp:include page="../frame/header.jsp"></jsp:include>
</head>
<body class="app_body">
	<div class="app_section">
		<div class="app_logo"><img src="/spgame/webflow/images/logo_shadow_black.png" loading="lazy" sizes="(max-width: 767px) 18vw, 100px" srcset="/spgame/webflow/images/logo_shadow_black-p-500.png 500w, /spgame/webflow/images/logo_shadow_black-p-800.png 800w, /spgame/webflow/images/logo_shadow_black-p-1080.png 1080w, /spgame/webflow/images/logo_shadow_black-p-1600.png 1600w, /spgame/webflow/images/logo_shadow_black.png 1810w" alt="" class="logo_img"></div>
		<div class="mobile_box">
			<div class="app_screen _2">
				<div class="app_content">
					<div class="system_warp">
						<img src="/spgame/webflow/images/logo_shadow_black.png" loading="lazy" style="opacity:1" data-w-id="e5d9f5ed-8fab-f305-5877-e337d3e516e3" srcset="/spgame/webflow/images/logo_shadow_black-p-500.png 500w, /spgame/webflow/images/logo_shadow_black-p-800.png 800w, /spgame/webflow/images/logo_shadow_black-p-1080.png 1080w, /spgame/webflow/images/logo_shadow_black-p-1600.png 1600w, /spgame/webflow/images/logo_shadow_black.png 1810w" sizes="(max-width: 767px) 40vw, 200px" alt="" class="start_logo">
						<div><spring:message code="login.title" /></div>
						<div class="system_btn_warp">
							<a href="/spgame/app_register.do" class="system_btn w-button"><spring:message code="login.txt9" /></a> 
							<a href="/spgame/app_login.do" class="system_btn _2 w-button"><spring:message code="top.login" /></a>
							<div class="system_warn"><spring:message code="login.txt" />
							<span class="menu_term" onclick="popup('information1')"><spring:message code="bottom.terms" />,&nbsp; </span> <span class="menu_term" onclick="popup('information2')"><spring:message code="bottom.policy" /></span> 
							<spring:message code="login.txt1" />
							</div>
						</div>
					</div>
					<jsp:include page="../frame/infoPopup.jsp"></jsp:include>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../frame/js.jsp"></jsp:include>
</body>
</html>