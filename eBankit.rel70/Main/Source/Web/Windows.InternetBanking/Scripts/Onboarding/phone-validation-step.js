var eBankit = eBankit || {};
eBankit.Onboarding = eBankit.Onboarding || {};
if (eBankit.Onboarding.PhoneValidationStep == undefined) {
    eBankit.Onboarding.PhoneValidationStep = (function () {

        function Init() {

            Fingerprint2.get(
                {
                    preprocessor: function (key, value) {
                        if (key == "userAgent") {
                            var parser = new UAParser(value);
                            var userAgentMinusVersion = ((typeof parser.getOS().name === "undefined") ? "" : parser.getOS().name) +
                                ((typeof parser.getOS().version === "undefined") ? "" : parser.getOS().version) + ' ' +
                                ((typeof parser.getBrowser().name === "undefined") ? "" : parser.getBrowser().name) +
                                ((typeof parser.getCPU().architecture === "undefined") ? "" : parser.getCPU().architecture) + ' ' +
                                ((typeof parser.getEngine().name === "undefined") ? "" : parser.getEngine().name) + ' ' +
                                ((typeof parser.getDevice().name === "undefined") ? "" : parser.getDevice().name) + ' ' +
                                ((typeof parser.getDevice().version === "undefined") ? "" : parser.getDevice().version);

                            $('#hdnOperationSystem').val(((typeof parser.getOS().name === "undefined") ? "" : parser.getOS().name));
                            $('#hdnBrowserName').val(((typeof parser.getBrowser().name === "undefined") ? "" : parser.getBrowser().name) + ((typeof parser.getBrowser().version === "undefined") ? "" : '/' + parser.getBrowser().version));
                            userAgentMinusVersion = userAgentMinusVersion.trimStart().trimEnd();

                            return userAgentMinusVersion;
                        }

                        if (key == "openDatabase") {
                            return '';
                        }

                        return value;
                    },
                    excludes: {
                        webdriver: true,
                        language: true,
                        colorDepth: true,
                        deviceMemory: true,
                        hardwareConcurrency: true,
                        screenResolution: true,
                        availableScreenResolution: true,
                        sessionStorage: true,
                        localStorage: true,
                        indexedDb: true,
                        addBehavior: true,
                        cpuClass: true,
                        plugins: true,
                        canvas: true,
                        adBlock: true,
                        hasLiedLanguages: true,
                        hasLiedResolution: true,
                        hasLiedOs: true,
                        hasLiedBrowser: true,
                        touchSupport: true,
                        fonts: true,
                        audio: true,
                        pixelRatio: true,
                        doNotTrack: true,
                        fontsFlash: true,
                        enumerateDevices: true
                    }
                },
                function (components) {
                    var murmur = Fingerprint2.x64hash128(components.map(function (pair) { return pair.value }).join(), 31);
                    $('#hdnBrowserFingerPrint').val(murmur);
                });

        };

        return {
            Init: Init
        };
    }());

    $(document).ready(function () {
        eBankit.Onboarding.PhoneValidationStep.Init();
    });
}

$(document).ready(function () {
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        eBankit.Onboarding.PhoneValidationStep.Init();
    });
});