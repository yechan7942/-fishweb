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
$(document).ready(function() {
	$('#btn2').on('click', formSubmit);
	init();
});
function formSubmit() {
		
	var name = $('#name').val();
	var text = $('#text').val();

	if (name.length == 0 || text.length == 0) {
		alert('이름과 내용을 입력해 주세요.');
		return;
	}
	$.ajax({
		url : '/good/reply/insert',
		type : 'POST',
		data : {
			name : name,
			text : text
		},
		success : function() {
			alert('작성되었습니다.');
			$('#name').val('');
			$('#text').val('');
			init();
		},
		error : function(e) {
			alert(JSON.stringify(e));
		}
	});
}

function init() {
	$.ajax({
		url : '/good/reply/list',
		type : 'GET',
		success : output
	});
}

function output(msg) {
	var str = '<table>';
	$.each(msg, function(key, item) {
		str += '<tr>';
		str += '<td class="tdNum">' + item.num + '</td>';
		str += '<td class="tdName">' + item.name + '</td>';
		str += '<td class="tdText">' + item.text + '</td>';
		str += '<td><input type="button" value="수정" class="btnUpd"></td>';
		str += '<td><input type="button" value="삭제" class="btnDel" data-num="'+ item.num +'"></td>';
		str += '</tr>';
	});
	str += '</table>';

	$('#replyList').html(str);

	$('input:button.btnUpd').on('click', replyUpd);
	
	$('input:button.btnDel').on('click', replyDel);
}
var flag = true;

function replyUpd() {
	if (!flag) { //만약 flag 변수의 값이 false이면 이하 수정 양식 표시 코드를 실행하지 않고 함수를 종료한다.
		return;
	}

	flag = false;
	
	var num = $(this).closest('tr').find('.tdNum').html(); 
	var name = $(this).closest('tr').find('.tdName').html();
	var text = $(this).closest('tr').find('.tdText').html();

	//수정 양식을 문자열로 작성
	var str = '';
	str += '<tr>';
	str += '	<td></td>';
	str += '	<td><input type="text" value="' + name + '" disabled="true"></td>'; //disabled 대신 readonly 속성도 비슷한 효과를 가짐
	str += '	<td><input type="text" id="TextUpd" value="' + text + '"></td>';
	str += '	<td><input type="button" id="ConfirmUpd" value="수정 확인"></td>';
	str += '	<td><input type="button" id="CancelUpd" value="취소"></td>';
	str += '</tr>';

	$(this).closest('tr').after(str);

	$("#ConfirmUpd").on("click", function() {
		var textUpd = $(this).closest('tr').find("#TextUpd").val(); 
		
		$.ajax({
			url: '/good/reply/update',
			type: 'POST',
			data: {
				num: num,
				name: name,
				text: textUpd
			},
			success: function() {
				alert("수정에 성공했습니다.");
				flag = true; 
				init();
			},
			error: function(e) {
				alert(JSON.stringify(e));
			}
		});
	});

	$("#CancelUpd").on("click", function() {
		flag = true; 
		$(this).closest('tr').remove();
	});
}


function commentDel() {
	
	var num = $(this).attr('data-num');
	
	$.ajax({
		url : '/good/reply/delete',
		type : 'POST',
		data : {
			num : num
		},
		success : function() {
			alert('삭제되었습니다.');
			init();
		}
	});
}





</script>
</head>
<body>
<body>
	<div class="centerdiv">
		<h1>[게시판 글 읽기]</h1>
		<table>
			<tr>
				<th>작성자</th>
				<td>${b.id}</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${b.inputdate}</td>
			</tr>

			<tr>
				<th>조회수</th>
				<td>${b.hits}</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${b.title}</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${b.contents}</td>
			</tr>
		</table>
	
		<form id="writeForm">
			이름 <input type="text" id="name" name="name" style="width: 100px;">
			내용 <input type="text" id="text" name="text" style="width: 300px;">
			<input type="button" id="btn2" value="댓글작성하기">
		</form>
	</div>
	<br>
	<br>

		
	<div id="replyList"></div>


</body>
</html>

