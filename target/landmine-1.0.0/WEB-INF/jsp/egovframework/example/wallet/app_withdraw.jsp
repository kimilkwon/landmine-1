<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html data-wf-page="644b94d9be660b20ca558558" data-wf-site="644a0d29c6872cead0a180f0">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="App_Withdraw_check" property="og:title">
<meta content="App_Withdraw_check" property="twitter:title">
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
				<div class="app_top _2">
					<jsp:include page="../frame/top.jsp"></jsp:include>
				</div>
				<div class="app_content">
					<div class="dnw_box">
						<div class="total_txt">
							<spring:message code="withdraw.txt8" /><br>
							<span class="count_txt">${amount} ${coin}</span>
						</div>
					</div>
					<div class="dnw_block _2">
						<div class="dnw_adrs_block">
							<div class="dnw_adrs_warp">
								<div>From</div>
								<div class="m_address">
									<div>${myAddress}</div>
								</div>
							</div>
							<img src="/landmine/webflow/images/blue_arrow.svg" loading="lazy" alt="" class="bnw_arrow">
							<div class="dnw_adrs_warp">
								<div>To</div>
								<div class="m_address">
									<div>${address}</div>
								</div>
							</div>
						</div>
						<div class="system_btn_warp">
							<div class="system_warn warn_red">
								<spring:message code="withdraw.txt9" />
							</div>
							<div class="btnwarp">
								<a href="javascript:withdrawProcess()" class="system_btn2 _3 w-button"><spring:message code="withdraw.txt10" /></a> 
								<a href="/landmine/user/app_mypage.do" class="system_btn2 w-button"><spring:message code="exchange.txt6" /></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../frame/js.jsp"></jsp:include>
</body>
<script>
	function withdrawProcess() {
		var address = "${address}";
		var amount = "${amount}";
		var coin = "${coin}";
		console.log("address:"+address+"amount:"+amount);
		var data = { "address" : address,"amount":amount,"coin":coin };
		$.ajax({
			type :"post",
			data:data,
			dataType : "json" ,
			url : "/landmine/user/withdrawProcess.do",
			success:function(data){
				if(data.result == "success"){
					alert(data.msg);
					location.href="/landmine/user/app_mypage.do";
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