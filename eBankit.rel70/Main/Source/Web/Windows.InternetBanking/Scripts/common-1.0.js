/**
 * Protect window.console method calls, e.g. console is not defined on IE
 * unless dev tools are open, and IE doesn't define console.debug
 */
(function () {
    if (!window.console) {
        window.console = {};
    }
    // union of Chrome, FF, IE, and Safari console methods
    var m = [
        "log", "info", "warn", "error", "debug", "trace", "dir", "group",
        "groupCollapsed", "groupEnd", "time", "timeEnd", "profile", "profileEnd",
        "dirxml", "assert", "count", "markTimeline", "timeStamp", "clear"
    ];
    // define undefined methods as noops to prevent errors
    for (var i = 0; i < m.length; i++) {
        if (!window.console[m[i]]) {
            window.console[m[i]] = function () { };
        }
    }
})();
jQuery.extend({
    parseQuerystring: function () {
        var nvpair = {};
        var qs = window.location.search.replace('?', '');
        var pairs = qs.split('&');
        $.each(pairs, function (i, v) {
            var pair = v.split('=');
            nvpair[pair[0]] = pair[1];
        });
        return nvpair;
    }
});
Type.registerNamespace('eBankit.Presentation');

eBankit.Presentation.MouseX = 0;
eBankit.Presentation.MouseY = 0;
eBankit.Presentation.GetResource = function (key) {
    var res = "[JS:" + key + "]";
    if (typeof (top.Resources != undefined) && (top.Resources != null)) {
        if (typeof (top.Resources["JS"]["JS_" + key] != undefined) && (top.Resources["JS"]["JS_" + key] != null)) {
            res = top.Resources["JS"]["JS_" + key]
        }
    }

    return res
}

eBankit.Presentation.nC = function (url, menuPageId, params) {
    //var sessionGuidParam = "";
    //var interactionId = "";
    //if (typeof (QSSessionGuid) != "undefined" && url.toString().indexOf(QSSessionGuid + "=") == -1)
    //    sessionGuidParam = "&" + QSSessionGuid + '=' + SessionGuid;
    //else if (parent && typeof (parent.QSSessionGuid) != "undefined" && url.toString().indexOf(parent.QSSessionGuid + "=") == -1)
    //    sessionGuidParam = "&" + parent.QSSessionGuid + '=' + parent.SessionGuid;

    //if (url.toString().indexOf("&InteractionId") == -1)
    //    interactionId = "&InteractionId=" + InteractionId;
    //else interactionId = "";

    if (params)
        eBankit.document.location.href = eBankit.Presentation.ResolveUrl((url + (url.toString().indexOf(".aspx?") == -1 ? "?" : "&") + (params ? params : "")));
    else
        eBankit.document.location.href = eBankit.Presentation.ResolveUrl(url);

    return false;
}
eBankit.Presentation.ResolveUrl = function (url) {
    return url.replace("~/", baseUrl);
}

eBankit.Presentation.HomePage = function () {
    eBankit.Presentation.BlockPageForNormalRequest();
    eBankit.document.location.href = eBankit.Presentation.ResolveUrl(landingurlpage);
}

eBankit.Presentation.QueryString = function (key) {
    key = key.replace(/[*+?^$.\[\]{}()|\\\/]/g, "\\$&"); // escape RegEx meta chars
    var match = location.search.match(new RegExp("[?&]" + key + "=([^&]+)(&|$)"));
    return match && decodeURIComponent(match[1].replace(/\+/g, " "));
}

eBankit.Presentation.ChangeLanguage = function (code) {
    hdnToAddCode.val(code);
    __doPostBack(btnChangeLanguageId, '');
}

eBankit.Presentation.Format = function (str, col) {
    col = typeof col === 'object' ? col : Array.prototype.slice.call(arguments, 1);

    return str.replace(/\{\{|\}\}|\{(\w+)\}/g, function (m, n) {
        if (m == "{{") { return "{"; }
        if (m == "}}") { return "}"; }
        return col[n];
    });
}

eBankit.Presentation.IsWindowManager = function () {
    if (window.frameElement
        && (typeof (window.frameElement.outerHTML) != "undefined")
        && (window.frameElement.outerHTML != null)
        && (window.frameElement.outerHTML.indexOf('windowmanager') > -1))
        return true;
    else
        return false;
}

eBankit.Presentation.IsParentWindowManager = function () {
    if ((typeof (isLegacyPopup) != "undefined" && isLegacyPopup) || (typeof (parent.isLegacyPopup) != "undefined" && parent.isLegacyPopup))
        return false;

    if (parent.window.frameElement
        && (typeof (parent.window.frameElement.outerHTML) != "undefined")
        && (parent.window.frameElement.outerHTML != null)
        && (parent.window.frameElement.outerHTML.indexOf('windowmanager') > -1))
        return true;
    else
        return false;
}

eBankit.Presentation.AutoResizeIFrame = function (element) {

    //if (element.readyState != "complete") {
    //    setTimeout(function () { AutoResizeIFrame(element) }, 100);
    //}

    if (typeof eBankit.Presentation.containerCss === 'undefined') {
        var iframeMinHeight = 500;

        if (eBankit.Presentation.IsWindowManager() && !eBankit.Presentation.IsParentWindowManager()) {
            //console.info("AutoResizeIFrame#:" + element.id + "#readyState:" + element.readyState+"#NO RESIZE");
            return;
        }
        if (eBankit.Presentation.IsParentWindowManager()) {
            //console.info("AutoResizeIFrame#:" + element.id + "#readyState:" + element.readyState + "#IsParentWindowManager#NO RESIZE");
        }

        if (!eBankit.Presentation.IsWindowManager() && !eBankit.Presentation.IsParentWindowManager()) {

            var $contentBody = $(element).contents().find("body").eq(0);
            var $contentCssClass = $contentBody.find("div.container-popup div.trx-container > input[type='hidden']#hdnContainerCssClass");
            if ($contentCssClass.length > 0 && $contentCssClass.eq(0).val() != '') {
                var cssClassValue = $contentCssClass.eq(0).val();
                $(element).addClass(cssClassValue);
            }
            else {

                //var $div3 = $div2.find("div.trx-container").eq(0);
                //var $div4 = $div2.find('input[type="hidden"]');
                //if ($div4)

                //try to get body height
                //var $contentBody = $(element).contents().find("body").eq(0);
                if ($contentBody.height() > 0)
                    iframeMinHeight = $contentBody.height();
                else
                    iframeMinHeight = 500;

                //console.info("AutoResizeIFrame:" + element.id + "#readyState:" + element.readyState + "#height:" + iframeMinHeight);
            }
        }

        var elementContentWindow;
        var elementContentWindowDocument;
        var elementContentWindowDocumentDocumentElement;
        var elementContentWindowDocumentDocumentElementDocument;
        var elementContentWindowDocumentDocumentElementDocumentBody;

        if (element) {

            elementContentWindow = element.contentWindow;
            if (elementContentWindow) {
                elementContentWindowDocument = elementContentWindow.document;
                if (elementContentWindowDocument) {
                    elementContentWindowDocumentDocumentElement = elementContentWindowDocument.documentElement;
                    if (elementContentWindowDocumentDocumentElement) {
                        elementContentWindowDocumentDocumentElementDocument = elementContentWindowDocumentDocumentElement.document;
                        if (elementContentWindowDocumentDocumentElementDocument) {
                            elementContentWindowDocumentDocumentElementDocumentBody = elementContentWindowDocumentDocumentElementDocument.body;
                            if (elementContentWindowDocumentDocumentElementDocumentBody && elementContentWindowDocumentDocumentElementDocumentBody.scrollHeight) {
                                var scrollHeight = (elementContentWindowDocumentDocumentElementDocumentBody.scrollHeight);
                                if (scrollHeight < iframeMinHeight)
                                    scrollHeight = iframeMinHeight;
                                element.style.height = scrollHeight + "px";
                                //console.info("AutoResizeIFrame:" + element.id + "#readyState:" + element.readyState + "#height:" + scrollHeight);
                            }
                        }
                        else {
                            if (elementContentWindowDocumentDocumentElement.scrollHeight) {
                                var scrollHeight = (elementContentWindowDocumentDocumentElement.scrollHeight);
                                if (scrollHeight < iframeMinHeight)
                                    scrollHeight = iframeMinHeight;
                                element.style.height = scrollHeight + "px";
                            }

                        }
                    }
                }
            }
        }
    }
    else {
        $(element).addClass(eBankit.Presentation.containerCss);
    }
};

eBankit.Presentation.InsertValidateMsg = function (elem, text) {
    var newElem = document.createElement("label");
    elem.addClass("has-error");
    //elem.addClass("errorCustom")
    if (elem[0] != undefined && elem[0].parentNode.lastChild.nodeName == "SPAN" && elem[0].parentNode.lastChild.className == "info") {
        if (elem[0].parentNode.lastChild.previousSibling.nodeName != "LABEL") {
            //newElem.className = "error errorCustom";
            newElem.className = "has-error";
            newElem.setAttribute("role", "alert");
            newElem.setAttribute("id", elem[0].id + "_error");
            //newElem.innerText = text;
            elem[0].setAttribute("aria-invalid", true);
            elem[0].setAttribute("aria-errormessage", elem[0].id + "_error");

            if (document.all) {
                newElem.innerText = text;
            } else {
                newElem.textContent = text;
            }
            elem[0].parentNode.insertBefore(newElem, elem[0].parentNode.lastChild);
        }
        else {
            if (document.all) {
                elem[0].parentNode.lastChild.previousSibling.innerText = text;
            } else {
                elem[0].parentNode.lastChild.previousSibling.textContent = text;
            }
        }
    }
    else if (elem[0] != undefined && elem[0].parentNode.lastChild.nodeName != "LABEL") {
        //newElem.className = "error errorCustom";
        newElem.className = "has-error";
        newElem.setAttribute("role", "alert");
        newElem.setAttribute("id", elem[0].id + "_error");
        //newElem.innerText = text;
        elem[0].setAttribute("aria-invalid", true);
        elem[0].setAttribute("aria-errormessage", elem[0].id + "_error");

        if (document.all)
            newElem.innerText = text;
        else
            newElem.textContent = text;

        elem[0].parentNode.appendChild(newElem);
    }
    else if (elem[0] != undefined) {
        if (document.all)
            elem[0].parentNode.lastChild.innerText = text;
        else
            elem[0].parentNode.lastChild.textContent = text;
    }
    else if (elem[0] == undefined) {

    }
}

eBankit.Presentation.InsertValidateMsg_V2 = function (elem, text) {
    var newElem = document.createElement("label");
    elem.addClass("error")
    //elem.addClass("errorCustom")
    if (elem[0].parentNode.lastChild.nodeName == "SPAN" && elem[0].parentNode.lastChild.className == "info") {
        if (elem[0].parentNode.lastChild.previousSibling.nodeName != "LABEL") {
            //newElem.className = "error errorCustom";
            newElem.className = "error";
            newElem.setAttribute("id", elem[0].id);
            //newElem.innerText = text;

            if (document.all) {
                newElem.innerText = text;
            } else {
                newElem.textContent = text;
            }
            elem[0].parentNode.insertBefore(newElem, elem[0].parentNode.lastChild);
        }
        else {
            if (document.all) {
                elem[0].parentNode.lastChild.previousSibling.innerText = text;
            } else {
                elem[0].parentNode.lastChild.previousSibling.textContent = text;
            }
        }
    }
    else if (elem[0].parentNode.lastChild.nodeName != "LABEL") {
        //newElem.className = "error errorCustom";
        newElem.className = "error";
        newElem.setAttribute("id", elem[0].id);
        //newElem.innerText = text;
        if (document.all)
            newElem.innerText = text;
        else
            newElem.textContent = text;

        elem[0].parentNode.appendChild(newElem);
    }
    else {
        if (document.all)
            elem[0].parentNode.lastChild.innerText = text;
        else
            elem[0].parentNode.lastChild.textContent = text;
    }
}


eBankit.Presentation.InsertCustomValidateMsg = function (elem, text) {
    elem.addClass("custom-error");
    $("label[for='" + elem[0].id + "'].custom-error").remove();

    var newElem = document.createElement("label");
    newElem.className = "custom-error";
    newElem.setAttribute("for", elem[0].id);
    newElem.innerText = text;

    var siblings = elem.siblings();
    if (siblings.length > 0) {
        siblings.eq(siblings.length - 1).after(newElem);
    } else {
        elem.after(newElem);
    }
}

eBankit.Presentation.RemoveValidateMsg = function (elem) {
    elem.removeClass("has-error");
    elem.removeClass("error");
    elem.removeAttr("aria-invalid");
    elem.removeAttr("aria-errormessage");
    //elem.removeClass("errorCustom");
    if (elem != null && elem[0] != null && elem[0].parentNode != null && elem[0].parentNode.lastChild.nodeName == "SPAN" && elem[0].parentNode.lastChild.className == "info" && (elem[0].parentNode.lastChild.previousSibling.nodeName == "LABEL")) {
        elem[0].parentNode.removeChild(elem[0].parentNode.lastChild.previousSibling);
    }
    else if (elem != null && elem[0] != null && elem[0].parentNode != null && elem[0].parentNode.lastChild.nodeName == "LABEL") {
        elem[0].parentNode.removeChild(elem[0].parentNode.lastChild);
    }
}

eBankit.Presentation.RemoveCustomValidateMsg = function (elem) {
    elem.removeClass("custom-error");
    elem.removeClass("error");
    $("label[for='" + elem[0].id + "'].custom-error").remove();
}

eBankit.Presentation.OpenLink = function (link) {
    eBankit.document.location.href = link;
}

eBankit.Presentation.PostGrid = function (uniqueid, hdn, expression) {
    //
    var hdnControl = $('#' + hdn);
    hdnControl.val(expression);

    __doPostBack(uniqueid, '');
}

eBankit.Presentation.GetPageCoords = function (element) {
    var coords = { x: 0, y: 0 };
    while (element) {
        coords.x += element.offsetLeft;
        coords.y += element.offsetTop;
        element = element.offsetParent;
    }
    return coords;
}

eBankit.Presentation.GetElementObject = function (elementId) {
    if (document.all)
        return document.all[elementId];
    else if (document.getElementById)
        return document.getElementById(elementId);
    else
        return null;
}

Sys.Application.add_load(pageLoad_ProcessValidation);
function pageLoad_ProcessValidation() {
    //

}

/* Prevent site access via Iframe */
eBankit.Presentation.PreventFrameAccess = function () {
    if (top != self) {
        top.location = self.location;
    }
}
/* END Prevent site access via Iframe */

/* LOADING PAGE */
eBankit.Presentation.IgnoreUnload = false;
window.onbeforeunload = function (e) {
    if (!eBankit.Presentation.IgnoreUnload) {
        if (navigator && (navigator.userAgent.toLowerCase()).indexOf("msie") > -1) {
            setTimeout(function () { eBankit.Presentation.BlockPageForNormalRequest(); }, 10);
        }
        else {
            eBankit.Presentation.BlockPageForNormalRequest();
        }
    }
    eBankit.Presentation.IgnoreUnload = false;
};

window.onload = function () {
    eBankit.Presentation.UnLoading();
}

// Fix safari infinite loading upon pressing browser back button
window.onpageshow = function () {
    if (eBankit.browsers.isSafari) {
        eBankit.Presentation.UnLoading();
    }
}

eBankit.Presentation.Loading = function () {
    if (!eBankit.Presentation.NoLoading)
        if (typeof (SessionGuid) == 'undefined')
            eBankit.Presentation.BlockPageForNormalRequest();
}

eBankit.Presentation.UnLoading = function () {
    //if (parent)
    //    parent.eBankit.Presentation.ResizeIframe();
    //else
    //    eBankit.Presentation.ResizeIframe()

    $('.blockOverlay').css('opacity', '0');
    $('.blockElement').css('opacity', '0');
    $.unblockUI();
}

eBankit.Presentation.BlockPageForNormalRequest = function () {
    if (!eBankit.Presentation.NoLoading) {
        $.unblockUI();
        eBankit.Presentation.SetBlockPageCommon();

        $('body').block();
    }
    //var form = $('body');
    //$('input').each(function (i) {
    //    var self = $(this);
    //    try {
    //        var v = self.autoNumeric('get');
    //        console.log("Not an autonumeric field: " + self.attr("name"));
    //        console.log("value before: " + v);
    //        self.autoNumeric('destroy');
    //        self.val(v);
    //        console.log("value after: " + self.val());
    //    } catch (err) {
    //        //console.log("Not an autonumeric field: " + self.attr("name"));
    //    }
    //});
}

eBankit.Presentation.SelectorToBlockOnAjaxRequest = null;

eBankit.Presentation.BlockPageForAjaxRequest = function () {
    $.unblockUI();
    eBankit.Presentation.SetBlockPageCommon();

    if (eBankit.Presentation.SelectorToBlockOnAjaxRequest) {

        $.blockUI.defaults.css = {
            width: '8em',
            height: '8em',
            position: 'fixed',
            left: '50vw',
            top: '50vh',
            backgroundColor: 'transparent',
            marginTop: '-8em'
        };
        $.blockUI.defaults.centerX = false;
        $.blockUI.defaults.centerY = false;
        $.blockUI.defaults.theme = false;
        $(eBankit.Presentation.SelectorToBlockOnAjaxRequest).block();
    }
    else
        $('body').block();
    eBankit.Presentation.SelectorToBlockOnAjaxRequest = null;
}

eBankit.Presentation.BeginRequest = function (sender, args) {
    if (!eBankit.Presentation.NoLoading)
        eBankit.Presentation.BlockPageForAjaxRequest(args);
}

eBankit.Presentation.EndRequest = function (sender, args) {
    if (args.get_error() != undefined) {
        args.set_errorHandled(true);
    }

    $.unblockUI();
    eBankit.Presentation.NoLoading = false;
}

eBankit.Presentation.ResetCursor = function () {
    //document.body.style.cursor = 'cursor';
}

eBankit.Presentation.SetBlockPageCommon = function () {
    $.blockUI.defaults.onUnblock = eBankit.Presentation.ResetCursor;

    $.blockUI.defaults.message = '<div class=\"loading-image\"></div>';
    $.blockUI.defaults.css = {
        width: '8em',
        height: '8em',
        position: 'fixed',
        left: '50vw',
        top: '50vh',
        backgroundColor: 'transparent',
        marginTop: '-8em'

    };
    $.blockUI.defaults.theme = false;
    $.blockUI.defaults.centerY = false;
    $.blockUI.defaults.themedCSS = {};
    $.blockUI.defaults.themedCSS.width = 100;
    $.blockUI.defaults.themedCSS.height = 64;
    $.blockUI.defaults.overlayCSS = {};
    $.blockUI.defaults.overlayCSS.backgroundColor = '#f6f6f6';
    $.blockUI.defaults.overlayCSS.opacity = 0.6;
}

Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(eBankit.Presentation.BeginRequest);
Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.EndRequest);

/* Common Init */
$(document).ready(function () {
    //$('input[type=text], input[type=password]').attr('autocomplete', 'off');
    $(document).mousemove(function (e) {
        eBankit.Presentation.MouseX = e.pageX;
        eBankit.Presentation.MouseY = e.pageY;
    });
    //CurrencyTextBoxEvents();

    if ($.validator) {
        $.validator.methods.min = function (value, element, param) {
            var autonumeric = $(element).data("autoNumeric");
            if (autonumeric != null) {
                return this.optional(element) || $(element).autoNumeric("get") >= param;
            } else {
                return this.optional(element) || value >= param;
            }
        }
        $.validator.messages.min = $.validator.format(top.eBankit.Presentation.GetResource("MinValueError"));

        $.validator.methods.max = function (value, element, param) {
            var autonumeric = $(element).data("autoNumeric");
            if (autonumeric != null) {
                return this.optional(element) || $(element).autoNumeric("get") <= param;
            } else {
                return this.optional(element) || value <= param;
            }
        }
        $.validator.messages.max = $.validator.format(top.eBankit.Presentation.GetResource("MaxValueError"));

        $.validator.messages.digits = $.validator.format(top.eBankit.Presentation.GetResource("NumericError"));
    }
});
/* END Common Init */

function CurrencyTextBoxEvents() {
    var controls = ".centerField-margins-currencytextbox_v3 input[type=text]";

    $(controls).focus(function () {
        $(".centerField-margins-currencytextbox_v3 .curr_v2").css("visibility", "hidden");
        this.setSelectionRange(0, this.value.length);
        if (!($(".centerField-margins-currencytextbox_v3").hasClass('focus-currency')))
            $(".centerField-margins-currencytextbox_v3").addClass("focus-currency");

    });

    $(controls).removeAttr("style");

    var values = document.getElementsByClassName("sd");
    if (values != null && values.length > 0) {
        for (var i = 0; i < values.length; i++) {
            if (values[i].innerHTML.indexOf("-") > -1) {
                values[i].className += " negative";
            }
            else {
                values[i].className += " positive";
            }
        }
    }

    $(controls).blur(function () {
        var valid = $(".centerField-margins-currencytextbox_v3 .valid");
        if (valid != null) {
            $(".centerField-margins-currencytextbox_v3 .curr_v2").css("visibility", "visible");;
        }
        if ($(".centerField-margins-currencytextbox_v3").hasClass('focus-currency'))
            $(".centerField-margins-currencytextbox_v3").removeClass("focus-currency");

        $(controls).each(function () {
            var value = $(this).val().replace(',', '.');
            if (value == '') {
                $(this).val('' + parseFloat(0).toFixed(2).replace('.', ','));
            }
            else if (!isNaN(value)) {
                var valueformatted = parseFloat(value).toFixed(2);
                $(this).val(valueformatted.replace('.', ','));
            }
        });
    });

    $(controls).keypress(function (e) {
        return isNumber(e, this);
    });
}

function isNumber(evt, element) {
    var charCode = (evt.which) ? evt.which : event.keyCode;

    if (!isTextSelected(element)) {
        //var pointIndex = $(element).val().indexOf(',');
        //if (pointIndex >= 0 && pointIndex < $(element).val().length -2)
        //    return false;
    }
    if ((charCode != 44 || $(element).val().indexOf(',') != -1) && (charCode < 48 || charCode > 57))
        return false;

    return true;
}

function isTextSelected(input) {
    if (typeof input.selectionStart == "number") {
        return input.selectionStart == 0 && input.selectionEnd == input.value.length;
    } else if (typeof document.selection != "undefined") {
        input.focus();
        return document.selection.createRange().text == input.value;
    }
}

eBankit.Presentation.CustomValidatorRemove = function (inputField, removeall) {
    var removeaAllLabels = false;
    if (removeall != undefined)
        removeaAllLabels = removeall;

    var errorLabels = inputField.parentNode.getElementsByTagName("label");
    var foundJqueryError = false;
    if (errorLabels.length > 0) {
        for (var count = 0; count < errorLabels.length; count++) {
            var errorLabel = errorLabels[count];
            if (errorLabel.className == "error")
                if (errorLabel.getAttribute("generated") != null && errorLabel.getAttribute("generated").toString() == "true" && errorLabel.style.display != "none")
                    foundJqueryError = true;
        }

        if (foundJqueryError) {
            for (var count = 0; count < errorLabels.length; count++) {
                var errorLabel = errorLabels[count];
                if ((errorLabel.className == "error" && errorLabel.getAttribute("generated") == null) || removeaAllLabels)
                    inputField.parentNode.removeChild(errorLabel);
            }
            return false;
        }
    }

    return true;
}

eBankit.Presentation.Alltrim = function (str) {
    return str.replace(/^\s+|\s+$/g, '');
}

eBankit.Presentation.IsNumeric = function (input) {
    input = eBankit.Presentation.Alltrim(input.replace(",", "."));
    return /^[-+]?[0-9]+(\.[0-9]+)?$/.test(input);
}

eBankit.Presentation.IsPositiveNumber = function (input) {
    input = eBankit.Presentation.Alltrim(input.replace(",", "."));
    return /^\d*\.{0,1}\d+$/.test(input);
}

eBankit.Presentation.IsPositiveNumberV2 = function (input) {
    input = eBankit.Presentation.Alltrim(input.replace(",", "."));
    return /^\d+$/.test(input);
}

eBankit.Presentation.ValidateEmailExp = function (valEmail) {
    var isValid = true;
    if (valEmail != '') {
        if (valEmail.length < 254) {
            var regexMailStr = (/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/);
            var regexMail = new RegExp(regexMailStr);
            isValid = regexMail.test(valEmail);
        } else {
            isValid = false;
        }
    }
    return isValid;
}

/*
eBankit.Presentation.ValidateDateFormatExp = function (valDate) {
    var regexDateStr = /^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$/;
    var regexDate = new RegExp(regexDateStr);
    var isValid = regexDate.test(valDate);
    //console.info("isValid: " + isValid);
    return isValid;
}*/

eBankit.Presentation.ValidateDateFormatExp = function (valDate) {
    return (eBankit.dateJS.isDate(valDate, dateJSFormat));
}

/*
eBankit.Presentation.ValidateDateFormatExpV2 = function (valDate) {
    var regexDateStr = "^(\\d{1,2})" + date_sep + "(\\d{1,2})" + date_sep + "(\\d{4})$";
    //var regexDateStr = /^(\d{4})-(\d{1,2})-(\d{1,2})$/;
    var regexDate = new RegExp(regexDateStr);
    var isValid = regexDate.test(valDate);
    //console.info("isValid_v2: " + isValid);
    return isValid;
}*/


eBankit.Presentation.ValidateDateFormatExpV2 = function (valDate) {
    return (eBankit.dateJS.isDate(valDate, dateJSFormat));
}

/*
eBankit.Presentation.InternalValidation = function (date) {
    var success = false;
    if (date == null || date == '') {
        success = true;
    }
    var parts = date.split(date_sep);

    if (parts != null && parts.length == 3) {
        var day = parts[0];
        var month = parts[1];
        var year = parts[2];

        if (month <= 12) {
            if (day <= eBankit.Presentation.daysInMonth(month, year)) {
                success = true;
            }
        }
    }
    return success;
};*/
eBankit.Presentation.InternalValidation = function (date) {
    var success = false;
    if (date == null || date == '') {
        return true;
    }
    return (eBankit.dateJS.isDate(date, dateJSFormat));
};


eBankit.Presentation.daysInMonth = function (month, year) {
    return new Date(year, month, 0).getDate();
};

eBankit.Presentation.ValidateNotRequiredDateFormatExp = function (valDate) {
    var isValid = false;
    if (valDate == '')
        return true;
    else
        isValid = eBankit.Presentation.ValidateDateFormatExpV2(valDate);
    // console.info("isValid 2: " + isValid);
    return isValid;
}

eBankit.Presentation.ValidateNumeric = function (valNum) {
    var regexNumExp = /^[0-9]*$/;
    var regexNum = new RegExp(regexNumExp);
    valNum = eBankit.Presentation.Alltrim(valNum.replace(",", "."));
    var isvalid = regexNum.test(valNum);

    return isvalid;
}

eBankit.Presentation.ValidateNumTelemV2 = function (valNum, valExpression) {

    //[1|2|3|6] 2º mobile phone digit
    var regexNumExp = valExpression;
    var regexNum = new RegExp(regexNumExp);
    var isvalid = regexNum.test(valNum);


    return isvalid;

}

eBankit.Presentation.ValidateTamanhoRefTelem = function (valNum) {
    var regexNumExp = /^\d{9}$/;
    var regexNum = new RegExp(regexNumExp);
    var isvalid = regexNum.test(valNum);

    return isvalid;
}

eBankit.Presentation.ValidateCustomRegEx = function (valNum, regex) {
    var regexNumExp = regex;
    var regexNum = new RegExp(regexNumExp);
    var isvalid = regexNum.test(valNum);

    return isvalid;
}

eBankit.Presentation.GetParameterByName = function (name) {
    name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
    var regexS = "[\\?&]" + name + "=([^&#]*)";
    var regex = new RegExp(regexS);
    var results = regex.exec(window.location.href);
    if (results == null)
        return "";
    else
        return decodeURIComponent(results[1].replace(/\+/g, " "));
}

eBankit.Presentation.ConvertStringToJsDate = function (strDate) {
    if (strDate != "") {
        strDate = strDate.replace("/", "-");
        var dateSplitted;
        dateSplitted = strDate.split(date_sep);
        if (dateSplitted.length == 3) {
            return new Date(dateSplitted[2], dateSplitted[1] - 1, dateSplitted[0]);
        }
        else {
            return false;
        }
    }
    else
        return false;
}

/*
eBankit.Presentation.ValidateMinDate = function (value, valueToCompare) {
    //console.log(value);
    //console.log(valueToCompare);
    if (value != "" && valueToCompare != "") {
        //        var currentTime = new Date();
        //        var month = currentTime.getMonth() + 1
        //        var day = currentTime.getDate()
        //        var year = currentTime.getFullYear()
        //        var dataActual = new Date(month + "/" + day + "/" + year);
        var date = eBankit.Presentation.ConvertStringToJsDate(valueToCompare);
        var dataInd = eBankit.Presentation.ConvertStringToJsDate(value);
        //console.info("value: " + value);
        //console.info("valueToCompare: " + valueToCompare);
        //console.log(dataInd);
        //console.log(date);
        //console.info("date: " + date + " < dataInd: " + dataInd);
        //if (dataInd < date)
        //    console.log('min = false');
        //else
        //    console.log('min = true');

        if (dataInd < date)
            return false;
        else
            return true;
    }
    else
        return true;
}
*/

/*
eBankit.Presentation.MomentMonthConvertion = function (strDate)
{
    if (moment_month_convertion != null) {
        for (var key in moment_month_convertion) {
            if (strDate.indexOf(key)!=-1) {
                strDate = strDate.replace(key, moment_month_convertion[key]);
                break;
            }
        }
    }
    return strDate;
}
*/

/*
eBankit.Presentation.getDateKnownFormat = function (strDate)
{
    strDate = eBankit.Presentation.MomentMonthConvertion(strDate);
    return moment(strDate, moment_date_format);
}

*/

eBankit.Presentation.ValidateMinDate = function (value, valueToCompare) {

    if (value != "" && valueToCompare != "") {

        var date = new Date(eBankit.dateJS.getDateFromFormat(valueToCompare, dateJSFormat));
        var dataInd = new Date(eBankit.dateJS.getDateFromFormat(value, dateJSFormat));
       
        if (dataInd < date)
            return false;
        else
            return true;
    }
    else
        return true;
}

/*
eBankit.Presentation.ValidateMaxDate = function (value, valueToCompare) {

    if (value != "" && valueToCompare != "") {
        var date = eBankit.Presentation.ConvertStringToJsDate(valueToCompare);
        var dataInd = eBankit.Presentation.ConvertStringToJsDate(value);

        //console.info("value: " + value);
        //console.info("valueToCompare: " + valueToCompare);
        //console.log(dataInd);
        //console.log(date);
        //console.info("date: " + date + " > dataInd: " + dataInd);
        //if (dataInd > date)
        //    console.log('max = false');
        //else
        //    console.log('max = true');

        if (dataInd > date)
            return false;
        else
            return true;
    }
    else
        return true;
}
*/
eBankit.Presentation.ValidateMaxDate = function (value, valueToCompare) {

    if (value != "" && valueToCompare != "") {

        var date = new Date(eBankit.dateJS.getDateFromFormat(valueToCompare, dateJSFormat));
        var dataInd = new Date(eBankit.dateJS.getDateFromFormat(value, dateJSFormat));

        if (dataInd > date)
            return false;
        else
            return true;
    }
    else
        return true;
}


eBankit.Presentation.ValidateMinInt = function (value, valueToCompare) {
    if (value != "") {
        var intValue = parseInt(valueToCompare);
        var intValueInd = parseInt(value);

        if (intValueInd < intValue)
            return false;
        else
            return true;
    }
    else
        return true;
}

eBankit.Presentation.ValidateMaxInt = function (value, valueToCompare) {
    if (value != "") {
        var intValue = parseInt(valueToCompare);
        var intValueInd = parseInt(value);

        if (intValueInd > intValue)
            return false;
        else
            return true;
    }
    else
        return true;
}

eBankit.Presentation.ValidateMinAmount = function (value, valueToCompare) {
    var amountValue = parseFormattedNumber(value);
    var amountToCompareValue = parseFormattedNumber(valueToCompare);
    if (amountValue == 0) {
        return false;
    }
    else if (amountValue == null) {
        return false;
    }

    if (amountToCompareValue == 0) {
        return false;
    }
    else if (amountToCompareValue == null) {
        return false;
    }

    if (amountValue < amountToCompareValue)
        return false;

    return true;
};

eBankit.Presentation.ValidateMaxAmount = function (value, valueToCompare) {
    var amountValue = parseFormattedNumber(value);
    var amountToCompareValue = parseFormattedNumber(valueToCompare);
    if (amountValue == 0) {
        return false;
    }
    else if (amountValue == null) {
        return false;
    }

    if (amountToCompareValue == 0) {
        return false;
    }
    else if (amountToCompareValue == null) {
        return false;
    }

    if (amountValue > amountToCompareValue)
        return false;

    return true;
};

eBankit.Presentation.ValidateDate = function (value) {
    if (value != "") {
        var data30 = new Date();
        data30.setDate(data30.getDate() + 30);
        var dataInd = eBankit.Presentation.ConvertStringToJsDate(value);
        if (dataInd > data30)
            return false;
        else
            return true;
    }
    else
        return true;
}

eBankit.Presentation.ValidateWeekend = function (value) {
    if (value != "") {
        var returnValue = false;
        var dia = value.split('/')[0];
        var mes = value.split('/')[1];
        var ano = value.split('/')[2];
        var dData = new Date(ano, mes - 1, dia);
        if (dData.getDay() > 0 && dData.getDay() < 6)
            returnValue = true;

        return returnValue;
    }
    else
        return true;
}

eBankit.Presentation.ValidateCurrencyAmount = function (value) {
    /*    
    ^                   # start of string
    [0-9]+              # Must have one or more numbers
    (                   # begin optional group
    \.              # The decimal point, . must be escaped, or it is treated as "any character"
    [0-9]{0,2}      # one or two numbers
    )?                  # end group, signify it's optional with ?
    $                   # end of string 
    */


    var regExpStr = /^\d*?(\d+([\.\,]\d{1,2})?|[\.\,]\d{1,2})\s*$/;
    var regExpAmount = new RegExp(regExpStr);

    // Valida o valor apenas se nao estiver vazio
    if (value == '')
        return true;
    else {
        var isValid = regExpAmount.test(value);

        if (isValid) {
            var valAux = value.replace(',', '.');
            if (valAux.split(".")[0].length <= 11) {
                if (parseFloat(valAux) > 0)
                    isValid = true;
                else
                    isValid = false;
            }
            else
                isValid = false;
        }
        return isValid;
    }
}

eBankit.Presentation.ValidateCurrencyAmountCulture = function (value, decimalSeparator) {
    /*    
    ^                   # start of string
    [0-9]+              # Must have one or more numbers
    (                   # begin optional group
    \.              # The decimal point, . must be escaped, or it is treated as "any character"
    [0-9]{0,2}      # one or two numbers
    )?                  # end group, signify it's optional with ?
    $                   # end of string 
    */


    var regExpStr = /^\d*?(\d+([\.\,]\d{1,2})?|[\.\,]\d{1,2})\s*$/;
    /*if (decimalSeparator == ".")
        regExpStr = /^\d*?(\d+([\.]\d{1,2})?|[\.]\d{1,2})\s*$/;
    else if (decimalSeparator == ",")
        regExpStr = /^\d*?(\d+([\,]\d{1,2})?|[\,]\d{1,2})\s*$/;*/


    var regExpAmount = new RegExp(regExpStr);

    // Valida o valor apenas se nao estiver vazio
    if (value == '')
        return true;
    else {
        var isValid = regExpAmount.test(value);

        if (isValid) {
            var valAux = value;//.replace(',', '.');
            if (valAux.split(decimalSeparator)[0].length <= 11) {
                if (parseFloat(valAux) > 0)
                    isValid = true;
                else
                    isValid = false;
            }
            else
                isValid = false;
        }
        return isValid;
    }
}



eBankit.Presentation.ValidateCurrencyAmountAllowZero = function (value) {
    /*    
    ^                   # start of string
    [0-9]+              # Must have one or more numbers
    (                   # begin optional group
    \.              # The decimal point, . must be escaped, or it is treated as "any character"
    [0-9]{0,2}      # one or two numbers
    )?                  # end group, signify it's optional with ?
    $                   # end of string 
    */


    var regExpStr = /^\d*?(\d+([\.\,]\d{1,2})?|[\.\,]\d{1,2})\s*$/;
    var regExpAmount = new RegExp(regExpStr);

    // Valida o valor apenas se nao estiver vazio
    if (value == '')
        return true;
    else {
        var isValid = regExpAmount.test(value);

        if (isValid) {
            var valAux = value.replace(',', '.');
            if (valAux.split(".")[0].length <= 11) {
                if (parseFloat(valAux) >= 0)
                    isValid = true;
                else
                    isValid = false;
            }
            else
                isValid = false;
        }
        return isValid;
    }
}


eBankit.Presentation.ValidateCurrencyAmountCultureAllowZero = function (value, decimalSeparator) {
    /*    
    ^                   # start of string
    [0-9]+              # Must have one or more numbers
    (                   # begin optional group
    \.              # The decimal point, . must be escaped, or it is treated as "any character"
    [0-9]{0,2}      # one or two numbers
    )?                  # end group, signify it's optional with ?
    $                   # end of string 
    */


    var regExpStr = /^\d*?(\d+([\.\,]\d{1,2})?|[\.\,]\d{1,2})\s*$/;
    //if (decimalSeparator == ".")
    //    regExpStr = /^\d*?(\d+([\.]\d{1,2})?|[\.]\d{1,2})\s*$/;
    //else if (decimalSeparator == ",")
    //    regExpStr = /^\d*?(\d+([\,]\d{1,2})?|[\,]\d{1,2})\s*$/;

    var regExpAmount = new RegExp(regExpStr);

    // Valida o valor apenas se nao estiver vazio
    if (value == '')
        return true;
    else {
        var isValid = regExpAmount.test(value);

        if (isValid) {
            var valAux = value;//.replace(',', '.');
            if (valAux.split(decimalSeparator)[0].length <= 11) {
                if (parseFloat(valAux) >= 0)
                    isValid = true;
                else
                    isValid = false;
            }
            else
                isValid = false;
        }
        return isValid;
    }
}

eBankit.Presentation.ValidateCurrencyAmountCultureDecimalPlaces = function (value, decimalPlaces, decimalSeparator) {
    /*    
    ^                   # start of string
    [0-9]+              # Must have one or more numbers
    (                   # begin optional group
    \.              # The decimal point, . must be escaped, or it is treated as "any character"
    [0-9]{0,2}      # one or two numbers
    )?                  # end group, signify it's optional with ?
    $                   # end of string 
    */
    var regExpStr;

    if (decimalPlaces == 3)
        regExpStr = /^\d*?(\d+([\.\,]\d{1,3})?|[\.\,]\d{1,3})\s*$/;
    else if (decimalPlaces == 4)
        regExpStr = /^\d*?(\d+([\.\,]\d{1,4})?|[\.\,]\d{1,4})\s*$/;
    else if (decimalPlaces == 5)
        regExpStr = /^\d*?(\d+([\.\,]\d{1,5})?|[\.\,]\d{1,5})\s*$/;
    else if (decimalPlaces == 6)
        regExpStr = /^\d*?(\d+([\.\,]\d{1,6})?|[\.\,]\d{1,6})\s*$/;
    else if (decimalPlaces == 7)
        regExpStr = /^\d*?(\d+([\.\,]\d{1,7})?|[\.\,]\d{1,7})\s*$/;
    else if (decimalPlaces == 1)
        regExpStr = /^\d*?(\d+([\.\,]\d{1,1})?|[\.\,]\d{1,1})\s*$/;
    else if (decimalPlaces == 8)
        regExpStr = /^\d*?(\d+([\.\,]\d{1,8})?|[\.\,]\d{1,8})\s*$/;

    var regExpAmount = new RegExp(regExpStr);

    // Valida o valor apenas se nao estiver vazio
    if (value == '')
        return true;
    else {
        var isValid = regExpAmount.test(value);

        if (isValid) {
            var valAux = value.replace(',', '.');
            if (valAux.split(".")[0].length <= 11) {
                if (parseFloat(valAux) > 0)
                    isValid = true;
                else
                    isValid = false;
            }
            else
                isValid = false;
        }
        return isValid;
    }
}


eBankit.Presentation.ValidateCurrencyAmountDecimalPlaces = function (value, decimalPlaces) {
    /*    
    ^                   # start of string
    [0-9]+              # Must have one or more numbers
    (                   # begin optional group
    \.              # The decimal point, . must be escaped, or it is treated as "any character"
    [0-9]{0,2}      # one or two numbers
    )?                  # end group, signify it's optional with ?
    $                   # end of string 
    */
    var regExpStr;

    if (decimalPlaces == 3)
        regExpStr = /^\d*?(\d+([\.\,]\d{1,3})?|[\.\,]\d{1,3})\s*$/;
    else if (decimalPlaces == 4)
        regExpStr = /^\d*?(\d+([\.\,]\d{1,4})?|[\.\,]\d{1,4})\s*$/;
    else if (decimalPlaces == 5)
        regExpStr = /^\d*?(\d+([\.\,]\d{1,5})?|[\.\,]\d{1,5})\s*$/;
    else if (decimalPlaces == 6)
        regExpStr = /^\d*?(\d+([\.\,]\d{1,6})?|[\.\,]\d{1,6})\s*$/;
    else if (decimalPlaces == 7)
        regExpStr = /^\d*?(\d+([\.\,]\d{1,7})?|[\.\,]\d{1,7})\s*$/;
    else if (decimalPlaces == 1)
        regExpStr = /^\d*?(\d+([\.\,]\d{1,1})?|[\.\,]\d{1,1})\s*$/;
    else if (decimalPlaces == 8)
        regExpStr = /^\d*?(\d+([\.\,]\d{1,8})?|[\.\,]\d{1,8})\s*$/;

    var regExpAmount = new RegExp(regExpStr);

    // Valida o valor apenas se nao estiver vazio
    if (value == '')
        return true;
    else {
        var isValid = regExpAmount.test(value);

        if (isValid) {
            var valAux = value;//.replace(',', '.');
            if (valAux.split(decimalSeparator)[0].length <= 11) {
                if (parseFloat(valAux) > 0)
                    isValid = true;
                else
                    isValid = false;
            }
            else
                isValid = false;
        }
        return isValid;
    }
}

eBankit.Presentation.ValidateCurrencyAmountDecimalPlacesV2 = function (value, decimalPlaces) {
    /*    
    ^                   # start of string
    [0-9]+              # Must have one or more numbers
    (                   # begin optional group
    \.              # The decimal point, . must be escaped, or it is treated as "any character"
    [0-9]{0,2}      # one or two numbers
    )?                  # end group, signify it's optional with ?
    $                   # end of string 
    */
    var regExpAmountAux = new RegExp(/^[0-9]+([\.\,][0-9]*)?$/);
    var aux = regExpAmountAux.test(value);

    if (!aux)
        return true;

    var regExpStr;

    if (decimalPlaces == 2)
        regExpStr = /^[0-9]+([\.\,][0-9]{1,2})?$/;
    else if (decimalPlaces == 3)
        regExpStr = /^[0-9]+([\.\,][0-9]{1,3})?$/;
    else if (decimalPlaces == 4)
        regExpStr = /^[0-9]+([\.\,][0-9]{1,4})?$/;
    else if (decimalPlaces == 5)
        regExpStr = /^[0-9]+([\.\,][0-9]{1,5})?$/;
    else if (decimalPlaces == 6)
        regExpStr = /^[0-9]+([\.\,][0-9]{1,6})?$/;
    else if (decimalPlaces == 7)
        regExpStr = /^[0-9]+([\.\,][0-9]{1,7})?$/;
    else if (decimalPlaces == 1)
        regExpStr = /^[0-9]+([\.\,][0-9]{1,8})?$/;
    else if (decimalPlaces == 8)
        regExpStr = /^[0-9]+([\.\,][0-9]{1,9})?$/;

    var regExpAmount = new RegExp(regExpStr);

    // Valida o valor apenas se nao estiver vazio
    if (value == '')
        return true;
    else {

        return regExpAmount.test(value);
    }
}

eBankit.Presentation.ValidateCurrencyAmountCultureDecimalPlacesAllowZero = function (value, decimalPlaces, decimalSeparator) {
    /*    
    ^                   # start of string
    [0-9]+              # Must have one or more numbers
    (                   # begin optional group
    \.              # The decimal point, . must be escaped, or it is treated as "any character"
    [0-9]{0,2}      # one or two numbers
    )?                  # end group, signify it's optional with ?
    $                   # end of string 
    */
    var regExpStr;


    if (decimalPlaces == 3)
        regExpStr = /^\d*?(\d+([\.\,]\d{1,3})?|[\.\,]\d{1,3})\s*$/;
    else if (decimalPlaces == 4)
        regExpStr = /^\d*?(\d+([\.\,]\d{1,4})?|[\.\,]\d{1,4})\s*$/;
    else if (decimalPlaces == 5)
        regExpStr = /^\d*?(\d+([\.\,]\d{1,5})?|[\.\,]\d{1,5})\s*$/;
    else if (decimalPlaces == 6)
        regExpStr = /^\d*?(\d+([\.\,]\d{1,6})?|[\.\,]\d{1,6})\s*$/;
    else if (decimalPlaces == 7)
        regExpStr = /^\d*?(\d+([\.\,]\d{1,7})?|[\.\,]\d{1,7})\s*$/;
    else if (decimalPlaces == 1)
        regExpStr = /^\d*?(\d+([\.\,]\d{1,1})?|[\.\,]\d{1,1})\s*$/;
    else if (decimalPlaces == 8)
        regExpStr = /^\d*?(\d+([\.\,]\d{1,8})?|[\.\,]\d{1,8})\s*$/;

    var regExpAmount = new RegExp(regExpStr);

    // Valida o valor apenas se nao estiver vazio
    if (value == '')
        return true;
    else {
        var isValid = regExpAmount.test(value);

        if (isValid) {
            var valAux = value;//.replace(',', '.');
            if (valAux.split(decimalSeparator)[0].length <= 11) {
                if (parseFloat(valAux) >= 0)
                    isValid = true;
                else
                    isValid = false;
            }
            else
                isValid = false;
        }
        return isValid;
    }
}

eBankit.Presentation.disableCtrlKeyCombination = function (e) {
    //list all CTRL + key combinations you want to disable
    var forbiddenKeys = new Array('a', 'n', 'c', 'x', 'v', 'j');
    var key;
    var isCtrl;

    if (window.event) {
        key = window.event.keyCode;     //IE
        if (window.event.ctrlKey)
            isCtrl = true;
        else
            isCtrl = false;
    }
    else {
        key = e.which;     //firefox
        if (e.ctrlKey)
            isCtrl = true;
        else
            isCtrl = false;
    }

    //if ctrl is pressed check if other key is in forbidenKeys array
    if (isCtrl) {
        for (i = 0; i < forbiddenKeys.length; i++) {
            //case-insensitive comparation
            if (forbiddenKeys[i].toLowerCase() == String.fromCharCode(key).toLowerCase()) {
                return false;
            }
        }
    }
    return true;
}

eBankit.Presentation.formatNIB = function (nib, s) {
    var o = nib.toString();
    if (!s) { s = '0'; }
    while (o.length < 21) {
        o = s + o;
    }
    var ret = "";
    if (o.length == 21) {
        ret = o.substring(0, 4);
        ret += " " + o.substring(4, 8);
        ret += " " + o.substring(8, 19);
        ret += " " + o.substring(19, 21);
        return ret;
    }
    else {
        return " ";
    }
}

eBankit.Presentation.ValidateNib = function (n) {
    var o = n.toString();
    var returnValue = false;

    if (o.length == 21) {

        var nib1 = o.substring(0, 4);
        var nib2 = o.substring(4, 8);
        var nib3 = o.substring(8, 19);
        var nib4 = o.substring(19, 21);

        var nib = "" + nib1 + nib2 + nib3 + nib4;
        var pesos = new Array(0, 1, 10, 3, 30, 9, 90, 27, 76, 81, 34, 49, 5, 50, 15, 53, 45, 62, 38, 89, 17, 73, 51, 25, 56, 75, 71, 31, 19, 93, 57);
        var longNib = nib.length;

        var p = 0;
        for (var i = longNib; i > 2; i--) {
            p += parseInt(nib.charAt(longNib - i)) * pesos[i];
        }
        var controlCalc = 98 - (p % 97);
        var controlNib = nib.substring(longNib - 2, longNib);

        returnValue = (controlNib == controlCalc);
    }
    return returnValue;

}

eBankit.Presentation.ValidateContrib = function (nif) {
    var c;
    var checkDigit = 0;

    if (nif == "123456789")
        return false;

    //Check if is not null, is numeric and if has 9 numbers
    if (nif != null && eBankit.Presentation.IsNumeric(nif) && nif.length == 9) {
        //Get the first number of NIF
        c = nif.charAt(0);
        //Check firt number is (1, 2, 5, 6, 8 or 9)
        if (c == '1' || c == '2' || c == '5' || c == '6' || c == '8' || c == '9') {
            //Perform CheckDigit calculations
            checkDigit = c * 9;
            var i = 0;
            for (i = 2; i <= 8; i++) {
                checkDigit += nif.charAt(i - 1) * (10 - i);
            }
            checkDigit = 11 - (checkDigit % 11);
            //if checkDigit is higher than ten set it to zero
            if (checkDigit >= 10)
                checkDigit = 0;
            //Compare checkDigit with the last number of NIF
            //If equal the NIF is Valid.
            if (checkDigit == nif.charAt(8))
                return true;
        }
    }
    return false;
}

eBankit.Presentation.ValidateNif = function (ctrl) {
    var num = ctrl;
    var errCode = 0; //Nif OK

    if (ctrl == "123456789")
        return 1;

    var nifLen = num.length;
    var produto = 0;
    var resto = 0;

    //testar o tamnho
    if (nifLen != 9)
        errCode = 1;

    //testar se o nif e valido
    if ((num == "000000000") && errCode == 0)
        errCode = 2;

    //validar a 1ª posicao identificar se o NIF e valido ou não  
    if ((num.charAt(0) == '0' || num.charAt(0) == '3' || num.charAt(0) == '4') && errCode == 0) {

        errCode = 3;
    }
    j = 8;
    for (i = 1; i < 10; i++) {
        produto = produto + num.substring(j, j + 1) * i;
        j--;
    }
    resto = produto % 11;
    if ((resto != 0 && (resto != 1 || num.substring(8, 9) != 0) && errCode == 0))
        errCode = 3;

    return errCode;
}

eBankit.Presentation.IsValidNIF = function (nif) {
    var c;
    var checkDigit = 0;

    if (nif == "123456789")
        return false;

    //Verifica se é nulo, se é numérico e se tem 9 dígitos
    if (nif != null && eBankit.Presentation.IsNumeric(nif) && nif.length == 9) {
        //Obtem o primeiro número do NIF
        c = nif.charAt(0);

        //Verifica se o primeiro número é (1, 2, 5, 6, 8 ou 9)
        if (c == '1' || c == '2' || c == '5' || c == '6' || c == '8' || c == '9') {
            //Calculo do Digito de Controle
            checkDigit = c * 9;
            var i = 0;
            for (i = 2; i <= 8; i++) {
                checkDigit += nif.charAt(i - 1) * (10 - i);
            }
            checkDigit = 11 - (checkDigit % 11);

            //Se o digito de controle é maior que dez, coloca-o a zero
            if (checkDigit >= 10)
                checkDigit = 0;

            //Compara o digito de controle com o último numero do NIF
            //Se igual, o NIF é válido.
            if (checkDigit == nif.charAt(8))
                return true;
        }
    }
    return false;
}

eBankit.Presentation.GetPageCoords = function (element) {
    var coords = { x: 0, y: 0 };
    while (element) {
        coords.x += element.offsetLeft;
        coords.y += element.offsetTop;
        element = element.offsetParent;
    }
    return coords;
}

eBankit.Presentation.GetElementObject = function (elementId) {
    if (document.all)
        return document.all[elementId];
    else if (document.getElementById)
        return document.getElementById(elementId);
    else
        return null;
}


eBankit.Presentation.SelectControl = function (element) {
    //
    var elementControl = $('#' + element.id);
    var parentControl = elementControl.parent();

    // console.info(parentControl);

    $('.select-item').each(function () {
        $(this).removeClass('select-item');
    });

    elementControl.addClass('select-item');
}

eBankit.Presentation.IsMobile = function () {
    var check = false;
    (function (a) { if (/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a) || /1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0, 4))) check = true; })(navigator.userAgent || navigator.vendor || window.opera);
    return check;
}

eBankit.Presentation.SetMobileDatePickerReadOnly = function (elem) {
    if (eBankit.Presentation.IsMobile()) {
        $('#' + elem).prop('readonly', true);
    }
    else {
        $('#' + elem).prop('readonly', false);
    }
}

function FormatAmmount2(amount) {
    var delimiter = "."; // substituir por "," caso seja o delimitador
    amount += '';
    var a = amount.split('.');
    var d;

    if (a.length > 1)
        d = padRight(a[1], 2, '0');
    else
        d = '00';
    var i = parseInt(a[0]);
    var floatReturn;

    if (isNaN(i)) { return ''; }
    var minus = '';
    if (a[0].length > 0 && a[0].charAt(0) == '-') { minus = '-'; }

    i = Math.abs(i);
    var n = new String(i);
    var a = [];
    while (n.length > 3) {
        var nn = n.substr(n.length - 3);
        a.unshift(nn);
        n = n.substr(0, n.length - 3);
    }
    if (n.length > 0) { a.unshift(n); }
    n = a.join(delimiter);
    if (d.length < 1) { amount = n; }
    else { amount = n + ',' + d; }
    amount = minus + amount;
    //floatReturn = parseFloat(amount.replace('.', '').replace(',', '.'));

    return amount;
}

function FormatAmmountCulture(amount, delimiter) {
    amount += '';
    var a = amount.split('.');
    var d;

    if (a.length > 1)
        d = padRight(a[1], 2, '0');
    else
        d = '00';
    var i = parseInt(a[0]);
    var floatReturn;

    if (isNaN(i)) { return ''; }
    var minus = '';
    if (a[0].length > 0 && a[0].charAt(0) == '-') { minus = '-'; }

    i = Math.abs(i);
    var n = new String(i);
    var a = [];
    while (n.length > 3) {
        var nn = n.substr(n.length - 3);
        a.unshift(nn);
        n = n.substr(0, n.length - 3);
    }
    if (n.length > 0) { a.unshift(n); }
    n = a.join(delimiter);
    if (d.length < 1) { amount = n; }
    else { amount = n + delimiter + d; }
    amount = minus + amount;
    //floatReturn = parseFloat(amount.replace('.', '').replace(',', '.'));

    return amount;
}

function FormatAmmount(obj, amount) {
    var delimiter = "."; // substituir por "," caso seja o delimitador

    amount += '';
    var a = amount.split('.');
    //COMEÇAR AKI
    var d;
    if (a.length > 1)
        d = a[1];
    else
        d = '00';
    var i = parseInt(a[0]);
    var floatReturn;

    if (isNaN(i)) { return ''; }
    var minus = '';

    if (a[0].length > 0 && a[0].charAt(0) == '-') { minus = '-'; }

    i = Math.abs(i);
    var n = new String(i);
    var a = [];
    while (n.length > 3) {
        var nn = n.substr(n.length - 3);
        a.unshift(nn);
        n = n.substr(0, n.length - 3);
    }
    if (n.length > 0) { a.unshift(n); }
    n = a.join(delimiter);
    if (d.length < 1) { amount = n; }
    else { amount = n + ',' + d; }
    amount = minus + amount;
    //floatReturn = parseFloat(amount.replace('.', '').replace(',', '.'));

    obj.value = amount;
    //return amount;
}

function padLeft(text, totalLength, character) {

    var input = new String(text);
    var i;
    var temp = new String();

    for (i = input.length; i < totalLength; i++)
        temp += character;

    return (temp + input);

}

function padRight(text, totalLength, character) {

    var input = new String(text);
    var i;
    var temp = new String();

    for (i = input.length; i < totalLength; i++)
        temp += character;

    return (input + temp);

}

eBankit.Presentation.EnterPress = function (e) {
    if (e.keyCode === 13) {
        var bt = document.getElementById("MainContent_TransactionMainContent_txpTransactions_btnNextFlowItem");
        var btnCancel = document.getElementById("MainContent_TransactionMainContent_txpTransactions_btnCancelFlowItem");
        if (btnCancel !== null && btnCancel === document.activeElement) {
            btnCancel.click();
        }
        else if (bt !== null && bt === document.activeElement)
            bt.click();
        return false;
    }
};

function parseFormattedNumber(value) {
    var regex = new RegExp("^(?![0-9])");
    if (regex.test(value) == true) {
        value = value.substring(1);
        value = value.toString().split('.').join('').split(',').join('.') ///#####################################acrescentei isto ver bem

        if (value.indexOf(',') !== -1 && value.indexOf('.') !== -1) {
            value = value.replace('.', '');
        }
        return parseFloat(value.replace(' ', '').replace(',', '.'));
    }
    else {
        if (value.indexOf(',') !== -1 && value.indexOf('.') !== -1) {
            value = value.replace('.', '');
        }
        return parseFloat(value.replace(' ', '').replace(',', '.'));
    }
}

function parseFormattedNumberWithSymbol(value, currencySymbol) {

    value = value.replace(currencySymbol, "")
    value = value.toString().split('.').join('').split(',').join('.')
    if (value.indexOf(',') !== -1 && value.indexOf('.') !== -1) {
        value = value.replace('.', '');
    }
    return parseFloat(value.replace(' ', '').replace(',', '.'));

}

function parseCurrency(value, decimalSeparator, groupSeparator) {
    var regex = new RegExp("^(?![0-9])");
    if (regex.test(value) == true) {
        value = value.substring(1);
        return parseFloat(value.toString().split(groupSeparator).join('').split(decimalSeparator).join('.'));
    }
    else {
        return parseFloat(value.toString().split(groupSeparator).join('').split(decimalSeparator).join('.'));
    }

}

function parseCurrencyWithSymbol(value, decimalSeparator, groupSeparator, currencySymbol) {

    value = value.replace(currencySymbol, "");
    return parseFloat(value.toString().split(groupSeparator).join('').split(decimalSeparator).join('.'));


}


var __originaldoPostBack = __doPostBack;
$(document).ready(function () {
    if (eBankit.browsers.isSafari) {
        eBankit.browsers.loadSafariDefaultEvents();
        __doPostBack = eBankit.browsers.__doPostBackSafari;
    }
});

var eBankit = eBankit || {};
eBankit.document = {
    location: {
        set href(url) {
            if (eBankit.browsers.isSafari) {
                if (!eBankit.browsers.isBodyBlocked()) {
                    eBankit.Presentation.BlockPageForNormalRequest();
                }
                setTimeout(function () {
                    document.location.href = url;
                }, eBankit.browsers.timeBeforeAction);
            }
            else {
                document.location.href = url;
            }
        }
    }
};
eBankit.window = {
    top: {
        document: {
            location: {
                set href(url) {
                    if (eBankit.browsers.isSafari) {
                        if (!eBankit.browsers.isBodyBlocked()) {
                            eBankit.Presentation.BlockPageForNormalRequest();
                        }
                        setTimeout(function () {
                            window.top.document.location.href = url;
                        }, eBankit.browsers.timeBeforeAction);
                    }
                    else {
                        window.top.document.location.href = url;
                    }
                }
            }
        }
    }
}
eBankit.browsers = {
    timeBeforeAction: 500,
    isSafari: /^((?!chrome|android).)*safari/i.test(navigator.userAgent),
    isBodyBlocked: function () { return $('.blockUI.blockOverlay:visible').length > 0; },
    loadSafariDefaultEvents: function () {
        $("input[type=submit]").on('click', function () {
            $(this).removeAttr("clicked");
            $(this).attr("clicked", "true");
        });
        $(document).on('submit', 'form', function (e) {
            var itemClicked = $("input[type=submit][clicked=true]");
            if (!itemClicked.data("has-animation") === true) {
                if (!eBankit.browsers.isBodyBlocked()) {
                    eBankit.Presentation.BlockPageForNormalRequest();
                }
                setTimeout(function (elem) {
                    elem.data("has-animation", true);
                    elem.trigger('click');
                }, eBankit.browsers.timeBeforeAction, itemClicked);
                return false;
            }
            return true;
        });

        $(document).on('click', 'a', function (e) {
            var anchor = $(this);
            var href = anchor.attr("href");
            if (!e.isDefaultPrevented() && href !== undefined && href !== null && !href.endsWith('#') && !href.includes("javascript")) {

                if (anchor.data("has-animation") === true) {
                    anchor.removeData("has-animation");
                    window.location.href = this.href;
                }
                else {
                    e.preventDefault();
                    var isMailtoInSafari = href.includes("mailto:") && eBankit.browsers.isSafari;
                    if (!eBankit.browsers.isBodyBlocked() && !isMailtoInSafari) {
                        eBankit.Presentation.BlockPageForNormalRequest();
                    }
                    setTimeout(function () {
                        anchor.data("has-animation", true);
                        anchor.trigger("click");
                    }, eBankit.browsers.timeBeforeAction);
                }
            }
        });
    },
    __doPostBackSafari: function (eventTarget, eventArgument) {
        if (!eBankit.browsers.isBodyBlocked()) {
            eBankit.Presentation.BlockPageForNormalRequest();
        }
        setTimeout(function () {
            __originaldoPostBack(eventTarget, eventArgument);
        }, eBankit.browsers.timeBeforeAction);

    }
}
