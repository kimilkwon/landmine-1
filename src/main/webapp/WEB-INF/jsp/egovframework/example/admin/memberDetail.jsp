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
								</form>
								<div class="row">
									<div class="col-lg-3">
										<div class="form-group">
											<label>생년월일</label> 
											<pre>${info.birth}&nbsp;</pre>
										</div>
									</div>
									<div class="col-lg-3">
										<div class="form-group">
											<label>전화번호</label> 
											<pre>${info.phone}&nbsp;</pre>
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
	$.ajax({
		type:'post',
		data:{"idx" : idx , "id" : id , "name" : name, "pw":pw,"walletpw":walletpw},
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