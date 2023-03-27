window.onload = function () { buildCalendar(); }
let nowMonth = new Date();
let today = new Date();
today.setHours(0, 0, 0, 0);
let startDate;
let endDate;
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
        nowColumn.style.border ="1px solid #ffedcc"
        if (nowDay.getDay() === 0) {
            nowColumn.style.color = "#DC143C";
        }
        if (nowDay.getDay() === 6) {
            nowColumn.style.color = "#0000CD";
            nowRow = tbody_calendar.insertRow();
        }

        if (nowDay < today) {
            nowColumn.className = "pastDay";
        } else if (nowDay.getFullYear() === today.getFullYear() && nowDay.getMonth() === today.getMonth() && nowDay.getDate() == today.getDate()) {
            nowColumn.className = "today";
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
    if (document.getElementById("startDate").value != "") {
        if (document.getElementById("endDate").value != "") {
            return;
        }
        endDate = nowMonth.getFullYear() + '-' + leftPad(nowMonth.getMonth() + 1) + '-' + leftPad(nowColumn.innerText);
        if (startDate === endDate) {
            return;
        }
        if (new Date(document.getElementById("startDate").value).getTime() > new Date(endDate).getTime()) {
            endDate = document.getElementById("startDate").value;
            startDate = nowMonth.getFullYear() + '-' + leftPad(nowMonth.getMonth() + 1) + '-' + leftPad(nowColumn.innerText);
            if (document.getElementsByClassName("startDay")[0]) {
                document.getElementsByClassName("startDay")[0].classList.toggle("endDay");
                document.getElementsByClassName("startDay")[0].classList.remove("startDay");
            }
            nowColumn.classList.toggle("startDay");
        } else {
            nowColumn.classList.toggle("endDay");
        }
    } else {
        nowColumn.classList.toggle("startDay");
        startDate = nowMonth.getFullYear() + '-' + leftPad(nowMonth.getMonth() + 1) + '-' + leftPad(nowColumn.innerText);
    }
    if (startDate != null) {
        document.getElementById("startDate").value = startDate;
    }
    if (endDate != null) {
        document.getElementById("endDate").value = endDate;
    }

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
        if (number < 4) {
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

function checkNum() {
    let num = document.getElementById('num').value;
    if (num > 4 || num < 1) {
        document.getElementById("warn").innerText = '1명 이상 4명 이하만 가능합니다.';
        document.getElementById('num').value = 1;
    }
}

function reset() {
    if (document.getElementsByClassName("startDay")[0]) {
        document.getElementsByClassName("startDay")[0].classList.remove("startDay");
    }
    if (document.getElementsByClassName("endDay")[0]) {
        document.getElementsByClassName("endDay")[0].classList.remove("endDay");
    }
    document.getElementById("startDate").value = "";
    document.getElementById("endDate").value = "";
    startDate = null;
    endDate = null;
}