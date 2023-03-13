var errorHandler = function (xhr, textStatus, errorThrown) {
    if (xhr.status === 585) {
        window.location.href = "/Account/Login?sessionExpired=true";
    }
}