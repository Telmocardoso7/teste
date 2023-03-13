function checkCookieAccepted() {
    if (!sessionStorage.checkCookieAccepted) {
        //$(".cookieDiv").show();
        $(".cookieDiv").css("display", "block");
    } else {
        //$(".cookieDiv").hide();
        $(".cookieDiv").css("display", "none");
    }

    return true;
}

function closeCookieDisclaimer() {
    sessionStorage.checkCookieAccepted = true;
    $(".cookieDiv").hide();
    return true;
}