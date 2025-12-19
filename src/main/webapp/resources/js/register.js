let idOk = false;
let pwOk = false;


const staffIdInput = document.querySelector("#staff_id");
const idMsg = document.querySelector("#idcheck_msg");

// 아이디 입력 시 중복확인 초기화
staffIdInput.addEventListener("input", () => {
    idOk = false;
});

// 아이디 중복확인
document.querySelector("#staff_id_check").addEventListener("click", () => {
    const staffId = staffIdInput.value.trim();

    if (!staffId) {
        idMsg.classList.remove("d-none");
        idMsg.textContent = "아이디를 입력하세요.";
        return;
    }

    fetch("/admin/staff/idcheck", {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: "staff_id=" + encodeURIComponent(staffId)
    })
    .then(res => res.text())
    .then(text => {
        idMsg.classList.remove("d-none");
        if (text === "true") {
        	idOk.classList.remove("alert-danger");
        	idOk.classList.add("alert-success");
            idOk = false;
            idMsg.textContent = "중복된 아이디입니다.";
        } else {
        	idOk.classList.remove("alert-success");
        	idOk.classList.add("alert-danger");
            idOk = true;
            idMsg.textContent = "사용 가능한 아이디입니다.";
        }
    });
});



// 비밀번호 일치 확인
const staffPw = document.querySelector("#staff_pw");
const staffRepw = document.querySelector("#staff_repw");
const pwMsg = document.querySelector("#pwcheck_msg");

function pwCheck() {
    const pw = staffPw.value;
    const repw = staffRepw.value;

    if (repw.length === 0) {
        pwOk = false;
        return;
    }

if (pw === repw) {
        pwMsg.classList.remove("alert-danger");
        pwMsg.classList.add("alert-success");
        pwOk = true;
        pwMsg.textContent = "비밀번호가 일치합니다.";
    } else {
        pwMsg.classList.remove("alert-success");
        pwMsg.classList.add("alert-danger");
        pwOk = false;
        pwMsg.textContent = "비밀번호가 일치하지 않습니다.";
    }
    // 향후 해당부분 함수화하기
}

staffPw.addEventListener("input", pwCheck);
staffRepw.addEventListener("input", pwCheck);

// 회원가입 폼 제출
const form = document.querySelector("#reg_frm");
form.addEventListener("submit", (e) => {
    if (!idOk) {
        e.preventDefault();
        alert("아이디 중복확인을 해주세요.");
        return;
    } else if (!pwOk) {
        e.preventDefault();
        alert("비밀번호 확인이 일치하지 않습니다.");
        return;
    }
});