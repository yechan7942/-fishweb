<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
   

<style type="text/css">
	body{
	background-image: url("../resources/img/portfolio-4.jpg");
	background-repeat: no-repeat;
	background-size: 100%;
	}
	#back{
		width: 1245px;
		height: 685px;
		opacity: 0.8;
		margin: 0 auto;
		background-color:white;
		margin-top: 35px;
		padding: 30px;
	}
</style>
<title>[Search]</title>
<script type="text/javascript">
	function test() {
 		var data = {
 					"type":$("#select").val(),
 					"searchKey":$("#searchKey").val()
 					};
		console.log(data);
		$.ajax({
			url : 'fish',
			type : 'get',
			data : data,
			success : function(result) {
				console.log(result);
				var parse = JSON.parse(result);
				var test = parse.response.body.items.item;

				console.log(JSON.parse(result));
				console.log(test);

				var str = '<ul>';
				if(Array.isArray(test)){
					$.each(test, function(key, item) {
						if(item.chrtr != null){
						str += '<li>' + item.chrtr + '</li>';
						}
						if(item.distrInh !=null){
						str += '<li>' + item.distrInh + '</li>';
						}
						if(item.sciKr != null){
						str += '<li>' + item.sciKr + '</li>';
						}
					});
				}else if(!Array.isArray(test) && test != null){
					if(test.chrtr != null){	
					str +='<li>'+ test.chrtr+'</li>';}
					if(test.distrInh != null){
					str +='<li>'+ test.distrInh+'</li>';}
					if(test.sciKr != null){
					str +='<li>'+ test.sciKr+'</li>';
					}
                }else{
			        str += '<p>해당 기간에 데이터가 존재하지 않습니다.</p>'
			    };

			    str += '</ul>';
					

				$('#listDiv').html(str);
			}
		});
	}
</script>
</head>




<body>
   
<div id="back">
	<h1>바다생물 백과사전</h1><h4>(한글자도 틀리면 안나옴) ex)우럭,백상아리,오징어</h4>
	<select id="select">
				<option value="1">제목</option>
		<option value="2">내용</option>
	</select>
	<input type="text" name="searchKey" id="searchKey" placeholder="검색어"></input>
	
	<a href="javaScript:test()" class="btn btn-warning" role="button">검색</a>
	<div id="listDiv"></div>
	
</div>




</body>
</html>