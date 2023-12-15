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
<body class="body">
	<jsp:include page="../frame/page/top.jsp"></jsp:include>
	
	<div class="content">
	<div class="general_content">
        <div class="container">
          <div class="custermer_sc">
            <h2 class="content_title">고객센터</h2>
            <div class="custermer_title">
              <h3 class="content_sub">문의하기</h3>
            </div>
            <div class="form-block w-form">
              <form id="inquryForm" name="inquryForm" data-name="inquryForm" method="get" data-wf-page-id="657a9af4b11bb7f063a00331" data-wf-element-id="b0f9ba57-3b6e-5dec-1565-8c8330ffbc93" aria-label="Email Form">
                <div class="q_title">
                  <div class="q_title_tit">
                    <div>제목</div>
                  </div><input type="text" class="q_title_input w-input" maxlength="256" name="title" data-name="Field 2" placeholder="제목을 입력해주세요." id="title" required="">
                </div>
                <div class="q_content"><textarea placeholder="내용을 입력해주세요." maxlength="5000" id="text" name="text" data-name="Field" class="q_textarea w-input"></textarea></div>
              </form>
            </div>
            <div class="custermer_btnarea">
              <a href="javascript:insert()" class="c_btn w-button">문의등록</a>
              <a href="/landmine/user/qnaList.do" class="c_btn w-button">목록</a>
            </div>
          </div>
        </div>
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
			if(data.result == 'suc'){
				alert(msg);
				location.href='/landmine/user/qnaList.do';
			}
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