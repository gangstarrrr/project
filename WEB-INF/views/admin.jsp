<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
<meta charset=UTF-8">
<title>테스트중</title>
<script type="text/javascript" src="webjars/jquery/3.3.1/dist/jquery.min.js"></script>
<style>
    input{margin-bottom:10px;}   
</style>
</head>
<body>

<h1>관리자페이지</h1>


	<c:if test="${empty sessionScope}">
		<p>로그인</p>
		<form action="userSelect" method="post">
		<input type="text" name="userId" placeholder="아이디를 입력해주세요" ><br>
		<input type="password" name="userPassword" placeholder="비밀번호를 입력해주세요"><br>
		<input type="submit" value="로그인">
		</form>
	</c:if>
	
 	<c:if test="${sessionScope.user.status==1}">
		${sessionScope.user.userId}님 환영합니다.
		<br>
		<div style="padding: 5px"></div>
		<a href="filelist" style="padding-right:5px;">파일 리스트</a>
		<a href="update" style="padding-right:5px">이미지교체</a>
		<a href="insert" style="padding-bottom:30px">삽입</a><div style="padding: 5px"></div>
		<a href="logout" style="padding-right:5px">로그아웃</a>
	</c:if>
<a href="index">홈으로</a>
</body>
</html>