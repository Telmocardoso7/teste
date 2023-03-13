/* CO BROWSING */
/* Author: Fábio Pacheco */


function injectUnblu() {
    (function () {
        /* unblu enterprise offline snippet V4.2.20160712 */
        if (!window['unblu']) {
            var hdnApiKey = $("[id$=hdnUnbluApykey]").val();
            var hdnServer = $("[id$=hdnUnbluServer]").val();

            unblu = { APIKEY: hdnApiKey, SERVER: hdnServer };
            (function () {
                unblu.c = [];
                unblu.registerApiConsumer = function (callback, errorCallback, apiNames) {
                    unblu.c.push({ a: apiNames, c: callback, e: errorCallback });
                }

                unblu.setLocale = function (locale) { unblu.l = locale; }

                function r(url) {
                    var rewritingFn = null;
                    if (rewritingFn) url = rewritingFn(url);
                    return url;
                }

                if (!window["x-unblu-tmp-window-name"]) window["x-unblu-tmp-window-name"] = window.name;
                var q = document.getElementsByTagName("script")[0];
                if (q) {
                    var g = document.createElement("script");
                    g.setAttribute("src", r(unblu.SERVER + "/unblu/starter.js"));
                    g.setAttribute("type", "text/javascript");
                    g.setAttribute("defer", "defer");
                    q.parentNode.appendChild(g);
                }
            })();
        }
    })();
}

function setCoBrowsingSession(value, seconds) {
    setTimeout(function () {
        if (!value) {
            $(".CoBrowsingSessionInactive").show();
            $(".CoBrowsingSessionActive").hide();
            $(".ChatSession").show();
        }
        else {
            $(".CoBrowsingSessionActive").show();
            $(".ChatSession").hide();
            $(".CoBrowsingSessionInactive").hide();
        }

        $("[id$=CoBrowsingBarOpened]").css("transform", "translate(-50px,0)");
        $("[id$=CoBrowsingBarClosed]").css("transform", "translate(-50px,0)");

        $("[id$=CoBrowsingBarClosed]").show();
    }, seconds * 1000);
}

function coBrowsingBarToggle() {
    $("[id$=CoBrowsingBarOpened]").toggle();
    $("[id$=CoBrowsingBarClosed]").toggle();
}


function checkCoBrowsingSession() {
    if (!unblu.api && !unblu.apiConsumerRegistered) {
        unblu.apiConsumerRegistered = true;
        unblu.registerApiConsumer(function (requestedApi) {
            unblu.api = requestedApi;
            checkCoBrowsingSessionHelper();
        }, null, ['core.visitor.session']);
    }
    else
        checkCoBrowsingSessionHelper();
}

function checkCoBrowsingSessionHelper() {
    if (unblu.api) {
        var session = unblu.api.core.visitor.session.Session.getInstance();
        session.isSessionActive({
            onSuccess: function onSuccess(result) {
                if (result) {
                    setCoBrowsingSession(true, 0);
                    addCoBrowsingSessionListeners(session);
                }
                else {
                    delete_cookie("unblu");
                    setCoBrowsingSession(false, 4);
                }
            },
            onFailure: function onFailure(error) {
                alert("Session status ERROR\nDescription: " + error.message);
            }
        });
    }
}

function startCoBrowsingSession() {
    if ($("[id$=cb_ls_conditions]").prop('checked')) {
        if (!unblu.api && !unblu.apiConsumerRegistered) {
            unblu.apiConsumerRegistered = true;

            unblu.registerApiConsumer(function (requestedApi) {
                unblu.api = requestedApi;
            }, null, ['core.visitor.session']);
        }

        if (unblu.api) {
            var pin = $("[id$=i_pin]").val();
            var session = unblu.api.core.visitor.session.Session.getInstance();


            session.startSessionWithName(pin, "CLIENTE", {
                onSuccess: function onSuccess(result) {
                    writeCookie("unblu", result.sessionId, 1);
                    $('#modal_startCoBrowsing').modal('toggle');
                    setCoBrowsingSession(true, 0);
                    addCoBrowsingSessionListeners(session);
                    $("[id$=i_pin]").val("");
                },
                onFailure: function onFailure(error) {
                    alert("Start Session ERROR\nDescription: " + error.message);
                }
            });
        }
    }
    else {
        $("[id$=ls_error]").show();
    }
}

function startChatSession() {
    if (!window['unblu']) {
        injectUnblu();
    }

    if (!unblu.api && !unblu.apiConsumerRegistered) {
        unblu.apiConsumerRegistered = true;

        unblu.registerApiConsumer(function (requestedApi) {
            unblu.api = requestedApi;
            checkChatSessionHelper();
        }, null, ['core.visitor.session']);
    }
    else {
        checkChatSessionHelper();
    }
}

function checkChatSessionHelper() {
    if (unblu.api) {
        var session = unblu.api.core.visitor.session.Session.getInstance();
        session.startChatSession("CLIENT", {
            onSuccess: function onSuccess(result) {
                writeCookie("unblu", result.sessionId, 1);
                addCoBrowsingSessionListeners(session);
            },
            onFailure: function onFailure(error) {
                alert("Start Session ERROR\nDescription: " + error.message);
            }
        });
    }
}

function closeCoBrowsingSession() {

    if (!unblu.api && !unblu.apiConsumerRegistered) {
        unblu.apiConsumerRegistered = true;
        unblu.registerApiConsumer(function (requestedApi) {
            unblu.api = requestedApi;
            checkCoBrowsingState();
        }, null, ['core.visitor.session']);
    }
    checkCoBrowsingState();
}

function checkCoBrowsingState() {
    if (unblu.api) {
        unblu.api.core.visitor.session.Session.getInstance().isSessionActive({
            onSuccess: function onSuccess(result) {
                if (result)
                    closeCoBrowsingSessionHelper();
                else {
                    delete_cookie("unblu");
                    setCoBrowsingSession(false, 0);
                }
            },
            onFailure: function onFailure(error) {
                alert("Get Session state ERROR\nDescription: " + error.message);
            }
        });
    }
}

function closeCoBrowsingSessionHelper() {
    if (unblu.api) {
        unblu.api.core.visitor.session.Session.getInstance().terminateSession({
            onSuccess: function onSuccess(result) {
                delete_cookie("unblu");
                setCoBrowsingSession(false, 0);
            },
            onFailure: function onFailure(error) {
                alert("Terminate Session ERROR\nDescription: " + error.message);
            }
        });
    }
}





/* ADD SESSION LISTENERS */
function addCoBrowsingSessionListeners(session) {
    session.addSessionAbortedListener(
        function handleEvent(event) {
            abortedSessionHandler(event);
        }
    );
    session.addSessionTerminatedListener(
        function handleEvent(event) {
            terminatedSessionHandler(event)
        }
    );
    session.addSessionEndedListener(
        function handleEvent(event) {
            endedSessionHandler(event);
        }
    );
}


/* HANDLERS */

/* ABORTED SESSION HANDLER */
function abortedSessionHandler(event) {
    if (event.data.terminationCause.code === 1) {
        $("[id$=ls_closeAuthor]").text("Gestor");
    }
}

/* TERMINATED SESSION HANDLER */
function terminatedSessionHandler(event) {
    $("[id$=ls_closeAuthor]").text("Cliente");
}

/* ENDED SESSION HANDLER */
function endedSessionHandler(event) {
    delete_cookie("unblu");
    // $("[id$=modal_closeCoBrowsing]").modal("toggle");
    setCoBrowsingSession(false, 0);
}





function lsErrorHandling() {
    if ($("[id$=cb_ls_conditions]").prop('checked'))
        $("[id$=ls_error]").hide();
}


// http://stackoverflow.com/questions/2257631/how-create-a-session-using-javascript
function writeCookie(name, value, time) {
    var date, expires;
    if (time) {
        date = new Date();
        date.setTime(date.getTime() + (time * 60 * 60 * 1000));
        expires = "; expires=" + date.toGMTString();
    } else {
        expires = "";
    }
    document.cookie = name + "=" + value + expires + "; path=/";
}

function readCookie(name) {
    var i, c, ca, nameEQ = name + "=";
    ca = document.cookie.split(';');
    for (i = 0; i < ca.length; i++) {
        c = ca[i];
        while (c.charAt(0) === ' ') {
            c = c.substring(1, c.length);
        }
        if (c.indexOf(nameEQ) === 0) {
            return c.substring(nameEQ.length, c.length);
        }
    }
    return '';
}


// http://stackoverflow.com/questions/2144386/javascript-delete-cookie
function delete_cookie(name) {
    document.cookie = name + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}



function checkName() {

    if (!unblu.api && !unblu.apiConsumerRegistered) {
        unblu.apiConsumerRegistered = true;
        unblu.registerApiConsumer(function (requestedApi) {
            unblu.api = requestedApi;
            checkCoBrowsingState();
        }, ['core.visitor.session']);
    }
    checkNameHelper();
}

function checkNameHelper() {
    if (unblu.api) {
        var session = unblu.api.core.visitor.session.Session.getInstance();
        alert(session.EActor.values("OTHER_PARTICIPANT"))
    }
}