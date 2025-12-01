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
                <input type="text" id="staffId" name="staffId" class="form-control" placeholder="아이디 입력" autofocus>
                <button type="button" id="staffIdCheck" class="btn btn-secondary">중복 확인</button>
            </li>
            <li><p id="idCheckMsg" class="idcheck-msg">※ 아이디중복확인 버튼을 눌러 아이디 중복을 확인하세요.</p></li>
            <li><input type="password" id="staffPw" name="staffPw" class="form-control" placeholder="비밀번호 입력"></li>
            <li><input type="password" id="staffRepw" name="staffRepw" class="form-control" placeholder="비밀번호 확인"></li>
            <li><input type="text" id="staffName" name="staff_name" class="form-control" placeholder="이름 입력"></li>
            <li>
                <input type="radio" id="male" name="staffGender" value="m">
                <label for="male" class="btn btn-secondary btn-blank">남성</label>
                <input type="radio" id="female" name="staffGender" value="f">
                <label for="female" class="btn btn-secondary btn-blank">여성</label>
            </li>
            <li>
                <label for="birth">생년월일</label>
                <input type="date" id="birth" name="birth">
            </li>
            <li>
                <label for="staffPhone">연락처</label>
                <input type="tel" id="staffPhone" name="staffPhone" class="form-control" placeholder="전화번호 입력">
            </li>
            <li><input type="email" id="staffMail" name="staffMail" class="form-control" placeholder="이메일 입력"></li>
            <li><button id="reg-btn" type="button" onclick="checkData()" class="btn btn-dark btn-lg" disabled="disabled">직원 가입</button></li>
        </ul>
    </form>
</section>


<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>