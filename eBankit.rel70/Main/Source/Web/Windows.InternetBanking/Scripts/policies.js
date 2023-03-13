var Policies = {

    CookiesPolicyURL : "",
    PrivacyPolicyURL : "",

    GoToCookiesPolice: function () {
        var win = window.open(Policies.CookiesPolicyURL, '_blank');
        win.focus();
    },

    GoToPrivacyPolice: function () {
        var win = window.open(Policies.PrivacyPolicyURL, '_blank');
        win.focus();
    },



}



$(document).ready(function () {
    $('.lnkPrivacyPolicy').on('click', function (e) {
        e.preventDefault();
        Policies.GoToPrivacyPolice();
    });

    $('.lnkCookiesPolicy').on('click', function (e) {
        e.preventDefault();
        Policies.GoToCookiesPolice();
    });
});
