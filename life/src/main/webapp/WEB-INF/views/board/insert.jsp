<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" type="text/css" href="../resources/css/table.css" />
  <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="../resources/css/bootstrap-theme.min.css">
  <script src="../resources/js/table1.js"></script>
 
<script>
	
	function pagingFormSubmit(currentPage){
	var form = document.getElementById('pagingForm');
	var page = document.getElementById('page');
	page.value = currentPage
	form.submit();
		}
</script>

</head>


<body>

<div class="centerdiv">
<h2>[ 게시판 ]</h2>

<br>
<table id="products">
<tr>
	<td class="white">
		전체 : ${navi.totalRecordsCount}
	</td>
	<td class="white" colspan="3"></td>
	<td class="white">
		<input type="button" class="btn btn-primary" value="글쓰기" onclick="location.href='write';">
	</td>
	
</tr>
<tr>
	<th scope="col">번호</th>
	<th scope="col" style="width:220px">제목</th>
	<th scope="col">작성자</th>
	<th scope="col">조회수</th>
	<th scope="col">등록일</th>
</tr>

<c:forEach var="board" items="${list}">
<tr>
	<td class="center">${board.boardnum}</td>
	<td>
		<a href="read?boardnum=${board.boardnum}">${board.title}</a>
	</td>
	<td class="center">${board.id}</td>
	<td class="center">${board.hits}</td>
	<td>${board.inputdate}</td>
</tr>

</c:forEach>        
</table>
<br/><br/>

<div id="navigator">
	<a href="javascript:pagingFormSubmit(${navi.currentPage - navi.pagePerGroup})">◁◁ </a> &nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage - 1})">◀</a> &nbsp;&nbsp;

	<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}"> 
		<c:if test="${counter == navi.currentPage}"><b></c:if>
			<a href="javascript:pagingFormSubmit(${counter})">${counter}</a>&nbsp;
		<c:if test="${counter == navi.currentPage}"></b></c:if>
	</c:forEach>
	&nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage + 1})">▶</a> &nbsp;&nbsp;
	<a href="javascript:pagingFormSubmit(${navi.currentPage + navi.pagePerGroup})">▷▷</a>


<br><br>


<form id="pagingForm" method="get" action="list">
	<input type="hidden" name="page" id="page" />
	제목 : <input type="text"  name="searchText" value="${searchText}" />
	<input type="button" class="btn btn-primary" onclick="pagingFormSubmit(1)" value="검색">
</form>
</div>
</div>
</div>
</body>
</html>