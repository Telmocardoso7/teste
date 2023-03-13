var eBankit = eBankit || {};
eBankit.Onboarding = eBankit.Onboarding || {};

if (eBankit.Onboarding.Consent == undefined) {
    eBankit.Onboarding.Consent = (function () {
        //css constants
        var itemClass = ".consent-item";
        var nextTriggerClass = ".btn-consent-next";
        var acceptClass = ".btn-consent-accept";
        var rejectClass = ".btn-consent-reject";
        var triggerClass = ".btn-consent-trigger";
        var consentListInputId = "ConsentData";
        var orchestratorContainerClass = ".orchestrator-container";

        // logic values
        var currentIndex = 0;
        var currentData = [];
        var totalItems = 0;

        var init = function () {
            currentIndex = 0;
            totalItems = $(itemClass);

            loadNextItem();

            $(nextTriggerClass + acceptClass).on("click", function (e) {
                gotoNext(e, true);
            });

            $(nextTriggerClass + rejectClass).on("click", function (e) {
                gotoNext(e, false);
            });
        };

        var gotoNext = function (event, answer) {
            event.preventDefault();

            var container = $(event.target).closest(itemClass);
            saveItem(container, answer);

            if (currentIndex >= totalItems.length) {
                $('input[id$="' + consentListInputId + '"]').val(JSON.stringify(currentData));
                var trigger = $(triggerClass)[0];
                if (trigger != undefined) { trigger.click(); }
            } else {
                loadNextItem();
            }
        }

        var loadNextItem = function () {
            if (currentIndex - 1 >= 0) { hideItem(currentIndex - 1); }

            showItem(currentIndex);
            currentIndex++;
        };

        var showItem = function (index) {
            var item = totalItems.eq(index);
            if (item != undefined) {
                item.show();
                goTo(item);
            }
        };

        function goTo(elem) {
            $(orchestratorContainerClass).scrollTop($(elem));
        }

        var hideItem = function (index) {
            var item = totalItems.eq(index);
            if (item != undefined) { item.hide(); }
        };

        var saveItem = function (container, answerValue) {
            var consentId = container.data("consent-id");
            var versionId = container.data("consent-version");

            currentData.push({
                ConsentId: consentId,
                Accepted: answerValue,
                VersionId: versionId
            });
        };

        return {
            LoadNextItem: loadNextItem,
            SaveItem: saveItem,
            Init: init
        };
    }());

    $(document).ready(function () {
        eBankit.Onboarding.Consent.Init();

        $("input[id*='RejectBtn']").on('keydown', function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                e.currentTarget.click();
            }
        });
        $("input[id*='AcceptBtn']").on('keydown', function (e) {
            if (e.keyCode === 13) {
                e.preventDefault();
                e.currentTarget.click();
            }
        });

        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(eBankit.Onboarding.Consent.Init);
    });
}

