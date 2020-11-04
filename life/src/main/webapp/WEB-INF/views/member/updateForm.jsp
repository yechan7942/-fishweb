<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>개인 정보 수정</title>
<style type="text/css">
	#updateform{
		width: 300px;
		margin: 0 auto;
	}
</style>
<script src="../resources/js/jquery-3.4.1.min.js"></script>
  <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="../resources/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="../resources/css/default.css" />
  <script src="../resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/background/style.css" />
 <script type="text/javascript" src="../resources/background/script.js"></script>
    <script src="../resources/js/jquery-3.4.1.min.js"></script>

    <link rel="stylesheet" href="../resources/snow/styles.css"></link>
    <script src='../resources/snow/snowfall.jquery.min.js'></script>
    <script type='text/javascript'>     
        $(document).ready(function(){
		       $(document).snowfall({
			       image :"../resources/snow/flake.png",
			       minSize: 10,
			       maxSize:32,
			       flakeIndex:-2
			       })
            
         });</script>
<script>
function formCheck() {
	var pw = document.getElementById('password');
	var pw2 = document.getElementById('password2');
	var name = document.getElementById('name');
	
	if (pw.value.length < 3 || pw.value.length > 10) {
		alert("비밀번호는 3~10자로 입력하세요.");
		pw.focus();
		pw.select();
		return false;
	}
	if (pw.value != pw2.value) {
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
	return true;
}
</script>
</head>

<body style="background-color:Tomato;">
<div class="centerdiv" style="width: 60%; margin:0 auto;">
<h3>[ 개인 정보 수정 ]</h3>

<form id="updateform" action="update"  method="post" onsubmit="return formCheck();">
<table class="table table-bordered">
	<tr>
		<th>ID</th>
		<td>${member.id}</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="password" id="password" placeholder="비밀번호 입력"><br>
		<input type="password" id="password2" placeholder="비밀번호 다시 입력""></td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" id="name" placeholder="이름 입력"  value="${member.name}"></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" name="phone" placeholder="전화번호 입력"  value="${member.phone}"></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" name="email" id="email" placeholder="이메일  입력"  value="${member.email}"></td>
	</tr>
</table>
	<br>

<input type="submit" value="수정" class="btn btn-warning" role="button"/>
<input type="reset" value="다시 쓰기" class="btn btn-danger" role="button" />

</form>

</div>
</body>
</html>