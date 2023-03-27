//일반 로그인
$(function () {
    $("#norm_login_btn").click(function () {
        var id = $("#id").val();
        var uri = encodeURI(`/user/id_confirm?user_id=${id}`);
        $.get(uri, function (data) {
            if (data === false) {
                $("#confirm").text("가입 정보가 없는 아이디입니다.");
                $("#confirm").css("color", "red");
                return;
            }
        })
        var pw = $("#pw").val();
        uri = encodeURI(`/user/pw_confirm?user_id=${id}&user_pw=${pw}`);
        $.get(uri, function (data) {
            if (data === true) {
                $("#form_norm_login").submit();
            } else {
                $("#confirm").text("비밀번호가 틀렸습니다.");
                $("#confirm").css("color", "red");
                return;
            }
        })

    })
})