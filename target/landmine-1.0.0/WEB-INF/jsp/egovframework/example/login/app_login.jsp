<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html data-wf-page="644b9c001755fb5145a06128" data-wf-site="644a0d29c6872cead0a180f0">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="App_login" property="og:title">
<meta content="App_login" property="twitter:title">
<jsp:include page="../frame/header.jsp"></jsp:include>
</head>
<body class="app_body">
	<div class="app_section">
		<div class="app_logo"><img src="/landmine/webflow/images/logo_shadow_black.png" loading="lazy" sizes="(max-width: 767px) 18vw, 100px" srcset="/landmine/webflow/images/logo_shadow_black-p-500.png 500w, /landmine/webflow/images/logo_shadow_black-p-800.png 800w, /landmine/webflow/images/logo_shadow_black-p-1080.png 1080w, /landmine/webflow/images/logo_shadow_black-p-1600.png 1600w, /landmine/webflow/images/logo_shadow_black.png 1810w" alt="" class="logo_img"></div>
		<div class="mobile_box">
			<div class="app_screen _2">
				<div class="app_top">
					<div class="app_menu_warp">
						<div class="ap_menu_btn" onclick="location.href='/landmine/app_start.do'">
							<div class="ap_menu_icon w-embed">
								<?xml version="1.0" encoding="UTF-8"?>
								<svg xmlns="http://www.w3.org/2000/svg" viewbox="0 0 14.48 8.83">
									<defs>
										<style>
											.cls-1 {
												fill: currentColor;
											}
										</style>
									</defs> 
									<g> 
										<path class="cls-1" d="m4.73,7.97c.2.2.2.51,0,.71s-.51.2-.71,0L.11,4.77s-.02-.02-.03-.03H.08s0-.01,0-.02H.07v-.02H.07c-.04-.08-.07-.17-.07-.26s.02-.18.07-.25H.07v-.02H.07s0-.02,0-.03H.08s.02-.02.03-.03L4.02.14c.2-.19.51-.19.71,0,.2.2.2.51,0,.71L1.67,3.91h12.31c.28,0,.5.22.5.5s-.22.5-.5.5H1.67l3.07,3.06h0Z"></path>
									</g> 
								</svg>
							</div>
						</div>
					</div>
					<div class="top_title"><spring:message code="top.login" /></div>
				</div>
				<div class="app_content">
					<div class="system_warp">
						<img src="/landmine/webflow/images/logo_shadow_black.png" loading="lazy" style="opacity:1" data-w-id="e5d9f5ed-8fab-f305-5877-e337d3e516e3" srcset="/landmine/webflow/images/logo_shadow_black-p-500.png 500w, /landmine/webflow/images/logo_shadow_black-p-800.png 800w, /landmine/webflow/images/logo_shadow_black-p-1080.png 1080w, /landmine/webflow/images/logo_shadow_black-p-1600.png 1600w, /landmine/webflow/images/logo_shadow_black.png 1810w" sizes="(max-width: 767px) 40vw, 200px" alt="" class="start_logo">
						<div><spring:message code="login.title" /></div>
						<div class="form-block w-form">
							<form id="loginForm" name="loginForm" method="get">
								<div class="input_warp">
									<div class="input_title"><spring:message code="login.id" /></div>
									<div class="input_box">
										<input type="text" class="input w-input" name="id">
									</div>
								</div>
								<div class="input_warp"><spring:message code="login.pw" /></div>
									<div class="input_box">
										<input class="input w-input" name="pw" type="password">
									</div>
								</div>
							</form>

						</div>
						<div class="system_btn_warp">
							<a href="#" onclick="login()" class="system_btn w-button"><spring:message code="login.next" /></a>
							<div class="system_warn"> <spring:message code="login.txt" />
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
<script>


function login(){
	$.ajax({
		type :'post',
		url : '/landmine/loginProcess.do',
		data : $("#loginForm").serialize(),
		success:function(data){
			if(data.result == 'suc') location.href='/landmine/app_password.do';
			else alert(data.msg);
		}
	})
}
</script>
</html>