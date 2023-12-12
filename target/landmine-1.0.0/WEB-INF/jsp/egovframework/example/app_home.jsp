<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html data-wf-page="644a3c788608b013b811cf8a" data-wf-site="644a0d29c6872cead0a180f0">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="App_home" property="og:title">
<meta content="App_home" property="twitter:title">
<jsp:include page="frame/header.jsp"></jsp:include>
</head>
<body class="app_body">
	<div class="app_section">
		<div class="app_logo"><img src="/landmine/webflow/images/logo_shadow_black.png" loading="lazy" sizes="(max-width: 767px) 18vw, 100px" srcset="/landmine/webflow/images/logo_shadow_black-p-500.png 500w, /landmine/webflow/images/logo_shadow_black-p-800.png 800w, /landmine/webflow/images/logo_shadow_black-p-1080.png 1080w, /landmine/webflow/images/logo_shadow_black-p-1600.png 1600w, /landmine/webflow/images/logo_shadow_black.png 1810w" alt="" class="logo_img"></div>
		<div class="mobile_box">
			<div class="app_screen">
				<div class="app_top">
					<div class="app_menu_warp">
						<div class="ap_menu_btn" style="cursor:poiner;">
							<div class="ap_menu_icon w-embed" id="toggle-menu">
								<?xml version="1.0" encoding="UTF-8"?>
								<svg xmlns="http://www.w3.org/2000/svg" viewbox="0 0 15.16 13">
									<defs>
										<style>
											.cls-1 {                         
												fill: currentColor;
												fill-rule: evenodd; 
											}
										</style>
									</defs> 
									<g id="_레이어_1-2"> 
										<path class="cls-1" d="m7.64,2.15c-2.03,0-4.06,0-6.09,0-.24,0-.5,0-.73-.05C.33,1.98.03,1.65.02,1.14,0,.61.25.22.77.08,1.01,0,1.29,0,1.55,0,5.57,0,9.6,0,13.62,0c.02,0,.04,0,.06,0,.99.01,1.47.36,1.48,1.08.01.69-.5,1.06-1.48,1.07-2.01,0-4.02,0-6.04,0h0Z"></path>
										<path class="cls-1" d="m7.58,7.57c-2.01,0-4.02,0-6.04,0-.24,0-.5,0-.73-.05-.49-.12-.78-.45-.8-.96-.01-.53.24-.91.75-1.06.25-.07.52-.07.78-.07,4.02,0,8.05,0,12.07,0,.04,0,.08,0,.11,0,.94.02,1.41.38,1.42,1.08,0,.68-.49,1.06-1.43,1.06-2.05,0-4.1,0-6.15,0h0Z"></path>
										<path class="cls-1" d="m4.29,12.99c-1.07,0-2.15.03-3.22-.01-.92-.04-1.36-.93-.88-1.65.22-.33.55-.46.92-.46,2.15,0,4.29-.02,6.44,0,.7,0,1.11.48,1.09,1.11-.02.59-.44.99-1.13,1.01-1.07.02-2.15,0-3.22,0h0Z"></path>
									</g> 
								</svg>
							</div>
						</div>
					</div>
					<div class="app_logo"><img src="/landmine/webflow/images/logo_shadow_black.png" loading="lazy" sizes="(max-width: 767px) 18vw, 100px" srcset="/landmine/webflow/images/logo_shadow_black-p-500.png 500w, /landmine/webflow/images/logo_shadow_black-p-800.png 800w, /landmine/webflow/images/logo_shadow_black-p-1080.png 1080w, /landmine/webflow/images/logo_shadow_black-p-1600.png 1600w, /landmine/webflow/images/logo_shadow_black.png 1810w" alt="" class="logo_img"></div>
				</div>
				<jsp:include page="frame/footer.jsp"></jsp:include>
				<div class="app_content">
					
					<img src="/landmine/webflow/images/wallet_app_banner.png" loading="lazy" sizes="(max-width: 991px) 335px, 329px" srcset="/landmine/webflow/images/wallet_app_banner-p-500.png 500w" alt="" class="ap_main_img">
				</div>
				<jsp:include page="frame/left.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<jsp:include page="frame/js.jsp"></jsp:include>
</body>
<script>
var toggleMenu = $('#toggle-menu');
toggleMenu.on('click', function(e) {
	e.preventDefault(); 
	$('.ap_menu_pop').toggle();
});
$(document).on('click', function(e) {
	var LayerPopup = $(".ap_menu_pop");
	if(LayerPopup.has(e.target).length === 0 && toggleMenu.has(e.target).length === 0) {
		LayerPopup.css('display', 'none');
	}
});
function addressCopyMenu(){
	$("#copyInputMenu").attr("type", "text");
	$("#copyInputMenu").val($("#menuAddress").text());
	$("#copyInputMenu").select();
	document.execCommand('Copy');
	$("#copyInputMenu").attr("type", "hidden");
	alert("주소가 복사되었습니다. 주소:"+$("#menuAddress").text());
}

$(document).ready(function(){
	  $("._home").addClass('click');
	  $("._wallet").removeClass('click');
	  $("._service").removeClass('click');
})
</script>
</html>