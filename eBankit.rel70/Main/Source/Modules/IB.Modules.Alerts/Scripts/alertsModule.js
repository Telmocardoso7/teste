eBankit.Presentation.Alerts = {};


eBankit.Presentation.Alerts.EndRequest = function () {

    var y = document.getElementsByClassName('page-header');
    for (var j = 0; j < y.length; j++) {
        y[j].classList.add("alertGroupTitleRestyle");
    }
};

function footerBottom() {
    var hs = document.getElementById('phContainerBottom');
    hs.classList.add("footerBottom");
}


Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.Alerts.EndRequest);


$(document).ready(function () {
    eBankit.Presentation.Alerts.EndRequest();
});


