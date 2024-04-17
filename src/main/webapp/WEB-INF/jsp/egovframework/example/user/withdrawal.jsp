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
.input_dw{
color:white;
}
</style>

<body class="body">
  <div class="frame">
    <jsp:include page="../frame/page/top.jsp"></jsp:include>
    <div class="content">
      <div class="general_content">
        <div class="container">
          <div class="dw_sc">
            <h2 class="content_title">출금</h2>
            <div class="dw_box">
              <h3 class="content_sub">출금(환전)</h3>
              <div class="form-block w-form">
                <form id="initForm" name="initForm" data-name="initForm" method="get" data-wf-page-id="655c54ced6bfdf04faf4df3e" data-wf-element-id="64bd95e3-62b6-9a73-b361-7c9519ad3170">
                  <div class="input_warp2">
                    <div class="input_label2">보유캐쉬</div>
                    <div class="input_dw_warp">
                      <div class="input_txtbox _1">
                        <div id="totalMoney">${info.money}</div>
                      </div>
                    </div>
                  </div>
                 
                  <div class="input_warp2">
                    <div class="input_label2">출금신청금액</div>
                    <div class="input_dw_warp">
                    <input type="text" class="input_dw w-input" maxlength="256" name="totalWithdrawal" data-name="totalWithdrawal" placeholder="금액 입력" id="totalWithdrawal" required="" onkeyup="setMoney(this);">
                      <div class="dw_input_btnarea">
                        <a href="#" money="1000" class="dw_input_btn w-button">1천원</a>
                        <a href="#" money="10000" class="dw_input_btn w-button">1만원</a>
                        <a href="#" money="30000" class="dw_input_btn w-button">3만원</a>
                        <a href="#" money="50000" class="dw_input_btn w-button">5만원</a>
                        <a href="#" money="100000" class="dw_input_btn w-button">10만원</a>
                        <a href="#" money="500000" class="dw_input_btn w-button">50만원</a>
                        <a href="#" money="1000000" class="dw_input_btn w-button">100만원</a>
                        <a href="#" money="-1" class="dw_input_btn _2 w-button">정정</a>
                      </div>
                    </div>
                  </div>
                  <div class="input_warp2">
                    <div class="input_label2">출금비밀번호</div>
                    <div class="input_dw_warp">
                    <input type="password" class="input_dw w-input" maxlength="256" name="password" data-name="password" placeholder="출금 비밀번호 6자리 입력" id="password" >
                    </div>
                  </div>
                </form>
              </div>
              <div class="general_btn_area">
                <a href="javascript:withdrawalBtn()" class="general_btn w-button">출금(환전) 신청</a>
              </div>
            </div>
            <div class="dw_box">
              <h3 class="content_sub">출금(환전) 리스트</h3>
              <div class="dw_table">
                <div class="dw_table_top">
                  <div class="dw_tb1">
                    <div>신청시간</div>
                  </div>
                  <div class="dw_tb1">
                    <div>신청금액</div>
                  </div>
                  <div class="dw_tb1">
                    <div>상태</div>
                  </div>
                </div>
                
                <div class="dw_table_list">
                 <c:forEach var="item" items="${list}">
					<div class="dw_table_warp">
						<div class="dw_tb1">
	                      <fmt:formatDate value="${item.mdate}" pattern="yyyy-MM-dd"/>
	                    </div>
	                    <div class="dw_tb1">
	                      <div><fmt:formatNumber value="${item.money}" pattern="#,###"/></span>KRW</div>
	                    </div>
	                    <div class="dw_tb1">
                      		<c:if test="${item.stat eq '0'}"> <div class="list_txt">대기중</div></c:if>
							<c:if test="${item.stat eq '1'}"> <div class="list_txt blue">승인</div></c:if>
							<c:if test="${item.stat eq '2'}"> <div class="list_txt red">미승인 </div></c:if>
	                    </div>
					</div>
				</c:forEach>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
     
	<jsp:include page="../frame/page/footer.jsp"></jsp:include>
	 </div>
  </div>
	
	<jsp:include page="../frame/js.jsp"></jsp:include>
	<script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=64afbe4e8ebe5f98389608e1" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  </body>
<script>
var start =0;
function numberDeleteCommas(x) {
	return x.toString().replace(/\,/g, "");
}
$(".dw_input_btn").click(function() {
	  
	var money = ($(this).attr("money"));
	var totalMoney = numberDeleteCommas($("#totalMoney").text());
	
	if (money == "-1") {
		start = 0;
		$("#totalWithdrawal").val(0);
	} 
	else {
		
		if(start + parseInt(money)>=0){
			if (totalMoney >= start + parseInt(money)) {
				start += parseInt(money);
				$("#totalWithdrawal").val((start));
			}else{
			   	 	alert("보유금액보다 많은 금액으로 출금신청 할 수 없습니다.");
			   	 	$("#totalWithdrawal").val('');
			   	 	start =0;
			}
		}
	}
});
function setMoney(){
	var totalMoney = numberDeleteCommas($("#totalMoney").text());
	
    var point = $("#totalWithdrawal").val();
    if(!/^[0-9]+$/.test(point)){
      alert("숫자만 입력해야합니다.")
      $("#totalWithdrawal").val('');
      start =0;
      return;
    }
   	if(parseInt(point)>parseInt(totalMoney)){
   	 	alert("보유금액보다 많은 금액으로 출금신청 할 수 없습니다.");
   		$("#totalWithdrawal").val('');
   	 	start =0;
   	 	return;
   	}
    start = point;
    $("#totalWithdrawal").val((start));
 }
function withdrawalBtn(){
	var data = $("#initForm").serialize();
	$.ajax({
		type: 'post',
		data: data,
		url:'/spgame/user/withdrawalProcess.do',
		success: function(data){
			alert(data.msg);
			if(data.result == "success"){
				location.reload();
			}
			
		}
	})
}
  
  </script>
</html>