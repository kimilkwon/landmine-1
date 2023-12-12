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

<body class="home_body">
	<jsp:include page="../frame/page/top.jsp"></jsp:include>
	<div class="content">
		<div class="c_section">
		 <h1 class="h_menu_title"><spring:message code="list.customer" /><span class="h_subtitle"><spring:message code="top.inquiry" /></span></h1>
		 <div class="h_detail_title">
		   <h2 class="h_d_title"><spring:message code="top.inquiry" /></h2>
		   <div class="c_date">${info.qdate}</div>
		 </div>
		<div class="h_d_txtblcok">
			<div>${text}</div>
		 </div>
		 <hr>
		 <div class="h_detail_title">
		   <h2 class="h_d_title"><spring:message code="top.inquiry" /><spring:message code="contactus.answerTitle" /></h2>
		   <div class="c_date">${info.cdate}</div>
		 </div>
		<div class="h_d_txtblcok">
			<c:if test="${info.answer ne null}">
				<div>${info.answer}</div>
			</c:if>
			<c:if test="${info.answer eq null}">
				<div><spring:message code="contactus.answer" /></div>
			</c:if>
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