function updateValidationPanel() {
    let validationInfoPanel = document.querySelector('.validationInfo');
    validationInfoPanel.innerHTML = '';
    validationInfoPanel.classList.remove("show");
}


function getDataFromForm() {
    updateValidationPanel();
    let xValidity = isXValid();
    let yValidity = isYValid();
    let rValidity = isRValid();

    if (xValidity && yValidity && rValidity) {
        let x = getX();
        let y = getY();
        let r = getR();
        sendDataToServer(x, y, r);
    }
}


function sendDataToServer(x, y, r) {
    updateValidationPanel();
    if (x !== null && y !== null && r !== null) {
        $.ajax({
            type: "GET",
            url: "controller-servlet",
            dataType: "json",
            async: false,
            data: {
                "x-value": x.toString().trim(), "y-value": y.toString().trim(), "r-value": r.toString().trim(),
                "timezone": new Date().getTimezoneOffset()
            },
            success: function () {
                window.location.replace('./result.jsp');;
            },
            error: function (xhr, textStatus, err) {
                alert("readyState: " + xhr.readyState + "\n" +
                    "responseText: " + xhr.responseText + "\n" +
                    "status: " + xhr.status + "\n" +
                    "text status: " + textStatus + "\n" +
                    "error: " + err);
            }
        });
    }
}