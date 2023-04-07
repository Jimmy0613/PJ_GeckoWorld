function showResponse(pnum) {
    let uri = '/board/getResponse?pnum=' + pnum;
    $.ajax({
        type: "get",
        url: uri,
        dataType: "json",
        success: function (data) {
            let str = '<tr><th style="cursor:pointer;" onclick="hideResponse();"><strong>∧ 답변 감추기 ∧</strong></th></tr>';
            $(".resHead").append(str);
            $.each(data, function (i, res) {
                str = '<tr><td><h3><span style="color:white; background-color:cornflowerblue;">답변</span>&nbsp;&nbsp;' + res.w_nickname + ' 님의 답변</h3></td></tr>';
                str += '<tr><td><b>' + res.rdate + '</b><c:if test="${LOGIN_USER != null}">';
                str += '<c:if test="${LOGIN_USER.id eq post.w_id}">';
                str += '&nbsp;<button style="padding: 5px;">수정</button>&nbsp;<button style="padding: 5px;">삭제</button>';
                str += '</c:if></c:if></td></tr>';
                str += '<tr><td><br/></td></tr>';
                str += '<tr><td style="white-space: pre-line;">' + res.content + '</td></tr>';
                str += '<tr><td><br/></td></tr>';
                str += '<tr><td><button id="likeBtn' + res.rnum + '" value="' + res.like_count + '" onclick="like(' + res.rnum + ');" style="left:40%; background-color:rgb(176, 200, 245);">추천 ' + res.like_count + '</button></td></tr>';
                str += '<tr><td><hr/></td></tr>';
                $(".resBody").append(str);
            });

            $("#resBtn").css('display', 'none');
        },
        error: function () {
            console.log("답변 불러오기 실패");
        }
    });
}

function hideResponse() {
    $(".resHead").empty();
    $(".resBody").empty();
    $("#resBtn").css('display', 'inline');
}

function like(rnum) {
    let uri = "/board/like?rnum=" + rnum;
    $.ajax({
        type: "get",
        url: uri,
        success: function () {
            let like_count = parseInt($("#likeBtn" + rnum).val()) + 1;
            $("#likeBtn" + rnum).val(like_count);
            let str = '추천 ' + like_count;
            $("#likeBtn" + rnum).text(str);
        }

    })
}

function deletePost(pnum) {
    if (confirm('삭제하시겠습니까?')) {
        location.href = '/board/deletePost?pnum=' + pnum;
    }
}