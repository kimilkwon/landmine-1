<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div class="ap_menu_pop">
	<div class="ap_menu">
		<div class="ap_menu_wallet">
			<div><spring:message code="appMenu.wallet" /></div>
			<span class="menu_address" id="menuAddress">${myAddress}</span>
			<input type="hidden" id="copyInputMenu" />
			<span class="s_icon_btn" onclick="addressCopyMenu()">
				<span class="s_icon_img w-embed">
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
				</span>
				<div class="c_deco"><spring:message code="appMenu.copy" /></div>
			</span>
		</div>
		<div class="menu_box">
			<div class="ap_menu_title"><spring:message code="appbottom.Wallet" /></div>
			<a href="/landmine/user/app_withdraw_check.do" class="menu_link"><spring:message code="appMenu.export" /></a> 
			<a href="/landmine/user/app_exchange.do" class="menu_link"><spring:message code="appMenu.swap" /></a> 
		</div>
		<div class="menu_box">
			<div class="ap_menu_title"><spring:message code="list.customer" /></div>
			<a href="/landmine/user/app_notice.do" class="menu_link"><spring:message code="top.notice" /></a> 
			<a href="/landmine/user/app_faq.do" class="menu_link"><spring:message code="top.faq" /></a> 
			<a href="/landmine/user/app_qnaList.do" class="menu_link"><spring:message code="top.inquiry" /></a> 
		</div>

		<div class="div-block-2">
			<a href="javascript:popup('information1')" class="menu_term"><spring:message code="bottom.terms" /></a>
			<a href="javascript:popup('information2')" class="menu_term"><spring:message code="bottom.policy" /></a>
			<div class="version_txt"><spring:message code="appMenu.version" /></div>
			<a href="/landmine/logout.do" class="menu_term"><spring:message code="top.logout" /></a> 
		</div>
	</div>
</div>