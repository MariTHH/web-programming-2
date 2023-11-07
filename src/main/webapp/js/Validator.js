function getButtonsByColor(color, buttons) {
    let values = [];
    buttons.forEach(function (button) {
        if (getComputedStyle(button).backgroundColor === color) {
            values.push(button.value);
        }
    })
    return values;
}

function isXValid() {
    let xValue = document.getElementById("x-value").value;
    let validationInfo = '';
    let valid = false;

    if (!(xValue.trim() === "")) {
        if (/\d+/.test(xValue)) {
            if ((parseFloat(xValue) >= -3.0) && (parseFloat(xValue) <= 5.0)) {
                valid = true;
            } else validationInfo += "X должен быть в интервале (-3...5)!";
        } else validationInfo += "X должен быть числом!";
    } else validationInfo += "Введите X";

    addMessageToValidationPanel(validationInfo);

    return valid;
}

function isYValid(){
    let yValue = document.getElementById("y-value").value;
    let validationInfo = '';
    let valid = false;

    if (!(yValue.trim() === "")) {
        if (/\d+/.test(yValue)) {
            if ((parseFloat(yValue) >= -5.0) && (parseFloat(yValue) <= 3.0)) {
                valid = true;
            } else validationInfo += "Y должен быть в интервале (-5...3)!";
        } else validationInfo += "Y должен быть числом!";
    } else validationInfo += "Введите Y";

    addMessageToValidationPanel(validationInfo);

    return valid;
}

function isRValid(){
    let validationInfo = '';
    let rButtons = document.querySelectorAll(".r-button");
    let orangeColor = "rgb(220, 88, 42)";
    let valid = false;
    let rValues = getButtonsByColor(orangeColor, rButtons);

    if (rValues.length !== 1) {
        if (rValues.length === 0) {
            validationInfo += "Выберите R"
        } else if (rValues.length > 1) {
            validationInfo += "Должно быть выбрано одно значение R"
        }
    } else {
        if (!(1 <= parseFloat(rValues[0]) <= 3)) {
            validationInfo += "R не в выбранном диапазоне"
        }
    }
    if (validationInfo === "") {
        valid = true;
    } else{
        addMessageToValidationPanel(validationInfo);
    }

    return valid
}

function addMessageToValidationPanel(message){
    let validationInfoPanel = document.querySelector('.validationInfo');
    validationInfoPanel.innerHTML += message + "<br>";
    validationInfoPanel.classList.add("show");
}


function validateTextFieldY() {
    $('.y-text').on('input', function () {
        $(this).val($(this).val().replace(/[^.0-9]/, ''));
    });
}
function validateTextFieldX() {
    $('.x-text').on('input', function () {
        $(this).val($(this).val().replace(/[^.0-9]/, ''));
    });
}