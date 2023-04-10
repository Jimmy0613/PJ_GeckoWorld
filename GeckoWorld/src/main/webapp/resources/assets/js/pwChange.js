let pw_check0 = document.querySelector("#pw_check0");
let pw_check1 = document.querySelector("#pw_check1");
let pw_check2 = document.querySelector("#pw_check2");
let pw1 = document.querySelector("#pw1");
let pw2 = document.querySelector("#pw2");

//비밀번호 확인
function old_pw_onchange(id) {
    var oldPw = $("#oldPw").val();
    uri = encodeURI(`/user/pw_confirm?id=${id}&pw=${oldPw}`);
    $.get(uri, function (data) {
        if (data === true) {
            pw_check0.innerHTML = " ✔";
        } else {
            pw_check0.innerHTML = " ";
            return;
        }
    })

}

function pw_onchange() {
    const pwPattern = /^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z\d~!@#$%^&*]{8,14}$/;
    pw_check1.innerHTML = "";
    pw_check2.innerHTML = "";
    if (pw1.value !== null && pw2.value !== null) {
        if (pw1.value === pw2.value) {
            if (pwPattern.test(pw1.value)) {
                pw_check1.innerHTML = " ✔";
                pw_check2.innerHTML = " ✔";
                pw_msg.innerHTML = "비밀번호가 일치합니다.";
                pw_msg.style.color = "blue";
            } else {
                pw_msg.innerHTML = "영문(소문자or대문자), 숫자를 모두 포함해야합니다. (특수문자는 ~!@#$%^&*만 가능)";
                pw_msg.style.color = "red";
            }
        } else {
            pw_msg.innerHTML = "비밀번호가 일치하지 않습니다.";
            pw_msg.style.color = "red";
        }
    }
}

function change(id) {
    if (pw_check0.innerHTML !== " ✔") {
        alert("기존 비밀번호가 틀렸습니다.");
        return;
    }
    if (pw_check1.innerHTML !== " ✔") {
        alert("새로운 비밀번호를 확인해주세요.");
        return;
    }
    let uri = "/user/passwordChange.do?id=" + id + "&pw=" + pw1.value;
    $.get(uri, function (data) {
        if (data) {
            alert('변경되었습니다.');
            location.href = '/user/changePassword';
        } else {
            alert('서버와 통신 중 오류가 발생하였습니다.');
        }
    })
}