<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
<meta charset=UTF-8">
<title>테스트중</title>
<script type="text/javascript" src="webjars/jquery/3.3.1/dist/jquery.min.js"></script>
<script type="text/javascript">


var no = 1;   // 오로지 var 타입의 변수만 존재

function add() {
        var target = document.getElementById('gugu');
        target.innerHTML += '<input type="button" value="'+no+'" />';
        no++;
}

</script>
</head>
<body>

<a href="index">홈으로</a>

        <!-- on으로 시작하는 속성은 자바스크립트꺼~! -->
        <div id="gugu" onclick="add();">
        </div>

 

</body>
</html>