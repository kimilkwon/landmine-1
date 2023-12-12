<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html data-wf-page="644b720cee44451bee727827" data-wf-site="644a0d29c6872cead0a180f0">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="App_Mypage_list" property="og:title">
<meta content="App_Mypage_list" property="twitter:title">

<jsp:include page="../frame/header.jsp"></jsp:include>
<style>
	.list_block::-webkit-scrollbar {
		display: none;
	}
	.list_block {
		-ms-overflow-style: none;
	}
</style>
</head>
<body class="app_body">
	<div class="app_section">
<div class="app_logo"><img src="/landmine/webflow/images/logo_shadow_black.png" loading="lazy" sizes="(max-width: 767px) 18vw, 100px" srcset="/landmine/webflow/images/logo_shadow_black-p-500.png 500w, /landmine/webflow/images/logo_shadow_black-p-800.png 800w, /landmine/webflow/images/logo_shadow_black-p-1080.png 1080w, /landmine/webflow/images/logo_shadow_black-p-1600.png 1600w, /landmine/webflow/images/logo_shadow_black.png 1810w" alt="" class="logo_img"></div>
		<div class="mobile_box">
			<div class="app_screen">
				<div class="app_top">
					
					<jsp:include page="../frame/top.jsp"></jsp:include>
				</div>
				<jsp:include page="../frame/footer.jsp"></jsp:include>
				<div class="app_content">
					<div class="w_infobox">

						<span class="wallet_count">
							<span id="totalKRW"></span>KRW
						</span>
					</div>
					<div class="m_tokken_list">
						<div class="list_top">
							<a href="/landmine/user/app_deposit.do" class="dw_btn w-button"><spring:message code="wellet.deposit" /></a><!-- click -->
							<a href="/landmine/user/app_withdraw_check.do" class="dw_btn w-button"><spring:message code="wellet.withdrawal" /></a>
						</div>
						<div class="list_top2">
							<a href="/landmine/user/app_mypage_list.do?coin=${coin}" id="noKind" class="dwh_list_btn click w-button"><spring:message code="wellet.all" /></a> 
							<a href="/landmine/user/app_mypage_list.do?coin=${coin}&kind=deposit" id="deposit" class="dwh_list_btn click w-button"><spring:message code="wellet.deposit" /></a>
							<a href="/landmine/user/app_mypage_list.do?coin=${coin}&kind=withdraw" id="withdraw" class="dwh_list_btn click w-button"><spring:message code="wellet.withdrawal" /></a>
						</div>
						<div class="list_block2">
							<c:forEach var="item" items="${list}">
									<div class="list_warp2" >
										<div class="list3">
											<div>${item.mdate}</div>
										</div>
										<div class="list4">
											<c:if test="${item.kind eq '+' and item.money ne 0}">
												<div>${item.kind} <fmt:formatNumber value="${item.money}" pattern="#,###"/>KRW</div>
											</c:if>
											<c:if test="${item.kind eq '+' and item.money eq 0}">
												<div>${item.kind} ${item.coinAmount}${coin}</div>
											</c:if>
											
											<c:if test="${item.kind eq '-' and item.money ne 0 and item.stat eq 99}">
												<div>${item.kind} <fmt:formatNumber value="${item.money}" pattern="#,###"/>KRW</div>
											</c:if>
											<c:if test="${item.kind eq '-' and item.money eq 0}">
												<div>${item.kind} ${item.coinAmount}${coin}</div>
											</c:if>
											<c:if test="${item.kind eq '+' and item.stat eq 0}">
													<div class="list_position d"><spring:message code="wellet.deposit" /><spring:message code="wellet.stand" /></div>
											</c:if>
											<c:if test="${item.kind eq '+' and item.stat eq 1}">
												<div class="list_position d"><spring:message code="wellet.deposit" /><spring:message code="wellet.approval" /></div>
											</c:if>
											<c:if test="${item.kind eq '+' and item.stat eq 2}">
												<div class="list_position d"><spring:message code="wellet.deposit" /><spring:message code="wellet.notApproved" /></div>
											</c:if>
											<c:if test="${item.kind eq '+' and item.stat eq 99}">
												<c:if test="${item.memo eq null}">
													<div class="list_position d"><spring:message code="wellet.transmission=" /></div>
												</c:if>
												<c:if test="${item.memo ne null}">
													<div class="list_position d">${item.memo}</div>
												</c:if>
											</c:if>
											<c:if test="${item.kind eq '-' and item.stat eq 0}">
												<div class="list_position w"><spring:message code="wellet.withdrawal" /><spring:message code="wellet.stand" /></div>
											</c:if>
											<c:if test="${item.kind eq '-' and item.stat eq 1}">
												<div class="list_position w"><spring:message code="wellet.withdrawal" /><spring:message code="wellet.approval" /></div>
											</c:if>
											<c:if test="${item.kind eq '-' and item.stat eq 2}">
												<div class="list_position w"><spring:message code="wellet.withdrawal" /><spring:message code="wellet.notApproved" /></div>
											</c:if>
											<c:if test="${item.kind eq '-' and item.stat eq 99}">
												<c:if test="${item.memo eq null}">
													<div class="list_position w"><spring:message code="wellet.transmission=" /></div>
												</c:if>
												<c:if test="${item.memo ne null}">
													<div class="list_position w">${item.memo}</div>
												</c:if>
											</c:if>
											
										</div>
									</div>
								</c:forEach>
							
							<!-- <div class="list_warp2" onclick="location.href='/landmine/user/app_mypage_detail.do'" style="cursor:pointer";> -->
								
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
	<jsp:include page="../frame/js.jsp"></jsp:include>
</body>
<script>
$(document).ready(function(){
	  $("._home").removeClass('click');
	  $("._wallet").addClass('click');
	  $("._service").removeClass('click');
	  var kind = '${kind}';
	  console.log("kind:"+kind);
	  if(kind==''){
		  $("#deposit.dwh_list_btn").removeClass('click');
		  $("#withdraw.dwh_list_btn").removeClass('click');
	  }else if(kind=='+'){
		  $("#noKind.dwh_list_btn").removeClass('click');
		  $("#withdraw.dwh_list_btn").removeClass('click');
	  }else if(kind=='-'){
		  $("#noKind.dwh_list_btn").removeClass('click');
		  $("#deposit.dwh_list_btn").removeClass('click');
	  }
})

var usdtSise = 0.0;
var coinWallet = [0,0,0];
var coinSise = [0,0,0];
var coinW = ["BTC","ETH","XRP"];
var changeMoney = 0;
var usdt = 0;
var cfnum = 5;
var depositAndWithdraw = 0; //0 전체 1 입금 2 출금
$(document).ready(function() {
	  // 페이지 로드가 완료되면 5초마다 자동으로 ajax 요청을 보내는 함수를 호출
	  coinSiseRequest();
	  coinWalletRequest();
	  setInterval(coinWalletRequest, 1000);	 
	  setInterval(coinSiseRequest, 1000);
});
function onDeposit(){
	depositAndWithdraw = 1;
}
function onWithdraw(){
	depositAndWithdraw = 2;
}
function addressCopy(){
	$("#copyInput").attr("type", "text");
	$("#copyInput").val($("#address").text());
	$("#copyInput").select();
	document.execCommand('Copy');
	$("#copyInput").attr("type", "hidden");
	alert("주소가 복사되었습니다. 주소:"+$("#address").text());
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
	var money = '${money}';
	$.ajax({
		type :"post",
		dataType : "json" ,
		url : "/landmine/user/coinWallet.do",
		success:function(data){
			
			coinWallet[0] = data.BTC;
			coinWallet[1] = data.ETH;
			coinWallet[2] = data.XRP;
			
			
			total = numberWithCommas(toFixedDown(parseInt(money)+( coinWallet[0]*coinSise[0]*usdtSise )+( coinWallet[1]*coinSise[1]*usdtSise )+( coinWallet[2]*coinSise[2]*usdtSise ), 0))
			$("#totalKRW").text(total);
		},
		error:function(e){ console.log("ajax error"); }
	});
	
}
</script>
</html>