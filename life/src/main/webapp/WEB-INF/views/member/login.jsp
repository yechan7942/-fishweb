
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[Login]/title></title>
<script src="../resources/js/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="../resources/css/login.css">
<script src="../resources/js/login2.js">

</script>
</head>


<script>
$(document).ready(function(){
	$("#btn1").on("click",login);
});

function login(){
	var log = document.getElementById('id');
	var ps = document.getElementById('password');
	if(log.value==null||ps.value==""){
		alert('옳바른 id와 password를 입력해 주세요.');
		return;
	}else{
		$.ajax({
				url : 'login',
				type : 'post',
				data : {"id" : log.value,
						"password" : ps.value},
				success : function(a) {
					if(a==true){
							close();
							opener.location.reload();
					} else{
						alert('다시 입력해 주세요.');
						}					
			}	
			});
	}
}

</script>
</head>
<body>
<div class="login-wrap">
	<h2>Login</h2>
	<div class="form">
	<form action="login" method="post" onsubmit="return login();">
				<input type="text" name="id" id="id" placeholder="Username">
					
				<input type="password" name="password" id="password" placeholder="Password">
		
		<p><input type="button" class="b1" id ="btn1" value="Sign in" ></p>
	</form>
	</div>
</div>
</body>
</html>