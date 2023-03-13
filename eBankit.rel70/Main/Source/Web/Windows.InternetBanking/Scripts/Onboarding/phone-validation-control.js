var eBankit = eBankit || {};
eBankit.ProductSubscription = eBankit.ProductSubscription || {};

if (eBankit.Onboarding.PhoneValidation == undefined) {
    eBankit.ProductSubscription.PhoneValidation = (function () {
        var captchaSelector = "[id$=div_Captcha]";

        var init = function () {
            $("[id$=LabelEmptyOTP]").hide();
            $("[id$=LabelSmsTokenInvalid]").hide();
        };

        var correctCaptcha = function (response) {
            if (response.length > 0) {
                $("[id$=btnReSendSMSToken]").trigger('click');
            }
            $(captchaSelector).hide();
        };

        var showCaptcha = function (siteKey) {
            $(captchaSelector).show();      
            RenderRecaptcha(siteKey);    
        }

        return {
            Init: init,
            CaptchaSelector: captchaSelector,
            ShowCaptcha: showCaptcha,
            CorrectCaptcha: correctCaptcha
        };
    }());

    var RenderRecaptcha = function (sitekey) {
        if ($(eBankit.ProductSubscription.PhoneValidation.CaptchaSelector).is(":visible")) {
            grecaptcha.render('reCaptchaElement', {
                'sitekey': sitekey,
                'callback': eBankit.ProductSubscription.PhoneValidation.CorrectCaptcha,
                theme: 'light', //light or dark    
                size: 'normal'//normal or compact    
            });
        }
    };

    $(document).ready(function () {
        eBankit.ProductSubscription.PhoneValidation.Init();

        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(eBankit.ProductSubscription.PhoneValidation.Init);
    });
}