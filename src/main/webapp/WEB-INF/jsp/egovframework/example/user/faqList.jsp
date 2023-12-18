<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html data-wf-page="644a3c788608b013b811cf8a" data-wf-site="644a0d29c6872cead0a180f0">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="App_home" property="og:title">
<meta content="App_home" property="twitter:title">
<jsp:include page="../frame/header.jsp"></jsp:include>
</head>
<body class="home_body">
	<jsp:include page="../frame/page/top.jsp"></jsp:include>
			
	<div class="content">
    <div class="c_section">
      <h1 class="h_menu_title"><spring:message code="list.customer" /><span class="h_subtitle"><spring:message code="top.faq" /></span></h1>
      <div class="h_listblock">
        <div class="h_listbtop">
          <div class="h_list1">
            <div><spring:message code="list.title" /></div>
          </div>
          <div class="h_list2">
            <div><spring:message code="list.date" /></div>
          </div>
        </div>
        <div class="h_listarea">
         <c:forEach var="item" items="${list}">
          	<div class="h_list">
					<div class="h_list1" onclick="location.href='/spgame/user/faqDetail.do?idx=${item.idx}'" style="cursor:pointer;">
							 ${item.title}
					</div>
					<div class="h_list2">
		              <div class="c_date"> ${item.fdate}</div>
		            </div>
            </div>
		</c:forEach>
          
        </div>
      </div>
      <form name="listForm" action="/spgame/user/faqList.do">
        <input type="hidden" name="pageIndex"/>
      </form>
      <div class="h_page">
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
	
	  var paginationHTML = '<div class="h_page">';
	  paginationHTML += '<a href="#" onclick="page(' + 1 + ')" class="h_page_btn w-button">&lt;&lt;</a>';
		
	  var startPage = totalPages-currentPage;
	  if (totalPages == currentPage){
		  startPage +=1;
	  }
	  for (var i = startPage; i <= totalPages; i++) {
		if(i>5) return;
	  	paginationHTML += '<a href="#" onclick="page(' + i + ')" class="h_page_btn w-button">' + i + '</a>';
	  }
	
	  paginationHTML += '<a href="#" onclick="page(' + totalPages + ')" class="h_page_btn w-button">&gt;&gt;</a>';
	  paginationHTML += '</div>';
	
	  $('.h_page').html(paginationHTML);
	}
</script>
</html>