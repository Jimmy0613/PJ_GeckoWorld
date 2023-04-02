let tag = document.querySelector("#tag");
let title = document.querySelector("#title");
let totalPage = '<c:out value="${totalPage}"/>';
let prevPageSpan = document.querySelector("#prevPage");
let nextPageSpan = document.querySelector("#nextPage");

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
                            str += '<td style="color:white;"> &nbsp;&nbsp;<span style="background-color:navy;">정보</span></td>';
                            break;
                        case "N":
                            str += '<td style="color:white;"> &nbsp;&nbsp;<span style="color:black;">사담</span></td>';
                            break;
                        case "Q":
                            str += '<td style="color:white;"> &nbsp;&nbsp;<span style="background-color:coral;">질문</span></td>';
                            break;
                    }
                    str += '<td>' + post.w_nickname + '</td>';
                    str += '<td style="cursor:pointer;"><a href="/board/post?pnum='+post.pnum+'&currentPage=' + currentPage + '">' + post.title + '</a></td>';
                    str += '<td>' + post.view_count + '</td>';
                    str += '</tr>';
                    str += '<tr><td colspan="5"><hr></td></tr>';
                });
                str += '<c:set var="currentPage" value="' + currentPage + '"/>';
                str += '<c:set var="totalPage" value="' + totalPage + '"/>';
                if (currentPage == 1) {
                    prevPageSpan.innerHTML = "";
                } else {
                    prevPageSpan.innerHTML = "<button>《《 이전 </button>";
                }
                if (currentPage == totalPage) {
                    nextPageSpan.innerHTML = "";
                } else {
                    nextPageSpan.innerHTML = "<button>다음 》》</button>";
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
window.onload = function(){
    let currentPage = document.getElementById("myData").dataset.currentPage;
    if(currentPage ==null || currentPage==undefined){
        currentPage = 1;
    }
    getList(currentPage);
}