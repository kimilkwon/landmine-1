<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html data-wf-page="644f3f620014988627b2af8c" data-wf-site="644a0d29c6872cead0a180f0">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="App_Custermer_detail" property="og:title">
<meta content="App_Custermer_detail" property="twitter:title">
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
              <h3 class="content_sub">문의내역</h3>
            </div>
            <div class="form-block w-form">
              <form id="email-form" name="email-form" data-name="Email Form" method="get" data-wf-page-id="657a9d282acdd92966f8ecd2" data-wf-element-id="b0f9ba57-3b6e-5dec-1565-8c8330ffbc93" aria-label="Email Form">
                <div class="q_title">
                  <div class="q_title_txt">${info.title}<span class="q_date">${info.qdate}</span></div>
                </div>
                <div class="q_content">
                  <div>${info.text}</div>
                </div>
                <div class="q_content2">
                	<c:if test="${info.answer ne null}">
						<div>답변:${info.answer}</div>
					</c:if>
					<c:if test="${info.answer eq null}">
						<div>답변등록이 되지 않았습니다.</div>
					</c:if>
                </div>
              </form>
          
            </div>
            <div class="custermer_btnarea">
              <a href="/spgame/user/qnaList.do" class="c_btn w-button">목록</a>
            </div>
          </div>
        </div>

   </div>
   </div>
	<jsp:include page="../frame/page/footer.jsp"></jsp:include>
	<jsp:include page="../frame/js.jsp"></jsp:include>
</body>

<script>
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