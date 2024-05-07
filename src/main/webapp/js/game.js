console.log("웹소켓1");

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
			if (useridx != 0 && useridx != '0' && useridx != '') {
				console.log("접속시도");
				let obj2 = new Object;
				obj2.protocol = "login";
				obj2.userIdx = useridx;
				doSendToWeb(JSON.stringify(obj2));
			}
			
		}
		else if (obj.protocol == "requestLoginResult"){
			token = obj.token;
			var responseGameCheck = obj.gameCheck;
			var gameIdx = obj.gameIdx;
			var newData = { "gameIdx" : gameIdx};
			if(responseGameCheck == "gaming" && gameIdx != 0){//게임 중인게 있다면 불러오기 
				$.ajax({
					type : 'post',
					data : newData,
					url : "/spgame/gamingProcess.do",
					dataType : "json" ,		
					success : function(data) {
						if (data.result == 'suc') {
							console.log("searchBoxHistory:"+data.searchBoxHistory);
							console.log("nextStake:"+data.nextStake);
							console.log("totalStake:"+data.totalStake);
							console.log("betMoney:"+data.betMoney);
							gamingRestart(data.nextStake,data.totalStake,data.searchBoxHistory,data.betMoney);
							console.log("게임 불러드리기 성공");
							start = 0;
							$("#betMoney").val(0);
						} else {
							alert(data.msg);
						}
					}
				})
			}
			
		}
		else if(obj.protocol == "gameStart"){
			if(obj.result=="suc"){
				var betMoney = $("#betMoney").val();
				var mineSet = betCount;
				var newData = { "betMoney" : betMoney,"mineSet":mineSet};
				console.log("betMoney:"+betMoney);
				$.ajax({
					type : 'post',
					data : newData,
					url : "/spgame/gameStartProcess.do",
					dataType : "json" ,		
					success : function(data) {
						if (data.result == 'suc') {
							gameStart();
							start = 0;
							$("#betMoney").val(0);
						} else {
							alert(data.msg);
						}
					}
				})
			}else{
				alert(obj.msg);
			}
		}

	} catch (err) {
		console.log("[protocol]" + wpro + " " + err.message);
	}
}
function doSendToWeb(message) {
	websocketToWeb.send(message);
}
function doSendGameStart(){
	var point = $("#betMoney").val();
	console.log("point:"+point );
    if(!/^[0-9]+$/.test(point)){
      alert("배팅 입력란에는 숫자만 입력해야합니다.");
      return;
    }
    start = parseInt(point);
	if(!isGameSend&&!gameIsOpen){
		let obj = new Object;
		obj.protocol = "gameStartUser";
		obj.userIdx = useridx;
		obj.token = token;
		doSendToWeb(JSON.stringify(obj));
	}else{
		alert("게임중입니다.");
	}
	
	
}
initToWeb();




	const minMumMoney=10000;
	var grid = null;
	var gameIsOpen = false;
	var isGameBoxCheck = true;
	var checkBtn = 0;
	var havemoney = $(".point_span");
	
	function endGameSend(){
		var newData = {};
		$.ajax({
			type : 'post',
			data : newData,
			url : "/spgame/gameEndProcess.do",
			dataType : "json" ,		
			success : function(data) {
				if (data.result == 'suc') {
					let obj = new Object;
					obj.protocol = "gameEndUser";
					obj.userIdx = useridx;
					obj.token = token;
					doSendToWeb(JSON.stringify(obj));
				} else {
					alert(data.msg);
				}
			}
		})
	}
	
	 
	$(".lang_wawrp").hover(
			function(){$(this).children(".lang_box").toggleClass("on")
	  });
  
  
	  $('.mobile_menu_btn').hover(function() {
			$('.mobile_menupop').css('display', 'flex');
	  });
	  var start =0;
	  var betCount =5;
	  function numberDeleteCommas(x) {
			return x.toString().replace(/\,/g, "");
		}
	  $(".bet_btn").click(function() {
		  
		var money = ($(this).attr("money"));
		var totalMoney = numberDeleteCommas($("#totalMoney").text());
		
		if (money == "-1") {
			start = 0;
			$("#betMoney").val(0);
		} else if(money=="x2"){
			var total = start*2
			
			if(parseInt(totalMoney)<total){
				alert("보유금액 보다 많이 설정 할 수 없습니다.");
				return;
			}
			start = total;
			$("#betMoney").val((start));
		}else if(money=="MIN"){
			start = minMumMoney;
			$("#betMoney").val((start));
		}
		else if(money=="MAX"){
			start = parseInt(totalMoney);
			$("#betMoney").val((start));
		}
		else {
			if(parseInt(totalMoney)<start + parseInt(money)){
				alert("보유금액 보다 많이 설정 할 수 없습니다.");
				return;
			}
			if(start + parseInt(money)>=0){
				
				if (totalMoney >= start + parseInt(money)) {
					start += parseInt(money);
					$("#betMoney").val((start));
				}
			}
		}
	});
	  
  $(".bet_count_btn").click(function() {
	  if(gameIsOpen){
			notice("현재 게임 중 입니다.");
			return ;
		}
	 var count = ($(this).attr("count"));
	 betCount =count;
	 console.log(betCount);
        $('.bet_count_btn').removeClass('active');
        $(this).addClass('active');
  });
  
  function notice(msg){
	  $('.game_notice').text(msg);
	  $('.game_notice').css('display','flex');
	  $('.game_notice.red').css('display','none');
	  setTimeout(function(){ $('.game_notice').css('display','none')},5000);
  }
function noticeRed(msg){
	  $('.game_notice.red').text(msg);
	  $('.game_notice.red').css('display','flex');
	  $('.game_notice').css('display','none');
	  setTimeout(function(){ $('.game_notice.red').css('display','none')},5000);
	  
  }
function gameCheck(){
	
	
	console.log("start"+start);
	console.log("minMumMoney"+minMumMoney);
	if(start<minMumMoney){
		console.log("1"+minMumMoney);
		notice("시작 최소금액은 "+minMumMoney+"입니다.");
		return false ;
	}
	if(gameIsOpen){
		notice("현재 게임 중 입니다.");
		return false;
	}
	var totalMoney = numberDeleteCommas($("#totalMoney").text());
	$("#totalMoney").text(numberWithCommas(totalMoney-start));
	$(".point_span").text(numberWithCommas(totalMoney-start));
	
	setTimeout(function(){logWrite(betCount+"개의 거미줄로  시작금액"+start+"캐시로 시작했습니다.",0,"")},100);
	setTimeout(function(){logWrite("암호해쉬값:"+generateRandomHash(),0,"")},100);
	return true;
}

function regameCheck(){
	var totalMoney = numberDeleteCommas($("#totalMoney").text());
	$("#totalMoney").text(numberWithCommas(totalMoney-start));
	$(".point_span").text(numberWithCommas(totalMoney-start));
	
	setTimeout(function(){logWrite("암호해쉬값:"+generateRandomHash(),0,"")},100);
	return true;
}
function generateRandomHash() {
	  // 난수를 생성
	 const randomBytes = new Uint8Array(32); // 32 바이트(256 비트) 크기의 배열
	 window.crypto.getRandomValues(randomBytes);

	  // 난수를 16진수 문자열로 변환
	 const hash = Array.from(randomBytes).map(byte => byte.toString(16).padStart(2, '0')).join('');

	 return hash;
}
function gameStart(){
	if(!gameCheck()) return;

	drawGame();
	
	gameIsOpen = true;
}

function gamingRestart(nextStake,totalStake,searchBoxHistory,betMoney){
	if(!regameCheck()) return;

	redrawGame(nextStake,totalStake,searchBoxHistory,betMoney);
	
	gameIsOpen = true;
}
function endGame(){
	gameIsOpen = false;
	$('.game_content').addClass(' end');
	checkBtn = 0;
}
function rolcol(){
	var newElement = "";
	for(var i=0;i<5;i++){
		newElement += "<div class='game_boxwarp'>";
		for(var j=0;j<5;j++){
			newElement += "<div class='game_box' row='"+i+"' col='"+j+"'></div>";
		}
		newElement += "</div>";
	}
	return newElement;
}

function drawBackGame(searchBoxHistory,betMoney){//게임 중인거 불러올때
	
	var newElement = "";
    var searchBox = searchBoxHistory.split('-');
    
	for (var i = 1; i <= 25; i++) {
	    for (var j = 0; j < searchBox.length; j++) {
	        if (parseInt(searchBox[j]) == i) {
	        	var rowIndex = Math.floor((i-1) / 5);
                var colIndex = (i-1) % 5;
	        	var $gameBox = $('.game_content').find('.game_box[row="' + rowIndex + '"][col="' + colIndex + '"]');
	            if (!$gameBox.hasClass("suc")) {
                    $gameBox.addClass("suc");
                }
	        }
	    }
	}
	
}
function drawGame(){
	const newChildElement = 
		"<div class='game_content'>"+
		  "<div class='game_left'>"+
	             "<div class='game_board'>"+
	                  "<div class='game_boardwarp'>"+
	                  rolcol()+
	                  "</div>"+
	              "</div>"+
	          "</div>"+
	          "<div class='game_info'>"+
	              "<div class='score_warp'>"+
	                  "<div class='score_box'>"+
	                      "<div class='score_1'>"+
	                          "<div class='score_title'>NEXT</div>"+
	                          "<div class='next'>"+start*0.12+"</div>"+
	                      "</div>"+
	                      "<div class='score_2'>"+
	                          "<div class='score_title'>STAKE</div>"+"<div class='stake'>"+start+"</div>"+
	                      "</div>"+
	                  "</div>"+
	                  "<a class='cash_btn w-button'>Cash OUT</a>"+
	              "</div>"+
	              "<div class='game_logbox'>"+
	                  "<div class='game_log_warp'>"+
	                  "</div>"+
	              "</div>"+
	          "</div>"+
	      "</div>";
	
	  // game 클래스 하위에 자식 요소를 추가
	  $('.game').prepend(newChildElement);
	  
	 
	  $('.game_box').click(function () {
	  var $this = $(this);
	  gameBoxCheck($this);
	
	});
	$('.cash_btn').click( function (){
		var $closestGameContent = $(this).closest('.game_content');
		if ($closestGameContent.hasClass('end')) {
			logWriteEndGame($closestGameContent);
		   return;
		}
		if(checkBtn<=0){
			logWrite("시작 후 한번이상 배팅해야 합니다.",0,"");
			return;
		}
		var stakeValue = $('.game_content:not(.end) .score_2 .stake').text();
		var totalMoney = numberDeleteCommas($("#totalMoney").text());
		
		logWrite("캐쉬아웃"+numberWithCommas(stakeValue)+"획득",0,"check");
		
		$("#totalMoney").text(numberWithCommas(parseInt(totalMoney)+parseInt(stakeValue)));
		$(".point_span").text(numberWithCommas(parseInt(totalMoney)+parseInt(stakeValue)));
			endGame();
			endGameSend();
	});
}
  function redrawGame(nextStake,totalStake,searchBoxHistory,betMoney){
		const newChildElement = 
			"<div class='game_content'>"+
		  "<div class='game_left'>"+
	             "<div class='game_board'>"+
	                  "<div class='game_boardwarp'>"+
	                  rolcol()+
	                  "</div>"+
	              "</div>"+
	          "</div>"+
	          "<div class='game_info'>"+
	              "<div class='score_warp'>"+
	                  "<div class='score_box'>"+
	                      "<div class='score_1'>"+
	                          "<div class='score_title'>NEXT</div>"+
	                          "<div class='next'>"+nextStake+"</div>"+
	                      "</div>"+
	                      "<div class='score_2'>"+
	                          "<div class='score_title'>STAKE</div>"+"<div class='stake'>"+totalStake+"</div>"+
	                      "</div>"+
	                  "</div>"+
	                  "<a class='cash_btn w-button'>Cash OUT</a>"+
	              "</div>"+
	              "<div class='game_logbox'>"+
	                  "<div class='game_log_warp'>"+
	                  "</div>"+
	              "</div>"+
	          "</div>"+
	      "</div>";

	  // game 클래스 하위에 자식 요소를 추가
	  $('.game').prepend(newChildElement);
	  
	 
	  $('.game_box').click(function () {
	  var $this = $(this);
	  gameBoxCheck($this);

	});
	  
	  drawBackGame(searchBoxHistory,betMoney);
  
  $('.cash_btn').click( function (){
	  	console.log("!1");
		var $closestGameContent = $(this).closest('.game_content');
	    if ($closestGameContent.hasClass('end')) {
	    	logWriteEndGame($closestGameContent);
	    	console.log("2222");
	       return;
	    }
	   
		var stakeValue = $('.game_content:not(.end) .score_2 .stake').text();
		var totalMoney = numberDeleteCommas($("#totalMoney").text());
		
		logWrite("캐쉬아웃"+numberWithCommas(stakeValue)+"획득",0,"check");
		
		$("#totalMoney").text(numberWithCommas(parseInt(totalMoney)+parseInt(stakeValue)));
		$(".point_span").text(numberWithCommas(parseInt(totalMoney)+parseInt(stakeValue)));
		console.log("3333");
    	endGame();
    	console.log("4444");
    	endGameSend();
    	console.log("5555");
	});
  }

function logWrite(msg,money,code){
	var divText = "";
	if(code==="earn"){
		divText = "<div class='log_warp earn'>"+
		"<div>"+msg+"<span class='cash_span'>"+money+"캐시 </span> 획득</div>"+
		"</div>";
	}else if(code ==="error"){
		divText = "<div class='log_warp error'>"+
		"<div>"+msg+"</div>"+
		"</div>";
	}else if(code==="check"){
		divText = "<div class='log_warp check'>"+
		"<div>"+msg+"</div>"+
		"</div>";
	}
	else{
		divText = "<div class='log_warp'>"+
		"<div>"+msg+"</div>"+
		"</div>";
	}
	$('.game_content:not(.end) .game_log_warp').prepend(divText);
}
function mineCheck($this,check,mineLocation){
	const $closestGameContent = $this.closest('.game_content');
	if(check){
		if($closestGameContent.hasClass('end')){
			logWriteEndGame($closestGameContent);
	       return;
		}
	    const rowIndex = $this.attr("row");
	    const colIndex = $this.attr("col");
	    checkBtn++;
    	$this.addClass(" suc");
    	nextAndStakeUpdate(rowIndex,colIndex);

	}else{
		if($closestGameContent.hasClass('end')){
			logWriteEndGame($closestGameContent);
	       return;
		}
		const rowIndex = $this.attr("row");
	    const colIndex = $this.attr("col");
	    $this.addClass(" fail");
    	logWrite((parseInt(rowIndex))*5+(parseInt(colIndex)+1)+"타일에서 거미줄을 발견했습니다.",0,"error");
    	endGame();
    	showMine($closestGameContent,mineLocation);
    	findMine();
	}
}
function showMine(target,mineLocation){
	var mineSet = betCount -1;
	var mine = mineLocation.split('-');
	for (var i = 1; i <= 25; i++) {
	    for (var j = 0; j < mine.length; j++) {
	        if (parseInt(mine[j]) == i && mineSet>0) {
	        	var rowIndex = Math.floor((i-1) / 5);
                var colIndex = (i-1) % 5;
	        	var $gameBox = target.find('.game_box[row="' + rowIndex + '"][col="' + colIndex + '"]');
	            if (!$gameBox.hasClass("fail")) {
	            	mineSet--;
                    $gameBox.addClass("fail");
                }
	        }
	    }
	}
}
function logWriteEndGame(target){
	divText = "<div class='log_warp error'>"+
	"<div>해당 게임은 끝났습니다.</div>"+
	"</div>";
	target.find('.game_log_warp').prepend(divText);
}
function findMine(){
	var stakeValue = $('.game_content .score_2 .stake').text();
	$('.game_content .score_2 .stake').text(0);
}
function nextAndStakeUpdate(row,col){
	var nextValue = $('.game_content:not(.end) .score_1 .next').text();
	var stakeValue = $('.game_content:not(.end) .score_2 .stake').text();
	logWrite((parseInt(row))*5+(parseInt(col)+1)+"타일에서 거미를 발견해서",nextValue,"earn");
	$('.game_content:not(.end) .score_2 .stake').text(parseInt(stakeValue)+parseInt(nextValue));
	$('.game_content:not(.end) .score_1 .next').text(Math.floor(nextValue*1.2));
}
function isGameContentEnd($element) {
    return $element.hasClass('end');
}
function gameBoxCheck($this){
	
		const $closestGameContent = $this.closest('.game_content');
	    
	    if (isGameContentEnd($closestGameContent)) {
	        logWriteEndGame($closestGameContent);
	        return;
	    }
		const rowIndex = $this.attr("row");
	    const colIndex = $this.attr("col");
		var gameBoxNum = (parseInt(rowIndex))*5+parseInt(colIndex)+1; 
        var newData = {"gameBoxNum":gameBoxNum};
        $.ajax({
            type: 'post',
            data: newData,
            url: "/spgame/gameBoxCheck.do",
            dataType: "json",
            success: function(data) {
                if (data.result === 'suc') {
                	mineCheck($this,true,data.mineLocation);
                } else if (data.result === 'fail'){
                	mineCheck($this,false,data.mineLocation);
                	let obj = new Object;
					obj.protocol = "gameEndUser";
					obj.userIdx = useridx;
					obj.token = token;
					doSendToWeb(JSON.stringify(obj));
                }else if(data.result === 'errBetIdxNull'){
                	var $closestGameContent = $this.closest('.game_content');
                		if($closestGameContent.hasClass('end')){
                			logWriteEndGame($closestGameContent);
                	}
                }else if(data.result ==='alreadySelect'){
                	logWrite("이미 선택한 곳 입니다.",0,"")
                	
                }
                
            },
            error: function(error) {
                
            }
        });
	}
