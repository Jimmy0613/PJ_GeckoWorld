let id = document.querySelector("#id");
let id_msg = document.querySelector("#id_msg");
let pw1 = document.querySelector("#pw1");
let pw2 = document.querySelector("#pw2");
let pw_msg = document.querySelector("#pw_msg");
let user_name = document.querySelector("#user_name");
let id_check = document.querySelector("#id_check");
let pw_check1 = document.querySelector("#pw_check1");
let pw_check2 = document.querySelector("#pw_check2");
let name_check = document.querySelector("#name_check");
let id_confirm_btn = document.querySelector("#id_confirm_btn");
let form_join = document.querySelector("#form_join");

function id_onchange() {
  id_confirm_btn.style.opacity = 1;
  id_confirm_btn.disabled = false;
  id_confirm_btn.style.cursor = "pointer";
  id_check.innerHTML = "";
  id_msg.innerHTML = "";
}
function pw_onchange() {
  const pwPattern = /^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z\d~!@#$%^&*]{8,14}$/;
  pw_check1.innerHTML = "";
  pw_check2.innerHTML = "";
  if (pw1.value !== null && pw2.value !== null) {
    if (pw1.value === pw2.value) {
      if(pwPattern.test(pw1.value)){
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
function id_confirm() {
  if (id.value === null || id.value === "") {
    id_msg.innerHTML = "아이디를 입력해주세요.";
    id_msg.style.color = "red";
    return;
  } else {
    const idPattern = /^(?=.*\d)(?=.*[a-z])[a-z\d]{5,12}$/;
    if (idPattern.test(id.value)) {
      let uri = encodeURI("/user/id_confirm?id=" + id.value);
      $.get(uri, function (data) {
        console.log(data);
        if (data === false) {
          id_msg.innerHTML = "사용할 수 있는 아이디입니다.";
          id_msg.style.color = "blue";
          id_check.innerHTML = " ✔";
          id_confirm_btn.style.opacity = 0.5;
          id_confirm_btn.disabled = true;
          id_confirm_btn.style.cursor = "default";
          return;
        } else {
          id_msg.innerHTML = "이미 사용 중인 아이디입니다.";
          id_msg.style.color = "red";
          id_check.innerHTML = "";
          return;
        }
      }).fail(function () {
        alert("서버와 통신 중 오류가 발생했습니다.");
      });
    } else {
      id_msg.innerHTML = "영어 소문자와 숫자만 사용 가능합니다.";
      id_msg.style.color = "red";
      return;
    }

  }
}

function join_confirm() {
  let agree = document.querySelector("#agree");
  let id_check = document.querySelector("#id_check");
  if (agree.checked === false) {
    alert("이용 약관에 동의해주세요.");
    return;
  }
  if (id_check.innerHTML !== " ✔") {
    alert("아이디 중복 확인을 해주세요.");
    return;
  }
  if (pw_check1.innerHTML !== " ✔") {
    alert("비밀번호를 확인해주세요.");
    return;
  }
  if (user_name.value.length < 2 || user_name.value.length > 8) {
    alert("이름은 2 ~ 8자로 입력해주세요.");
    return;
  }

  form_join.submit();
}
