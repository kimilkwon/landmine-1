<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html data-wf-page="644b8e1e632a1fe0e3bcd82e" data-wf-site="644a0d29c6872cead0a180f0">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="App_Withdraw_input" property="og:title">
<meta content="App_Withdraw_input" property="twitter:title">
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
					
					<jsp:include page="../frame/top.jsp"></jsp:include>
				</div>
				<div class="app_content">
		          <div class="w_infobox">
		            <span class="wallet_count" id="haveMoney">0</span><span class="wallet_count" id="coinWord"></span>
		          </div>
		          <div class="dnw_block">
		            <div class="form-block w-form">
		              <form id="email-form" name="email-form" data-name="Email Form" method="get">
		             
		              	<div class="input_title"><spring:message code="exchange.txt4" /></div>
		                	<div class="select_box">
		                		<select id="coinSelect" name="field-4" data-name="Field 4" class="select-field w-select" onchange="changeCoin()">
		                		
		                		<option value="0">Bitcoin</option>
		                		<option value="1">Ethereum</option>
		                		<option value="2">Riple</option></select>
		                	</div>

		                <div class="input_warp">
		                  <div class="input_title"><spring:message code="withdraw.txt2" /></div>
		                  <div class="input_warn"><spring:message code="withdraw.txt3" /></div>
		                  <div class="input_box">
		                    <div class="d_countbox">
		                      <input type="text" class="input2 w-input" maxlength="256" name="field-2" data-name="Field 2" placeholder="" id="address" required="">
		                    </div>
		                  </div>
		                </div>
		                
		                <div class="input_warp">
		                  <div class="input_title"><spring:message code="withdraw.txt4" /></div>
		                  <div class="input_box"><input type="text" class="input2 w-input" maxlength="256" name="field-2" data-name="Field 2" placeholder="" id="changeMoney" required="" onchange="changeCoinNum()">
		                    <a href="javascript:maxButton()" class="input_btn w-button"> Max</a>
		                  </div>
		                </div>

		                <div class="fee_box">
		                  <div class="input_title"><spring:message code="withdraw.txt5" /><span id="reMoney"> </span></div>
		                </div>
		              </form>
		            </div>
		            <div class="system_btn_warp">
		              <a href="javascript:withdraw()" class="system_btn w-button"><spring:message code="withdraw.txt6" /></a>
		            </div>
		          </div>
		        </div>
		        <div class="ap_lockup_pop" style="display:none;">
		          <div class="general_popbox">
		            <div class="form-block w-form">
		                <div class="pop_content _2">
		                  <div class="pop_exsit"><img src="/landmine/webflow/images/wx_black.png" loading="lazy" sizes="100vw" srcset="/landmine/webflow/images/wx_black-p-500.png 500w, /landmine/webflow/images/wx_black-p-800.png 800w, /landmine/webflow/images/wx_black-p-1080.png 1080w, /landmine/webflow/images/wx_black.png 1600w" alt="" class="pop_exsit_img"></div><img src="/landmine/webflow/images/FWEFGWEG-12.png" loading="lazy" alt="" class="pop_img">
		                  <div class="pop_title1"><spring:message code="notification" /></div>
		                  <div class="s_warn"><spring:message code="withdraw.txt7" /></div>
		                </div>
		            </div>
		            <div class="g_pop_btnwarp">
		              <a href="javascript:popupClose()" class="g_pop_btn2 w-button"><spring:message code="contactus.check" /></a>
		            </div>
		          </div>
		        </div>
			</div>
		</div>
	</div>
	<jsp:include page="../frame/js.jsp"></jsp:include>
</body>
<script>
var usdtSise = 0.0;
var coinWallet = [0,0,0];
var coinW = ["BTC","ETH","XRP"];
var changeMoney = 0;
var usdt = 0;
var cfnum = 5;

$(document).ready(function() {
	  // 페이지 로드가 완료되면 5초마다 자동으로 ajax 요청을 보내는 함수를 호출
	  coinWalletRequest();
	 
});
function popupClose(){
	$(".ap_lockup_pop").hide();
}
function maxButton(){
	
	
	changeMoney= $("#haveMoney").text();
	$("#changeMoney").val(changeMoney);
	console.log("Money:"+changeMoney);
	var coinNum= $("#changeMoney").val();
	$("#reMoney").text(toFixedDown(( changeMoney - coinNum ), 5));
	if((changeMoney - coinNum) == 0){
		$("#reMoney").text(0);
	}
}

function changeCoinNum(){
	var haveMoney = $("#haveMoney").text();
	var coinNum= $("#changeMoney").val();
	
	let floatNum = parseFloat(coinNum);
	if(floatNum>haveMoney){
		alert("가진 코인보다 많이 보낼 수 없습니다.");
		$("#changeMoney").val("0");
	}else{
		$("#reMoney").text(toFixedDown(( haveMoney - coinNum ), 5));
		if((haveMoney - coinNum) == 0){
			$("#reMoney").text(0);
		}
	}
}

function changeCoin(){

	var coins= $("#coinSelect").val();
	var wallet = coinWallet[coins];
	
	$(".wallet_count").text(wallet);
	$("#coinWord").text(coinW[coins]);
	$("#changeMoney").val("0");
	
}
function coinWalletRequest() {
	
	$.ajax({
		type :"post",
		dataType : "json" ,
		url : "/landmine/user/coinWallet.do",
		success:function(data){
			
			coinWallet[0] = data.BTC;
			coinWallet[1] = data.ETH;
			coinWallet[2] = data.XRP;
			$(".wallet_count").text(data.BTC);
			$("#coinWord").text("BTC");
		},
		error:function(e){ console.log("ajax error"); }
	});
}

function withdraw() {
	var address = $("#address").val();
	var amount = $("#changeMoney").val();
	var coins= $("#coinSelect").val();
	var coin = coinW[coins];
	console.log("address:"+address+"amount:"+amount);
	var data = { "address" : address,"amount":amount,"coin":coin };
	$.ajax({
		type :"post",
		data:data,
		dataType : "json" ,
		url : "/landmine/user/withdrawNextProcess.do",
		success:function(data){
			if(data.result == "success"){
				location.href="/landmine/user/app_withdraw.do";
			}
			else if(data.result == "lockup"){
				$(".ap_lockup_pop").show();
			}
			else{
				alert(data.msg);
				return;
			}
		},
		error:function(e){ console.log("ajax error"); }
	});
}


</script>
</html>