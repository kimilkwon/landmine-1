<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html data-wf-page="644f37a6ae0890bdb268f0a7" data-wf-site="644a0d29c6872cead0a180f0">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="../frame/header.jsp"></jsp:include>
</head>

<body class=body>
	<div class="frame">
	<jsp:include page="../frame/page/top.jsp"></jsp:include>
	<div class="content">
	<div class="general_content">
        <div class="container">
          <div class="dw_sc">
            <h2 class="content_title">배팅내역</h2>
            <div class="form-block w-form">
              <form id="email-form" name="email-form" data-name="Email Form" method="get" data-wf-page-id="657a5b0a4cdb24104dba9a66" data-wf-element-id="cda1fbe4-9b7f-f514-566a-17c14d65a50d" aria-label="Email Form">
                <div class="search_warp">
                  <!-- <div class="date_warp"><select id="field" name="field" data-name="Field" class="category1 w-select">
                      <option value="">Select one...</option>
                      <option value="First">First choice</option>
                      <option value="Second">Second choice</option>
                      <option value="Third">Third choice</option>
                    </select><input type="text" class="date_input w-input" maxlength="256" name="field-2" data-name="Field 2" placeholder="Example Text" id="field-2" required="">
                    <div>~</div><input type="text" class="date_input w-input" maxlength="256" name="field-2" data-name="Field 2" placeholder="Example Text" id="field-2" required="">
                    <a href="#" class="search_btn w-button">검색</a>
                  </div> -->
                </div>
              </form>
            </div>
          </div>
          <div class="history_sc">
            <div class="history_top">
              <div class="h_list1 title">
                <div>경기일시</div>
              </div>
              <div class="h_list2 title">
                <div>종목</div>
              </div>
              <div class="h_list3 title">
                <div>회차</div>
              </div>
              <div class="h_list4 title">
                <div>배팅결과</div>
              </div>
            </div>
            <c:forEach var="item" items="${list}">
	            <div class="bet_info">
	              <div class="bet_info1">
	                <div class="date_txt">${item.bdate}</div>
	                <div class="game_numtxt">No.${item.idx}</div>
	              </div>
	              <div class="bet_info2">
	                <div class="h_list1">
	                  <div>${item.bdate}</div>
	                </div>
	                <div class="h_list2">
	                  <div>거미줄찾기</div>
	                </div>
	                <div class="h_list3">
	                  <div>No.${item.idx}</div>
	                </div>
	                <div class="h_list4 on">
	                	<c:if test="${item.result ne null}">
	                  		<div>거미줄 위치: ${item.mineLocation}</div>
                  		</c:if>
                  		<c:if test="${item.mineLocation eq null and item.result eq 'exit'}">
	                  		<div>거미줄 위치: 탈출로 인한 패배는 거미줄 위치가 기록되지 않습니다.</div>
                  		</c:if>
	                </div>
	                <c:if test="${item.result eq 'win'}">
	                	<div class="h_list5 btn1 w-button">승리</div>
	                </c:if>
	                <c:if test="${item.result eq 'lose' or item.result eq 'exit'}">
	                	<div class="h_list5 btn2 w-button">패배</div>
	                </c:if>
	                <c:if test="${item.result eq null}">
	                	<div class="h_list5 btn2 w-button">진행중</div>
	                </c:if>
	                
	              </div>
	              <div class="w-form">
	                  <div class="bet_info3">
	                    <div class="h_info_warp">
	                      <div class="h_info_txt">거미줄 수:<span class="h_span">${item.mineSet}</span></div>
	                      <div class="h_info_txt">배팅금액: <span class="h_span _3">${item.betMoney}</span></div>
	                      <div class="h_info_txt">당청금: <span class="h_span">${item.resultMoney}</span></div>
	                    </div>
	                  </div>
	              </div>
	            </div>
            </c:forEach>
          </div>
          <form name="listForm" action="/spgame/betList.do">
				  <input type="hidden" name="pageIndex"/>
				</form>
              <div class="pagging">
              
              </div>
        </div>
      </div>
      </div>
      </div>
   
	<jsp:include page="../frame/page/footer.jsp"></jsp:include>
	<jsp:include page="../frame/js.jsp"></jsp:include>
</body>

<script>
	//<-- 퍼블 script
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
	
	generatePagination();

  function page(num) {
	  document.listForm.pageIndex.value = num;
	  document.listForm.submit();
  }

  function generatePagination() {
	  var currentPage = ${page};
	  var totalPages = ${totalpage};
	
	  var paginationHTML = '<div class="pagging">';
	  paginationHTML += '<a href="#" onclick="page(' + 1 + ')" class="pagging_btn w-button">&lt;&lt;</a>';
		
	  var startPage = totalPages-currentPage;
	  if (totalPages == currentPage){
		  startPage +=1;
	  }
	  for (var i = startPage; i <= totalPages; i++) {
		if(i>5) return;
	  	paginationHTML += '<a href="#" onclick="page(' + i + ')" class="pagging_btn w-button">' + i + '</a>';
	  }
	
	  paginationHTML += '<a href="#" onclick="page(' + totalPages + ')" class="pagging_btn w-button">&gt;&gt;</a>';
	  paginationHTML += '</div>';
	
	  $('.pagging').html(paginationHTML);
	}
</script>
</html>