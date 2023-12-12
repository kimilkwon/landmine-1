<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html data-wf-page="61a5ea04adc0d6412d9b2767" data-wf-site="61a469941d3a2796c19b32e1">
<head>
  <meta charset="utf-8">
  <title>App_Deposit_input</title>
  <meta content="App_Deposit_input" property="og:title">
  <meta content="App_Deposit_input" property="twitter:title">
  <meta content="width=device-width, initial-scale=1" name="viewport">
  <meta content="Webflow" name="generator">
<jsp:include page="../frame/header.jsp"></jsp:include>
</head>
<body class="app_body">
  <div class="app_section">
	<div class="app_logo"><img src="/landmine/webflow/images/logo_shadow_black.png" loading="lazy" sizes="(max-width: 767px) 18vw, 100px" srcset="/landmine/webflow/images/logo_shadow_black-p-500.png 500w, /landmine/webflow/images/logo_shadow_black-p-800.png 800w, /landmine/webflow/images/logo_shadow_black-p-1080.png 1080w, /landmine/webflow/images/logo_shadow_black-p-1600.png 1600w, /landmine/webflow/images/logo_shadow_black.png 1810w" alt="" class="logo_img"></div>
    <div class="mobile_box">
      <div class="app_screen _2">
        <div class="app_top">
          <div class="top_title"><spring:message code="exchange.txt1" /></div>
          <div class="app_menu_warp">
            <div class="ap_menu_btn" onclick="location.href='/landmine/user/app_mypage.do'">
              <div class="ap_menu_icon w-embed">
                <?xml version="1.0" encoding="UTF-8"?><svg xmlns="http://www.w3.org/2000/svg" viewbox="0 0 14.48 8.83">
                  <defs>
                    <style>.cls-1{fill:currentColor;}</style>
                  </defs>
                  <g>
                    <path class="cls-1" d="m4.73,7.97c.2.2.2.51,0,.71s-.51.2-.71,0L.11,4.77s-.02-.02-.03-.03H.08s0-.01,0-.02H.07v-.02H.07c-.04-.08-.07-.17-.07-.26s.02-.18.07-.25H.07v-.02H.07s0-.02,0-.03H.08s.02-.02.03-.03L4.02.14c.2-.19.51-.19.71,0,.2.2.2.51,0,.71L1.67,3.91h12.31c.28,0,.5.22.5.5s-.22.5-.5.5H1.67l3.07,3.06h0Z"></path>
                  </g>
                </svg>
              </div>
            </div>
          </div>
        </div>
        <div class="app_content">
          <div class="w_infobox">
            <div class="wallet_count"><spring:message code="exchange.txt2" />: <span class="wallet_count" id ="userMoney"><fmt:formatNumber value="${money}" pattern="#,###"/></span>KRW </div>
          </div>
          <div class="dnw_block">
            <div class="form-block w-form">
              <form id="email-form" name="email-form" data-name="Email Form" method="get">
                <div class="input_warp">
               		<div class="input_title"><spring:message code="exchange.txt3" /></div>
                <div class="input_box">
                	<input type="text" class="input2 w-input" maxlength="256" name="field-5" data-name="Field 5" placeholder="" id="changeMoney" required="" onchange="changeCoin()">
                	<a href="javascript:maxButton()" class="input_btn w-button">Max</a></div>
                	<div class="input_title"><spring:message code="exchange.txt4" /></div>
                	<div class="select_box">
                		<select id="coinSelect" name="field-4" data-name="Field 4" class="select-field w-select" onchange="changeCoin()"><option value=""><spring:message code="exchange.txt5" /></option>
                		<option value="0">Bitcoin</option>
                		<option value="1">Ethereum</option>
                		<option value="2">Riple</option></select>
                	</div>
                		<div class="input_box">
                			<span class="d_countbox" id ="changeCoin"></span><span id ="coinWord"></span>
                		</div>
                	</div>
              </form>
            </div>
            <div class="system_btn_warp">
              <!--  <div class="system_warn warn_red">잔액이 부족합니다</div>-->
              <a href="/landmine/user/app_mypage.do" class="system_btn _2 w-button"><spring:message code="exchange.txt6" /></a>
              <a href="javascript:exchangeProcess()" class="system_btn w-button"><spring:message code="exchange.txt7" /></a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="../frame/js.jsp"></jsp:include>
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=644a0d29c6872cead0a180f0" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="../js/webflow.js" type="text/javascript"></script>
  <!-- [if lte IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/placeholders/3.0.2/placeholders.min.js"></script><![endif] -->
  <style>
.app_content::-webkit-scrollbar {display: none;}
.app_content {-ms-overflow-style: none;}
.dnw_block::-webkit-scrollbar {display: none;}
.dnw_block {-ms-overflow-style: none;}
</style>
  <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
	<script>
	
	
	var usdtSise = 0.0;
	var coinSise = [0,0,0];
	var coinW = ["BTC","ETH","XRP"];
	var changeMoney = 0;
	var usdt = 0;
	var cfnum = 5;
	
	
	$(document).ready(function() {
		  // 페이지 로드가 완료되면 5초마다 자동으로 ajax 요청을 보내는 함수를 호출
		  coinSiseRequest();
		  setInterval(coinSiseRequest, 1000);
	});
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
	function exchangeProcess() {
		var coins= $("#coinSelect").val();
		var changeMoney= numberDeleteCommas($("#changeMoney").val());
		var amount= $("#changeCoin").text();
		console.log("changeCoin:"+amount);
		if(changeMoney==0){
			alert("잔액이 부족합니다.");
			return;
		}
		if(amount==0.0){
			alert("코인수량이 없습니다.");
			return;
		}
		var selectCoin = coinW[coins];
			var data = { "coin" : selectCoin, "money" : changeMoney ,"amount" :amount,"usdtSise" : usdtSise,"coinSise" : coinSise[coins]};
			$.ajax({
				type :"post",
				data:data,
				dataType : "json" ,
				url : "/landmine/user/exchangeProcess.do",
				success:function(data){
					if(data.result == "success"){
						alert(data.msg);
						location.reload();
					}
					else{
						alert(data.msg);
						return;
					}
				},
				error:function(e){ console.log("ajax error"); }
			});
		}
	
	function maxButton(){
		changeMoney= $("#userMoney").text();
		$("#changeMoney").val(numberWithCommas(changeMoney));
		console.log("Money:"+changeMoney);
	}
	
	function changeCoin(){
		var changeMoney= numberDeleteCommas($("#changeMoney").val());
		var usdt = Math.floor((changeMoney / usdtSise)*100)/100;
		
		var coins= $("#coinSelect").val();
		console.log("usdt:"+usdt);
		console.log("coin:"+coins);
		
		var sise = coinSise[coins];
		var calc = parseFloat(toFixedDown(( usdt/sise ), cfnum));
		
		$("#changeCoin").text(calc);
		$("#coinWord").text(coinW[coins]);
	}
	function toFixedDown(val,fix){
		if(isNaN(val)) return 0;
		
		var minus = false;
		if(val < 0)
			minus = true;
		
		var num = 1;
		for(var i = 0; i < parseFloat(fix); i++){
			num *= 10;
		}
		const temp1 = (Number(val) + Number.EPSILON) * num; 
		const temp2 = Math.floor(Math.abs(temp1));
		var result = temp2 / num;
		
		if( result < 1 / num)
			result = 0;
		if(minus)
			result *= -1;
		return result.toFixed(fix);
	}  
		

	
	</script>
</body>
</html>