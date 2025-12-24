<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>

<div class="banner">
	<h2><span>User</span> LOGIN</h2>
</div>

<section>
	    <form action="/user/member/login" method="post">
	    	<ul class="mb-frm-wrap">
	    		<li><input type="text" name="mb_id" placeholder="아이디 입력" autofocus required ></li>
	    		<li><input type="password" name="mb_pw" placeholder="비밀번호 입력" required></li>
	    		<li>
	    			<button type="submit" class="btn btn-lg btn-dark" >로그인</button>
	    			<a href="/user/member/register" class="btn btn-lg btn-primary">회원가입</a>

					<!-- 로그인 에러 메시지 -->
	    			<p id="login_msg" class="login-msg d-inline-block alert alert-danger ${empty loginError ? 'd-none' : ''}">
        				<c:out value="${loginError}" />
    				</p>
	    		</li>
	    	</ul>
	    </form>

</section>
	    
<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>