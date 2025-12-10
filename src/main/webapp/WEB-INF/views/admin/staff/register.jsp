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
                <input type="text" id="staff_id" name="staff_id" class="form-control" placeholder="아이디 입력" autofocus
                	required minlength="4" maxlength="20" pattern="[a-z0-9]+" title="아이디는 영문 소문자/숫자 4~20자로 입력하세요.">
                <button type="button" id="staff_id_check" class="btn btn-secondary">중복 확인</button>
            </li>
            <li><p id="idcheck_msg" class="d-none d-inline-block alert alert-danger idcheck-msg"></p></li>
            
            <li><input type="password" id="staff_pw" name="staff_pw" placeholder="비밀번호 입력"></li>
            <li><input type="password" id="staff_repw" name="staff_repw" placeholder="비밀번호 확인"></li>
            <li><p id="pwcheck_msg" class="d-none d-inline-block alert alert-danger pwcheck-msg"></p></li>
            
            <li><input type="text" id="staff_name" name="staff_name" placeholder="이름 입력"></li>
            <li>
                <input type="radio" id="male" name="staff_gender" value="m">
                <label for="male" class="btn btn-secondary btn-blank">남성</label>
                <input type="radio" id="female" name="staff_gender" value="f">
                <label for="female" class="btn btn-secondary btn-blank">여성</label>
            </li>
            <li>
                <label for="staff_birth">생년월일</label>
                <input type="date" id="staff_birth" name="staff_birth">
            </li>
            <li><input type="tel" id="staff_phone" name="staff_phone" placeholder="전화번호 입력"></li>
            <li><input type="email" id="staff_mail" name="staff_mail" placeholder="이메일 입력"></li>
            <li><button id="reg-btn" type="button" onclick="checkData()" class="btn btn-dark btn-lg">직원 가입</button></li>
        </ul>
    </form>
</section>



<script>

	// 아이디 중복확인
    document.querySelector("#staff_id_check").addEventListener("click", () => {
        const staffId = document.querySelector("#staff_id").value.trim();
        const msg = document.querySelector("idcheck-msg");

        if (!staffId) {
        	msg.classList.remove('d-none');
            msg.textContent = "아이디를 입력하세요.";
            return;
        }

        fetch("/admin/staff/idcheck", {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: "staff_id=" + encodeURIComponent(staffId)
        })
        .then(res => res.text())
        .then(text => {
        	msg.classList.remove('idcheck-msg');
            msg.textContent = (text === "true") ? "중복된 아이디입니다." : "사용 가능한 아이디입니다.";
        });
    });
	
	
    // 유효성 검증 - 비밀번호 일치 여부 (미완성)
    document.querySelector('#staff_repw').addEventListener('input', () => {
		const staffPw   = document.querySelector('#staff_pw');
		const staffRepw = document.querySelector('#staff_repw');
		const msg = document.querySelector("#pwcheck_msg");
		
		if (staffPw.value === staffRepw.value) {
		    msg.classList.remove('pwcheck-msg');
		    msg.textContent = '비밀번호가 일치합니다.';
		} else {
		    msg.classList.add('pwcheck-msg');
		    msg.textContent = '비밀번호가 일치하지 않습니다.';
		}
	});

    function checkData() {
		document.reg_frm.submit();
	}
</script>

<%@ include file="/WEB-INF/views/user/include/footer.jsp" %>