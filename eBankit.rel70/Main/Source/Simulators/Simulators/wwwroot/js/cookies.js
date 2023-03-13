(function () {
    document.querySelector("#cookieConsent button[data-cookie-string]").addEventListener("click", function (el) {
        document.cookie = el.target.dataset.cookieString;
        document.querySelector("#cookieConsent").classList.add("hidden");
        $(".cookieDiv").css("display", "none");
    }, false);
})();