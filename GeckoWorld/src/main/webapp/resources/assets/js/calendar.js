window.onload = function () { buildCalendar(); }
let nowMonth = new Date();
let today = new Date();
today.setHours(0, 0, 0, 0);
function buildCalendar() {
    let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);
    let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);

    let tbody_calendar = document.querySelector(".calendar > tbody");
    document.getElementById("calYear").innerText = nowMonth.getFullYear();
    document.getElementById("calMonth").innerText = nowMonth.getMonth() + 1;

    while (tbody_calendar.rows.length > 0) {
        tbody_calendar.deleteRow(tbody_calendar.rows.length - 1);
    }

    let nowRow = tbody_calendar.insertRow();

    for (let j = 0; j < firstDate.getDay(); j++) {
        let nowColumn = nowRow.insertCell();
    }

    for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {
        let nowColumn = nowRow.insertCell();
        nowColumn.innerText = nowDay.getDate();
        nowColumn.style.border = "1px solid #ffedcc"
        nowColumn.style.minHeight = "51.58px"
        if (nowDay.getDay() === 0) {
            nowColumn.style.color = "coral";
        }
        if (nowDay.getDay() === 6) {
            nowColumn.style.color = "cornflowerblue";
            nowRow = tbody_calendar.insertRow();
        }

        if (nowDay < today) {
            nowColumn.className = "pastDay";
        } else if (nowDay.getFullYear() === today.getFullYear() && nowDay.getMonth() === today.getMonth() && nowDay.getDate() == today.getDate()) {
            nowColumn.className = "today";
            nowColumn.style.border = "2px solid navy";
            nowColumn.onclick = function () {
                choiceDate(this);
            }
        } else {
            nowColumn.className = "futureDay";
            nowColumn.onclick = function () { choiceDate(this); }
        }
    }
}
function choiceDate(nowColumn) {
    let date = nowMonth.getFullYear() + '-' + leftPad(nowMonth.getMonth() + 1) + '-' + leftPad(nowColumn.innerText);
    if (document.getElementsByClassName("choosedDate")[0]) {
        document.getElementsByClassName("choosedDate")[0].classList.remove("choosedDate");
    }
    nowColumn.classList.toggle("choosedDate");
    $("#choosedDate").val(date);
    search();
}

function prev() {
    nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());
    buildCalendar();
}
function next() {
    nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());
    buildCalendar();
}

function leftPad(value) {
    if (value < 10) {
        value = '0' + value;
        return value;
    }
    return value;
}

function count(type) {
    const resultElement = document.getElementById('num');
    let number = resultElement.value;
    if (type === 'plus') {
        if (number < 8) {
            number = parseInt(number) + 1;
        } else {
            return;
        }
    } else if (type === 'minus') {
        if (number > 1) {
            number = parseInt(number) - 1;
        }
    }
    resultElement.value = number;
}

function search() {
    let date = $("#choosedDate").val();
    let hour = $("#timeSelect").val();
    if ($(".disabled").length > 0) {
        $(".disabled").removeClass("disabled");
    }
    if ($(".choosed").length > 0) {
        $(".choosed").removeClass("choosed");
    }
    if (date == '') {
        alert('날짜를 선택해주세요.');
        return;
    }
    if (hour == 0) {
        alert('이용 시간을 선택해주세요.');
        return;
    }
    let uri = `/book/bookSearch?date=${date}`;
    $.get(uri, function (data) {
        console.log(data);
        $(".result").css("display", "table-row-group");
        for (let i = 0; i < data.length; i++) {
            let startTime = data[i].startTime;
            let endTime = data[i].endTime;
            for (let j = startTime; j <= endTime - 1; j++) {
                $("#time" + j).addClass('disabled').css('cursor', 'normal');
            }
        }
        if (hour != 1) {
            for (let y = 9; y <= 20; y++) {
                if (hour == 2) {
                    if ($("#time" + (y + 1)).hasClass('disabled') || (y + 1) > 20) {
                        $("#time" + y).addClass('disabled').css('cursor', 'normal');
                    }
                }
                if (hour == 3) {
                    if ($("#time" + (y + 2)).hasClass('disabled') || $("#time" + (y + 1)).hasClass('disabled') || (y + 2) > 20) {
                        $("#time" + y).addClass('disabled').css('cursor', 'normal');
                    }
                }
            }
        }

        for (let i = 0; i <= 20; i++) {
            if (!$("#time" + i).hasClass('disabled')) {
                $("#time" + i).click(function () {
                    choice(i);
                });
            }
        }
    }).fail(function () {
        alert("서버와 통신 중 오류가 발생했습니다.");
    });
}

function choice(i, hour) {
    if ($(".choosed").length > 0) {
        $(".choosed").removeClass("choosed");
    }
    $("#time" + i).addClass("choosed");
    if (hour == 2) {
        $("#time" + (i + 1)).addClass("choosed");
    }
    if (hour == 3) {
        $("#time" + (i + 1)).addClass("choosed");
        $("#time" + (i + 2)).addClass("choosed");
    }
}