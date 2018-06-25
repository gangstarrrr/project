<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
<meta charset=UTF-8">
<title>보드디테일</title>
<script type="text/javascript" src="webjars/jquery/3.3.1/dist/jquery.min.js"></script>
<script>
	$(document).ready(function(){
		var fileNo="${param.fileNo}"
		$.ajax({
			type : "post",
			url : "detailboard",
			data:{"fileNo":fileNo}
		}).done(function(data){
			var data = JSON.parse(data);
			var title = data.boardTitle;
			var contents = data.boardContents;
			$("#title").append(title);
			$("#contents").append(contents);
			var fileURL=data.fileURL;
			var html="<img src='"+fileURL+"'width='200' height='200'><br>";
			$("#files").append(html);
			var list = data.list;
			$("#body").append(update);
		});
	});


</script>
</head>
<body>

	<h1 id="title">제목 : </h1>
	<p id="contents">내용 : </p>
	<div id="files"></div>
	
   <a href="admin" style="margin-right:60px;">메인으로</a>
   <a href="updateboard?fileNo=${param.fileNo}">수정</a>
   <a href="delfileboard?fileNo=${param.fileNo}">삭제</a>
</body>
</html>