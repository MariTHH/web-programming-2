function refreshSVG(){
    document.getElementById("graph").innerHTML += "";
}


function svgHandler(event) {
    const svg = document.querySelector('svg');
    const rect = svg.getBoundingClientRect();
    updateValidationPanel();
    if (isRValid()) {
        let r = getR();
        let x = ((event.clientX - rect.left - 150 * 1.2) * (r / 2) / (50 * 1.2)).toFixed(2);
        let y = (((-1) * (event.clientY - rect.top - 150 * 1.2)) * (r / 2) / (50 * 1.2)).toFixed(2);
        refreshSVG();
        sendDataToServer(x, y, r);
    }
}