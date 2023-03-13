function UpdateEbankitContainerSize(size) {
    var newHeight = parseInt($("#iframeContainer").css("height")) + size;
    $("#iframeContainer").css("height", newHeight);
}

function SetEbankitContainerSize(size) {
    $("#iframeContainer").css("height", size);
}

