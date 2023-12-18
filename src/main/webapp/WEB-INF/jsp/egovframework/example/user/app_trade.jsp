<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<div class="app_logo"><img src="/spgame/webflow/images/logo_shadow_black.png" loading="lazy" sizes="(max-width: 767px) 18vw, 100px" srcset="/spgame/webflow/images/logo_shadow_black-p-500.png 500w, /spgame/webflow/images/logo_shadow_black-p-800.png 800w, /spgame/webflow/images/logo_shadow_black-p-1080.png 1080w, /spgame/webflow/images/logo_shadow_black-p-1600.png 1600w, /spgame/webflow/images/logo_shadow_black.png 1810w" alt="" class="logo_img"></div>
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
          <div class="l_content">
            <div class="l_sc1">
              <div class="lock_title"><spring:message code="lock.txt1" /></div>
              <div class="l_time_sc">
                <div class="l_time" id="remainTime">00:00:00:00</div>
                <div><spring:message code="lock.txt2" /></div>
              </div>
              <div class="l_address">
                <div><spring:message code="appMenu.wallet" />: ${myAddress}</div>
              </div>
            </div>
            <div class="l_sc2">
              <div class="l_unit">
              <img src="/spgame/webflow/images/bit_icon.svg" loading="lazy" alt=""
										class="coin_img">
              	${info.btc}<span class="l_unit">BTC</span>
              </div>
              <div class="l_unit">
              <img src="/spgame/webflow/images/eth_icon.svg" loading="lazy" alt=""
										class="coin_img">
              	${info.eth}<span class="l_unit">ETH</span>
              </div>
              <div class="l_unit" >
              <img src="/spgame/webflow/images/XRPicon_1XRPicon.png" loading="lazy" alt=""
										class="coin_img">
              	${info.xrp}<span class="l_unit">XRP</span>
              </div>
              
              <img src="/spgame/webflow/images/low_white.svg" loading="lazy" style="opacity: 1; transform: translate3d(0px, 0px, 0px) scale3d(1, 1, 1) rotateX(0deg) rotateY(0deg) rotateZ(0deg) skew(0deg, 0deg); transform-style: preserve-3d;" data-w-id="e1162182-e13d-0221-d6fa-05d29d2310e6" alt="" class="lockup_arrow">
              <div class="lock_iconbox"><img src="/spgame/webflow/images/lockuo_icon.png" loading="lazy" alt="" class="lock_icon"></div>
            </div>
          </div>
        </div>
		</div>
	</div>
	<jsp:include page="../frame/js.jsp"></jsp:include>
</body>
<script>
function calculateRemainingTime() {

	  var baseDate = new Date('${lockupDate}');
	  var now = new Date();
	  var remainingTime = baseDate.getTime() - now.getTime();
	  var days = Math.floor(remainingTime / (24 * 60 * 60 * 1000));
	  remainingTime %= (24 * 60 * 60 * 1000);
	  var hours = Math.floor(remainingTime / (60 * 60 * 1000));
	  remainingTime %= (60 * 60 * 1000);
	  var minutes = Math.floor(remainingTime / (60 * 1000));
	  remainingTime %= (60 * 1000);  
	  var seconds = Math.floor(remainingTime / 1000);

	  if(seconds>=0)
	  	$('#remainTime').text(days + "days " + hours + ":" + minutes + ":" + seconds);
}
function popupClose(){
	$(".ap_lockup_pop").hide();
}
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
	
	  $("._wallet").removeClass('click');
	  $("._home").removeClass('click');
	  $("._lockup").addClass('click');
	  $("._trade").removeClass('click');
})



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
	  calculateRemainingTime();
	  setInterval(calculateRemainingTime,1000);
	  setInterval(coinWalletRequest, 5000);	 
	  setInterval(coinSiseRequest, 5000);
});
function addressCopy(){
	$("#copyInput").attr("type", "text");
	$("#copyInput").val($("#address").text());
	$("#copyInput").select();
	document.execCommand('Copy');
	$("#copyInput").attr("type", "hidden");
	alert("주소가 복사되었습니다. 주소:"+$("#address").text());
}
function addressCopyMenu(){
	$("#copyInputMenu").attr("type", "text");
	$("#copyInputMenu").val($("#menuAddress").text());
	$("#copyInputMenu").select();
	document.execCommand('Copy');
	$("#copyInputMenu").attr("type", "hidden");
	alert("주소가 복사되었습니다. 주소:"+$("#menuAddress").text());
}

function coinSiseRequest() {
	
	$.ajax({
		type :"post",
		dataType : "json" ,
		url : "/spgame/coinSise.do",
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
		url : "/spgame/user/coinWallet.do",
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