<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp" %>

    <div class="bn">
    	<h2><span>Member</span> RESET PASSWORD</h2>
    </div>
    
    <link rel="stylesheet" href="/resources/css/member.css">
    
    <section>
	    <form action="/user/member/resetpwd" method="post">
	    	<ul class="mb-frm-wrap mb-resetpwd-wrap">
	    		<li><input type="text" name="mb_id" placeholder="아이디 입력" autofocus required class="form-control"></li>
	    		<li><input type="text" name="mb_name" placeholder="이름 입력" required class="form-control"></li>
	    		<li><input type="tel" name="mb_phone" placeholder="전화번호 입력" required class="form-control"></li>
	    		<li><input type="password" name="mb_pw" placeholder="재설정 비밀번호 입력" required class="form-control"></li>
	    		<li>
	    			<button type="submit" class="btn btn-dark btn-lg">비밀번호 재설정</button>
	    			<a href="/user/member/login" class="btn btn-primary btn-lg">로그인</a>
	    			<a href="/user/member/register" class="btn btn-info btn-lg mt10">회원 가입</a>
	    		</li>
	    	</ul>
	    </form>
	    
	    <div class="msg-wrap">
	    	<c:if test="${reset_pwd == false}">
	    	<p class="alert alert-danger">※ 비밀번호 재설정에 실패했습니다.</p>
	    	</c:if>
	   	</div>
    </section>

<%@ include file="../include/footer.jsp" %>














