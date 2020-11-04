<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[ID 중복 체크]</title>
<script>
	function formCheck() {
		var id = document.getElementById('searchId');
		if (id.value.length<3||id.value.length>12) {
			alert('ID는 3~12자로 입력하세요.')
			return false;
		}
		return true;
	}
	function inputId(){
		opener.document.getElementById('id').value = '${searchId}';
		this.close();

		}
</script>
</head>
<body>
<h1>[ ID중복확인]</h1>

	<form action="idcheck" method="post" onsubmit="return formCheck()">
		검색할 ID<input type="text" name="searchId" id="searchId"> 
		<input type="submit" value="검색">

	</form>
	
	
	<c:if test="${result!=null}">
		<c:if test="${result=='yes'}">
			<p>${searchId}: 사용 가능한 아이디 입니다.</p>
			<p>
				<input type="button" value="ID사용하기" onclick="inputId()">
			</p>
		</c:if>
		<c:if test="${result=='no'}">
			<p>${searchId}: 이미 사용중인 ID입니다.</p>
		</c:if>
	</c:if>
</body>
</html>