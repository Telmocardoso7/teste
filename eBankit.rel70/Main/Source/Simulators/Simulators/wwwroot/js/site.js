// Please see documentation at https://docs.microsoft.com/aspnet/core/client-side/bundling-and-minification
// for details on configuring this project to bundle and minify static web assets.

// Write your JavaScript code.




$(document).ready(function () {
    $.LoadingSpin("show", 'body', $('#loadingSpin-text').val());
    //if (!sessionStorage.checkCookieAccepted) {
    //    //$(".cookieDiv").show();
    //    $(".cookieDiv").css("display", "block");
    //} else {
    //    //$(".cookieDiv").hide();
    //    $(".cookieDiv").css("display", "none");
    //}
    $.LoadingSpin("hide", 'body');
});