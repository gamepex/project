<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/staff.css">

<div class="adm-bnr">
	<h2><span>Staff</span> REGISTER</h2>
</div>

<section>
    <form name="reg_frm" action="/admin/staff/register" method="post">
        <ul class="staff-reg-frm">
            <li>
                <input type="text" id="staff_id" name="staff_id" placeholder="아이디 입력" autofocus>
                <button type="button" id="staff_id_check" class="btn btn-secondary">중복 확인</button>
            </li>
            <li><p id="idCheckMsg" class="idcheck-msg">※ 버튼을 눌러 아이디 중복을 확인하세요.</p></li>
            <li><input type="password" name="staff_pw" placeholder="비밀번호 입력"></li>
            <li><input type="password" name="staff_repw" placeholder="비밀번호 확인"></li>
            <li><input type="text" id="staff_name" name="staff_name" placeholder="이름 입력"></li>
            <li>
                <input type="radio" id="male" name="staff_gender" value="m">
                <label for="male" class="btn btn-secondary btn-blank">남성</label>
                <input type="radio" id="female" name="staff_gender" value="f">
                <label for="female" class="btn btn-secondary btn-blank">여성</label>
            </li>
            <li>
                <label for="birth">생년월일</label>
                <input type="date" id="birth" name="birth">
            </li>
            <li><input type="tel" id="staff_phone" name="staff_phone" placeholder="전화번호 입력"></li>
            <li><input type="email" id="staff_mail" name="staff_mail" placeholder="이메일 입력"></li>
            <li><button id="reg-btn" type="button" onclick="checkData()" class="btn btn-dark btn-lg" disabled="disabled">직원 가입</button></li>
        </ul>
    </form>
</section>


<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>