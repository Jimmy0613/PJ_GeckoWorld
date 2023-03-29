let tag = document.querySelector("#tag");
let title = document.querySelector("#title");
let writerDate = document.querySelector("#writerDate");
let postContent = document.querySelector("#postContent");
let postArea = document.querySelector("#postArea");
let commentCount = document.querySelector("#commentCount");
let currentPage = 1;
let totalPage = '<c:out value="${totalPage}"/>';
let prevPageSpan = document.querySelector("#prevPage");
let nextPageSpan = document.querySelector("#nextPage");
let responseMsg = document.querySelector("#responseMsg");
function showPost(num) {
    let uri = encodeURI('/board/getPost?num=' + num);
    $.ajax({
        type: "get",
        url: uri,
        dataType: "json",
        success: function (data) {
            console.log(data);
            switch (data.tag) {
                case "N":
                    tag.style.backgroundColor = "black";
                    tag.innerHTML = '사담';
                    responseMsg.innerHTML = '';
                    break;
                case "I":
                    tag.style.backgroundColor = "navy";
                    tag.innerHTML = '정보';
                    responseMsg.innerHTML = '';
                    break;
                case "Q":
                    tag.style.backgroundColor = "coral";
                    tag.innerHTML = '질문';
                    var str = '<button onclick="location.href=\'/board/newpost?tag=A&pnum='+data.num + '\'">답변하기</button>&nbsp;&nbsp;';
                    if(data.response_count==0){
                        str += '아직 답변이 없습니다.&nbsp;';
                    } else {
                        str += data.response_count + ' 개의 답변이 있습니다.&nbsp;';
                        str += '<button onclick="showResponse(' + data.num + ');">보기</button>&nbsp;';
                    }
                    responseMsg.innerHTML = str;

                    break;
                case "A":
                    tag.style.backgroundColor = "cornflowerblue";
                    tag.innerHTML = '답변';
                    responseMsg.innerHTML = '';
                    break;
            }
            title.innerHTML = '&nbsp;' + data.title;
            writerDate.innerHTML = data.w_nickname + " | " + data.pdate;
            postContent.innerHTML = data.content.replace(/\n/g, "<br>");
            postArea.style.display = "block";
            commentCount.innerHTML = data.comment_count;
        },
        error: function () {
            alert('이미 삭제되었거나 접근할 수 없는 글입니다.');
            location.href = '/board/list_';
        }
    })

}
function prevPage() {
    if (currentPage == 1) {
        alert('첫번째 목록입니다.');
        return;
    } else {
        getList(currentPage - 1);
    }
}

function nextPage() {
    if (currentPage == totalPage) {
        alert('마지막 목록입니다.');
        return;
    } else {
        getList(currentPage + 1);
    }
}
function getList(page) {
    $(".tbody").empty();
    let uri = '/board/getList?currentPage=' + page;
    $.ajax({
        type: "get",
        url: uri,
        dataType: "json",
        success: function (data) {
            currentPage = data.currentPage;
            totalPage = data.totalPage;
            let str = '';
            if(data.postList.length == 0){
                str += '<tr>';
                str += '<td colspan="5"> 아직 글이 없습니다. </td>';
                str += '</tr>';
            } else {
                $.each(data.postList, function (i, post) {
                    str += '<tr style="height: 30px;">';
                    switch (post.tag) {
                        case "I":
                            str += '<td style="color:white;"> <span style="background-color:navy;">정보</span></td>';
                            break;
                        case "N":
                            str += '<td style="color:white;"> <span style="color:black;">사담</span></td>';
                            break;
                        case "Q":
                            str += '<td style="color:white;"> <span style="background-color:coral;">질문</span></td>';
                            break;
                        case "A":
                            str += '<td style="color:white;"> <span style="background-color:cornflowerblue;">답변</span></td>';
                            break;
                    }
                    str += '<td>' + post.w_nickname + '</td>';
                    str += '<td style="cursor:pointer;" onclick="showPost(' + post.num + ')">' + post.title + '</td>';
                    str += '<td>' + post.view_count + '</td>';
                    str += '<td>' + post.like_count + '</td>';
                    str += '</tr>';
                    str += '<tr><td colspan="5"><hr></td></tr>';
                });
                str += '<c:set var="currentPage" value="' + currentPage + '"/>';
                str += '<c:set var="totalPage" value="' + totalPage + '"/>';
                if (currentPage == 1) {
                    prevPageSpan.innerHTML = "";
                } else {
                    prevPageSpan.innerHTML = "《《 이전 목록 불러오기 ";
                }
                if (currentPage == totalPage) {
                    nextPageSpan.innerHTML = "";
                } else {
                    nextPageSpan.innerHTML = "다음 목록 불러오기 》》";
                }
            }
            $('.tbody').append(str);
        },
        error: function () {
            console.log("리스트 불러오기 실패");
        }
    });
}

// 실행하면 바로 첫 페이지가 나오도록 함
window.onload = getList(currentPage);