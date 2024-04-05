<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html data-wf-page="64b0b735061c5fcdf0dbe592" data-wf-site="64afbe4e8ebe5f98389608e1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="App_home" property="og:title">
<meta content="App_home" property="twitter:title">
<jsp:include page="../frame/header.jsp"></jsp:include>
</head>
<style>
.log_warp.error {
    background-color: var(--red);
    color:white;
}
</style>

<body class="body">
  <div class="frame">
    <jsp:include page="../frame/page/top.jsp"></jsp:include>
    <div class="content">
      <div class="banner">
        <div class="banner_warp">
          <h1 class="banner_title">Spendesk</h1>
          <div class="banner_item">
            <div class="banner_item_txt">The more diamond you find on the 5x5 grid, the higher your multiplier. <br>Try not to hit any broken diamond or your game will end!</div>
            <a href="/spgame/user/game.do" class="banner_btn w-button">게임 시작</a>
          </div>
        </div>
      </div>
      <div class="general_content">
        <div class="container">
          <div class="main_tem_area">
            <div class="main_item_warp">
              <div class="main_item"><img src="/spgame/webflow/images//icon_6.svg" loading="lazy" alt="" class="item_img">
                <h3 class="item_title">Bitcoin Only</h3>
                <h4 class="item_sub">Transactions are safe, simple and cheap.</h4>
              </div>
              <div class="main_item"><img src="/spgame/webflow/images//icon_2.svg" loading="lazy" alt="" class="item_img">
                <h3 class="item_title">Fast Deposits</h3>
                <h4 class="item_sub">Start playing after 1 confirmation</h4>
              </div>
              <div class="main_item"><img src="/spgame/webflow/images//icon_3.svg" loading="lazy" alt="" class="item_img">
                <h3 class="item_title">Provably Fair</h3>
                <h4 class="item_sub">ine positions are chosen at the start of every round and can be verified after the round ends.</h4>
              </div>
            </div>
            <div class="main_item_warp">
              <div class="main_item"><img src="/spgame/webflow/images//icon_4.svg" loading="lazy" alt="" class="item_img">
                <h3 class="item_title">Better Odds</h3>
                <h4 class="item_sub">Lucky Diamond has considerably better odds than all other bitcoin mine games.</h4>
              </div>
              <div class="main_item"><img src="/spgame/webflow/images//icon_5.svg" loading="lazy" alt="" class="item_img">
                <h3 class="item_title">Mobile-Friendly</h3>
                <h4 class="item_sub">Fun to play on your commute or during boring business meetings.</h4>
              </div>
              <div class="main_item"><img src="/spgame/webflow/images//icon_1.svg" loading="lazy" alt="" class="item_img">
                <h3 class="item_title">Mobile Wallet Support</h3>
                <h4 class="item_sub">Integrated QR Codes make it easy to deposit from your mobile wallet.</h4>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
	<jsp:include page="../frame/page/footer.jsp"></jsp:include>
  </div>
	
	<jsp:include page="../frame/js.jsp"></jsp:include>
	<script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=64afbe4e8ebe5f98389608e1" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  </body>
  <script>
	//<-- 퍼블 script
	const minMumMoney=10000;
	var grid = null;
	var gameIsOpen = false;
	var checkBtn = 0;
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
	setTimeout(function(){logWrite(betCount+"개의 지뢰로  시작금액"+start+"캐시로 시작했습니다.",0,"")},100);
	return true;
}
function gameStart(){
	if(!gameCheck()) return;
	grid = createGrid();
    placeMines(grid);
	drawGame();
	gameIsOpen = true;
};
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
	                  "<a href='#' class='cash_btn w-button'>Cash OUT</a>"+
	              "</div>"+
	              "<div class='game_logbox'>"+
	                  "<div class='game_log_warp'>"+
	                  "</div>"+
	              "</div>"+
	          "</div>"+
	      "</div>";

	  // game 클래스 하위에 자식 요소를 추가
	  $('.game').prepend(newChildElement);
	  
	 
	  $('.game_box').click( function () {
	  const $closestGameContent = $(this).closest('.game_content');

		if($closestGameContent.hasClass('end')){
			logWriteEndGame($closestGameContent);
	       return;
		}
	    const rowIndex = $(this).attr("row");
	    const colIndex = $(this).attr("col");
	    checkBtn++;
	    if(grid[rowIndex][colIndex].isCheck){
	    	return;
	    }
	    if (grid[rowIndex][colIndex].isMine) {
	    	
	    	$(this).addClass(" fail");
	    	logWrite((parseInt(rowIndex))*5+(parseInt(colIndex)+1)+"타일에서 지뢰를 발견했습니다.",0,"error");
	    	endGame();
	    	findMine();
	    } else {
	    	$(this).addClass(" suc");
	    	grid[rowIndex][colIndex].isCheck = true;
	    	nextAndStakeUpdate(rowIndex,colIndex);
	    }
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
	logWrite((parseInt(row))*5+(parseInt(col)+1)+"타일에서",nextValue,"earn");
	$('.game_content:not(.end) .score_2 .stake').text(parseInt(stakeValue)+parseInt(nextValue));
	$('.game_content:not(.end) .score_1 .next').text(Math.floor(nextValue*1.2));
}
function createGrid() {
    const grid = [];
    for (var i = 0; i < 5; i++) {
        const row = [];
        for (var j = 0; j < 5; j++) {
            row.push({ isMine: false },{ isCheck: false });
        }
        grid.push(row);
    }
    return grid;
}
function placeMines(grid) {
    const totalMines = betCount; // 지뢰의 개수
    var minesPlaced = 0;
    while (minesPlaced < totalMines) {
        const randomRow = Math.floor(Math.random() * 5);
        const randomCol = Math.floor(Math.random() * 5);

        if (!grid[randomRow][randomCol].isMine) {
            grid[randomRow][randomCol].isMine = true;
            minesPlaced++;
        }
    }
}
  </script>
</html>