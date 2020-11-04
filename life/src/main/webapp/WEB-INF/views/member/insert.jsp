<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[Join]</title>


<script type="text/javascript">

function idcheckOpen(){
	window.open('idcheck','idwin','top=400, left=400,  width=400, height=400');
	
}
function menu(){
	var form = document.getElementById('form');	
	var id = document.getElementById('id');
	var pw = document.getElementById('password');
	var pw1 = document.getElementById('password1');
	var name = document.getElementById('name');
	var phone = document.getElementById('phone');
	var email = document.getElementById('email');
	
	if (id.value.length < 3 || id.value.length > 10) {
		alert("ID는 3~10자로 입력하세요.");
		id.focus();
		id.select();
		return false;
	}
	if (pw.value.length < 3 || pw.value.length > 10) {
		alert("비밀번호는 3~10자로 입력하세요.");
		pw.focus();
		pw.select();
		return false;
	}
	if (pw.value != pw1.value) {
		alert("비밀번호를 정확하게 입력하세요.");
		pw.focus();
		pw.select();
		return false;
	}
	if (name.value == '') {
		alert("이름을 입력하세요.");
		name.focus();
		name.select();
		return false;
	}
	if (phone.value == '') {
		alert("숫자를 입력해주세요~");
		phone.focus();
		phone.select();
		return false;
	}
	if (email.value == '') {
		alert("이메일을 입력해주세요..");
		email.focus();
		email.select();
		return false;
	}	
	
	form.submit();
}


	

</script>
</head>
<body>
<div align="center">
		<h1>[회원 가입]</h1>

		<form id="form" action="insert" method="post">
			<table border=1>
				<tr>
					<th>ID</th>
					<td><input type="text" name="id" id="id" readonly="readonly"
						placeholder="ID중복확인 이용"> 
						<input type="button"
						value="ID중복확인" onclick="idcheckOpen()"></td>
				</tr>
				<tr>
					<th rowspan="2">비밀번호</th>
					<td><input type="password" name="password" id="password"
						placeholder="비밀번호 입력"></td>
				</tr>
				<tr>
					<td><input type="password" id="password1"
						placeholder="비밀번호 다시 입력"></td>
				</tr>

				<tr>
					<th>이름</th>
					<td><input type="text" name="name" id="name"
						placeholder="이름 입력"></td>
				</tr>

				<tr>
					<th>전화번호</th>
					<td><input type="text" name="phone" id="phone"
						placeholder="번호 입력"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email" id="email"
						placeholder="이메일 입력"></td>
				</tr>

			</table>


			<input type="button" value="가입" onclick="menu()"> 
			<input type="reset"  value="다시 쓰기">
		</form>
	</div>
</body>
</html>