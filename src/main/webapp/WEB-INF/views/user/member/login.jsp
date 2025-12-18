<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>

<div class="banner"></div>
	    <form action="/user/member/login" method="post">
	    	<ul class="mb-frm-wrap">
	    		<li><input type="text" name="mb_id" placeholder="아이디 입력" autofocus required class="form-control"></li>
	    		<li><input type="password" name="mb_pw" placeholder="비밀번호 입력" required class="form-control"></li>
	    		<li>
	    			<button type="submit" class="btn btn-lg btn-dark" >로그인</button>
	    			<a href="/user/member/register" class="btn btn-lg btn-primary">회원 가입</a>
	    			<a href="/user/member/resetpwd" class="btn btn-lg btn-secondary">비밀번호 찾기</a>
	    		</li>
	    	</ul>
	    </form>
	    
<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>