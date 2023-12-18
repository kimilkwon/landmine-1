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
          <div class="custermer_sc">
            <h2 class="content_title">고객센터</h2>
            <div class="custermer_title">
              <h3 class="content_sub">문의 리스트</h3>
              <div class="custermer_btnarea">
                <a href="/spgame/user/qna.do" class="c_btn w-button">문의하기</a>
              </div>
            </div>
            <div class="list_area">
              <div class="list_top">
                <div class="list1">
                  <div>문의 시간</div>
                </div>
                <div class="list2">
                  <div>문의 제목</div>
                </div>
                <div class="list3">
                  <div>답변상태</div>
                </div>
              </div>
              
              <c:forEach var="item" items="${list}">
		          	<div class="list_warp" onclick="location.href='/spgame/user/qnaDetail.do?idx=${item.idx}'" style="cursor:pointer;">
						<div class="list1">
				            <div class="list_txt">${item.qdate}</div>
				        </div>
				        <div class="list2">
							${item.title}
						</div>
				        <div class="list3">
				        	<c:if test="${item.answer eq null}">
				        		<div class="list_txt">N</div>
				        	</c:if>
				            <c:if test="${item.answer ne null}">
				        		<div class="list_txt">Y</div>
				        	</c:if>
				        </div>
		            </div>
			</c:forEach>

              </div>
				<form name="listForm" action="/spgame/user/qnaList.do">
				  <input type="hidden" name="pageIndex"/>
				</form>
              <div class="pagging">
              
              </div>
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