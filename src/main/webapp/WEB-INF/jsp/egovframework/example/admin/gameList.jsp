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
<style>
  .game_content {
    padding-left: 0;
    padding-right: 0;
  }

  .game_board {
    width: 100px;
    height: 100px;
    margin-left: auto;
    margin-right: auto;

  }

  .game_boardwarp {
    width: 120%;
    height: 21%;
    grid-column-gap: 3px;
    grid-row-gap: 3px;
    flex-direction: column;
    display: flex;
  }

  .game_boxwarp {
    width: 100%;
    height: 21%;
    grid-column-gap: 3px;
    grid-row-gap: 3px;
    display: flex;
    align-items: center; /* 위아래로 가운데 정렬 */
    justify-content: space-between; /* 위아래로 공백 생성 */
  }

  .game_box {
    width: 20%;
    height: 18px; /* 높이를 70px로 설정하여 위아래 공백을 생성 */
    background-color: grey;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .game_box:hover {
    background-image: linear-gradient(to bottom, var(--point1_15), var(--point1_15));
  }

  .game_box.suc {
    background-color: forestgreen;
    align-items: center;
    text-align-last: center;
    line-height: 20px;
    font-size: medium;
  }

  .game_box.fail {
    background-color:red;
    background-position: 50%;
    background-repeat: no-repeat;
    background-size: 75%;
  }
</style>

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
											<th>게임</th>
											<th>유저번호</th>
											<th>유저ID</th>
											<th>유저이름</th>
											<th>배팅금액</th>
											<th>폭탄 설정 수</th>
											<th>폭탄 위치</th>
											<th>배팅시작시간</th>
											<th>액션</th>
										</tr>
									</thead>
									<tbody id="list">
								
										<c:forEach var="item" items="${list}">
											<tr>
												<td>
												<div class='game_content' bidx="${item.bidx}" mineLocation="${item.mineLocation}" searchBoxHistory="${item.searchBoxHistory}">
													<div class='game_left'>
														<div class='game_board'>	
															<c:forEach  var="i" begin="1" end="5" >
																<div class='game_boxwarp'>
																	<c:forEach  var="j" begin="1" end="5" >
																		<div class='game_box' num="${5*(i-1) + j}"></div> 
																	</c:forEach>
																</div>
															</c:forEach>
														</div>
													</div>
												</div>
												</td>
												<td>${item.midx}</td>
												<td>${item.id}</td>
												<td>${item.name}</td>
												<td>${item.betMoney}</td>
												<td>${item.mineSet}</td>
												<td>${item.mineLocation}</td>
												<td><fmt:formatDate value="${item.bdate}" pattern="yyyy-MM-dd"/></td>
												<td>
													<button type="button" class="btn btn-info btn-sm pEventSkip" onclick="mineBoom(${item.midx},${item.idx})">KILL버튼</button>
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


function mineBoom(userIdx,betIdx){
	let obj2 = new Object;
	obj2.protocol = "AdminMineBoom";
	obj2.userIdx= userIdx;
	obj2.betIdx= betIdx;
	doSendToWeb(JSON.stringify(obj2));
	setTimeout(function() {location.reload();}, 500);
}

function gamestartAlert(){
	alert("회원 게임 시작");
}

$(document).ready(function() {
    $('.game_content').each(function() {
        var minelocation = $(this).attr('minelocation');
        var searchboxhistory = $(this).attr('searchboxhistory');
        if (minelocation) {
            var mineNumbers = minelocation.split('-');
            $.each(mineNumbers, function(index, number) {
                $(this).find('.game_box[num="' + number + '"]').addClass('fail');
            }.bind(this)); 
        }
        if (searchboxhistory) {
            var successNumbers = searchboxhistory.split('-');
            $.each(successNumbers, function(index, number) {
                $(this).find('.game_box[num="' + number + '"]').addClass('suc');
            }.bind(this)); 
        }
    });
});


function reload(){
	location.reload();
}
</script>
</html>