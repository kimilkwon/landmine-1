<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html data-wf-page="644b8bdccff00c8c13c53c51" data-wf-site="644a0d29c6872cead0a180f0">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="App_QR" property="og:title">
<meta content="App_QR" property="twitter:title">
<jsp:include page="../frame/header.jsp"></jsp:include>
</head>
<body class="app_body">
	<div class="app_section">
		<div class="app_logo"><img src="/landmine/webflow/images/logo_shadow_black.png" loading="lazy" sizes="(max-width: 767px) 18vw, 100px" srcset="/landmine/webflow/images/logo_shadow_black-p-500.png 500w, /landmine/webflow/images/logo_shadow_black-p-800.png 800w, /landmine/webflow/images/logo_shadow_black-p-1080.png 1080w, /landmine/webflow/images/logo_shadow_black-p-1600.png 1600w, /landmine/webflow/images/logo_shadow_black.png 1810w" alt="" class="logo_img"></div>
		<div class="mobile_box">
			<div class="app_screen _2">
				<div class="app_top">
					<div class="top_title"><spring:message code="qr.txt1" /></div>
					<jsp:include page="../frame/top.jsp"></jsp:include>
				</div>
				<div class="app_content">
					<div class="qr_block">
						<div>
							<spring:message code="qr.txt2" />
						</div>
						<div class="m_address _2">
							<div>0x7Ed83C364D1132Bf2599fd5546fACe1e88dC5218</div>
							<div class="s_icon_btn">
								<div class="s_icon_img w-embed">
									<?xml version="1.0" encoding="UTF-8"?>
									<svg xmlns="http://www.w3.org/2000/svg" viewbox="0 0 12 12">
										<defs>
											<style>
												.cls-1 {
													fill: currentColor;
													fill-rule: evenodd;
												}
											</style>
										</defs> 
										<g> 
											<path class="cls-1" d="m2.09,6.98c0-1.4,0-2.81,0-4.21,0-.53.13-.66.65-.66,2.82,0,5.64,0,8.47,0,.57,0,.79.22.79.81,0,2.76,0,5.52,0,8.28,0,.59-.22.81-.79.81-2.77,0-5.55,0-8.32,0-.57,0-.79-.22-.79-.81,0-1.4,0-2.81,0-4.21h0Z"></path>
											<path class="cls-1" d="m0,4.99C0,3.65,0,2.3,0,.96,0,.28.27,0,.95,0,3.65,0,6.36.01,9.06,0c.82,0,.9.58.83,1.17-.01.12-.1.16-.2.16-.12,0-.24,0-.36,0-2.27,0-4.55,0-6.82,0-.88,0-1.18.3-1.18,1.18,0,2.26,0,4.52,0,6.78,0,.22.19.59-.3.61-.63.03-.97-.17-1.02-.63-.01-.12,0-.24,0-.36,0-1.31,0-2.62,0-3.93h0Z"></path>
										</g> 
									</svg>
								</div>
								<div class="c_deco"><spring:message code="appMenu.copy" /></div>
							</div>
						</div>
						<img src="/landmine/webflow/images/QR_code_for_mobile_English_Wikipedia.svg.png" loading="lazy" alt="" class="qr_img">
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../frame/js.jsp"></jsp:include>
</body>
</html>