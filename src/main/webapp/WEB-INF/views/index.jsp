<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Rental</title>
</head>
<body>
    <h1>Book Rental</h1>
    <h2><fmt:formatDate value="${serverTime}" pattern="yyyy년 MM월 dd일 HH시 mm분 ss초" /></h2>
    <%-- ${변수명} : 표현식, JSTL로 날짜와 시간 형식을 변경 --%>
    
    <a href="/admin">관리자 모드</a>
    <a href="/user">사용자 모드</a>
</body>
</html>










