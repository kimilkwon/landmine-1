<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dth">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<jsp:include page="adminFrame/header.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<div class="login-panel panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Please Sign In</h3>
				</div>
				<div class="panel-body">
					<form id="adminLoginForm" role="form" method="post">
						<fieldset>
							<div class="form-group">
								<input class="form-control" placeholder="Id" name="id" type="text" autofocus>
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="Password" name="pw" type="password">
							</div>
							<button class="btn btn-lg btn-success btn-block" onclick="adminLogin()">Login</button>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="adminFrame/footer.jsp"></jsp:include>
</body>
<script>
function adminLogin(){
	$.ajax({
		type :'post',
		url : '/spgame/admin/loginProcess.do',
		data : $("#adminLoginForm").serialize(),
		success:function(data){
			if(data.result == 'suc')location.href='/spgame/admin/member.do';
			else alert(data.msg);
		}
	})
}
</script>
</html>