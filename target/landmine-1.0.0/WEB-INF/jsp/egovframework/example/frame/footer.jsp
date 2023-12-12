<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<div class="ap_b_block">
	<div class="ap_b_btn _home" onclick="location.href='/landmine/user/app_mypage.do'" style="cursor:pointer;">
		<div class="ap_b_btn_icon w-embed">
			<?xml version="1.0" encoding="UTF-8"?>
			<svg xmlns="http://www.w3.org/2000/svg" viewbox="0 0 20 20">
				<defs>
					<style>
					.cls-1 {
						fill: currentColor;
						fill-rule: evenodd;
					}
					</style>
				</defs> 
				<g> 
					<path class="cls-1" d="m9.93,20c-2.81,0-5.61,0-8.42,0-1.13,0-1.49-.34-1.49-1.42C0,15.06.02,11.54,0,8.03c0-.62.23-1.05.72-1.41C3.49,4.57,6.24,2.49,9.01.44c.8-.59,1.18-.59,1.98,0,2.77,2.05,5.52,4.12,8.29,6.18.49.37.72.8.72,1.41-.02,3.51,0,7.03-.01,10.54,0,1.08-.37,1.42-1.5,1.42-2.85,0-5.71,0-8.56,0h0Zm-.99-5.35c0,.6,0,1.19,0,1.79.02,1.53-.25,1.32,1.44,1.37.57.01.7-.21.69-.71-.02-1.41,0-2.83-.01-4.24-.01-1.53.25-1.32-1.44-1.37-.57-.01-.71.21-.69.71.03.82,0,1.63,0,2.45h0Z"></path>
				</g> 
			</svg>
		</div>
		<div><spring:message code="appbottom.home" /></div>
	</div>
	<div class="ap_b_btn _wallet" onclick="location.href='/landmine/user/app_mypage_list.do?coin=krw'" style="cursor:pointer;">
		<div class="ap_b_btn_icon w-embed">
			<?xml version="1.0" encoding="UTF-8"?>
			<svg xmlns="http://www.w3.org/2000/svg" viewbox="0 0 22.86 20">
				<defs>
					<style>
						.cls-1 {
							fill: currentColor;
							fill-rule: evenodd;
						}
					</style>
				</defs> 
				<g> 
					<path class="cls-1" d="m11.79,20c-2.86,0-5.72,0-8.58,0C1.15,20,0,18.85,0,16.79,0,12.26,0,7.73,0,3.2,0,1.17,1.15,0,3.16,0,8.47,0,13.77,0,19.07,0c1.13,0,1.86.48,2.23,1.44.34.88,0,1.39-.94,1.39-5.42,0-10.84,0-16.26,0-.2,0-.4-.01-.59.02-.41.06-.65.31-.65.72,0,.41.25.66.67.71.2.02.4.01.6.01,5.38,0,10.76,0,16.14,0,1.75,0,2.6.85,2.6,2.58,0,3.51,0,7.03,0,10.54,0,1.71-.85,2.57-2.55,2.58-2.84,0-5.68,0-8.52,0Zm8.23-7.84c0-.8-.61-1.44-1.41-1.46-.81-.01-1.45.6-1.47,1.4-.02.83.61,1.48,1.44,1.49.8,0,1.43-.62,1.44-1.42h0Z"></path>
				</g> 
			</svg>
		</div>
		<div><spring:message code="appbottom.Wallet" /></div>
	</div>
	<div class="ap_b_btn _lockup" onclick="location.href='/landmine/user/app_lockup.do'" style="cursor:pointer;">
		<div class="ap_b_btn_icon w-embed">
			<?xml version="1.0" encoding="utf-8"?>
			<!--  Generator: Adobe Illustrator 26.3.1, SVG Export Plug-In . SVG Version: 6.00 Build 0)   -->
				<svg id="_레이어_2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 17 20">
                <defs>
                  <style>.cls-1
				{fill:Currentcolor;fill-rule:evenodd;}</style>
                </defs>
                <g id="_레이어_1-2">
                  <path class="cls-1" d="m8.5,20c-2.41,0-4.83,0-7.24,0-1.04,0-1.26-.22-1.26-1.27C0,15.83,0,12.94,0,10.04c0-1.05.21-1.27,1.26-1.27.11,0,.22-.01.32,0,.58.08.8-.16.78-.78-.03-1.39-.02-2.79,0-4.18,0-.8.08-1.6.51-2.3C3.46.52,4.36.02,5.49.01c2.01-.02,4.02-.02,6.02,0,1.67.02,2.86,1.14,3.06,2.87.19,1.67.08,3.36.07,5.04,0,.68.2.94.85.85.17-.02.34,0,.51,0,.72.03,1,.3,1,1.07.01,1.99,0,3.98,0,5.97,0,.97,0,1.95,0,2.92,0,1.05-.22,1.27-1.26,1.27-2.41,0-4.83,0-7.24,0h0Zm0-11.23c1.2,0,2.39-.01,3.59,0,.46,0,.65-.15.65-.65-.02-1.59,0-3.18-.01-4.78-.01-.96-.45-1.41-1.4-1.42-1.88-.02-3.76-.02-5.64,0-.95,0-1.39.46-1.4,1.42-.02,1.59,0,3.18-.01,4.78,0,.49.18.66.65.65,1.2-.02,2.39,0,3.59,0h0Zm-.02,3.89c-.81.01-1.31.84-.9,1.6.24.43.34.85.3,1.32-.03.45.15.64.6.63.42,0,.65-.13.62-.6-.03-.49.08-.93.32-1.38.4-.76-.13-1.58-.95-1.56h0Z"></path>
                </g>
              </svg>
		</div>
		<div><spring:message code="appbottom.lockup" /></div>
	</div>
	
	<div class="ap_b_btn _trade" onclick="location.href='https://kr.tradingview.com/chart/?symbol=BITSTAMP%3ABTCUSD'" style="cursor:pointer;">
		<div class="ap_b_btn_icon w-embed">
			<?xml version="1.0" encoding="utf-8"?>
			
				<svg id="_레이어_2" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 70.55 66.79">
                <defs>
                  <style>.cls-1{fill:Currentcolor;}</style>
                </defs>
                <g id="_迹_1">
                  <path class="cls-1" d="m67.02,66.79H3.53c-1.95,0-3.53-1.58-3.53-3.53V3.53C0,1.58,1.58,0,3.53,0s3.53,1.58,3.53,3.53v56.2h59.96c1.95,0,3.53,1.58,3.53,3.53s-1.58,3.53-3.53,3.53Z"></path>
                  <rect class="cls-1" x="12.93" y="38.92" width="13.64" height="14.58"></rect>
                  <rect class="cls-1" x="31.75" y="34.45" width="13.64" height="19.28"></rect>
                  <rect class="cls-1" x="50.56" y="20.11" width="13.64" height="33.86"></rect>
                </g>
              </svg>
		</div>
		<div><spring:message code="appbottom.market" /></div>
	</div>
</div>
<jsp:include page="../frame/infoPopup.jsp"></jsp:include>
<script>

</script>

