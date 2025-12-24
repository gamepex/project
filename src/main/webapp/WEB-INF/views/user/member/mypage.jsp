<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>

<div class="banner">
    <h2><span>My</span> PAGE</h2>
</div>

<section>
    <ul class="user-info-wrap">
	    <li>
	        <h4>${mvo.mb_nickname} 님</h4>
	        <p>아이디 : ${mvo.mb_id}</p>
	        <p>이름 : ${mvo.mb_name}</p>
	        <p>성별 : ${mvo.mb_gender == 'm' ? '남성' : '여성'}</p>
	        <p>생년월일 : ${mvo.mb_birth}</p>
	        <p>전화 : ${mvo.mb_phone}</p>
	        <p>메일 : ${mvo.mb_mail}</p>
	        <p>주소 : [${mvo.mb_zipcode}] ${mvo.mb_addr} ${mvo.mb_addr_detail}</p>
	        <p>등급 : ${mvo.mb_grade}</p>
	    </li>
    </ul>

	<div class="user-group-btn">
		<a href="/user/member/modify?mb_id=${mvo.mb_id}" class="btn btn-success btn-lg">수정</a>
		
		<form action="/user/member/deleteMember" method="post" class="d-inline">
			<input type="hidden" name="mb_id" value="${mvo.mb_id}">
			<button type="submit" class="btn btn-danger btn-lg">탈퇴</button>
		</form>
	</div>

</section>
<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>