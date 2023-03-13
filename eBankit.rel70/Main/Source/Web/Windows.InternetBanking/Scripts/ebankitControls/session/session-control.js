eBankit = eBankit || {};
eBankit.Presentation = eBankit.Presentation || {};
eBankit.Presentation.SessionControl = eBankit.Presentation.SessionControl || {};
eBankit.Presentation.SessionControl.Logic = (function () {
    var _popupTimer, _redirectTimer;
    var _storageKey = "SESSION_POPUP";
    var _iframeContainer = "#divRenewSessionContainer";

    var _timeBeforePopup = eBankit.Presentation.SessionControl.Configuration.TimeBeforePopup;
    var _sessionRemainingTime = eBankit.Presentation.SessionControl.Configuration.SessionRemainingTime;
    var _popupDisplayMessage = eBankit.Presentation.SessionControl.Configuration.PopupText;
    var _expiredUrl = eBankit.Presentation.SessionControl.Configuration.SessionExpiredUrl;
    var _popupTime = eBankit.Presentation.SessionControl.Configuration.PopupTime;
    var _errorMargin = eBankit.Presentation.SessionControl.Configuration.ErrorMarginPopup;
    var _renewSessionPage = eBankit.Presentation.SessionControl.Configuration.RenewSessionPage;
    var _hasSlidingSession = eBankit.Presentation.SessionControl.Configuration.HasSlidingSession;
    var _sessionTimeout = eBankit.Presentation.SessionControl.Configuration.SessionTimeout;

    var ClearTimeouts = function () {
        window.clearTimeout(_popupTimer);
        window.clearTimeout(_redirectTimer);
    };

    var ScheduleTimeouts = function () {
        if (sessionStorage.getItem(_storageKey) == null) {
            _popupTimer = window.setTimeout(ShowPopup, _timeBeforePopup);
        }

        _redirectTimer = window.setTimeout(SessionExpiredRedirect, _sessionRemainingTime);
    };

    var ShowPopup = function () {
        sessionStorage.setItem(_storageKey, true); // to prevent multiple popups

        itcore_ui.HideModal();
        itcore_ui.ShowTopPopupConfirm(
            _popupDisplayMessage,
            top.eBankit.Presentation.GetResource("SessionTimeOutTitle"),
            "eBankit.Presentation.SessionControl.Logic.RenewSession()");
    };

    var ResetSate = function () {
        ClearTimeouts();
        sessionStorage.removeItem(_storageKey);
        _timeBeforePopup = _sessionTimeout - _popupTime - _errorMargin;
        _sessionRemainingTime = _sessionTimeout - _errorMargin;
    };

    var SessionExpiredRedirect = function () {
        window.location.href = _expiredUrl;
    };

    var RenewSession = function () {
        eBankit.Presentation.Loading();
        var iframe = document.createElement("iframe");
        iframe.setAttribute("src", _renewSessionPage);
        iframe.onload = function () {
            var renewBtn = $(this).contents().find(".btn-renew");
            if (renewBtn.length == 0 || renewBtn == undefined) { // close iframe if we cannot trigger renew session
                window.top.$(_iframeContainer).html("");
                window.top.eBankit.Presentation.UnLoading();
                window.top.eBankit.Presentation.SessionControl.Logic.ResetSate();
                window.top.eBankit.Presentation.SessionControl.Logic.ScheduleTimeouts();
            }
        }
        $(_iframeContainer).append(iframe);
    };

    var RenewSlidingSession = function () {
        window.top.eBankit.Presentation.SessionControl.Logic.ResetSate();
        window.top.eBankit.Presentation.SessionControl.Logic.ScheduleTimeouts();   
    };

    return {
        ClearTimeouts: ClearTimeouts,
        ScheduleTimeouts: ScheduleTimeouts,
        ShowPopup: ShowPopup,
        ResetSate: ResetSate,
        RenewSession: RenewSession,
        RenewSlidingSession: RenewSlidingSession
    };
})();


$(document).ready(function () {
    function isOnId(target) {
        return (target.id != null && target.id != "") || target.parentNode.id != "";
    };
    if (eBankit.Presentation.SessionControl.Configuration.HasSlidingSession == "True") {
        eBankit.Presentation.SessionControl.Logic.RenewSlidingSession();
       
        document.addEventListener('click', function (e) {
            var clickedOnRenewPopUp = $(e.target.parentElement.children).filter(function (elem) {
                if ($(this).attr("onclick")) {
                    return $(this).attr("onclick").indexOf("eBankit.Presentation.SessionControl.Logic.RenewSession();") >= 0;
                }
            });
            if (isOnId(e.target) && !clickedOnRenewPopUp.length) {
                eBankit.Presentation.SessionControl.Logic.RenewSlidingSession();
            }
        });
    }
    else {
        eBankit.Presentation.SessionControl.Logic.ScheduleTimeouts();
    }
});

