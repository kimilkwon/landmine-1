<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html data-wf-page="64b0b735061c5fcdf0dbe592" data-wf-site="64afbe4e8ebe5f98389608e1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="App_home" property="og:title">
<meta content="App_home" property="twitter:title">
<jsp:include page="../frame/header.jsp"></jsp:include>
</head>
<style>
.log_warp.error {
    background-color: var(--red);
    color:white;
}
</style>

<body class="body">
  <div class="frame">
    <jsp:include page="../frame/page/top.jsp"></jsp:include>
    <div class="content">
      <div class="container">
        <div class="game_frame">
          <div class="bet_area">
            <div class="game_balance">
              <div class="balance_title">BALANCE</div>
              <div class="balance_count" id="totalMoney">0</div>
            </div>
            <div class="game_bet_btnarea1">
              <div class="bet_btn_warp">
                <a href="#" money="-1"class="bet_btn zero w-button">0</a>
                <a href="#" money="MIN"class="bet_btn w-button">MIN</a>
                <a href="#" money="MAX"class="bet_btn w-button">MAX</a>
              </div>
              <div class="bet_btn_warp">
                <a href="#" money="1000" class="bet_btn plus w-button">+1000</a>
                <a href="#" money="5000" class="bet_btn plus w-button">+5000</a>
                <a href="#" money="10000" class="bet_btn plus w-button">+10000</a>
              </div>
              <div class="bet_btn_warp">
                <a href="#" money="-1000" class="bet_btn minus w-button">-1000</a>
                <a href="#" money="-5000" class="bet_btn minus w-button">-5000</a>
                <a href="#" money="x2" class="bet_btn w-button">X2</a>
              </div>
            </div>
            <div class="game_bet_btnarea2">
              <div class="form-block w-form">
                <form id="email-form" name="email-form" data-name="Email Form" method="get" data-wf-page-id="6552cea403b55036cfb448a7" data-wf-element-id="a76e4f6a-d317-24b7-2225-5b5217999878">
                  <div class="bet_input_warp1">
                  <input type="text" class="bet_input w-input" maxlength="256" id="betMoney" name="field" data-name="Field" id="field" required="" >
                    <a href="javascript:gameStart()" class="bet_input_btn w-button">시작</a>
                  </div>
                  <div class="bet_count_btnwarp">
                    <a href="#" class="bet_count_btn w-button" count="1">1</a>
                    <a href="#" class="bet_count_btn w-button"count="3">3</a>
                    <a href="#" class="bet_count_btn active w-button"count="5">5</a>
                    <a href="#" class="bet_count_btn w-button"count="10">10</a>
                  </div>
                </form>
              </div>
            </div>
          </div>
          <div class="game_notice" style="display:none;">
            	시작된 게임이 있습니다.
          </div>
          <div class="game_notice red" style="display:none;">
            	최소 배팅금액은 1,000원 입니다.
          </div>
          <div class="game">
          </div>
         </div>
        </div>
       </div>
          


	<jsp:include page="../frame/page/footer.jsp"></jsp:include>
  </div>
	
	<jsp:include page="../frame/js.jsp"></jsp:include>
	<script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=64afbe4e8ebe5f98389608e1" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  </body>
   

  <script>
  	const useridx = Number("${userIdx}");
	console.log("useridx"+useridx);
	const serverport = '<%=request.getServerPort()%>';
	let servername = '<%=request.getServerName()%>';
	
	console.log("웹소켓1");

	
	//<-- 퍼블 script
	
  </script>
  <script src="../js/game.js?v=2" type="text/javascript"></script>
  <script src="../js/gameServer.js?v=17" type="text/javascript"></script>
</html>