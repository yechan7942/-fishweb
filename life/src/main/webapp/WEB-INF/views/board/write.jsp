<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/table.css" />
<script src="../resources/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$('#next').on('click',happy);	
});
function happy(){
 var title = $('#title').val();
 var contents = $('#contents').val();
 if (title.length == 0 || contents.length == 0) {
		alert('제목과 내용을 입력해주세요.');
		return false;
	}
	return true;
}

</script>

</head>
<body>
	<div class="centerdiv">
		<h1>글쓰기</h1>
		<form action="write" method="post">
			<table>
				<tr>
					<th>제목</th>
					<td><input type="text" name="title" id="title"></td>
				</tr>

				<tr>
					<th>내용</th>
					<td><textarea rows="10" cols="50" name="contents"
							id="contents"></textarea></td>
				</tr>

			</table>
			<input type="submit" id="next" value="저장">
		</form>
	</div>
</body>
</html>