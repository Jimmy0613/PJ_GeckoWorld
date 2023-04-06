function out(id){
    let ok = confirm('정말 탈퇴하시겠어요?');
    if(ok){
        let uri = '/user/out?id=' + id;
        $.ajax({
            type:"get",
            url:uri,
            success: function(){
                alert('탈퇴가 완료되었습니다.');
            },
            error: function(){
                alert('서버와 통신 중 에러가 발생했습니다.');
            }
        })
    } else {
        return false;
    }
}