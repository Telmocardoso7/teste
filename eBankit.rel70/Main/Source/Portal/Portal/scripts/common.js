
Type.registerNamespace('eBankit.Presentation');

/* LOADING PAGE */
window.onbeforeunload = function () {
    eBankit.Presentation.Loading();
};

window.onload = function () {
    eBankit.Presentation.UnLoading();
}




/* Prevent site access via Iframe */
eBankit.Presentation.PreventFrameAccess = function () {
    if (top != self) {
        top.location = self.location;
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
}


eBankit.Presentation.SetBlockPageCommon = function () {
    $.blockUI.defaults.onUnblock = eBankit.Presentation.ResetCursor;

    $.blockUI.defaults.message = '<div class=\"loader\"></div>';
    $.blockUI.defaults.css = {};
    $.blockUI.defaults.css.backgroundColor = 'transparent';
    $.blockUI.defaults.css.top = (window.pageYOffset + Math.max(0, ($(window).height() - 200) / 2)) + 'px';
    $.blockUI.defaults.themedCSS = {};
    $.blockUI.defaults.themedCSS.width = 100;
    $.blockUI.defaults.themedCSS.height = 64;
    $.blockUI.defaults.centerX = true;
    $.blockUI.defaults.centerY = false;
    $.blockUI.defaults.overlayCSS = {};
    $.blockUI.defaults.overlayCSS.backgroundColor = '#f6f6f6';
    $.blockUI.defaults.overlayCSS.opacity = 0.6;
}


eBankit.Presentation.BlockPageForNormalRequest = function () {
    $.unblockUI();
    eBankit.Presentation.SetBlockPageCommon();
    $('body').block();
}

eBankit.Presentation.SelectorToBlockOnAjaxRequest = null;

eBankit.Presentation.BlockPageForAjaxRequest = function () {
    $.unblockUI();
    eBankit.Presentation.SetBlockPageCommon();

    if (eBankit.Presentation.SelectorToBlockOnAjaxRequest) {
        $.blockUI.defaults.css.top = null;
        $.blockUI.defaults.centerX = true;
        $.blockUI.defaults.centerY = true;
        $(eBankit.Presentation.SelectorToBlockOnAjaxRequest).block();
    }
    else
        $('body').block();
    eBankit.Presentation.SelectorToBlockOnAjaxRequest = null;
}

eBankit.Presentation.BeginRequest = function (sender, args) {
    if (!eBankit.Presentation.NoLoading)
        eBankit.Presentation.BlockPageForAjaxRequest();
}

eBankit.Presentation.EndRequest = function (sender, args) {

    if (args.get_error() != undefined) {
        args.set_errorHandled(true);
    }

    $.unblockUI();
    eBankit.Presentation.NoLoading = false;
    CurrencyTextBoxEvents();

}

eBankit.Presentation.ResetCursor = function () {
    document.body.style.cursor = 'pointer';
}



//Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(eBankit.Presentation.BeginRequest);
//Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.EndRequest);