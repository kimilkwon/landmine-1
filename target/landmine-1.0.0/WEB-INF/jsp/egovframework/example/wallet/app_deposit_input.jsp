<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html data-wf-page="644f252e001498d3abb0f7e7" data-wf-site="644a0d29c6872cead0a180f0">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="App_Deposit_input" property="og:title">
<meta content="App_Deposit_input" property="twitter:title">
<jsp:include page="../frame/header.jsp"></jsp:include>
<style>
	.dnw_block::-webkit-scrollbar {
		display: none;
	}
	.dnw_block {
		-ms-overflow-style: none;
	}
</style>
</head>
<body class="app_body">
	<div class="app_section">
		<div class="app_logo"><img src="/landmine/webflow/images/logo_shadow_black.png" loading="lazy" sizes="(max-width: 767px) 18vw, 100px" srcset="/landmine/webflow/images/logo_shadow_black-p-500.png 500w, /landmine/webflow/images/logo_shadow_black-p-800.png 800w, /landmine/webflow/images/logo_shadow_black-p-1080.png 1080w, /landmine/webflow/images/logo_shadow_black-p-1600.png 1600w, /landmine/webflow/images/logo_shadow_black.png 1810w" alt="" class="logo_img"></div>
		<div class="mobile_box">
			<div class="app_screen _2">
				<div class="app_top">
					<div class="top_title">입금</div>
					<jsp:include page="../frame/top.jsp"></jsp:include>
				</div>
				<div class="app_content">
					<div class="w_infobox">
						<div class="wallet_count">
							1,234.12345678<br>
							<span class="wallet_krw">64,123,456 KRW</span>
						</div>
					</div>
					<div class="dnw_block">
						<div class="form-block w-form">
							<form id="email-form" name="email-form" data-name="Email Form"
								method="get">
								<div class="input_warp">
									<div class="input_title">입금금액</div>
									<div class="input_box">
										<input type="text" class="input w-input" maxlength="256"
											name="field" data-name="Field" placeholder=""
											id="field" required="">
									</div>
								</div>
								<div class="d_btnwarp">
									<a href="#" class="d_btn w-button">1만원</a> 
									<a href="#" class="d_btn w-button">10만원</a> 
									<a href="#" class="d_btn w-button">100만원</a> 
									<a href="#" class="d_btn w-button">500만원</a> 
									<a href="#" class="d_btn w-button">1,000만원</a> 
									<a href="#" class="d_btn reset w-button">초기화</a>
								</div>
								<div>잔액 : 0</div>
							</form>
							<div class="w-form-done">
								<div>Thank you! Your submission has been received!</div>
							</div>
							<div class="w-form-fail">
								<div>Oops! Something went wrong while submitting the form.</div>
							</div>
						</div>
						<div class="system_btn_warp">
							<div class="system_warn warn_red">잔액이 부족합니다</div>
							<a href="/landmine/user/app_deposit.do" class="system_btn _2 w-button">코인전환</a> 
							<a href="#" class="system_btn w-button">입금신청</a>
						</div>
					</div>
				</div>
				<div class="ap_lockup_pop">
					<div class="general_popbox">
						<div class="form-block w-form">
							<form id="email-form-2" name="email-form-2" data-name="Email Form 2" method="get">
								<div class="pop_content _2">
									<div class="pop_exsit">
										<img src="/landmine/webflow/images/wx_black.png" loading="lazy" sizes="100vw" srcset="/landmine/webflow/images/wx_black-p-500.png 500w, /landmine/webflow/images/wx_black-p-800.png 800w, /landmine/webflow/images/wx_black-p-1080.png 1080w, /landmine/webflow/images/wx_black.png 1600w" alt="" class="pop_exsit_img">
									</div>
									<img src="/landmine/webflow/images/FWEFGWEG-12.png" loading="lazy" alt=""
										class="pop_img">
									<div class="pop_title1">알림</div>
									<div class="s_warn"><spring:message code="withdraw.txt7" /></div>
								</div>
							</form>
							<div class="w-form-done">
								<div>Thank you! Your submission has been received!</div>
							</div>
							<div class="w-form-fail">
								<div>Oops! Something went wrong while submitting the form.</div>
							</div>
						</div>
						<div class="g_pop_btnwarp">
							<a href="#" class="g_pop_btn2 w-button">확인</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../frame/js.jsp"></jsp:include>
</body>
</html>