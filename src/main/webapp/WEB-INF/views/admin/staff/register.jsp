<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/staff.css">

<div class="adm-bnr">
	<h2><span>Staff</span> REGISTER</h2>
</div>

<c:if test="${not empty resultMsg}">
  <p class="alert alert-${alertType} text-center">
    ${resultMsg}
  </p>
</c:if>

<section>
    <form id="reg_frm" name="reg_frm" action="/admin/staff/register" method="post">
        <ul class="staff-reg-frm">
            <li>
                <input type="text" id="staff_id" name="staff_id" placeholder="아이디 입력" autofocus
                	required minlength="4" maxlength="20" pattern="[a-z0-9]+" title="아이디는 영문 소문자/숫자 4~20자로 입력하세요.">
                <button type="button" id="staff_id_check" class="btn btn-secondary ">중복 확인</button>
            </li>
            <li><p id="idcheck_msg" class="d-none d-inline-block alert idcheck-msg"></p></li>
            
            <li><input type="password" id="staff_pw" name="staff_pw" placeholder="비밀번호 입력" required></li>
            <li><input type="password" id="staff_repw" name="staff_repw" placeholder="비밀번호 확인" required></li>
            <li><p id="pwcheck_msg" class="d-inline-block alert">비밀번호는 4~20자여야 합니다.</p></li>
            
            <li><input type="text" id="staff_name" name="staff_name" placeholder="이름 입력" required></li>
            <li>
                <input type="radio" id="male" name="staff_gender" value="m" required>
                <label for="male" class="btn btn-secondary btn-blank">남성</label>
                <input type="radio" id="female" name="staff_gender" value="f">
                <label for="female" class="btn btn-secondary btn-blank">여성</label>
            </li>
            <li>
                <label for="staff_birth">생년월일</label>
                <input type="date" id="staff_birth" name="staff_birth" required>
            </li>
            <li><input type="tel" id="staff_phone" name="staff_phone" placeholder="전화번호 입력" required></li>
            <li><input type="email" id="staff_mail" name="staff_mail" placeholder="이메일 입력" required></li>
            <li><button id="reg-btn" type="submit" class="btn btn-dark btn-lg">직원 가입</button></li>
        </ul>
    </form>
</section>


<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>
<script src="/resources/js/register.js" defer></script>