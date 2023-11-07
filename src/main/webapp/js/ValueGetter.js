function getX() {
    return parseFloat(document.getElementById("x-value").value)
}

function getY(){
    return parseFloat(document.getElementById("y-value").value)
}

function getR(){
    let rButtons = document.querySelectorAll(".r-button");
    let orangeColor = "rgb(220, 88, 42)";
    let rValues = getButtonsByColor(orangeColor, rButtons);
    return parseFloat(rValues[0])
}