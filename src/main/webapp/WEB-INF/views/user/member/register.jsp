<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/user/include/header.jsp" %>

<div class="banner">
	<h2><span>User</span> REGISTER</h2>
</div>

<c:if test="${not empty resultMsg}">
  <p class="alert alert-${alertType} text-center">
    ${resultMsg}
  </p>
</c:if>

<section>
    <form id="reg_frm" name="reg_frm" action="/user/member/register" method="post">
        <ul class="user-reg-frm">
            <li>
                <input type="text" id="mb_id" name="mb_id" class="js-id" placeholder="아이디 입력" autofocus
                	required minlength="4" maxlength="20" pattern="[a-z0-9]+" title="아이디는 영문 소문자/숫자 4~20자로 입력하세요.">
                <button type="button" id="mb_id_check" class="btn btn-secondary js-id-check"
                    data-url="/user/member/idcheck" data-param="mb_id">중복 확인</button>
            </li>
            <li><p id="idcheck_msg" class="d-inline-block alert idcheck-msg"></p></li>
            
            <li><input type="password" id="mb_pw" name="mb_pw" class="js-pw" placeholder="비밀번호 입력" required></li>
            <li><input type="password" id="mb_repw" name="mb_repw" class="js-repw" placeholder="비밀번호 확인" required></li>
            <li><p id="pwcheck_msg" class="d-inline-block alert">비밀번호는 4~20자여야 합니다.</p></li>
            
            <li><input type="text" id="mb_name" name="mb_name" placeholder="이름 입력" required></li>
            <li>
                <input type="radio" id="male" name="mb_gender" value="m" required>
                <label for="male" class="btn btn-secondary btn-blank">남성</label>
                <input type="radio" id="female" name="mb_gender" value="f">
                <label for="female" class="btn btn-secondary btn-blank">여성</label>
            </li>
            <li>
                <label for="mb_birth">생년월일</label>
                <input type="date" id="mb_birth" name="mb_birth" required>
            </li>
            <li><input type="email" id="mb_mail" name="mb_mail" placeholder="이메일 입력" required></li>
            <li><input type="tel" id="mb_phone" name="mb_phone" placeholder="전화번호 입력" required></li>
            <li>
                <input type="button" onclick="execDaumPostcode()" value="우편번호 찾기">
				<input type="text" id="mb_zipcode" name="mb_zipcode"placeholder="우편번호" style="width: 110px;" required readonly><br>			
				<input type="text" id="mb_addr" name="mb_addr" style="width: 300px;" placeholder="주소" required readonly><br>
				<input type="text" id="mb_addr_detail" name="mb_addr_detail"placeholder="상세주소" required>
			</li>
            <li><button id="reg-btn" type="submit" class="btn btn-dark btn-lg">회원 가입</button></li>
        </ul>
    </form>
</section>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/resources/js/register.js" defer></script>