<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<div class="top">
	<div class="top_warp">
		<a href="/spgame/user/main.do" class="top_logo w-inline-block"><img
			src="/spgame/webflow/images/logo_spen_1.svg"
			loading="lazy" alt="" class="logo_img"></a>
		<div class="nav_area">
			<a href="/spgame/user/game.do" class="nav_btn active w-button">게임</a>
			<a href="/spgame/user/noticeList.do" class="nav_btn w-button">공지사항</a>
			 <div class="nav_warp">
				<a href="/spgame/user/deposit.do" class="nav_btn w-button">입출금</a>
				<div class="nav_toggle">
					<a href="/spgame/user/deposit.do" class="toggle_btn w-button">입금</a>
					<a href="/spgame/user/withdrawal.do" class="toggle_btn w-button">출금</a>
				</div>
			</div>
			<a href="/spgame/user/qnaList.do" class="nav_btn w-button">문의내역</a>
			<a href="/spgame/user/betList.do" class="nav_btn w-button">배팅내역</a>
			<!--
			<a href="#" class="nav_btn w-button">공지사항</a>
			<a href="#" class="nav_btn w-button">고객센터</a>
			<a href="#" class="nav_btn w-button">쪽지함</a>
			<a href="#" class="nav_btn w-button">배팅내역</a>
			<a href="#" class="nav_btn w-button">마이페이지</a> -->
		</div>
		
		
			<c:if test="${userIdx ne 'null'}">
				<div class="point_info">
					<div class="point_title">보유금액:</div>
					<div>
						<span class="point_span">0</span> 원
					</div>
					<a href="/spgame/logout.do" class="logout_btn w-button">로그아웃</a>
				</div>
			</c:if>
			<c:if test="${userIdx eq 'null'}">
				<div class="login_area" style="display:flex;">
					<a href="/spgame/login.do" class="login_btn w-button">로그인</a>
					<a href="/spgame/join.do" class="regist_btn w-button">회원가입</a>
				</div>
			</c:if>
		<div class="mob_menu" onclick="mobMenu()">
			<div class="mob_menu_btn">
				<img
					src="https://assets-global.website-files.com/6552cea403b55036cfb448a4/655c3a225b32e5086ce2a888_menu2_w.svg"
					loading="lazy" alt="" class="mob_menu_img">
			</div>
			<div class="mob_menu_container" style="display:none;">
				<div class="mob_exsit"></div>
				<div class="mob_menu_area">
					
					<div class="m_menu_btnwarp">
						<a href="/spgame/user/game.do" class="m_menu_btn1 w-inline-block">게임</a><div></div>
					</div>
					
					<div class="m_menu_btnwarp">
						<a href="/spgame/user/noticeList.do" class="m_menu_btn1 w-inline-block">공지사항</a>
					</div>
					<br>
				 	<div class="m_menu_btnwarp">
						<a href="/spgame/user/deposit.do" class="m_menu_btn1 w-inline-block">입금</a>
						<a href="/spgame/user/withdrawal.do" class="m_menu_btn1 w-inline-block">출금</a>
					</div>
					<br>
					<div class="m_menu_btnwarp">
						<a href="/spgame/user/qnaList.do" class="m_menu_btn1 w-inline-block">문의내역</a>
						<a href="/spgame/user/betList.do" class="m_menu_btn1 w-inline-block">배팅내역</a>
					</div>
				</div>
			</div> 
		</div>
	</div>
</div>
<script>

$(".nav_warp").hover(
function(){$(this).children(".nav_toggle").stop().slideToggle(200);});


function mobMenu(){
	if($(".mob_menu_container").css("display")=="none"){
		$(".mob_menu_container").css("display","flex");
		
	}else{
		$(".mob_menu_container").css("display","none");
	}
}
</script>
