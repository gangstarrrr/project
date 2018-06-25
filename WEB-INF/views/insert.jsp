<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="webjars/jquery/3.3.1/dist/jquery.min.js"></script>
<title>파일삽입</title>
<script>
	$(document).ready(function(){
		$("form").submit(function(e){
			e.preventDefault();
			$.ajax({
				type:"post",
				url:"http://FileServer/FileUpload/gang",
				data:new FormData($(this)[0]),
				contentType:false,
				cache:false,
				processData:false
			}).done(function(data){
				var d = JSON.parse(data);
				console.log(d);
				
				$.ajax({
					type:"post",
					url:"fileInsert",
					data:{
						"fileName":$("form input").eq(0).val(),
						"boardTitle":$("form input").eq(1).val(),
						"boardContents":$("form input").eq(2).val(),
						data:JSON.stringify(d.upload) 
					}
				}).done(function(data){
					alert("파일 삽입 성공");
					location.href="test";
				});
			})
		})
	});
</script>
<style>
    input{margin-bottom:10px;}   
</style>
</head>
<body>
	<h2>파일삽입 & 글 작성</h2>
	<form action="" method="post">
		<input type="text" name="fileName" placeholder="파일의 제목을 입력해주세요" ><br>
		<input type="text" name="boardTitle" placeholder="사진의 제목을 입력해주세요"><br>
		<input type="text" name="boardContents" placeholder="사진의 내용을 입력해주세요"><br>
		<input type="file" name="file"><br>
		<input type="submit" value="파일삽입">
	</form>
</body>
</html>