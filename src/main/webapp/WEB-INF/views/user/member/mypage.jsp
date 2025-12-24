<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>

<div class="banner">
    <h2><span>My</span> PAGE</h2>
</div>

<section>
    <ul class="staff-info-wrap">
        <c:forEach var="mvo" items="${memberInfo}">
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
        </c:forEach>
    </ul>
</section>
<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>