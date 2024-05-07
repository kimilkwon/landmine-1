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
				<li><a href="/spgame/admin/logout.do"><i class="fa fa-sign-out fa-fw"></i> Logout</a></li>
			</ul>
		</li>
	</ul>
	<div class="navbar-default sidebar" role="navigation">
		<div class="sidebar-nav navbar-collapse">
			<ul class="nav" id="side-menu">
				<li id="member"><a href="/spgame/admin/member.do"><i class="fa fa-caret-right fa-fw"></i> 회원 목록<span id="newMember"></span></a></li>
				<li class="nav-item">
		            <a class="nav-link" href="/spgame/admin/notice.do" >
		                <span>공지사항</span>
		            </a>
		        </li>
				<li class="nav-item">
		            <a class="nav-link" href="/spgame/admin/qna.do" id="contact">
		                <span>문의</span>
		            </a>
		        </li>
				<li><a href="#"id ="gameText"><i class="fa fa-caret-right fa-fw"></i> 게임 <span class="gamecnt"></span><span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<!-- <li><a href="/spgame/admin/faq.do">FAQ</a></li> -->
						<li><a href="/spgame/admin/gameList.do">진행중인 게임 리스트 <span class="gamecnt"></span></a></li>
						<li><a href="/spgame/admin/betList.do">배팅내역</a></li>
					</ul>
				</li>
				<li><a href="#" id="dwcntText"><i class="fa fa-caret-right fa-fw"></i> 입출금 <span id ="dwcnt"></span><span class="fa arrow"></span></a>
					<ul class="nav nav-second-level">
						<li><a href="/spgame/admin/depositList.do" id="depositLeft">입금신청 목록<span id="depositLeftButton"></span></a></li>
						<li><a href="/spgame/admin/withdrawList.do" id="withdrawLeft">출금신청 목록<span id="withdrawLeftButton"></span></a></li>
					</ul>
				</li> 
			</ul>
		</div>
	</div>
</nav>
</body>
<script type="text/javascript">
var askSound = new Audio();
askSound.src = "/spgame/sound/tin2.mp3";

allAlarmChek();
setInterval(allAlarmChek, 50000);

function allAlarmChek(){
	$.ajax({
		type :"post",
		dataType : "json" ,
		url : "/spgame/admin/isAllAlarmCheck.do",
		success:function(data){
			if(data.result == "success"){
				var alarm = 0;
				if(data.wcnt == 0){
					$("#withdrawLeftButton").html('');
					$("#withdrawLeft").css("background-color","");
				}
				else{
					$("#withdrawLeftButton").html('<button type="button" class="btn btn-info btn-sm">'+data.wcnt+'</button>');
					$("#withdrawLeft").css("background-color","tomato");
				}
				if(data.dcnt == 0){
					$("#depositLeftButton").html('');
					$("#depositLeft").css("background-color","");
				}
				else{
					$("#depositLeftButton").html('<button type="button" class="btn btn-info btn-sm">'+data.dcnt+'</button>');
					$("#depositLeft").css("background-color","tomato");
				}
				var totalDWcnt = parseInt(data.dcnt)+parseInt(data.wcnt);
				if(totalDWcnt>0){
					$("#dwcntText").css("background-color","tomato");
					$("#dwcnt").html('<button type="button" class="btn btn-info btn-sm">신규 입출금:'+totalDWcnt+'</button>');
				}else{
					$("#dwcntText").css("background-color","");
					$("#dwcnt").html('');
				}
				if(data.gcnt>0){
					$("#gameText").css("background-color","tomato");
					$(".gamecnt").html('<button type="button" class="btn btn-info btn-sm">게임중:'+data.gcnt+'</button>');
				}else{
					$("#gameText").css("background-color","");
					$(".gamecnt").html('');
				}
				if(data.newMemCnt>0){
					alarm = 1;
					$("#member").css("background-color","tomato");
					$("#newMember").html('<button type="button" class="btn btn-info btn-sm">신규회원 : '+data.newMemCnt+'</button>');
				}else{
					$("#member").css("background-color","");
					$("#newMember").html('');
				}
				if(data.askcnt>0){
					alarm = 1;
					$("#contact").css("background-color","tomato");
					$("#contact").html('문의  <button type="button" class="btn btn-info btn-sm">신규문의 : '+data.askcnt+'</button>');
				}else{
					$("#contact").css("background-color","");
					$("#contact").html('문의 ');
				}
				if(alarm == 1){
					askSound.play();
				}
			}
			else{
				return;
			}
		},
		error:function(e){ console.log("ajax error"); }
	});
}


const serverport = '<%=request.getServerPort()%>';
let servername = '<%=request.getServerName()%>';
let wsUriToWeb = "wss://"+servername+":"+serverport+"/spgame/websocket/echo.do"; //주소 확인!!
if(servername == "localhost")
	wsUriToWeb = "ws://"+servername+":"+serverport+"/spgame/websocket/echo.do";

console.log("wsUriToWeb:"+wsUriToWeb);



let websocketToWeb = null;

function initToWeb() {
	console.log("initToWeb");
	websocketToWeb = new WebSocket(wsUriToWeb);
	websocketToWeb.onopen = function(evt) {
		console.log("웹소켓접속");
		onOpenToWeb(evt);
	};

	websocketToWeb.onmessage = function(evt) {
		onMessageToWeb(evt);
	};

	websocketToWeb.onerror = function(evt) {
		onErrorToWeb(evt);
	};

	websocketToWeb.onclose = function(evt) {
		console.log("재접속");
			initToWeb();
	};
}
function onOpenToWeb(evt) {
	
	}
function onErrorToWeb(evt) {
	console.log("onErrorToWEb");
}
function onMessageToWeb(evt) { // 받은 메세지를 보여준다
	let wpro = "none";
	try {
		let obj = JSON.parse(evt.data);
		console.log(obj);
		wpro = obj.protocol;
		if (obj.protocol == "doLogin") {
				console.log("접속시도");
				let obj2 = new Object;
				obj2.protocol = "loginAdmin";
				doSendToWeb(JSON.stringify(obj2));
		}
		
		else if(obj.protocol == "newMember" 
				||obj.protocol == "qnaInsert"
					||obj.protocol == "depositInsert"
						||obj.protocol == "withdrawalInsert"){
			askSound.play();
			allAlarmChek();
		}
	} catch (err) {
		console.log("[protocol]" + wpro + " " + err.message);
	}
}

function doSendToWeb(message) {
	websocketToWeb.send(message);
}


initToWeb();
</script>
</html>