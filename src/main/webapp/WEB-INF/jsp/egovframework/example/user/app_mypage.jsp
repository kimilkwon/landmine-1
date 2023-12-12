<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html data-wf-page="644b5ac0168e3b38e8b5fbdf" data-wf-site="644a0d29c6872cead0a180f0">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="App_Mypage" property="og:title">
<meta content="App_Mypage" property="twitter:title">
<jsp:include page="../frame/header.jsp"></jsp:include>
<style>
	.list_block::-webkit-scrollbar {
		display: none;
	}
	.list_block {
		-ms-overflow-style: none;
	}
	.w_profile {
    color: #000;
    }
</style>
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
					<div class="top_title"><spring:message code="mypage.title" /></div>
				</div>
				<jsp:include page="../frame/footer.jsp"></jsp:include>
				
				<div class="app_content">
					
					<div class="w_profile">
		            <div class="l_profilesc">
		              <div class="profile_icon"><img src="/landmine/webflow/images/logo_shadow.png" loading="lazy" alt="" class="profile_img"></div>
		              
		            </div>
					<div class="w_mywallet">
						<div class="m_address">
							<div id="address">${myAddress}</div>
							<input type="hidden" id="copyInput" />
							<div class="s_icon_btn" onclick="addressCopy()">
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
						<div class="ap_title"><spring:message code="mypage.money" /></div>
						
						<div class="wallet_count">
							<span ><span id="totalKRW"></span>KRW</span>
						</div>
					
					
						<!-- <div class="addtoken">
							<div>토큰추가</div>
							<img src="/landmine/webflow/images/add_icon.svg" loading="lazy" alt="" class="s_icon_btn">
						</div> -->
					</div>
					<div class="m_tokken_list">
						
						<div class="list_block">
							<c:if test="${info.btcLockup eq 0}">
								<div class="list_warp" onclick="location.href='/landmine/user/app_mypage_list.do?coin=BTC'" style="cursor:pointer";>
							</c:if>
							<c:if test="${info.btcLockup eq 1}">
								<div class="list_warp" onclick="lockUpPage()" style="cursor:pointer";>
							</c:if>
							
								<div class="list1">
									<img src="/landmine/webflow/images/bit_icon.svg" loading="lazy" alt=""
										class="coin_img">
									<div class="coin_txt">BTC</div>
									<c:if test="${info.btcLockup eq 1}">
										<img src="/landmine/webflow/images/lock_icon.png" loading="lazy" alt="" class="coin_img">
									</c:if>
								</div>
								<div class="list2">
									<div class="wallet_count2">
										<div id = "BTC"></div>
										<div class="wallet_krw" id = "BTCkrw">64,123,456 KRW</div>
									</div>
								</div>
							</div>
							<c:if test="${info.ethLockup eq 0}">
								<div class="list_warp" onclick="location.href='/landmine/user/app_mypage_list.do?coin=ETH'" style="cursor:pointer";>
							</c:if>
							<c:if test="${info.ethLockup eq 1}">
								<div class="list_warp" onclick="lockUpPage()" style="cursor:pointer";>
							</c:if>
							
								<div class="list1">
									<img src="/landmine/webflow/images/eth_icon.svg" loading="lazy" alt=""
										class="coin_img">
									<div class="coin_txt">ETH</div>
									<c:if test="${info.ethLockup eq 1}">
										<img src="/landmine/webflow/images/lock_icon.png" loading="lazy" alt="" class="coin_img">
									</c:if>
								</div>
								<div class="list2">
									<div class="wallet_count2" >
										<div id = "ETH"></div>
										<div class="wallet_krw"  id = "ETHkrw">64,123,456 KRW</div>
									</div>
									
								</div>
							</div>
							<c:if test="${info.xrpLockup eq 0}">
								<div class="list_warp" onclick="location.href='/landmine/user/app_mypage_list.do?coin=XRP'" style="cursor:pointer";>
							</c:if>
							<c:if test="${info.xrpLockup eq 1}">
								<div class="list_warp" onclick="lockUpPage()" style="cursor:pointer";>
							</c:if>
								<div class="list1">
									<img src="/landmine/webflow/images/XRPicon_1XRPicon.png" loading="lazy" alt=""
										class="coin_img">
									<div class="coin_txt">XRP</div>
									<c:if test="${info.xrpLockup eq 1}">
										<img src="/landmine/webflow/images/lock_icon.png" loading="lazy" alt="" class="coin_img">
									</c:if>
								</div>
								<div class="list2">
									<div class="wallet_count2">
										<div id = "XRP"></div>
										<div class="wallet_krw" id = "XRPkrw"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<jsp:include page="../frame/left.jsp"></jsp:include>
			</div>
		</div>
	</div>
	<jsp:include page="../frame/js.jsp"></jsp:include>
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
$(document).ready(function(){
	
	  $("._home").addClass('click');
	  $("._wallet").removeClass('click');
	  $("._lockup").removeClass('click');
	  $("._trade").removeClass('click');
})

function lockUpPage(){
	
	popup("lockUp");
	
}

var usdtSise = 0.0;
var coinWallet = [0,0,0];
var coinSise = [0,0,0];
var coinW = ["BTC","ETH","XRP"];
var changeMoney = 0;
var usdt = 0;
var cfnum = 5;

$(document).ready(function() {
	
	  // 페이지 로드가 완료되면 5초마다 자동으로 ajax 요청을 보내는 함수를 호출
	  coinSiseRequest();
	  coinWalletRequest();

	  setInterval(coinWalletRequest, 1000);	 
	  setInterval(coinSiseRequest, 1000);
});
function addressCopy(){
	$("#copyInput").attr("type", "text");
	$("#copyInput").val($("#address").text());
	$("#copyInput").select();
	document.execCommand('Copy');
	var msg = "<spring:message code='mypage.msg' />";
	alert(msg+$("#menuAddress").text());
}
function addressCopyMenu(){
	$("#copyInputMenu").attr("type", "text");
	$("#copyInputMenu").val($("#menuAddress").text());
	$("#copyInputMenu").select();
	document.execCommand('Copy');
	$("#copyInputMenu").attr("type", "hidden");
	var msg = "<spring:message code='mypage.msg' />";
	alert(msg+$("#menuAddress").text());
}

function coinSiseRequest() {
	
	$.ajax({
		type :"post",
		dataType : "json" ,
		url : "/landmine/coinSise.do",
		success:function(data){
			
			coinSise[0] = data.BTC;
			coinSise[1] = data.ETH;
			coinSise[2] = data.XRP;
			usdtSise = data.USDT;
		},
		error:function(e){ console.log("ajax error"); }
	});
}
function coinWalletRequest() {
	var total = 0;
	$.ajax({
		type :"post",
		dataType : "json" ,
		url : "/landmine/user/coinWallet.do",
		success:function(data){
			
			coinWallet[0] = data.BTC;
			coinWallet[1] = data.ETH;
			coinWallet[2] = data.XRP;
			
			$("#BTC").text(data.BTC);
			$("#BTCkrw").text(numberWithCommas(toFixedDown(( coinWallet[0]*coinSise[0]*usdtSise ), 0))+"KRW");
			$("#ETH").text(data.ETH);
			$("#ETHkrw").text(numberWithCommas(toFixedDown(( coinWallet[1]*coinSise[1]*usdtSise ), 0))+"KRW");
			$("#XRP").text(data.XRP);
			$("#XRPkrw").text(numberWithCommas(toFixedDown(( coinWallet[2]*coinSise[2]*usdtSise ), 0))+"KRW");
			
			total = numberWithCommas(toFixedDown(( coinWallet[0]*coinSise[0]*usdtSise )+( coinWallet[1]*coinSise[1]*usdtSise )+( coinWallet[2]*coinSise[2]*usdtSise ), 0))
			$("#totalKRW").text(total);
		},
		error:function(e){ console.log("ajax error"); }
	});
	
}

</script>
</html>