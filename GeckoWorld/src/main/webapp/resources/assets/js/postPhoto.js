
function editComment(cnum) {
    let uri = '/board/editCommentPhoto?cnum=' + cnum;
    $.ajax({
        type: "get",
        url: uri,
        success: function (data) {
            let str = `<form action="/board/editCommentPhoto.do" method="post">`
            str += `<input type="hidden" name='num' value="${data.num}">`;
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

function deletePost(num) {
    if (confirm('삭제하시겠습니까?')) {
        location.href = '/board/deletePostPhoto?num=' + num;
    }
}

function deleteComment(cnum){
    if(confirm('삭제하시겠습니까?')){
        location.href = '/board/deleteCommentPhoto?cnum=' + cnum;
    }
}