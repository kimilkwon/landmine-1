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

<%-- <body class=body>
	<div class="frame">
	<jsp:include page="../frame/page/top.jsp"></jsp:include>
	<div class="content">
	<div class="general_content">
        <div class="container">
          <div class="custermer_sc">
            <h2 class="content_title">문의내역</h2>
            <div class="custermer_title">
              <h3 class="content_sub">고객센터 리스트</h3>
              <div class="custermer_btnarea">
                <a href="#" class="c_btn w-button">문의하기</a>
                <a href="#" class="c_btn _2 w-button">전체삭제</a>
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
                <div class="list4">
                  <div>삭제</div>
                </div>
              </div>
              <div class="list_warp">
                <div class="list1">
                  <div class="list_txt">12/14 13:30:50</div>
                </div>
                <div class="list2">
                  <div class="list_txt">답변상태</div>
                </div>
                <div class="list3">
                  <div class="list_txt ok">답변상태</div>
                </div>
                <div class="list4">
                  <a href="#" class="list_btn w-button">삭제</a>
                </div>
              </div>
              <div class="list_warp">
                <div class="list1">
                  <div class="list_txt">12/14 13:30:50</div>
                </div>
                <div class="list2">
                  <div class="list_txt">답변상태</div>
                </div>
                <div class="list3">
                  <div class="list_txt cancle">반려</div>
                </div>
                <div class="list4">
                  <a href="#" class="list_btn w-button">삭제</a>
                </div>
              </div>
              <div class="list_warp">
                <div class="list1">
                  <div class="list_txt">12/14 13:30:50</div>
                </div>
                <div class="list2">
                  <div class="list_txt">답변상태</div>
                </div>
                <div class="list3">
                  <div class="list_txt">대기중</div>
                </div>
                <div class="list4">
                  <a href="#" class="list_btn w-button">삭제</a>
                </div>
              </div>
              <div class="list_warp">
                <div class="list1">
                  <div class="list_txt">12/14 13:30:50</div>
                </div>
                <div class="list2">
                  <div class="list_txt">답변상태</div>
                </div>
                <div class="list3">
                  <div class="list_txt">대기중</div>
                </div>
                <div class="list4">
                  <a href="#" class="list_btn w-button">삭제</a>
                </div>
              </div>
              <div class="list_warp">
                <div class="list1">
                  <div class="list_txt">12/14 13:30:50</div>
                </div>
                <div class="list2">
                  <div class="list_txt">답변상태</div>
                </div>
                <div class="list3">
                  <div class="list_txt">대기중</div>
                </div>
                <div class="list4">
                  <a href="#" class="list_btn w-button">삭제</a>
                </div>
              </div>
              <div class="pagging">
                <a href="#" class="pagging_btn w-button">&lt;&lt;</a>
                <a href="#" class="pagging_btn w-button">&lt;</a>
                <a href="#" class="pagging_btn w-button">1</a>
                <a href="#" class="pagging_btn w-button">2</a>
                <a href="#" class="pagging_btn w-button">3</a>
                <a href="#" class="pagging_btn w-button">&gt;</a>
                <a href="#" class="pagging_btn w-button">&gt;&gt;</a>
              </div>
            </div>
          </div>
        </div>
      </div>
	<div class="general_content">
        <div class="container">
          <div class="custermer_sc">
            <h2 class="content_title">문의내역</h2>
            <div class="custermer_title">
              <h3 class="content_sub">고객센터 리스트</h3>
              <div class="custermer_btnarea">
                <a href="#" class="c_btn w-button">문의하기</a>
                <a href="#" class="c_btn _2 w-button">전체삭제</a>
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
                <div class="list4">
                  <div>삭제</div>
                </div>
              </div>
              </div>
              <c:forEach var="item" items="${list}">
              	<div class="list_warp">
		          	<div class="list_warp" onclick="location.href='/landmine/user/qnaDetail.do?idx=${item.idx}'" style="cursor:pointer;">
						<div class="list2">
				            <div class="c_date">${item.qdate}</div>
				        </div>
				        <div class="list1">
							${item.text}
						</div>
				        <div class="list2">
				            <div class="c_date">${item.answer}</div>
				        </div>
				        <div class="list2">
				            <div class="c_date">${item.qdate}</div>
				        </div>
		            </div>
	            </div>
			</c:forEach>

              
				<form name="listForm" action="/landmine/user/qnaList.do">
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
 --%>
 
 <body class="body">
  <div class="frame">
    <div class="top">
      <div class="top_warp">
        <a href="#" class="top_logo w-inline-block"><img src="../images/logo_white2.svg" loading="lazy" alt="" class="logo_img"></a>
        <div class="nav_area">
          <a href="#" class="nav_btn active w-button">게임</a>
          <div class="nav_warp">
            <a href="#" class="nav_btn w-button">입출금</a>
            <div class="nav_toggle">
              <a href="#" class="toggle_btn w-button">입금</a>
              <a href="#" class="toggle_btn w-button">출금</a>
            </div>
          </div>
          <a href="#" class="nav_btn w-button">공지사항</a>
          <a href="#" class="nav_btn w-button">고객센터</a>
          <a href="#" class="nav_btn w-button">쪽지함</a>
          <a href="#" class="nav_btn w-button">배팅내역</a>
          <a href="#" class="nav_btn w-button">마이페이지</a>
        </div>
        <div class="login_area">
          <a href="#" class="login_btn w-button">로그인</a>
          <a href="#" class="regist_btn w-button">회원가입</a>
        </div>
        <div class="point_info">
          <div class="point_title">보유금액: </div>
          <div><span class="point_span">111,511,498</span> 원</div>
          <a href="#" class="logout_btn w-button">로그아웃</a>
        </div>
        <div class="mob_menu">
          <div class="mob_menu_btn"><img src="../images/menu2_w.svg" loading="lazy" alt="" class="mob_menu_img"></div>
          <div class="mob_menu_container">
            <div class="mob_exsit"></div>
            <div class="mob_menu_area">
              <div class="m_menu_btnwarp">
                <a href="#" class="m_menu_btn1 w-inline-block">
                  <div>게임</div>
                </a>
              </div>
              <div class="m_menu_btnwarp">
                <a href="#" class="m_menu_btn1 w-inline-block">
                  <div>입출금</div>
                </a>
                <div class="m_menu_toggle">
                  <div class="m_menu_btn2">
                    <div>입금</div>
                  </div>
                  <div class="m_menu_btn1">
                    <div>출금</div>
                  </div>
                </div>
              </div>
              <div class="m_menu_btnwarp">
                <a href="#" class="m_menu_btn1 w-inline-block">
                  <div>공지사항</div>
                </a>
              </div>
              <div class="m_menu_btnwarp">
                <a href="#" class="m_menu_btn1 w-inline-block">
                  <div>고객센터</div>
                </a>
              </div>
              <div class="m_menu_btnwarp">
                <a href="#" class="m_menu_btn1 w-inline-block">
                  <div>쪽지함</div>
                </a>
              </div>
              <div class="m_menu_btnwarp">
                <a href="#" class="m_menu_btn1 w-inline-block">
                  <div>배팅내역</div>
                </a>
              </div>
              <div class="m_menu_btnwarp">
                <a href="#" class="m_menu_btn1 w-inline-block">
                  <div>마이페이지</div>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="content">
      <div class="banner">
        <div class="banner_warp">
          <h1 class="banner_title">Touch Keep</h1>
          <div class="banner_item">
            <div class="banner_item_txt">The more diamond you find on the 5x5 grid, the higher your multiplier. <br>Try not to hit any broken diamond or your game will end!</div>
            <a href="#" class="banner_btn w-button">게임 시작</a>
          </div>
        </div>
      </div>
      <div class="general_content">
        <div class="container">
          <div class="custermer_sc">
            <h2 class="content_title">문의내역</h2>
            <div class="custermer_title">
              <h3 class="content_sub">고객센터 리스트</h3>
              <div class="custermer_btnarea">
                <a href="#" class="c_btn w-button">문의하기</a>
                <a href="#" class="c_btn _2 w-button">전체삭제</a>
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
                <div class="list4">
                  <div>삭제</div>
                </div>
              </div>
              <div class="list_warp">
                <div class="list1">
                  <div class="list_txt">12/14 13:30:50</div>
                </div>
                <div class="list2">
                  <div class="list_txt">답변상태</div>
                </div>
                <div class="list3">
                  <div class="list_txt ok">답변상태</div>
                </div>
                <div class="list4">
                  <a href="#" class="list_btn w-button">삭제</a>
                </div>
              </div>
              <div class="list_warp">
                <div class="list1">
                  <div class="list_txt">12/14 13:30:50</div>
                </div>
                <div class="list2">
                  <div class="list_txt">답변상태</div>
                </div>
                <div class="list3">
                  <div class="list_txt cancle">반려</div>
                </div>
                <div class="list4">
                  <a href="#" class="list_btn w-button">삭제</a>
                </div>
              </div>
              <div class="list_warp">
                <div class="list1">
                  <div class="list_txt">12/14 13:30:50</div>
                </div>
                <div class="list2">
                  <div class="list_txt">답변상태</div>
                </div>
                <div class="list3">
                  <div class="list_txt">대기중</div>
                </div>
                <div class="list4">
                  <a href="#" class="list_btn w-button">삭제</a>
                </div>
              </div>
              <div class="list_warp">
                <div class="list1">
                  <div class="list_txt">12/14 13:30:50</div>
                </div>
                <div class="list2">
                  <div class="list_txt">답변상태</div>
                </div>
                <div class="list3">
                  <div class="list_txt">대기중</div>
                </div>
                <div class="list4">
                  <a href="#" class="list_btn w-button">삭제</a>
                </div>
              </div>
              <div class="list_warp">
                <div class="list1">
                  <div class="list_txt">12/14 13:30:50</div>
                </div>
                <div class="list2">
                  <div class="list_txt">답변상태</div>
                </div>
                <div class="list3">
                  <div class="list_txt">대기중</div>
                </div>
                <div class="list4">
                  <a href="#" class="list_btn w-button">삭제</a>
                </div>
              </div>
              <div class="pagging">
                <a href="#" class="pagging_btn w-button">&lt;&lt;</a>
                <a href="#" class="pagging_btn w-button">&lt;</a>
                <a href="#" class="pagging_btn w-button">1</a>
                <a href="#" class="pagging_btn w-button">2</a>
                <a href="#" class="pagging_btn w-button">3</a>
                <a href="#" class="pagging_btn w-button">&gt;</a>
                <a href="#" class="pagging_btn w-button">&gt;&gt;</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="footer">
      <div class="footer_warp">
        <div class="f_logo"><img src="../images/logo_white1.svg" loading="lazy" alt="" class="logo_img"></div>
        <div class="copyright">
          <div>CoptRight by TouchKeep ⓒ All Rights reserved</div>
        </div>
      </div>
    </div>
  </div>
  <script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=6552cea403b55036cfb448a4" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  <script src="../js/webflow.js" type="text/javascript"></script>

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