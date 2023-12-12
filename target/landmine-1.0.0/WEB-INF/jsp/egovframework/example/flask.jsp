<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html data-wf-page="644a3c788608b013b811cf8a" data-wf-site="644a0d29c6872cead0a180f0">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="App_home" property="og:title">
<meta content="App_home" property="twitter:title">
<jsp:include page="frame/header.jsp"></jsp:include>
</head>
<body class="home_body">
	<jsp:include page="frame/page/top.jsp"></jsp:include>
	<div class="content">
		<div class="banner">
		  <div class="banner_box">
			<div class="banner_txt">
			  <h1 class="banner_head"><span class="intro_title_sub"><spring:message code="flask.banner1.title" /></span><br><spring:message code="flask.banner1.title1" /></h1>
			  <div><spring:message code="flask.banner1.txt" /></div>
			</div><img src="/landmine/webflow/images/Flask_Hero.png" loading="lazy" sizes="(max-width: 767px) 83vw, (max-width: 991px) 90vw, 800px" srcset="/landmine/webflow/images/Flask_Hero-p-500.png 500w, /landmine/webflow/images/Flask_Hero-p-800.png 800w, /landmine/webflow/images/Flask_Hero-p-1080.png 1080w, /landmine/webflow/images/Flask_Hero-p-1600.png 1600w, /landmine/webflow/images/Flask_Hero.png 1920w" alt="" class="banner_img">
			<a href="javascript:alertPop()" class="dn_btn w-button"><spring:message code="flask.banner1.btn" /></a>
		  </div>
		</div>
		<div class="section _2">
		  <div class="main_txtbox">
			<h2 class="intro_sc_title"><span class="intro_title_sub"><spring:message code="flask.banner2.title" /></span><br><spring:message code="flask.banner2.title1" /></h2>
			<div><spring:message code="flask.banner2.txt" /></div>
		  </div><img src="/landmine/webflow/images/boan_img.png" loading="lazy" sizes="(max-width: 767px) 45vw, (max-width: 991px) 240px, 250px" srcset="/landmine/webflow/images/boan_img.png 500w, /landmine/webflow/images/boan_img.png 546w" alt="" class="main_img">
		</div>
		<div class="section _3">
		  <div class="main_txtbox">
			<h2 class="intro_sc_title"><span class="intro_title_sub"><spring:message code="flask.banner3.title" /></span><br><spring:message code="flask.banner3.title1" /></h2>
			<div> <spring:message code="flask.banner3.txt" /></div>
		  </div><img src="/landmine/webflow/images/Bring_your_APIs_to_MetaMask.png" loading="lazy" sizes="(max-width: 767px) 45vw, (max-width: 991px) 240px, 250px" srcset="/landmine/webflow/images/Bring_your_APIs_to_MetaMask-p-500.png 500w, /landmine/webflow/images/Bring_your_APIs_to_MetaMask-p-800.png 800w, /landmine/webflow/images/Bring_your_APIs_to_MetaMask.png 1008w" alt="" class="main_img">
		</div>
		<div class="section">
		  <h2 class="main_title"><spring:message code="flask.banner4.title" /></h2>
		  <div class="main_subtitle"><spring:message code="flask.banner4.txt" /><br></div>
		  <div class="intro_list">
			<div class="intro_qna" onclick="moveFaq()">
				<div class="intro_qna_title">
					<div><spring:message code="flask.banner4.btn" /></div><img src="/landmine/webflow/images/wx.png" loading="lazy" sizes="(max-width: 767px) 6vw, (max-width: 991px) 33.941162109375px, 3vw" srcset="/landmine/webflow/images/wx-p-500.png 500w, /landmine/webflow/images/wx-p-800.png 800w, /landmine/webflow/images/wx-p-1080.png 1080w, /landmine/webflow/images/wx.png 1600w" alt="" class="qna_icon">
				</div>
			</div>
		  </div>
		</div>
	  </div>
	<jsp:include page="frame/page/footer.jsp"></jsp:include>
	<jsp:include page="frame/js.jsp"></jsp:include>
	<script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=64afbe4e8ebe5f98389608e1" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
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

	  function moveFaq(){
		var faqListUrl = "/landmine/user/faqList.do";
    
		// 새로운 페이지로 이동합니다.
		window.location.href = faqListUrl;
	  }

  </script>
</html>