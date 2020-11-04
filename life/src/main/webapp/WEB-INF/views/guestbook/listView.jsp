<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
<script src="../resources/js/jquery-3.4.1.min.js"></script>
<script src="../resources/js/guest.js"></script>
<link rel="stylesheet" href="../resources/css/guest.css">

<script>
function del(n){
	var form = document.getElementById('hiddenForm');
	var pw = document.getElementById('pw'+n);
	var num = document.getElementById('num');
	var password = document.getElementById('password');

	num.value=n;
	password.value=pw.value;
	form.submit();
		
}

</script>
</head>
<body>


	<div id="invoice">

		<div class="toolbar hidden-print">
			<div class="text-right"></div>
			<hr>
		</div>
		<div class="invoice overflow-auto">
			<div style="min-width: 600px">

				<header>
					<div style="text-align: center;">
						<h1>[방명록]</h1>
					</div>
				</header>
					<div class="text-gray-light" class="btn btn-info" style="width: 60%; margin:0 auto;">
						<input type="button" value="글쓰기"
							onclick="location.href='writeForm'">
					</div>
					<table border="0" cellspacing="0" cellpadding="0" style="margin: 0 auto;">
						<thead>
							<tr>
								<th>글번호</th>
								<th class="text-right">작성자</th>
								<th class="text-right">내용</th>
								<th class="text-left">글 삭제하기</th>
								<th class="text-right">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="guest" items="${list}">
								<tr>
									<td class="no">${guest.num}</td>
									<td class="text-left">${guest.name}</td>
									<td class="qty"><pre>${guest.contents}</pre></td>
									<td class="unit">p.s<input type="password"
										style="width: 50px;" id="pw${guest.num }"><br> <input
										type="button" value="삭제" onclick="del(${guest.num})"></td>
									<td class="total">${guest.inputdate}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<form id="hiddenForm" action="delete" method="post">
						<input type="hidden" name="num" id="num"> <input
							type="hidden" name="password" id="password">
					</form>
			</div>
		</div>
	</div>






</body>
</html>