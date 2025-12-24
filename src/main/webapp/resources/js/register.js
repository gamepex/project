let idOk = false;
let pwOk = false;


const idInput = document.querySelector(".js-id");
const idMsg = document.getElementById("idcheck_msg");

function setIdMsg(type, text) {
  idMsg.classList.remove("alert-success", "alert-danger");
  idMsg.classList.add(type === "success" ? "alert-success" : "alert-danger");
  idMsg.textContent = text;
}

// 아이디 입력 시 중복확인 초기화
idInput.addEventListener("input", () => {
    idOk = false;
    setIdMsg("danger", "아이디 중복확인을 해주세요.");
});

// 아이디 중복확인
document.querySelector(".js-id-check").addEventListener("click", (e) => {
    const id = idInput.value.trim();
    const btn = e.currentTarget;
    const url = btn.dataset.url;
    const param = btn.dataset.param;

    if (!id) {
        idOk = false;
        setIdMsg("danger", "아이디를 입력하세요.");
        return;
    }

    fetch(url, {
        method: "POST",
        headers: { "Content-Type": "application/x-www-form-urlencoded;charset=UTF-8" },
        body: param + "=" + encodeURIComponent(id)
    })
    .then(res => res.text())
    .then(text => {
        if (text === "true") {
            idOk = false;
            setIdMsg("danger", "중복된 아이디입니다.");
        } else {
        	idOk = true;
            setIdMsg("success", "사용 가능한 아이디입니다.");
        }
    });
});



// 비밀번호 일치 확인
const pwEl = document.querySelector(".js-pw");
const repwEl = document.querySelector(".js-repw");
const pwMsg = document.getElementById("pwcheck_msg");

function pwCheck() {
    const pw = pwEl.value;
    const repw = repwEl.value;

    if (repw.length === 0) {
        pwOk = false;
        return;
    }

    pwMsg.classList.remove("alert-success", "alert-danger");
    const result = (pw === repw);
    pwOk = result;
    pwMsg.classList.add(result ? "alert-success" : "alert-danger");
    pwMsg.textContent = result ? "비밀번호가 일치합니다." : "비밀번호가 일치하지 않습니다.";

}

pwEl.addEventListener("input", pwCheck);
repwEl.addEventListener("input", pwCheck);

// 회원가입 폼 제출
const form = document.getElementById("reg_frm");
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

// 우편번호 찾기
function execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function (data) {

        let addr = '';
        
        if (data.userSelectedType === 'R') {
            addr = data.roadAddress;
        } else {
            addr = data.jibunAddress;
        }

        document.getElementById('mb_zipcode').value = data.zonecode;
        document.getElementById('mb_addr').value = addr;
        document.getElementById('mb_addr_detail').focus();
    }
  }).open();
}