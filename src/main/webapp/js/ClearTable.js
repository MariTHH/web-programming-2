function clearTable() {
    $.ajax({
        type: "DELETE",
        url: "controller-servlet",
        async: false,
        success: function () {
            window.location.reload();
        },
        error: function (xhr, textStatus, err) {
            alert("readyState: " + xhr.readyState + "\n" +
                "responseText: " + xhr.responseText + "\n" +
                "status: " + xhr.status + "\n" +
                "text status: " + textStatus + "\n" +
                "error: " + err);
        }
    })
}