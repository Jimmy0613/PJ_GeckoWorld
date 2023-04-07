function cancel(num){
    let ok = confirm('예약을 취소하시겠습니까?');
    if(ok==false){
        return;
    }
    let uri = encodeURI('/book/cancel?num=' + num);
    $.get(uri, function(){
        alert('취소되었습니다.');
        location.href = '/user/reservation';
    })
}