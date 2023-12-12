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
            <h2 class="content_title">회원가입</h2>
            <div class="regist_block">
             <form id="joinFrm">
              <div class="form-block w-form">
                  <div class="input_warp">
                    <div class="input_label">아이디</div>
                    <div class="input_ad_warp"><input type="text" class="input2 w-input" maxlength="256" name="id" data-name="id" placeholder="로그인시 사용할 아이디를 입력해주세요." id="id" required="">
                      <a href="javascript:checkIdFunc()" class="input_btn w-button">중복확인</a>
                    </div>
                    <div class="input_notice">* ID는 4~16자리입니다.</div>
                  </div>
                  <div class="input_warp">
                    <div class="input_label">비밀번호</div><input type="password" class="input1 w-input" maxlength="256" name="pw" data-name="pw" placeholder="비밀번호를 입력하세요." id="pw" required="">
                    <div class="input_notice">* Password는 6~16자리입니다.</div>
                  </div>
                  <div class="input_warp">
                    <div class="input_label">비밀번호 확인</div><input type="password" class="input1 w-input" maxlength="256" name="pwConfirm" data-name="pwConfirm" placeholder="비밀번호를 다시 한번 입력하세요." id="pwConfirm" required="">
                    <div class="input_warn">* Password가 일치하지 않습니다.</div>
                  </div>
                  <div class="input_warp">
                    <div class="input_label">닉네임</div>
                    <div class="input_ad_warp"><input type="text" class="input2 w-input" maxlength="256" name="nickName" data-name="nickName" placeholder="닉네임" id="nickName" required="">
                      <a href="javascript:checkNickNameFunc()" class="input_btn w-button">중복확인</a>
                    </div>
                  </div>
                  <div class="input_warp">
                    <div class="input_label">휴대폰 번호</div>
                    <input type="text" class="input2 w-input" maxlength="256" name="phone" data-name="phone" placeholder="전화번호를 정확히 입력해주세요." id="phone" required="">
                    <a href="javascript:checkPhone()" class="input_btn w-button">휴대폰인증</a>
                  </div>
                   <div class="input_warp">
                    <div class="input_label">인증번호</div>
                    <input type="text" class="input2 w-input" maxlength="256" name="phoneCode" data-name="phoneCode" placeholder="인증번호를 입력해주세요." id="phoneCode" required="">
                  </div>
                  </div>
                  <div class="input_warp">
                    <div class="input_label">은행정보</div>
                    <div class="input_ad_warp"><select id="bank" name="bank" data-name="bank" class="input3 w-select">
                        <option value="">은행선택</option>
						<option value="카카오뱅크">카카오뱅크</option>
						<option value="국민은행">국민은행</option>
						<option value="기업은행">기업은행</option>
						<option value="농협은행">농협은행</option>
						<option value="신한은행">신한은행</option>
						<option value="산업은행">산업은행</option>
						<option value="우리은행">우리은행</option>
						<option value="한국씨티은행">한국시티은행</option>
						<option value="하나은행">하나은행</option>
						<option value="SC제일은행">SC제일은행</option>
						<option value="경남은행">경남은행</option>
						<option value="광주은행">광주은행</option>
						<option value="대구은행">대구은행</option>
						<option value="도이치">도이치</option>
						<option value="뱅크오브아메리카">뱅크오브아메리카</option>
						<option value="부산은행">부산은행</option>
						<option value="산림조합">산림조합</option>
						<option value="저축은행">저축은행</option>
						<option value="새마을금고">새마을금고</option>
						<option value="수협은행">수협은행</option>
						<option value="산협중앙회">산협중앙회</option>
						<option value="우체국">우체국</option>
						<option value="전북은행">전북은행</option>
						<option value="제주은행">제주은행</option>
						<option value="중국건설은행">중국건설은행</option>
						<option value="중국공상은행">중국공상은행</option>
						<option value="중국은행">중국은행</option>
						<option value="BNP파리바">BNP파리바</option>
						<option value="HSBC은행">HSBC은행</option>
						<option value="JP모간">JP모간</option>
						<option value="케이뱅크">케이뱅크</option>
						<option value="토스뱅크">토스뱅크</option>			
						<option value="신협">신협</option>			
						<option value="미래에셋">미래에셋</option>	
                      </select>
                      <input type="text" class="input3 w-input" maxlength="256" name="mname" data-name="mname" placeholder="예금주" id="mname" required=""></div>
                      <input type="text" class="input1 w-input" maxlength="256" name="account" data-name="account" placeholder="계좌번호를 입력해주세요." id="account" required="">
                  </div>
                  <div class="input_warp">
                    <div class="input_label">환전 비밀번호</div><input type="password" class="input1 w-input" maxlength="256" name="changePw" data-name="changePw" placeholder="환전시 사용할 비밀번호를 설정해주세요." id="changePw" required="">
                  </div>
                </form>
                <div class="lr_linkarea">
                <div>이미 회원가입을 하셨나요? <a href="/landmine/login" class="login_link">로그인</a>
                </div>
              </div>
               <a href="javascript:join()" class="lr_btn w-button">회원가입</a>
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
  	var checkNickName = false;
	var checkId = false;
  function checkIdFunc() {
		$.ajax({
			type : 'post',
			data : {
				'id' : $("#id").val()
			},
			url : '/landmine/checkId.do',
			success : function(data) {
				alert(data.msg);
				if (data.result == 'success') {
					checkId = true;
				}
				else{
					checkId = false;
				}
			}
		})
	}
  function checkPhone() {
		$.ajax({
			type : 'post',
			data : {
				'phone' : $("#phone").val()
			},
			url : '/landmine/checkPhone.do',
			success : function(data) {
				alert(data.msg);
				
			}
		})
	}
  function checkNickNameFunc() {
		$.ajax({
			type : 'post',
			data : {
				'nickname' : $("#nickName").val()
			},
			url : '/landmine/checkNickName.do',
			success : function(data) {
				alert(data.msg);
				if (data.result == 'success') {
					checkNickName = true;
				}
				else{
					checkNickName = false;
				}
			}
		})
	}
  
  var joining = false;
	function join() {
		if (joining)
			return;
		if ($("#id").val().length <1) {
			alert("아이디를 입력하세요.");
			return false;
		}
		if ($("#id").val().length <4 ||$("#id").val().length >16) {
			alert("id는 4자리~16자리입니다.");
			return false;
		}
		if (!checkId) {
			alert("아이디 중복확인을 부탁드립니다.");
			return false;
		}
		if (!checkNickName) {
			alert("닉네임 중복확인을 부탁드립니다.");
			return false;
		}
		if ($("#pw").val() != $("#pwConfirm").val()) {
			alert("비밀번호와 비밀번호확인 제대로 입력하세요.")
			return false;
		}
		
		joining = true;
		var data = $("#joinFrm").serialize();
		$.ajax({
			type : 'post',
			data : data,
			url : '/landmine/joinProcess.do',
			success : function(data) {
				joining = false;
				alert(data.msg);
				if (data.result == 'success') {
					location.href = "/landmine/login.do";
				}
			}
		})
	}
  </script>
</html>