<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.util.*"%>
<%
	NiceID.Check.CPClient niceCheck = new NiceID.Check.CPClient();

	String sSiteCode = "BZ557"; // NICE로부터 부여받은 사이트 코드
	String sSitePassword = "Hh6zYNNGKc5M"; // NICE로부터 부여받은 사이트 패스워드

	String sRequestNumber = "REQ0000000001"; // 요청 번호, 이는 성공/실패후에 같은 값으로 되돌려주게 되므로 
												// 업체에서 적절하게 변경하여 쓰거나, 아래와 같이 생성한다.
	sRequestNumber = niceCheck.getRequestNO(sSiteCode);
	session.setAttribute("REQ_SEQ", sRequestNumber); // 해킹등의 방지를 위하여 세션을 쓴다면, 세션에 요청번호를 넣는다.

	String sAuthType = ""; // 없으면 기본 선택화면, M: 핸드폰, C: 신용카드, X: 공인인증서

	String popgubun = "N"; //Y : 취소버튼 있음 / N : 취소버튼 없음
	String customize = ""; //없으면 기본 웹페이지 / Mobile : 모바일페이지

	String sGender = ""; //없으면 기본 선택 값, 0 : 여자, 1 : 남자 

	// CheckPlus(본인인증) 처리 후, 결과 데이타를 리턴 받기위해 다음예제와 같이 http부터 입력합니다.
	//리턴url은 인증 전 인증페이지를 호출하기 전 url과 동일해야 합니다. ex) 인증 전 url : http://www.~ 리턴 url : http://www.~
	String sReturnUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ "/spgame/identifyresult.do"; // 성공시 이동될 URL
	String sErrorUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ "/spgame/failresult.do"; // 실패시 이동될 URL
	// 입력될 plain 데이타를 만든다.
	String sPlainData = "7:REQ_SEQ" + sRequestNumber.getBytes().length + ":" + sRequestNumber + "8:SITECODE"
			+ sSiteCode.getBytes().length + ":" + sSiteCode + "9:AUTH_TYPE" + sAuthType.getBytes().length + ":"
			+ sAuthType + "7:RTN_URL" + sReturnUrl.getBytes().length + ":" + sReturnUrl + "7:ERR_URL"
			+ sErrorUrl.getBytes().length + ":" + sErrorUrl + "11:POPUP_GUBUN" + popgubun.getBytes().length
			+ ":" + popgubun + "9:CUSTOMIZE" + customize.getBytes().length + ":" + customize + "6:GENDER"
			+ sGender.getBytes().length + ":" + sGender;

	String sMessage = "";
	String sEncData = "";

	int iReturn = niceCheck.fnEncode(sSiteCode, sSitePassword, sPlainData);
	if (iReturn == 0) {
		sEncData = niceCheck.getCipherData();
	} else if (iReturn == -1) {
		sMessage = "암호화 시스템 에러입니다.";
	} else if (iReturn == -2) {
		sMessage = "암호화 처리오류입니다.";
	} else if (iReturn == -3) {
		sMessage = "암호화 데이터 오류입니다.";
	} else if (iReturn == -9) {
		sMessage = "입력 데이터 오류입니다.";
	} else {
		sMessage = "알수 없는 에러 입니다. iReturn : " + iReturn;
	}
%>

<script language='javascript'>
	window.name = "Parent_window";

	function fnPopup() {
		window.open('', 'popupChk', 'width=500, height=550, top=100, left=100, fullscreen=no, menubar=no, status=no, toolbar=no, titlebar=yes, location=no, scrollbar=no');
		document.form_chk.action = "https://nice.checkplus.co.kr/CheckPlusSafeModel/checkplus.cb";
		document.form_chk.target = "popupChk";
		document.form_chk.submit();
	}

	//function getphone(hpn, sBirthDate, idnum, sName, di, suc, aa)
	function getphone(hpn, sBirthDate, sName, suc) {
		if (suc == 0) {
			$("#phone").val(hpn);
			$("#phone").prop("readonly", true);
			//$(".verbtn").html("휴대폰 인증 완료");
			//$("#name").val(sName);
			checkPhone =  true;
			//phonecheck = 1;
		} else {
			alert("이미 가입된 상태입니다.");
			//$("#phoneJ").val("");
		}
	}
</script>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html data-wf-page="644b7fbd837f481254e550fe" data-wf-site="644a0d29c6872cead0a180f0">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="App_Regist" property="og:title">
<meta content="App_Regist" property="twitter:title">
<jsp:include page="../frame/header.jsp"></jsp:include>
</head>
<body class="app_body">
	<form name="form_chk" method="post">
		<input type="hidden" name="m" value="checkplusSerivce">
		<!-- 필수 데이타로, 누락하시면 안됩니다. -->
		<input type="hidden" name="EncodeData" value="<%=sEncData%>">
		<!-- 위에서 업체정보를 암호화 한 데이타입니다. -->
	</form>
	<div class="app_section">
		<div class="app_logo"><img src="/spgame/webflow/images/logo_shadow_black.png" loading="lazy" sizes="(max-width: 767px) 18vw, 100px" srcset="/spgame/webflow/images/logo_shadow_black-p-500.png 500w, /spgame/webflow/images/logo_shadow_black-p-800.png 800w, /spgame/webflow/images/logo_shadow_black-p-1080.png 1080w, /spgame/webflow/images/logo_shadow_black-p-1600.png 1600w, /spgame/webflow/images/logo_shadow_black.png 1810w" alt="" class="logo_img"></div>
		<div class="mobile_box">
			<div class="app_screen _2">
				<div class="app_top">
					<div class="app_menu_warp">
						<div class="ap_menu_btn" onclick="location.href='/spgame/app_start.do'">
							<div class="ap_menu_icon w-embed">
								<?xml version="1.0" encoding="UTF-8"?>
								<svg xmlns="http://www.w3.org/2000/svg" viewbox="0 0 14.48 8.83">
									<defs>
										<style>
											.cls-1 {
												fill: currentColor;
											}
										</style>
									</defs> 
									<g> 
										<path class="cls-1" d="m4.73,7.97c.2.2.2.51,0,.71s-.51.2-.71,0L.11,4.77s-.02-.02-.03-.03H.08s0-.01,0-.02H.07v-.02H.07c-.04-.08-.07-.17-.07-.26s.02-.18.07-.25H.07v-.02H.07s0-.02,0-.03H.08s.02-.02.03-.03L4.02.14c.2-.19.51-.19.71,0,.2.2.2.51,0,.71L1.67,3.91h12.31c.28,0,.5.22.5.5s-.22.5-.5.5H1.67l3.07,3.06h0Z"></path>
									</g> 
								</svg>
							</div>
						</div>
					</div>
					<div class="top_title">회원가입</div>
				</div>
				<div class="app_content">
					<div class="system_warp">
						<img src="/spgame/webflow/images/logo_shadow_black.png" loading="lazy" sizes="(max-width: 767px) 18vw, 100px" srcset="/spgame/webflow/images/logo_shadow_black-p-500.png 500w, /spgame/webflow/images/logo_shadow_black-p-800.png 800w, /spgame/webflow/images/logo_shadow_black-p-1080.png 1080w, /spgame/webflow/images/logo_shadow_black-p-1600.png 1600w, /spgame/webflow/images/logo_shadow_black.png 1810w" alt="" class="start_logo">
						<div>가장 안전한 자산관리의 시작</div>
						<div class="form-block w-form">
							<form id="joinForm" name="joinForm">
								<div class="input_warp">
									<div class="input_title">성명</div>
									<div class="input_box">
										<input type="text" class="input w-input" name="name" autofocus>
									</div>
								</div>
								<div class="input_warp">
									<div class="input_title">생년월일</div>
									<div class="input_selectwarp">
										<div class="select_box">
											<select name="birth0" class="select-field w-select">
												<option value="">년도</option>
												<c:forEach begin="1950" end="2020" step="1" var="i">
													<option value="${i}">${i}</option>
												</c:forEach>
											</select>
										</div>
										<div class="select_box _2">
											<select name="birth1" class="select-field w-select">
												<option value="">월</option>
												<c:forEach begin="1" end="12" step="1" var="i">
													<option value="${i}">${i}</option>
												</c:forEach>
											</select>
										</div>
										<div class="select_box _2">
											<select name="birth2" class="select-field w-select">
												<option value="">일</option>
												<c:forEach begin="1" end="31" step="1" var="i">
													<option value="${i}">${i}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
								<div class="input_warp">
									<div class="input_title">전화번호</div>
									<div class="input_box">
										<input type="text" class="input3 w-input _phone" name="phone" id="phone" placeholder="숫자만 입력해 주세요" > 
										<a href="#" onclick="fnPopup()"class="input_btn2 w-button">문자인증</a>
									</div>
								</div>
								<div class="input_warp">
									<div class="input_title">아이디</div>
									<div class="input_box">
										<input type="text" class="input3 w-input" name="id" id="id"> 
										<a href="#" onclick="idCheck()" class="input_btn2 w-button">중복확인</a>
									</div>
								</div>
								<div class="input_warp">
									<div class="input_title">비밀번호</div>
									<div class="input_box">
										<input type="password" class="input w-input" name="pw">
									</div>
								</div>
								<div class="input_warp">
									<div class="input_title">비밀번호 확인</div>
									<div class="input_box">
										<input type="password" class="input w-input" name="pwck">
									</div>
								</div>
							</form>
						</div>
						<div class="system_btn_warp">
							<a href="#" onclick="signUp()" class="system_btn w-button">확인</a><!-- 일단 문자 인증 빼고 진행해서 '확인'으로 글자 바꿈 문자 인증 진행할 시 '다음'으로 글자 바꿔야 함 -->
						</div>
					</div>
				</div>
				<div class="ap_authpop">
					<div class="general_popbox">
						<div class="form-block w-form">
							<form id="email-form-2" name="email-form-2" method="get">
								<div class="pop_content">
									<div class="pop_title1">전화번호 인증</div>
									<div class="input_box">
										<input type="text" class="input3 w-input" name="field-2"> 
										<a href="#" class="input_btn2 w-button">문자인증</a>
									</div>
									<div class="pop_exsit">
										<img src="https://d3e54v103j8qbb.cloudfront.net/plugins/Basic/assets/placeholder.60f9b1840c.svg" loading="lazy" alt="" class="pop_exsit_img">
									</div>
									<div class="s_warn">5분 이내로 인증번호(6자리)를 입력해주세요.</div>
								</div>
							</form>
						</div>
						<div class="g_pop_btnwarp">
							<a href="popupClose()" class="g_pop_btn _2 w-button">취소</a> 
							<a href="#" class="g_pop_btn w-button">확인</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../frame/js.jsp"></jsp:include>
</body>
<script>
function signUp(){
	$.ajax({
		type : 'post',
		data : $("#joinForm").serialize(),
		url : '/spgame/joinProcess.do',
		success:function(data){
			if(data.result == 'suc') location.href = '/spgame/app_password1.do';
			else alert(data.msg);
		}
	})
}
function popupShow(){
	$(".ap_authpop").show();
}
function popupClose(){
	$(".ap_authpop").hide();
}
function idCheck(){
	$.ajax({
		type : 'post',
		data : {'id':$("#id").val()},
		url : '/spgame/idCheckProcess.do',
		success:function(data){
			if(data.result == 'suc') alert('사용 가능한 아이디입니다.');
			else alert(data.msg);
		}
	})
}
$(document).ready(function(){
	$('._phone').keyup(function (e){
		let bfval = $(this).val();
		re=/[^0-9]/gi;
		$("._phone").val(bfval.replace(re,""));
	});
});
</script>
</html>