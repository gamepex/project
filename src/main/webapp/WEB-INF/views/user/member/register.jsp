<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/user/member/idcheck" method="get">
		<input type="text" name="mb_id">
		<button type="submit">중복확인</button>
	</form>
</body>
</html>