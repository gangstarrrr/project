<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title> 매덩여행 - 런던</title>
	<link rel="stylesheet" type="text/css" href="resources/index.css">
   <link rel="stylesheet" type="text/css"  media="only screen and (max-width: 1200px)" href="resources/tab.css">
   <link rel="stylesheet" type="text/css"  media="only screen and (max-width: 670px)" href="resources/phone.css">
	<link rel='shortcut icon' href='resources/icon/send.png'>
	<script type="text/javascript" src="webjars/jquery/3.3.1/dist/jquery.min.js"></script>

	<script>
		$(document).ready(function(){
			$.ajax({
				type:"post",
				url:"selectlonDetail"
			}).done(function(data){
				var d = JSON.parse(data);
				var list = d.list;
				for(var i=0;i<list.length;i++){
					var html="<section style='background-image: url("+list[i].fileURL+")'class='bar'>";
					html += "<article>"+"<h1>"+list[i].boardTitle+"</h1>";
					html += "<p>"+list[i].boardContents+"</p>";
					html +="</article></section>";
					$("body").append(html);
				}
			});
		});
	</script>
</head>
<body>
    <div id="before_button">
        <a href="index"><img src="resources/icon/before_icon.png" width="70px"></a>
    </div>
</body>
</html>