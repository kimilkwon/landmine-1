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
<body class="home_body">
	<jsp:include page="../frame/page/top.jsp"></jsp:include>
	<div class="content">
	<div class="c_section">
	 <h1 class="h_menu_title">
	 <spring:message code="list.customer" />
	 <span class="h_subtitle"><spring:message code="top.inquiry" /></span></h1>
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
	</div>
	<jsp:include page="../frame/page/footer.jsp"></jsp:include>
	<jsp:include page="../frame/js.jsp"></jsp:include>
</body>
<script>
function insert(){
	$.ajax({
		type : 'post',
		url : '/landmine/user/askInsertProcess.do',
		data : $("#inquryForm").serialize(),
		success : function(data){
			var msg = "<spring:message code='contactus.qnasucMsg' />";
			if(data.result == 'suc') alert(msg);
			else alert(data.msg);
		}
	})
}
function popupOff(){
	$(".ap_complete_pop").css('display','none');
}

  //<-- 퍼블 script
  $(".lang_wawrp").hover(
  		function(){$(this).children(".lang_box").toggleClass("on")
	});

  $(".nav_warp").hover(
		  function(){$(this).children(".top_arrow").toggleClass("on")
		  	$(this).children(".nav_toggle").toggleClass("on")
	});

	$('.mobile_menu_btn').hover(function() {
      	$('.mobile_menupop').css('display', 'flex');
    });
	//---->

</script>
</html>