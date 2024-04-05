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
<body>
<div id="wrapper">
	<jsp:include page="adminFrame/left.jsp"></jsp:include>
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">회원 정보</h1>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
				<div class="panel-heading"></div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
							<form name="updateForm" id="updateForm" method="post">
								<div class="row">
									<div class="col-lg-3">
										<div class="form-group">
											<label>이름</label> 
											<input type="text" class="form-control" id="name" value="${info.name}">
											
										</div>
									</div>
									<div class="col-lg-3">
										<div class="form-group">
											<label>아이디</label> 
											<input type="text" class="form-control" id="id" value="${info.id}">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-3">
										<div class="form-group">
											<label>비밀번호</label> 
											<input type="text" class="form-control" id="pw" value="${info.pw}">
										</div>
									</div>
									<div class="col-lg-3">
										<div class="form-group">
											<label>환전 비밀번호</label> 
											<input type="text" class="form-control" id="walletpw" value="${info.walletpw}">
										</div>
									</div>
									
									
								</div>
								</form>
								<div class="row">
									<div class="col-lg-3">
										<div class="form-group">
											<label>전화번호</label> 
											<pre><input type="text" class="form-control" id="phone" value="${info.phone}"></pre>
										</div>
									</div>
									<div class="col-lg-3">
										<div class="form-group">
											<label>가입일</label> 
											<pre><fmt:formatDate value="${info.mdate}" pattern="yyyy-MM-dd"/>&nbsp;</pre>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-3">
										<div class="form-group">
											<label>은행</label> 
											<select id="mbank" name="mbank" class="form-control" id="mbank" style="width: fit-content;">
													<option value="">은행을 선택해주세요</option>
													<option value="경남은행" <c:if test="${info.mbank eq '경남은행'}">selected</c:if>>경남은행</option>
													<option value="광주은행" <c:if test="${info.mbank eq '광주은행'}">selected</c:if>>광주은행</option>
													<option value="국민은행" <c:if test="${info.mbank eq '국민은행'}">selected</c:if>>국민은행</option>
													<option value="기업은행" <c:if test="${info.mbank eq '기업은행'}">selected</c:if>>기업은행</option>
													<option value="수협은행" <c:if test="${info.vBank eq '수협은행'}">selected</c:if>>수협은행</option>
													<option value="농협은행" <c:if test="${info.vBank eq '농협은행'}">selected</c:if>>농협은행</option>
													<option value="농협중앙회" <c:if test="${info.mbank eq '농협중앙회'}">selected</c:if>>농협중앙회</option>
													<option value="농협회원조합" <c:if test="${info.mbank eq '농협회원조합'}">selected</c:if>>농협회원조합</option>
													<option value="대구은행" <c:if test="${info.mbank eq '대구은행'}">selected</c:if>>대구은행</option>
													<option value="도이치은행" <c:if test="${info.mbank eq '도이치은행' or info.mbank eq '도이치'}">selected</c:if>>도이치은행</option>
													<option value="부산은행" <c:if test="${info.mbank eq '부산은행'}">selected</c:if>>부산은행</option>
													<option value="산림조합" <c:if test="${info.mbank eq '산림조합'}">selected</c:if>>산림조합</option>
													<option value="산협중앙회" <c:if test="${info.mbank eq '산협중앙회'}">selected</c:if>>산협중앙회</option>
													<option value="산업은행" <c:if test="${info.mbank eq '산업은행'}">selected</c:if>>산업은행</option>
													<option value="새마을금고" <c:if test="${info.mbank eq '새마을금고'}">selected</c:if>>새마을금고</option>
													<option value="수협중앙회" <c:if test="${info.mbank eq '수협중앙회'}">selected</c:if>>수협중앙회</option>
													<option value="신한은행" <c:if test="${info.mbank eq '신한은행'}">selected</c:if>>신한은행</option>
													<option value="신협중앙회" <c:if test="${info.mbank eq '신협중앙회'}">selected</c:if>>신협중앙회</option>
													<option value="외환은행" <c:if test="${info.mbank eq '외환은행'}">selected</c:if>>외환은행</option>
													<option value="우리은행" <c:if test="${info.mbank eq '우리은행'}">selected</c:if>>우리은행</option>
													<option value="우체국" <c:if test="${info.mbank eq '우체국'}">selected</c:if>>우체국</option>
													<option value="전북은행" <c:if test="${info.mbank eq '전북은행'}">selected</c:if>>전북은행</option>
													<option value="제주은행" <c:if test="${info.mbank eq '제주은행'}">selected</c:if>>제주은행</option>
													<option value="저축은행" <c:if test="${info.mbank eq '저축은행'}">selected</c:if>>저축은행</option>
													<option value="카카오뱅크" <c:if test="${info.mbank eq '카카오뱅크'}">selected</c:if>>카카오뱅크</option>
													<option value="토스뱅크" <c:if test="${info.mbank eq '토스뱅크'}">selected</c:if>>토스뱅크</option>
													<option value="케이뱅크" <c:if test="${info.mbank eq '케이뱅크'}">selected</c:if>>케이뱅크</option>
													<option value="하나은행" <c:if test="${info.mbank eq '하나은행'}">selected</c:if>>하나은행</option>
													<option value="한국씨티은행" <c:if test="${info.mbank eq '한국씨티은행'}">selected</c:if>>한국씨티은행</option>
													<option value="HSBC은행" <c:if test="${info.mbank eq 'HSBC은행'}">selected</c:if>>HSBC은행</option>
													<option value="SC제일은행" <c:if test="${info.mbank eq 'SC제일은행'}">selected</c:if>>SC제일은행</option>
													<option value="뱅크오브아메리카" <c:if test="${info.mbank eq '뱅크오브아메리카'}">selected</c:if>>뱅크오브아메리카</option>
													<option value="중국건설은행" <c:if test="${info.mbank eq '중국건설은행'}">selected</c:if>>중국건설은행</option>
													<option value="중국공상은행" <c:if test="${info.mbank eq '중국공상은행'}">selected</c:if>>중국공상은행</option>
													<option value="중국은행" <c:if test="${info.mbank eq '중국은행'}">selected</c:if>>중국은행</option>
													<option value="BNP파리바" <c:if test="${info.mbank eq 'BNP파리바'}">selected</c:if>>BNP파리바</option>
													<option value="JP모간" <c:if test="${info.mbank eq 'JP모간'}">selected</c:if>>JP모간</option>
													<option value="미래에셋" <c:if test="${info.mbank eq '미래에셋'}">selected</c:if>>미래에셋</option>
											</select>
										</div>
									</div>
									<div class="col-lg-3">
										<div class="form-group">
											<label>예금주</label> 
											<pre><input type="text" class="form-control" id="mname" value="${info.mname}"></pre>
										</div>
									</div>
									<div class="col-lg-3">
										<div class="form-group">
											<label>계좌번호</label> 
											<pre><input type="text" class="form-control" id="maccount" value="${info.maccount}"></pre>
										</div>
									</div>
								</div>
								<div class ="row">
									<div class="col-lg-3">
										<div class="form-group">
											<label>회원정보</label> 
											<div class="form-group input-group">
												<span class="input-group-btn">
													<button type="button" onclick="javascript:updateUserInfo()" class="btn btn-primary">회원정보 변경</button>
													<button type="button" onclick="javascript:updateUserRemove()" class="btn btn-danger">회원삭제</button>
												</span>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-3">
										<label>회원 보유금액</label> 
											<pre><fmt:formatNumber value="${info.money}" pattern="#,###"/> KRW&nbsp;</pre>
										</div>
									<div class="col-lg-3">
										<div class="form-group">
											<label>금액 추가/회수</label> 
											<div class="form-group input-group">
												<span class="input-group-btn">
													<button type="button" onclick="javascript:updatePointKRW(${info.idx},'+')" class="btn btn-primary">추가</button>
												</span> 
												<input name="point" class="form-control" placeholder="숫자만 입력" id="pointKRW" onkeyup="SetNum(this);">
												<span class="input-group-btn">
													<button type="button" onclick="javascript:updatePointKRW(${info.idx},'-')" class="btn btn-danger">회수</button>
												</span>
											</div>
										</div>
									</div>
								</div>
								
								
									
								
							
					
						<button type="button" onclick="location.href='/spgame/admin/member.do'" class="btn btn-primary">목록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="adminFrame/footer.jsp"></jsp:include>
</body>
<script>
function SetNum(obj){
	val=obj.value;
	re=/[^0-9]/gi;
	obj.value=val.replace(re,"");
}
function SetCoinNum(obj){
	val=obj.value;
	re=/[^0-9.]/gi;
	obj.value=val.replace(re,"");
}
function updateUser(idx , stat){

	$.ajax({
		type:'post',
		data:{"idx" : idx , "stat" : stat },
		url:'/spgame/admin/updateUser.do',
		dataType:'json',
		success:function(data){
			alert(data.msg);
			if(data.result == 'success'){
				location.reload();
			}
		},
		error:function(e){
			console.log('ajax Error ' + JSON.stringify(e));
		}
	})
}
function updateLockupDate(idx){
	var sdate = $("#sdate").val();
	$.ajax({
		type:'post',
		data:{"idx" : idx , "sdate" : sdate },
		url:'/spgame/admin/updateLockupDate.do',
		dataType:'json',
		success:function(data){
			alert(data.msg);
			if(data.result == 'success'){
				location.reload();
			}
		},
		error:function(e){
			console.log('ajax Error ' + JSON.stringify(e));
		}
	})
}
function updateLockUpNotSet(idx , coin){

	$.ajax({
		type:'post',
		data:{"idx" : idx , "coin" : coin },
		url:'/spgame/admin/updateCoinLockupSet.do',
		dataType:'json',
		success:function(data){
			alert(data.msg);
			if(data.result == 'success'){
				location.reload();
			}
		},
		error:function(e){
			console.log('ajax Error ' + JSON.stringify(e));
		}
	})
}
function updatePoint(idx , kind,coin){
	var memo =prompt('관리자 세부내용', '세부내용을 입력하세요.');
	 
	let point = $("#point"+coin).val();
	if(point == ''){
		alert("point를 입력해주세요");
		return false;
	}
	if(point == '0'){
		alert("point를 제대로 입력해주세요");
		return false;
	}
	$.ajax({
		type:'post',
		data:{"idx" : idx , "kind" : kind , "point" : point,"coin":coin,"memo":memo},
		url:'/spgame/admin/updatePoint.do',
		dataType:'json',
		success:function(data){
			alert(data.msg);
			if(data.result == 'success'){
				location.reload();
			}
		},
		error:function(e){
			console.log('ajax Error ' + JSON.stringify(e));
		}
	})
}
function updatePointKRW(idx , kind){
	let pointKRW = $("#pointKRW").val();
	if(pointKRW == ''){
		alert("point(원화)를 입력해주세요");
		return false;
	}
	else if(pointKRW == '0'){
		alert("point(원화)를 제대로 입력해주세요");
		return false;
	}
	
	$.ajax({
		type:'post',
		data:{"idx" : idx , "kind" : kind , "point" : pointKRW},
		url:'/spgame/admin/updatePointKRW.do',
		dataType:'json',
		success:function(data){
			alert(data.msg);
			if(data.result == 'success'){
				location.reload();
			}
		},
		error:function(e){
			console.log('ajax Error ' + JSON.stringify(e));
		}
	})
}
function updateUserInfo(){
	let idx = '${info.idx}';
	let id = $("#id").val();
	let name = $("#name").val();
	let pw = $("#pw").val();
	let walletpw = $("#walletpw").val();
	let phone = $("#phone").val();
	let mbank = $("#mbank").val();
	let mname = $("#mname").val();
	let maccount = $("#maccount").val();
	
	$.ajax({
		type:'post',
		data:{"idx" : idx , "id" : id , "name" : name, "pw":pw,"walletpw":walletpw,"phone":phone,"mbank":mbank,"mname":mname,"maccount":maccount},
		url:'/spgame/admin/updateUserUpdate.do',
		dataType:'json',
		success:function(data){
			alert(data.msg);
			if(data.result == 'success'){
				location.reload();
			}

		},
		error:function(e){
			console.log('ajax Error ' + JSON.stringify(e));
		}
	})
}
function updateUserRemove(){
	if(!confirm("해당 회원을 정말 삭제하시겠습니까?")) return;
	let idx = '${info.idx}';
	
	$.ajax({
		type:'post',
		data:{"idx" : idx },
		url:'/spgame/admin/updateUserRemove.do',
		dataType:'json',
		success:function(data){
			alert(data.msg);
			if(data.result == 'success'){
				location.href='/spgame/admin/member.do';
			}

		},
		error:function(e){
			console.log('ajax Error ' + JSON.stringify(e));
		}
	})
}
</script>
</html>