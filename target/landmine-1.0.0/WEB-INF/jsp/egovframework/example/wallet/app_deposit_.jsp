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
          <div class="top_title">입금</div>
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
            <div class="wallet_count">잔액: <span class="wallet_count" id ="userMoney"><fmt:formatNumber value="${money}" pattern="#,###"/> </span>KRW </div>
          </div>
          <div class="dnw_block">
            <div class="form-block w-form">
              <form id="email-form" name="email-form" data-name="Email Form" method="get">
                <div class="input_warp">
                  <div class="input_title" >입금금액</div>
                  <div class="input_box"><input type="text" class="input w-input" maxlength="256" name="field" data-name="Field" placeholder="" id="money" required="" readonly> </div>
                </div>
                <div class="d_btnwarp">
                  <a href="#" class="d_btn w-button" money ="10000">1만원</a>
                  <a href="#" class="d_btn w-button" money ="100000">10만원</a>
                  <a href="#" class="d_btn w-button" money ="1000000">100만원</a>
                  <a href="#" class="d_btn w-button" money ="5000000">500만원</a>
                  <a href="#" class="d_btn w-button" money ="10000000">1,000만원</a>
                  <a href="#" class="d_btn reset w-button">초기화</a>
                </div>
              </form>
            </div>
            <div class="system_btn_warp">
              <c:if test="${money eq 0}">
              	<div class="system_warn warn_red">잔액이 부족합니다</div>
              </c:if>
              
              <a href="/landmine/user/app_exchange.do" class="system_btn _2 w-button">코인전환</a>
              <a href="javascript:depositProcess()" class="system_btn w-button">입금신청</a>
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

	  $(".s_icon_btn").hover(
	  function(){$(this).children(".c_deco").toggleClass("on")}
	  );

		var money = 0;
		
		function resetPoint(){
			money = 0;
			$("#money").val(numberWithCommas(money));
		}
		
		$(function() {
			$(".d_btn").on("click", function() {
				if($(this).attr("class").includes("reset")){
					resetPoint();
					return;
				}
				
				/* if(money+parseFloat($(this).attr("money"))>3000000){
					alert("1회 입금 한도는 최대 300만 원입니다.");
					return;
				} */
				
				money = money+parseFloat($(this).attr("money"));
				$("#money").val(numberWithCommas(money));
			});
		});
		
		function depositProcess() {
			if (money <= 0) {
				alert("입금액을 확인하세요");
				return;
			}

			if (money % 5000 > 0) {
				alert("오천원 단위로 출금 가능합니다.");
				money = money - (money % 5000);
				$("#money").val( numberWithCommas(parseFloat(money)));
				return;
			}
			
			var allData = { "money" : money, };
			$.ajax({
				type : 'post',
				url : '/landmine/user/depositProcess.do',
				data : allData,
				success : function(data) {
					if (data.dresult == "suc") {
						alert(data.msg);
						
						//관리자한테 신청이 있음을 알려줌
						//var obj = new Object();
						//obj.protocol = 'moneyAlarm';
						//obj.kind = 'deposit';
						//doChatSend(JSON.stringify(obj));
					} else {
						alert(data.msg);
						location.reload();
					}
				}
			})
		}

		function depositck(obj) {
			var deleteComma = obj.value.replace(/\,/g, "");

			// 콤마( , )를 제외하고 문자가 입력되었는지를 확인한다.
			if (isFinite(deleteComma) == false) {
				alert("????");
				obj.value = "";
				return false;
			}
			else{
				console.log("deleteComma:"+deleteComma);
				money = parseFloat(deleteComma);
			}
			if (money <= 0) {
				alert("입금액을 확인하세요");
				return;
			}
			// 기존에 들어가있던 콤마( , )를 제거한 이 후의 입력값에 다시 콤마( , )를 삽입한다.
			obj.value = inputComma(removeComma(obj.value));
		}
		

	
		function numberWithCommas(x) {
			return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}
		function numberDeleteCommas(x) {
			return x.toString().replace(/\,/g, "");
		}
		var start = 0;
		$(".dw_btn1").click(function(){
			var money = parseInt($(this).attr("money"));
			if(money==-1){
				start = 0;
				$("#depositMoney").val("");
			}
			else{
				start += money;
				$("#depositMoney").val(numberWithCommas(start));
			}
		});
	</script>
</body>
</html>