<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
<meta charset=UTF-8">
<script type="text/javascript" src="/lhk/webjars/jquery/3.3.1/dist/jquery.min.js"></script>
<title>수정</title>
</head>
<script>
	$(document).ready(function(){
		var fileNo="${param.fileNo}";
		$.ajax({
			type : "post",
			url : "detailboard",
			data : {"fileNo" : fileNo}
		}).done(function(data){
			
			var d = JSON.parse(data);			
			var fileName = d.fileName;
			var boardTitle = d.boardTitle;
			var boardContents = d.boardContents;
			$("form input").eq(0).val(boardTitle);
			$("form input").eq(1).val(boardContents);
			$("form input").eq(2).val(fileName);
			$("#files").empty();
			var fileURL = d.fileURL;
			var html = "<img src='"+fileURL+"' width='150' height='150'><br>";
			$("#files").append(html);
			
		})
		$("form").submit(function(e){
			e.preventDefault();
			
			$.ajax({
				type : "post",
				url : "http://FileServer/FileUpload/gang",
				data: new FormData($(this)[0]),
				contentType: false,
				cache: false,
				processData: false
			}).done(function(data) {
				  var d = JSON.parse(data)
				  $.ajax({
					  type : "post",
				  	  url : "updateboard2",
				  	  data : {
				  		  "fileNo" : fileNo,
						  "boardTitle" : $("form input").eq(0).val(),
						  "boardContents" : $("form input").eq(1).val(),
						  "fileName" : $("form input").eq(2).val(),
						  "fileURL" : d.fileURL,
						  "data" : JSON.stringify(d.upload)
				  	  }
				  }).done(function(data){
					  var d = JSON.parse(data);
					  console.log(d);
					  alert("수정");
					  location.href = "detail?fileNo=" + d.fileNo;
				  });
			})
		});
	});
</script>
<body>
	<h1>글수정! </h1>
	<form action="" method="post" enctype="multipart/form-data">
		<input type="text" name="boardTitle" placeholder="제목를 입력하세요."><br>
		<input type="text" name="boardContents" placeholder="내용을 입력하세요."><br>
		<input type="text" name="fileName" placeholder="파일 제목를 입력하세요."><br>
		<input type="file" name="file" multiple="multiple"><br>
		<input type="submit"     value="글수정">
	</form>
	<div id="files"></div>
</body>
</html>