<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html data-wf-page="644b73c353ef613a0e275102" data-wf-site="644a0d29c6872cead0a180f0">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="App_Password" property="og:title">
<meta content="App_Password" property="twitter:title">
<jsp:include page="../frame/header.jsp"></jsp:include>
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
					<div class="system_warp">
						<div class="system_title"><spring:message code="login.txt2" /><br><spring:message code="login.pw" /></div>
						<div class="password_block">
							<div><spring:message code="login.txt3" /><span class="color_span"><spring:message code="login.txt4" /></span><spring:message code="login.txt5" /></div>
							<div class="pw_block">
								<div class="pw_box"><input type="password" class="_pw" id="pw0" style="width:30px; text-align:center; border:none; background:transparent; outline:none;" maxlength="1" autofocus></div>
								<div class="pw_box"><input type="password" class="_pw" id="pw1" style="width:30px; text-align:center; border:none; background:transparent; outline:none;" maxlength="1"></div>
								<div class="pw_box"><input type="password" class="_pw" id="pw2" style="width:30px; text-align:center; border:none; background:transparent; outline:none;" maxlength="1"></div>
								<div class="pw_box"><input type="password" class="_pw" id="pw3" style="width:30px; text-align:center; border:none; background:transparent; outline:none;" maxlength="1"></div>
								<div class="pw_box"><input type="password" class="_pw" id="pw4" style="width:30px; text-align:center; border:none; background:transparent; outline:none;" maxlength="1"></div>
								<div class="pw_box"><input type="password" class="_pw" id="pw5" style="width:30px; text-align:center; border:none; background:transparent; outline:none;" maxlength="1"></div>
							</div>
							<div class="system_warn"><spring:message code="login.txt6" /></div>
						</div>
						<div class="system_btn_warp">
							<a href="#" onclick="setPw()" class="system_btn w-button"><spring:message code="login.next" /></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../frame/js.jsp"></jsp:include>
</body>
<script>
$(document).on("keypress keyup keydown", "input[class=_pw]", function(e){
    if(this.value.length != '0') $(this).parent('.pw_box').addClass('on');
    else $(this).parent('.pw_box').removeClass('on');
    $('._pw').keyup(function (e){
		let bfval = $(this).val();
		re=/[^0-9]/gi;
	});
}); 
function setPw(){
	$.ajax({
		type : 'post',
		data : {'pw0':$("#pw0").val() , 'pw1':$("#pw1").val() , 'pw2':$("#pw2").val() , 'pw3':$("#pw3").val() , 'pw4':$("#pw4").val() , 'pw5':$("#pw5").val()},
		url : '/landmine/setPwProcess1.do',
		success:function(data){
			if(data.result == 'suc') location.href = '/landmine/app_password2.do';
			else alert(data.msg);
		}
	})
}
$('#pw0').on('keyup', function() {
    if(this.value.length == 1) {
       $('#pw1').focus()
    }
});
$('#pw1').on('keyup', function() {
    if(this.value.length == 1) {
       $('#pw2').focus()
    }
});
$('#pw2').on('keyup', function() {
    if(this.value.length == 1) {
       $('#pw3').focus()
    }
});
$('#pw3').on('keyup', function() {
    if(this.value.length == 1) {
       $('#pw4').focus()
    }
});
$('#pw4').on('keyup', function() {
    if(this.value.length == 1) {
       $('#pw5').focus()
    }
});

$('#pw5').on('keyup', function() {
    if(this.value.length == 0) {
       $('#pw4').focus()
    }
});
$('#pw4').on('keyup', function() {
    if(this.value.length == 0) {
       $('#pw3').focus()
    }
});
$('#pw3').on('keyup', function() {
    if(this.value.length == 0) {
       $('#pw2').focus()
    }
});
$('#pw2').on('keyup', function() {
    if(this.value.length == 0) {
       $('#pw1').focus()
    }
});
$('#pw1').on('keyup', function() {
    if(this.value.length == 0) {
       $('#pw0').focus()
    }
});
</script>
</html>