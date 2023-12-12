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
		  <div class="banner_box _2">
			<div class="banner_txt">
			  <h1 class="banner_head _2"><spring:message code="swarps.banner1.title" /></h1>
			</div><img src="/landmine/webflow/images/swarp_header.png" loading="lazy" sizes="(max-width: 991px) 200px, 350px" srcset="/landmine/webflow/images/swarp_header.png 500w, /landmine/webflow/images/swarp_header.png 560w" alt="" class="banner_img _2">
		  </div>
		</div>
		<div class="section2">
		  <div class="main_txtbox">
			<h2 class="main_title"><spring:message code="swarps.banner2.title" /></h2>
			<div class="main_subtitle"><spring:message code="swarps.banner2.txt" /></div>
		  </div>
		  <div class="s_itemwarp"><img src="/landmine/webflow/images/mobile_03.png" loading="lazy" sizes="(max-width: 767px) 15vw, (max-width: 991px) 100px, 250px" srcset="/landmine/webflow/images/mobile_03.png 500w, /landmine/webflow/images/mobile_03.png 768w" alt="" class="s_item"><img src="/landmine/webflow/images/mobile_04.png" loading="lazy" sizes="(max-width: 767px) 15vw, (max-width: 991px) 100px, 250px" srcset="/landmine/webflow/images/mobile_04.png 500w, /landmine/webflow/images/mobile_04.png 768w" alt="" class="s_item"><img src="/landmine/webflow/images/mobile_06.png" loading="lazy" sizes="(max-width: 767px) 15vw, (max-width: 991px) 100px, 250px" srcset="/landmine/webflow/images/mobile_06.png 500w, /landmine/webflow/images/mobile_06.png 768w" alt="" class="s_item"><img src="/landmine/webflow/images/mobile_08.png" loading="lazy" sizes="(max-width: 767px) 15vw, (max-width: 991px) 100px, 250px" srcset="/landmine/webflow/images/mobile_08.png 500w, /landmine/webflow/images/mobile_08.png 768w" alt="" class="s_item"></div>
		</div>
		<div class="section _2">
		  <div class="main_txtbox">
			<h2 class="main_title"><strong><spring:message code="swarps.banner3.title1" /></strong></h2>
			<div class="main_subtitle"><spring:message code="swarps.banner3.txt1" /></div>
		  </div><img src="/landmine/webflow/images/swaps_img.svg" loading="lazy" alt="" class="main_img">
		</div>
		<div class="section _2"><img src="/landmine/webflow/images/Quotes.webp" loading="lazy" sizes="(max-width: 479px) 92vw, 400px" srcset="/landmine/webflow/images/Quotes.webp 500w, /landmine/webflow/images/Quotes.webp 800w, /landmine/webflow/images/Quotes.webp 828w" alt="" class="s_img">
		  <div class="main_txtbox">
			<h2 class="main_title"><spring:message code="swarps.banner3.title2" /></h2>
			<div class="main_subtitle"><spring:message code="swarps.banner3.txt2" /></div>
		  </div>
		</div>
		<div class="section _2">
		  <div class="main_txtbox">
			<h2 class="main_title"><spring:message code="swarps.banner3.title3" /></h2>
			<div class="main_subtitle"><spring:message code="swarps.banner3.txt3" /></div>
		  </div><img src="/landmine/webflow/images/Approvals.webp" loading="lazy" sizes="(max-width: 479px) 92vw, 400px" srcset="/landmine/webflow/images/Approvals.webp 500w, /landmine/webflow/images/Approvals.webp 800w, /landmine/webflow/images/Approvals.webp 958w" alt="" class="s_img">
		</div>
		<div class="section _2"><img src="/landmine/webflow/images/Slippage.webp" loading="lazy" sizes="(max-width: 479px) 92vw, 400px" srcset="/landmine/webflow/images/Slippage.webp 500w, /landmine/webflow/images/Slippage.webp 800w, /landmine/webflow/images/Slippage.webp 880w" alt="" class="s_img">
		  <div class="main_txtbox">
			<h2 class="main_title"><spring:message code="swarps.banner3.title4" /><br></h2>
			<div class="main_subtitle"><spring:message code="swarps.banner3.txt4" /></div>
		  </div>
		</div>
		<div class="section">
		  <h2 class="main_title"><spring:message code="swarps.banner4.title" /></h2>
		  <div class="main_subtitle"><spring:message code="swarps.banner4.txt" /></div>
		  <c:if test="${userIdx eq 'null' or empty userIdx }">
			<a href="/landmine/app_register.do" class="main_btn w-button"><spring:message code="swarps.banner4.btn" /></a>
		</c:if>
		<c:if test="${userIdx ne 'null' and not empty userIdx}">
			<a href="/landmine/user/app_mypage.do" class="main_btn w-button"><spring:message code="swarps.banner4.btn" /></a>
		</c:if>
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
  </script>
</html>