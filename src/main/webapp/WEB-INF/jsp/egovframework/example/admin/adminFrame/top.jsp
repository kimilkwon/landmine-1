<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
<div class="navbar-header">
	<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
		<span class="sr-only">Toggle navigation</span> 
		<span class="icon-bar"></span> 
		<span class="icon-bar"></span> 
		<span class="icon-bar"></span>
	</button>
	<a class="navbar-brand" href="index.html">landmine</a>
</div>
<!-- /.navbar-header -->

<ul class="nav navbar-top-links navbar-right">
	<!-- /.dropdown -->
	<li class="dropdown">
		<a class="dropdown-toggle" data-toggle="dropdown" href="#"> 
			<i class="fa fa-user fa-fw"></i>
			<i class="fa fa-caret-down"></i>
		</a>
		<ul class="dropdown-menu dropdown-user">
			<li><a href="/spgame/admin/logout.do"><i class="fa fa-sign-out fa-fw"></i> Logout</a></li>
		</ul> <!-- /.dropdown-user -->
	</li>
	<!-- /.dropdown -->
</ul>
<!-- /.navbar-top-links -->

<div class="navbar-default sidebar" role="navigation">
	<div class="sidebar-nav navbar-collapse">
		<ul class="nav" id="side-menu">
			<li><a href="/spgame/admin/staff.do"><i class="fa fa-caret-right fa-fw"></i> 직원 관리</a></li>
			<li><a href="/spgame/admin/game.do"><i class="fa fa-caret-right fa-fw"></i> 게임 관리</a></li>
			<li><a href="/spgame/admin/menu.do"><i class="fa fa-caret-right fa-fw"></i> 메뉴 관리</a></li>
			<li><a href="/spgame/admin/calculate.do"><i class="fa fa-caret-right fa-fw"></i> 정산 관리</a></li>
			<li><a href="#"><i class="fa fa-caret-right fa-fw"></i> 고객 센터<span class="fa arrow"></span></a>
				<ul class="nav nav-second-level">
					<li><a href="/spgame/admin/notice.do">공지사항</a></li>
					<li><a href="/spgame/admin/customerOpinion.do">고객의견</a></li>
				</ul>
			</li>
		</ul>
	</div>
	<!-- /.sidebar-collapse -->
</div>
<!-- /.navbar-static-side --> </nav>
</body>
</html>