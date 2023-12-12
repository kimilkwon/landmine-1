<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
	<div class="navbar-header">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
			<span class="sr-only">Toggle navigation</span> 
			<span class="icon-bar"></span> 
			<span class="icon-bar"></span> 
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="index.html">landmine 관리자 페이지</a>
	</div>
	<ul class="nav navbar-top-links navbar-right">
		<li class="dropdown">
			<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
				<i class="fa fa-user fa-fw"></i>
				<i class="fa fa-caret-down"></i>
			</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="/landmine/admin/logout.do"><i class="fa fa-sign-out fa-fw"></i> Logout</a></li>
			</ul>
		</li>
	</ul>
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li><a href="/landmine/admin/member.do"><i class="fa fa-caret-right fa-fw"></i> 회원 목록</a></li>
				<li><a href="#"><i class="fa fa-caret-right fa-fw"></i> 고객 센터<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="/landmine/admin/notice.do">공지사항</a></li>
						<!-- <li><a href="/landmine/admin/faq.do">FAQ</a></li> -->
						<li><a href="/landmine/admin/qna.do">QNA</a></li>
					</ul>
				</li>
				<li><a href="#"><i class="fa fa-caret-right fa-fw"></i> 입출금<span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="/landmine/admin/depositList.do">입금 신청</a></li>
						<li><a href="/landmine/admin/withdrawList.do">출금 신청</a></li>
					</ul>
				</li> 
			</ul>
		</div>
	</div>
</nav>
</body>
</html>