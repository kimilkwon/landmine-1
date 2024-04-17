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
            <h2 class="content_title">입금</h2>
            <div class="dw_box">
              <h3 class="content_sub">입금(충전)</h3>
              <div class="form-block w-form">
                <form id="depositForm" name="depositForm" data-name="depositForm" method="get" data-wf-page-id="655c54ced6bfdf04faf4df3e" data-wf-element-id="64bd95e3-62b6-9a73-b361-7c9519ad3170">
                  <div class="input_warp2">
                    <div class="input_label2">보유캐쉬</div>
                    <div class="input_dw_warp">
                      <div class="input_txtbox _1">
                        <div id="totalMoney">${info.money}</div>
                      </div>
                    </div>
                  </div>
                  <div class="input_warp2">
                    <div class="input_label2">입금자명</div>
                    <div class="input_dw_warp">
                      <div class="input_txtbox">
                        <div>${info.mname}</div>
                      </div>
                    </div>
                  </div>
                  <div class="input_warp2">
                    <div class="input_label2">입금계좌정보</div>
                    <div class="input_dw_warp">
                      <div class="dw_txt">입금전 고객센터로 문의 바랍니다.<br>‍입금완료후 반드시 본 페이지에서 입금신청을 해주세요.<br>‍최소 입금금액 만원 이상부터 가능합니다.</div>
                    </div>
                  </div>
                  <div class="input_warp2">
                    <div class="input_label2">입금신청금액</div>
                    <div class="input_dw_warp">
                    <input type="text" class="input_dw w-input" maxlength="256" name="totalDeposit" data-name="totalDeposit" placeholder="금액 입력" id="totalDeposit" required="" onkeyup="setMoney(this);">
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
                </form>
              </div>
              <div class="general_btn_area">
                <a href="javascript:depositBtn()" class="general_btn w-button">입금(충전) 신청</a>
                <a href="/spgame/user/qna.do" class="general_btn w-button">문의하기</a>
              </div>
            </div>
            <div class="dw_box">
              <h3 class="content_sub">입금(충전) 리스트</h3>
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
		$("#totalDeposit").val(0);
	} 
	else {
		if(start + parseInt(money)>=0){
				start += parseInt(money);
				$("#totalDeposit").val((start));
		}
	}
});
function setMoney(){
    var point = $("#totalDeposit").val();
    if(!/^[0-9]+$/.test(point)){
      alert("숫자만 입력해야합니다.")
      $("#totalDeposit").val('');
      start =0;
      return;
    }
    start = point;
    $("#totalDeposit").val((start));
 }
function depositBtn(){
	var data = $("#depositForm").serialize();
	$.ajax({
		type: 'post',
		data: data,
		url:'/spgame/user/depositProcess.do',
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