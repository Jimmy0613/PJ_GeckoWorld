function fileCommand(id) {
    let arr = id.split("_");
    let number = arr[arr.length - 1];
    let imgId = '#img_' + number;
    let divId = '#descArea_' + number;
    let delbtnId;
    if (number != 1) {
        delbtnId = "#del_" + number;
    }
    let addbtnId = "#add_" + number;

    if ($("#" + id).val() != null && $("#" + id).val().length != 0) {
        let fileValue = $("#" + id).val().split("\\");
        let fileName = fileValue[fileValue.length - 1];
        let imgUrl = '/resources/images/upload/' + fileName;
        $(imgId).attr("src", imgUrl);
        $(addbtnId).prop("disabled", false);
        if (number != "1") {
            $(divId).css("display", "grid");
            $(delbtnId).prop("disabled", false);
        }
    } else {
        $(imgId).attr("src", '');
        $(addbtnId).prop("disabled", true);
        if (number != "1") {
            $(divId).css("display", "none");
            $(delbtnId).prop("disabled", true);
        }
    }
}
function addTr(id, event) {
    event.preventDefault();
    let arr = id.split("_");
    let number = arr[arr.length - 1];
    if (number == 5) {
        alert('더이상 추가할 수 없습니다.');
    } else {
        let str = newTr((parseInt(number) + 1));
        $(".thead").append(str);
    }
    $("#" + id).css("display", "none");
    if (document.querySelector("#descArea_" + parseInt(number) + 1) != null) {
        $("#descArea_" + (parseInt(number) + 1)).css("display", "grid");
    } else {
        newDescArea((parseInt(number) + 1));
    }
}
function newTr(number) {
    let str = `<tr id="file_${number}">`;
    str += '<td style="width: 250px;">';
    str += `<input type="file" id="p_${number}" accept="image/*" onchange = "fileCommand(this.id)">`;
    str += '</td>';
    str += '<td style="width: 30px;">';
    if (number != 5) {
        str += `<button style="padding:5px;" disabled id="add_${number}" onclick="addTr(this.id, event);">추가</button>`;
    }
    str += '</td>';
    str += '<td>';
    str += `<button style="padding:5px;" disabled id="del_${number}" onclick="deleteTr(this.id);">삭제</button>`;
    str += '</td>';
    str += '</tr>';
    return str;
}

function newDescArea(number) {
    let newDiv = $("<div/>", { id: `descArea_${number}` }).css({
        display: "grid",
        width: "100%",
        height: "200px",
        "grid-template-columns": "3fr 7fr"
    });
    let newImg = $("<img/>", {
        id: `img_${number}`,
        src: "https://via.placeholder.com/150" // 예시 이미지 URL
    }).css({
        "max-width": "100%",
        "max-height": "200px",
        display: "block" // display 속성 추가
    });
    let newTextarea = $("<textarea/>", {
        id: `desc_${number}`,
        name: "desc",
        spellcheck: "false",
    }).css({
        "min-height": "200px",
        resize: "none",
        display: "block" // display 속성 추가
    });
    $("#descBox")[0].append(newDiv[0]);
    $(`#descArea_${number}`).append(newImg, newTextarea);
}

function deleteTr(id) {
    let str = id.split("_");
    let number = str[str.length - 1];
    let inputId = '#p_' + number;
    let imgId = '#img_' + number;
    let divId = '#descArea_' + number;
    $(inputId).val(null);
    $(imgId).attr("src", '');
    $("#del_" + number).prop("disabled", true);
    $("#add_" + number).prop("disabled", true);
    $(divId).css("display", "none");
}

function submitForm() {
    let form = document.querySelector("#postForm");
    for (let i = 1; i <= 5; i++) {
        let id = "#p_" + i;
        let file = document.querySelector(id);
        if (file != null && file!=undefined) {            
            let fileValue = file.value.split("\\");
            let fileName = fileValue[fileValue.length - 1];
            addFileToForm(fileName, form);
        }
    }
    form.action = '/board/newPostPhoto.do';
    form.method = 'POST';

}
function cancelForm(event, num) {
    event.preventDefault(); // 기본 이벤트 막기
    location.href = '/board/postPhoto?num='+num; // 이동할 주소
}
function addFileToForm(value, form) {
    $('<input>').attr({
        type: 'hidden',
        name: 'url',
        value: value
    }).appendTo(form);
}