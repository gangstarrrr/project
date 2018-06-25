<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset=UTF-8">
<title>수정</title>
<script type="text/javascript" src="webjars/jquery/3.3.1/dist/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			//**************************버튼	
				$.ajax({
					type:"post",
					url:"selectButton"
				}).done(function(data){
					var d = JSON.parse(data);
					var list = d.list;
					for(var i=0;i<list.length;i++){
						var html="<option value='"+list[i].fileName+"'>";
						html+=list[i].fileName+"</option>";
						$("#buttonlistY").prepend(html);
					}
				});			
				$.ajax({
					type:"post",
					url:"selectButtonN"
				}).done(function(data){
					var d = JSON.parse(data);
					var list = d.list;
					for(var i=0;i<list.length;i++){
						var html="<option value='"+list[i].fileName+"'>";
						html+=list[i].fileName+"</option>";
						$("#buttonlistN").prepend(html);
					}
				});
				
			$("#updateButton").submit(function(event){
				event.preventDefault();
 				var fileName=$("#buttonY").val();
 				var fileName2=$("#buttonN").val();
				console.log(fileName); 
 				$.ajax({
					type:"post",
					url:"updateButton",
					data : {
						"fileName" : fileName,
						"fileName2" : fileName2	
					}
				}).done(function(){
					alert("수정완료");
				}); 
			});
			//**************************리스트	
			$.ajax({
					type:"post",
					url:"selectList"
				}).done(function(data){
					var d = JSON.parse(data);
					var list = d.list;
					for(var i=0;i<list.length;i++){
						var html="<option value='"+list[i].fileName+"'>";
						html+=list[i].fileName+"</option>";
						$("#ListlistY").prepend(html);
					}
				});			
				$.ajax({
					type:"post",
					url:"selectListN"
				}).done(function(data){
					var d = JSON.parse(data);
					var list = d.list;
					for(var i=0;i<list.length;i++){
						var html="<option value='"+list[i].fileName+"'>";
						html+=list[i].fileName+"</option>";
						$("#ListlistN").prepend(html);
					}
				});
				
			$("#updateList").submit(function(event){
				event.preventDefault();
 				var fileName=$("#ListY").val();
 				var fileName2=$("#ListN").val();
				console.log(fileName); 
 				$.ajax({
					type:"post",
					url:"updateList",
					data : {
						"fileName" : fileName,
						"fileName2" : fileName2	
					}
				}).done(function(){
					alert("수정완료");
				}); 
			});
			//**************************바르셀로나
			$.ajax({
					type:"post",
					url:"selectbarDetail"
				}).done(function(data){
					var d = JSON.parse(data);
					var list = d.list;
					for(var i=0;i<list.length;i++){
						var html="<option value='"+list[i].fileName+"'>";
						html+=list[i].fileName+"</option>";
						$("#barDetaillistY").prepend(html);
					}
				});			
				$.ajax({
					type:"post",
					url:"selectbarDetailN"
				}).done(function(data){
					var d = JSON.parse(data);
					var list = d.list;
					for(var i=0;i<list.length;i++){
						var html="<option value='"+list[i].fileName+"'>";
						html+=list[i].fileName+"</option>";
						$("#barDetaillistN").prepend(html);
					}
				});
				
			$("#updatebarDetail").submit(function(event){
				event.preventDefault();
 				var fileName=$("#barDetailY").val();
 				var fileName2=$("#barDetailN").val();
				console.log(fileName); 
 				$.ajax({
					type:"post",
					url:"updatebarDetail",
					data : {
						"fileName" : fileName,
						"fileName2" : fileName2	
					}
				}).done(function(){
					alert("수정완료");
				}); 
			});
			//**************************런던
			$.ajax({
				type:"post",
				url:"selectlonDetail"
			}).done(function(data){
				var d = JSON.parse(data);
				var list = d.list;
				for(var i=0;i<list.length;i++){
					var html="<option value='"+list[i].fileName+"'>";
					html+=list[i].fileName+"</option>";
					$("#lonDetaillistY").prepend(html);
				}
			});			
			$.ajax({
				type:"post",
				url:"selectlonDetailN"
			}).done(function(data){
				var d = JSON.parse(data);
				var list = d.list;
				for(var i=0;i<list.length;i++){
					var html="<option value='"+list[i].fileName+"'>";
					html+=list[i].fileName+"</option>";
					$("#lonDetaillistN").prepend(html);
				}
			});
			
		$("#updatelonDetail").submit(function(event){
			event.preventDefault();
				var fileName=$("#lonDetailY").val();
				var fileName2=$("#lonDetailN").val();
			console.log(fileName); 
				$.ajax({
				type:"post",
				url:"updatelonDetail",
				data : {
					"fileName" : fileName,
					"fileName2" : fileName2	
				}
			}).done(function(){
				alert("수정완료");
			}); 
		});
		});

	</script>

	<style>
		p{font-size: 1.5em ; font-weight: bolder}

	</style>

</head>
<body>

<p>버튼 이미지</p>
	<form id="updateButton" action="" method="post">
		<label for="buttonY">수정 전</label>
		<input type="text" name="buttonY" id="buttonY" list="buttonlistY">
		<datalist id="buttonlistY">
		</datalist>
		<label for="buttonN">수정 후</label>
		<input type="text" name="buttonN" id="buttonN" list="buttonlistN">
		<datalist id="buttonlistN">
		</datalist>
		<input type="submit" value="수정"><BR>
	</form>
<hr>
<p>리스트 이미지</p>
	<form id="updateList" action="" method="post">
		<label for="ListY">수정 전</label>
		<input type="text" name="ListY" id="ListY" list="ListlistY">
		<datalist id="ListlistY">
		</datalist>
		<label for="ListN">수정 후</label>
		<input type="text" name="ListN" id="ListN" list="ListlistN">
		<datalist id="ListlistN">
		</datalist>
		<input type="submit" value="수정"><BR>
	</form>
<hr>	
<p>바르셀로나 이미지</p>
	<form id="updatebarDetail" action="" method="post">
		<label for="barDetailY">수정 전</label>
		<input type="text" name="barDetailY" id="barDetailY" list="barDetaillistY">
		<datalist id="barDetaillistY">
		</datalist>
		<label for="barDetailN">수정 후</label>
		<input type="text" name="barDetailN" id="barDetailN" list="barDetaillistN">
		<datalist id="barDetaillistN">
		</datalist>
		<input type="submit" value="수정"><BR>
	</form>
<hr>	
<p>런던 이미지</p>
	<form id="updatelonDetail" action="" method="post">
		<label for="lonDetailY">수정 전</label>
		<input type="text" name="lonDetailY" id="lonDetailY" list="lonDetaillistY">
		<datalist id="lonDetaillistY">
		</datalist>
		<label for="lonDetailN">수정 후</label>
		<input type="text" name="lonDetailN" id="lonDetailN" list="lonDetaillistN">
		<datalist id="lonDetaillistN">
		</datalist>
		<input type="submit" value="수정"><BR>
	</form><br>
<hr>
<a href="index">메뉴</a>
</body>
</html>