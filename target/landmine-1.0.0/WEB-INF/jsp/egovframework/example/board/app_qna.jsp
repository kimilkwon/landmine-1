<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html data-wf-page="644f41cdb695816987596472" data-wf-site="644a0d29c6872cead0a180f0">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="App_Custermer_1on1" property="og:title">
<meta content="App_Custermer_1on1" property="twitter:title">
<jsp:include page="../frame/header.jsp"></jsp:include>
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
					<div class="c_content">
						<div class="form-block w-form">
							<form id="inquryForm" name="inquryForm" method="get">
								<div class="c_contentblcok">
									<div class="input_warp">
										<div class="input_title"><spring:message code="contactus.name" /></div>
										<div class="input_box">
											<input type="text" class="input w-input" name="name">
										</div>
									</div>
									<div class="input_warp">
										<div class="input_title"><spring:message code="contactus.email" /></div>
										<div class="input_selectwarp">
											<div class="select_box _2">
												<input type="text" class="input w-input" name="email0">
											</div>
											<div class="select_box _2">
												<select id="field-4" name="email1" class="select-field w-select">
													<option value=""><spring:message code="contactus.choice" /></option>
													<option value="@naver.com">naver.com</option>
													<option value="@hanmail.net">hanmail.net</option>
													<option value="@nate.com">nate.com</option>
													<option value="@yahoo.co.kr">yahoo.co.kr</option>
													<option value="@gmail.com">gmail.com</option>
												</select>
											</div>
										</div>
									</div>
									<div class="input_warp">
										<div class="input_title"><spring:message code="contactus.content" /></div>
										<textarea name="text" class="textarea w-input"></textarea>
									</div>
									<a href="#" onclick="insert()" class="system_btn w-button"><spring:message code="contactus.check" /></a>
								</div>
							</form>
						</div>
						<div class="system_btn_warp"></div>
					</div>
				</div>
				<div class="ap_complete_pop" style="display: none;">
					<div class="general_popbox">
						<div class="form-block w-form">
							<form id="email-form-2" name="email-form-2" data-name="Email Form 2" method="get">
								<div class="pop_content _2">
									<div class="pop_exsit" onclick="popupOff()">
										<img src="/landmine/webflow/images/wx_black.png" loading="lazy" sizes="100vw" srcset="/landmine/webflow/images/wx_black-p-500.png 500w, /landmine/webflow/images/wx_black-p-800.png 800w, /landmine/webflow/images/wx_black-p-1080.png 1080w, /landmine/webflow/images/wx_black.png 1600w" alt="" class="pop_exsit_img">
									</div>
									<img src="/landmine/webflow/images/FEW-05.png" loading="lazy" alt=""
										class="pop_img">
									<div><spring:message code="contactus.qnasucMsg" /></div>
									<div class="s_warn">
										<spring:message code="contactus.qnasucMsg2" />
									</div>
								</div>
							</form>
						</div>
						<div class="g_pop_btnwarp">
							<a href="javascript:location.reload();" class="g_pop_btn2 w-button"><spring:message code="contactus.check" /></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../frame/js.jsp"></jsp:include>
</body>
<script>
function insert(){
	$.ajax({
		type : 'post',
		url : '/landmine/user/askInsertProcess.do',
		data : $("#inquryForm").serialize(),
		success : function(data){
			if(data.result == 'suc') $(".ap_complete_pop").css('display','flex');
			else alert(data.msg);
		}
	})
}
function popupOff(){
	$(".ap_complete_pop").css('display','none');
}
$(document).ready(function(){
	  $("._home").removeClass('click');
	  $("._wallet").removeClass('click');
	  $("._service").addClass('click');
})
</script>
</html>