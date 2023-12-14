console.log("웹소켓1");

let wsUriToWeb = "ws://"+servername+":"+serverport+"/landmine/websocket/echo.do"; //주소 확인!!
if(servername == "localhost")
	wsUriToWeb = "ws://"+servername+":"+serverport+"/landmine/websocket/echo.do";

console.log("wsUriToWeb:"+wsUriToWeb);



let websocketToWeb = null;

function initToWeb() {
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
	chatServerConnecting();
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
			if (useridx != 0 && useridx != '0' && useridx != '') {
				console.log("접속시도");
				let obj = new Object;
				obj.protocol = "login";
				obj.userIdx = useridx;
				doSendToWeb(JSON.stringify(obj));
			}
			
		}
	} catch (err) {
		console.log("[protocol]" + wpro + " " + err.message);
	}
}
function doSendToWeb(message) {
	websocketToWeb.send(message);
}

initToWeb();
