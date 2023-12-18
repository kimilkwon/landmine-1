<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="adminFrame/header.jsp"></jsp:include>
</head>
<body>
<div id="wrapper">
	<jsp:include page="adminFrame/left.jsp"></jsp:include>
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">지뢰찾기 실시간</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">지뢰찾기 실시간 목록</div>
						<div class="panel-body">
							<div class="table-responsive">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>유저번호</th>
											<th>유저ID</th>
											<th>유저이름</th>
											<th>배팅금액</th>
											<th>거미줄 설정 수</th>
											<th>배팅시작시간</th>
											<th>액션</th>
										</tr>
									</thead>
									<tbody id="list">
										<c:forEach var="item" items="${list}">
											<tr>
												<td>${item.midx}</td>
												<td>${item.id}</td>
												<td>${item.name}</td>
												<td>${item.betMoney}</td>
												<td>${item.mineSet}</td>
												<td><fmt:formatDate value="${item.bdate}" pattern="yyyy-MM-dd"/></td>
												<td>
													<button type="button" class="btn btn-info btn-sm pEventSkip" onclick="mineBoom(${item.midx},${item.idx})">지뢰폭발설정</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="adminFrame/footer.jsp"></jsp:include>
</body>
<script>
function page(num) {
	document.listForm.pageIndex.value = num;
	document.listForm.submit();
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
		else if(obj.protocol == "gamelist"){
			setTimeout(function() {location.reload();}, 500);
		}
	} catch (err) {
		console.log("[protocol]" + wpro + " " + err.message);
	}
}
function doSendToWeb(message) {
	websocketToWeb.send(message);
}

function mineBoom(userIdx,betIdx){
	let obj2 = new Object;
	obj2.protocol = "AdminMineBoom";
	obj2.userIdx= userIdx;
	obj2.betIdx= betIdx;
	doSendToWeb(JSON.stringify(obj2));
	setTimeout(function() {location.reload();}, 500);
}

initToWeb();
</script>
</html>