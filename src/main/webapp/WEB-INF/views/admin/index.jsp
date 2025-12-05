<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/staff.css">

<div class="adm-bnr">
	<h2><span>Admin</span> INDEX</h2>
</div>

<section>
<c:choose>
	<c:when test="${empty sessionScope.staff}">
	    <form action="/admin/staff/login" method="post">
	    	<ul class="staff-login-frm">
	    		<li><input type="text" name="staff_id" placeholder="아이디 입력" autofocus required></li>
	    		<li><input type="password" name="staff_pw" placeholder="비밀번호 입력" required"></li>
	    		<li>
	    			<button type="submit" class="btn btn-dark btn-lg" >로그인</button>
	    			<a href="/admin/staff/register" class="btn btn-primary btn-lg">직원 가입</a>
	    		</li>
	    	</ul>
	    </form>
	</c:when>
	
	<c:otherwise>
		<h3 style="color: red">${sessionScope.staff.staff_name}님 안녕하세요.</h3>
		<a href="/admin/staff/logout" class="btn btn-primary">로그아웃</a>
		<a href="/admin/staff/staff_list" class="btn btn-primary">직원 목록</a>
		<a href="#" class="btn btn-primary">메뉴3</a>
		<a href="#" class="btn btn-primary">메뉴4</a>
		<a href="#" class="btn btn-primary">메뉴5</a>
	</c:otherwise>
</c:choose>
</section>
<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>