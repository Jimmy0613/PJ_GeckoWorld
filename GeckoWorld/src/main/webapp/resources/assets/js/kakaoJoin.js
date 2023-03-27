$(function () {
    $("#form_kakao_join_btn").click(function () {
        if ($("#agree").is(":checked") === false) {
            alert('약관에 동의해주세요.');
            return;
        }
        if ($("#user_name").val().length < 2) {
            alert('이름은 한 글자 이상 입력해주세요.');
            return;
        }
        $("#form_kakao_join").submit();
    })
})