function showResponse(pnum) {
    let uri = '/board/getResponse?pnum=' + pnum;
    $.ajax({
        type: "get",
        url: uri,
        dataType: "json",
        success: function (data) {
            let list = data.list;
            let LOGIN_USER = data.LOGIN_USER;
            let str = '<tr><th style="cursor:pointer;" onclick="hideResponse();"><strong>∧ 답변 감추기 ∧</strong></th></tr>';
            $(".resHead").append(str);
            $.each(list, function (i, res) {
                str = '<tr><td><h3><span style="color:white; background-color:cornflowerblue;">답변</span>&nbsp;&nbsp;' + res.title + '</h3></td></tr>';
                str += '<tr><td><b>' + res.w_nickname + '&nbsp;|&nbsp;' + res.rdate + '</b>';
                if (LOGIN_USER != null) {
                    if (LOGIN_USER.id == res.w_id) {
                        str += '&nbsp;<button onclick="location.href=\'/board/editResponse?rnum=' + res.rnum + '&pnum=' + pnum + '\'" style="padding: 5px;">수정</button>';
                        str += '&nbsp;<button onclick="deleteResponse(' + res.rnum + ');" style="padding: 5px;">삭제</button>';
                    }
                }
                str += '</td></tr>';
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

function editComment(cnum) {
    let uri = '/board/editComment?cnum=' + cnum;
    $.ajax({
        type: "get",
        url: uri,
        success: function (data) {
            let str = `<form action="/board/editComment.do" method="post">`
            str += `<input type="hidden" name='pnum' value="${data.pnum}">`;
            str += `<input type="hidden" name='cnum' value="${cnum}">`;
            str += `<input style="width:90%;" name='content' value="${escapeHtml(data.content)}">`;
            str += `<input style="padding:5px;" type="submit" value="수정">`;
            str += `</form>`
            console.log(str);
            if ($("#comment" + cnum).length === 0) {
                console.log("#comment" + cnum + " does not exist");
            }
            $("#comment" + cnum).html(str);
        }
    })
}
function escapeHtml(unsafe) {
    return unsafe.replace(/[&<"']/g, function (match) {
        switch (match) {
            case "&":
                return "&amp;";
            case "<":
                return "&lt;";
            case "\"":
                return "&quot;";
            case "'":
                return "&#039;";
            default:
                return match;
        }
    });
}

function deletePost(pnum) {
    if (confirm('삭제하시겠습니까?')) {
        location.href = '/board/deletePost?pnum=' + pnum;
    }
}

function deleteResponse(rnum) {
    if (confirm('삭제하시겠습니까?')) {
        location.href = '/board/deleteResponse?rnum=' + rnum;
    }
}

function deleteComment(cnum){
    if(confirm('삭제하시겠습니까?')){
        location.href = '/board/deleteComment?cnum=' + cnum;
    }
}