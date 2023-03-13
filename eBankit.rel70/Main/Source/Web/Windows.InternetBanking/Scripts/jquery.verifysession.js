var timeoutSession = null;
var flagToLogout = false;

function ValidateSessionTime() {
    var timeToAllow = 1;
    var url = "services.axd?Method=LastMiddlewareDateTimeAccess";
    $.ajax({
        type: "POST",
        url: url,
        beforeSend: function (xhr) {
            xhr.setRequestHeader("Accept", "text/javascript, application/javascript, */*, text/javascript,application/javascript,text/html");
            xhr.setRequestHeader("Content-type", "application/json;");
            xhr.setRequestHeader("Connection", "close");
        },
        success: function (time) {

            if ((time != "") && (time > 0) && (time <= timeToAllow) && (flagToLogout == false)) {
                //GetSessionControl();
                flagToLogout = true;
                //disableBackground();
                itcore_ui.ShowTopPopupConfirm(top.eBankit.Presentation.GetResource("SessionMessage"), top.eBankit.Presentation.GetResource("SessionMessageTitle"), "KeepAliveSession();");
                //jConfirm(mstr_expsemess, mstr_millen, function (r) {
                //    if (r) {
                //        //disableBackground();
                //        KeepAliveSession();
                //    }
                //    // Alterado por Ricardo Felgueiras BUG 13529
                //    // Nao redirecciona para a pagina de SessionTimeOut se o user responder "Nao"
                //    //                    else {
                //    //                        //timeoutSession = setTimeout('ValidateSessionTime()', 30000);
                //    //                        enableBackground();                        
                //    //                        // eBankit.document.location.href = mstr_logt + "?ReturnUrl=" + encodeURIComponent(window.location.href);
                //    //                    }
                //    enableBackground();
                //});
                try { if (timeoutSession != null && timeoutSession != undefined) { clearTimeout(timeoutSession); } } catch (err) { }
                timeoutSession = setTimeout('ValidateSessionTime()', 30000);
            }
            else {
                if (time <= 0) {
                    ////enableBackground();
                    //$.alerts._hide();
                    ////disableBackground();
                    $.ajax({
                        type: "POST",
                        url: "services.axd?Method=HandleOnClose",
                        beforeSend: function (xhr) {
                            xhr.setRequestHeader("Accept", "text/javascript, application/javascript, */*, text/javascript,application/javascript,text/html");
                            xhr.setRequestHeader("Content-type", "application/json;");
                        },
                        success: function (ret) {
                            //
                        },
                        error: function (XMLHttpRequest, textStatus, errorThrown) {
                            //
                        }
                    });

                    //jAlert(mstr_expsemess2, mstr_millen, function (r) {
                    //    enableBackground();
                    eBankit.document.location.href = mstr_logt + "?ReturnUrl=" + encodeURIComponent(window.location.href);
                    //});
                }
                else {

                    if ((time != "") && (time > 0) && (time >= timeToAllow))
                        flagToLogout = false;
                    //var timeMilis = time * 60 * 1000;
                    try { if (timeoutSession != null && timeoutSession != undefined) { clearTimeout(timeoutSession); } } catch (err) { }
                    timeoutSession = setTimeout('ValidateSessionTime()', 30000);
                }
            }
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {
            //
        },
        complete: function () {
            //
        }
    });
}

function KeepAliveSession() {
    var url = "services.axd?Method=KeepAliveSession";
    $.ajax({
        type: "POST",
        url: url,
        beforeSend: function (xhr) {
            xhr.setRequestHeader("Accept", "text/javascript, application/javascript, */*, text/javascript,application/javascript,text/html");
            xhr.setRequestHeader("Content-type", "application/json;");
            xhr.setRequestHeader("Connection", "close");
        },
        success: function (isAlive) {
            if (isAlive) {
                flagToLogout = false;

                // Comentado por Ricardo Felgueiras
                // Para evitar que fossem criados dois timers depois do utilizador renovar a sessao
                // timeoutSession = setTimeout('ValidateSessionTime()', 30000);
            }
            //nableBackground();
        },
        error: function (XMLHttpRequest) {
            //
            //enableBackground();
        }
    });
}
