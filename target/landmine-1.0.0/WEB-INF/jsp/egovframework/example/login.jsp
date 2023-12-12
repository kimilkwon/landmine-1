<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html data-wf-page="64b0b735061c5fcdf0dbe592" data-wf-site="64afbe4e8ebe5f98389608e1">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta content="App_home" property="og:title">
<meta content="App_home" property="twitter:title">
<jsp:include page="frame/header.jsp"></jsp:include>
</head>
<style>
.log_warp.error {
    background-color: var(--red);
    color:white;
}
</style>

<body class="body">
  <div class="frame">
    <jsp:include page="frame/page/top.jsp"></jsp:include>
    <div class="content">
      <div class="login_content">
        <div class="container">
          <div class="regist_sc">
            <h2 class="content_title">로그인</h2>
            <div class="regist_block">
              <div class="form-block w-form">
                <form id="loginFrm" name="loginFrm" data-name="loginFrm" >
                  <div class="input_warp">
                    <div class="input_label">아이디</div>
                    <input type="text" class="input1 w-input" maxlength="256" name="id" data-name="Field" placeholder="Example Text" id="id" required="">
                    <div class="input_notice">ID는 대,소문자를 구분합니다.</div>
                  </div>
                  <div class="input_warp">
                    <div class="input_label">비밀번호</div>
                    <input type="text" class="input1 w-input" maxlength="256" name="pw" data-name="Field 4" placeholder="Example Text" id="pw" required="">
                    <div class="input_notice">비밀번호는 암호화되어 안전하게 전송됩니다.</div>
                  </div>
                </form>
              </div>
              <div class="lr_linkarea">
                <div>계정이 필요하신가요? <a href="/landmine/join" class="login_link">회원가입</a>
                </div>
              </div>
              <a href="javascript:login()" class="lr_btn w-button">로그인</a>
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
	<jsp:include page="frame/page/footer.jsp"></jsp:include>
	
  </div>
	
	<jsp:include page="frame/js.jsp"></jsp:include>
	<script src="https://d3e54v103j8qbb.cloudfront.net/js/jquery-3.5.1.min.dc5e7f18c8.js?site=64afbe4e8ebe5f98389608e1" type="text/javascript" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
  </body>
  <script>
  function login() {
		var formData = new FormData($('#loginFrm')[0]);
		$.ajax({
			type : 'post',
			data : formData,
			url : '/landmine/loginProcess.do',
		 	contentType: false,
		 	processData: false,				
			success : function(data) {
				if (data.result == 'success') {
					alert(data.msg);
					location.href = "/landmine/user/main.do";
				} else {
					console.log(data.msg);
					alert(data.msg);
				}
			}
		})
	}
  </script>
</html>