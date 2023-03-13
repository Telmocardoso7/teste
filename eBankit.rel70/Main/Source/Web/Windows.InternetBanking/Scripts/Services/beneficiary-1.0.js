eBankit.Presentation.Beneficiary = {}
eBankit.Presentation.Beneficiary.BeneficiaryClk = function (input, atype, hasemail, hasphone) {
    //
    var index = 'undefined';
    if (typeof (input) == 'object')
        index = input.data['accountIndex'];
    else
        index = input;

    hdnSelectedPanel.val("benef");
    eBankit.Presentation.Beneficiary.CloseTabOption(false);

    hdnFavoritSelectedIndex.val("");
    hdnOperationSelectedIndex.val("");

    var OldBenIndex = hdnBeneficiarySelectedIndex.val();
    var NewBenIndex = index;
    hdnBeneficiarySelectedIndex.val(index);
    //alert("Index:" + index);
    //alert("OldBenIndex:" + OldBenIndex);

    hdnBeneficiaryAccountType.val(atype);

    if (index != 'undefined') {

        eBankit.Presentation.Beneficiary.SetVals(index);

        if (OldBenIndex != NewBenIndex) {
            if (AutoPostBack_f == 'True') {
                __doPostBack(btnBeneficiarySelectedChanged, '');
            } else
                return false;
        }
        else
            return false;
    }
    else {
        //
    }
}

eBankit.Presentation.Beneficiary.BeneficiaryTabClk = function (input, atype, hasemail, hasphone) {
    //
    var index = 'undefined';
    if (typeof (input) == 'object')
        index = input.data['accountIndex'];
    else
        index = input;

    hdnSelectedPanel.val("benef");
    eBankit.Presentation.Beneficiary.CloseTabOption(false);

    hdnFavoritSelectedIndex.val("");

    var OldBenIndex = hdnBeneficiarySelectedIndex.val();
    var NewBenIndex = index;
    hdnBeneficiarySelectedIndex.val(index);
    //alert("Index:" + index);
    //alert("OldBenIndex:" + OldBenIndex);

    hdnBeneficiaryAccountType.val(atype);
    hdnHasNotifyEmail.val(hasemail);
    hdnHasNotifyPhone.val(hasphone);

    if (index != 'undefined') {

        eBankit.Presentation.Beneficiary.SetVals(index);

        if (OldBenIndex != NewBenIndex) {
            if (AutoPostBack_f == 'True') {
                __doPostBack(btnBeneficiarySelectedChanged, '');
            } else
                return false;
        }
        else
            return false;
    }
    else {
        //
    }
}

eBankit.Presentation.Beneficiary.BeneficiaryLandingClk = function (id) {
    //
    eBankit.document.location.href = eBankit.Presentation.ResolveUrl('~/Security/Transactions/Transactions.aspx?trxid=TRX00121' + projId + '&bid=' + id);
}

eBankit.Presentation.Beneficiary.RemoveSelectedBenefIndex = function () {
    hdnBeneficiarySelectedIndex.val("");
    hdnBeneficiaryAccountType.val("");
    hdnHasNotifyEmail.val("");
    hdnHasNotifyPhone.val("");
    _hidSelectedBeneficiary.val("");
    hdnAlreadyBenef.val("");
}

eBankit.Presentation.Beneficiary.FavoritClk = function (input, atype) {
    //
    var index = 'undefined';
    if (typeof (input) == 'object')
        index = input.data['accountIndex'];
    else
        index = input;

    hdnSelectedPanel.val("favorit");
    eBankit.Presentation.Beneficiary.CloseTabOption(false);

    hdnBeneficiarySelectedIndex.val("");
    hdnOperationSelectedIndex.val("");

    hdnFavoritSelectedIndex.val(index);

    hdnBeneficiaryAccountType.val(atype);

    if (index != 'undefined') {

        eBankit.Presentation.Beneficiary.SetFavVals(index);

        if (AutoPostBack_f == 'True') {
            __doPostBack(btnFavoritSelectedChanged, '');
        } else
            return false;
    }
    else {
        //
    }
}

eBankit.Presentation.Beneficiary.FavoritTabClk = function (input, atype) {
    //
    var index = 'undefined';
    if (typeof (input) == 'object')
        index = input.data['accountIndex'];
    else
        index = input;

    hdnSelectedPanel.val("favorit");
    //eBankit.Presentation.Beneficiary.CloseTabOption(false);

    hdnBeneficiarySelectedIndex.val("");

    hdnFavoritSelectedIndex.val(index);

    hdnBeneficiaryAccountType.val(atype);

    if (index != 'undefined') {

        eBankit.Presentation.Beneficiary.SetFavVals(index);

        if (AutoPostBack_f == 'True') {
            __doPostBack(btnFavoritSelectedChanged, '');
        } else
            return false;
    }
    else {
        //
    }
}

eBankit.Presentation.Beneficiary.FavoritLandingClk = function (id, type, transactionsList) {
    //
    var parsed = JSON.parse(JSON.stringify(transactionsList));
    for (var i = 0; i < parsed.length; i++) {
        switch (type) {
            case parsed[i].Item1:
                eBankit.document.location.href = eBankit.Presentation.ResolveUrl('~/Security/Transactions/Transactions.aspx?trxid=' + parsed[i].Item2 + projId + '&favid=' + id);
                break;
            default:
                break;
        }
    }
}

eBankit.Presentation.Beneficiary.OperationClk = function (input) {
    //
    var index = 'undefined';
    if (typeof (input) == 'object')
        index = input.data['accountIndex'];
    else
        index = input;

    hdnSelectedPanel.val("operations");
    eBankit.Presentation.Beneficiary.CloseTabOption(false);

    hdnBeneficiarySelectedIndex.val("");
    hdnFavoritSelectedIndex.val("");

    var OldOperIndex = hdnOperationSelectedIndex.val();
    var NewOperIndex = index;
    hdnOperationSelectedIndex.val(index);

    if (index != 'undefined') {

        eBankit.Presentation.Beneficiary.SetOperVals(index);

        if (OldOperIndex != NewOperIndex) {
            if (AutoPostBack_f == 'True') {
                __doPostBack(btnOperationSelectedChanged, '');
            } else
                return false;
        }
        else
            return false;
    }
    else {
        //
    }
}

eBankit.Presentation.Beneficiary.ChangeTabTitle = function (id) {
    var iconArrow = $("#iconArrow");
    //iconArrow.show();
    iconArrow.addClass("icon-arrow-up");
    iconArrow.removeClass("icon-arrow-down");

    if (id == "benef") {
        //hTabTitle.text(chooseBeneficiary);
        //$(".icon-me").addClass("")
    }
    //else if (id == "favorit") {
    //    hTabTitle.text(chooseFavorit);
    //}
    //else if (id == "operations") {
    //    hTabTitle.text(chooseOperation);
    //}
}

eBankit.Presentation.Beneficiary.ChangeTabTitle_v2 = function (id) {
    var iconArrow = $("#iconArrow");

    var operationPanel = $("#operations");


    var favoritPanel = $("#favorit");
    var liHtmlFavo = $("#divFavorit a");
    var liHtml = $("#divOperation a");

    if (iconArrow.attr("class") == "icon-arrow-down") {
        iconArrow.removeClass("icon-arrow-down");
        iconArrow.addClass("icon-arrow-up");
        if (id == 'operations') {

            var operationPanel = $("#operations");

            operationPanel.addClass("active");
            operationPanel.addClass("in");

            var liHtml = $("#divOperation a");
            liHtml.addClass("activePane");

        }
        else if (id == 'favorit') {

            var favoritPanel = $("#favorit");
            favoritPanel.addClass("active");
            favoritPanel.addClass("in");
            var liHtmlFavo = $("#divFavorit a");
            liHtmlFavo.addClass("activePane");

        }
    } else {

        if (id == 'operations') {
            if (liHtml.hasClass("activePane")) {
                liHtml.removeClass("activePane");

                operationPanel.removeClass("active");
                operationPanel.removeClass("in");

                iconArrow.removeClass("icon-arrow-up");
                iconArrow.addClass("icon-arrow-down");
            } else if (liHtmlFavo.hasClass("activePane")) {
                favoritPanel.removeClass("active");
                favoritPanel.removeClass("in");
                liHtmlFavo.removeClass("activePane");
                operationPanel.addClass("active");
                operationPanel.addClass("in");

                var liHtml = $("#divOperation a");
                liHtml.addClass("activePane");

            }


        } else if (id == 'favorit') {
            if (liHtml.hasClass("activePane")) {
                operationPanel.removeClass("active");
                operationPanel.removeClass("in");

                liHtml.removeClass("activePane");
                favoritPanel.addClass("active");
                favoritPanel.addClass("in");

                var liHtml = $("#divOperation a");
                liHtmlFavo.addClass("activePane");

            } else if (liHtmlFavo.hasClass("activePane")) {

                liHtmlFavo.removeClass("activePane");
                favoritPanel.removeClass("active");
                favoritPanel.removeClass("in");

                iconArrow.removeClass("icon-arrow-up");
                iconArrow.addClass("icon-arrow-down");
            }


        }
    }
}

eBankit.Presentation.Beneficiary.ChangeTabTitle_v3 = function (id) {
    var iconArrow = $("#iconArrow");

    var benefPanel = $("#benef");


    var favoritPanel = $("#favorit");
    var liHtmlFavo = $("#divFavorit a");
    var liHtml = $("#divBeneficiares a");

    if (iconArrow.attr("class") == "icon-arrow-down") {
        iconArrow.removeClass("icon-arrow-down");
        iconArrow.addClass("icon-arrow-up");
        if (id == 'benef') {

            var benefPanel = $("#benef");

            benefPanel.addClass("active");
            benefPanel.addClass("in");

            var liHtml = $("#divBeneficiares a");
            liHtml.addClass("activePane");

        }
        else if (id == 'favorit') {

            var favoritPanel = $("#favorit");
            favoritPanel.addClass("active");
            favoritPanel.addClass("in");
            var liHtmlFavo = $("#divFavorit a");
            liHtmlFavo.addClass("activePane");

        }
    } else {

        if (id == 'benef') {
            if (liHtml.hasClass("activePane")) {
                liHtml.removeClass("activePane");

                benefPanel.removeClass("active");
                benefPanel.removeClass("in");

                iconArrow.removeClass("icon-arrow-up");
                iconArrow.addClass("icon-arrow-down");
            } else if (liHtmlFavo.hasClass("activePane")) {
                favoritPanel.removeClass("active");
                favoritPanel.removeClass("in");
                liHtmlFavo.removeClass("activePane");
                benefPanel.addClass("active");
                benefPanel.addClass("in");

                var liHtml = $("#divBeneficiares a");
                liHtml.addClass("activePane");

            }


        } else if (id == 'favorit') {
            if (liHtml.hasClass("activePane")) {
                benefPanel.removeClass("active");
                benefPanel.removeClass("in");

                liHtml.removeClass("activePane");
                favoritPanel.addClass("active");
                favoritPanel.addClass("in");

                liHtmlFavo.addClass("activePane");

            } else if (liHtmlFavo.hasClass("activePane")) {

                liHtmlFavo.removeClass("activePane");
                favoritPanel.removeClass("active");
                favoritPanel.removeClass("in");

                iconArrow.removeClass("icon-arrow-up");
                iconArrow.addClass("icon-arrow-down");
            }


        }
    }
}

eBankit.Presentation.Beneficiary.CloseTabOption = function (allowTab) {
    var iconArrow = $("#iconArrow");

    //hTabTitle.text('');
    //iconArrow.hide();

    if (iconArrow.attr("class") == "icon-arrow-down") {
        iconArrow.removeClass("icon-arrow-down");
        iconArrow.addClass("icon-arrow-up");
    }
    else {
        iconArrow.removeClass("icon-arrow-up");
        iconArrow.addClass("icon-arrow-down");
    }

    $(".tab-pane-benefs").each(function () {
        $(this).removeClass("active");
        $(this).removeClass("in");
    });

    $(".tab-pane-favs").each(function () {
        $(this).removeClass("active");
        $(this).removeClass("in");
    });

    if (!allowTab) {
        $(".nav-benefs li").each(function () {
            $(this).removeClass("active");
        });
        $(".nav-favs li").each(function () {
            $(this).removeClass("active");
        });
    }

    if (iconArrow.attr("class") == "icon-arrow-up") {
        var selPanel = hdnSelectedPanel.val();

        if (selPanel == '' || selPanel == 'benef') {
            liBeneficiaries.addClass("active");
            var benefPanel = $("#benef");
            benefPanel.addClass("active");
            benefPanel.addClass("in");
            benefPanel.removeClass("activePane");
            eBankit.Presentation.Beneficiary.ChangeTabTitle('benef');
        }
        else if (selPanel == 'favorit') {
            liFavorits.addClass("active");
            var favoritPanel = $("#favorit");
            favoritPanel.addClass("active");
            favoritPanel.addClass("in");
            favoritPanel.removeClass("activePane");
            eBankit.Presentation.Beneficiary.ChangeTabTitle('favorit');
        }
        else if (selPanel == 'operations') {
            liOperations.addClass("active");
            var operationPanel = $("#operations");
            operationPanel.addClass("active");
            operationPanel.addClass("in");
            operationPanel.removeClass("activePane");
            eBankit.Presentation.Beneficiary.ChangeTabTitle('operations');
        }
    }
}


eBankit.Presentation.Beneficiary.CloseTabOptionV2 = function (allowTab) {
    var iconArrow = $("#iconArrow");

    //hTabTitle.text('');
    //iconArrow.hide();

    if (iconArrow.attr("class") == "icon-arrow-down") {
        iconArrow.removeClass("icon-arrow-down");
        iconArrow.addClass("icon-arrow-up");
    }
    else {
        iconArrow.removeClass("icon-arrow-up");
        iconArrow.addClass("icon-arrow-down");
    }

    $(".tab-pane-benefs").each(function () {
        $(this).removeClass("active");
        $(this).removeClass("in");
    });

    $(".tab-pane-favs").each(function () {
        $(this).removeClass("active");
        $(this).removeClass("in");
    });

    if (!allowTab) {
        $(".nav-tabs-selectors li").each(function () {
            $(this).removeClass("active");
        });
    }

    if (iconArrow.attr("class") == "icon-arrow-up") {
        var selPanel = hdnSelectedPanel.val();
        if (selPanel == '' || selPanel == 'operations') {
            var liHtml = $("#divOperation a");
            liHtml.addClass("activePane")
            liOperations.addClass("active");
            var operationPanel = $("#operations");
            operationPanel.addClass("active");
            operationPanel.addClass("in");
            var iconArrow = $("#iconArrow");
            //iconArrow.show();
            iconArrow.addClass("icon-arrow-up");
            iconArrow.removeClass("icon-arrow-down");

        }
        else if (selPanel == 'favorit') {
            liFavorits.addClass("active");
            var favoritPanel = $("#favorit");
            favoritPanel.addClass("active");
            favoritPanel.addClass("in");
            var iconArrow = $("#iconArrow");
            //iconArrow.show();
            iconArrow.addClass("icon-arrow-up");
            iconArrow.removeClass("icon-arrow-down");

        }
    } else {
        var liHtmlFavo = $("#divFavorit a");
        var liHtml = $("#divOperation a");
        liHtmlFavo.removeClass("activePane");
        liHtml.removeClass("activePane");
        var favoritPanel = $("#favorit");
        favoritPanel.removeClass("active");
        favoritPanel.removeClass("in");
        var operationPanel = $("#operations");
        operationPanel.removeClass("active");
        operationPanel.removeClass("in");
    }
}

eBankit.Presentation.Beneficiary.CloseTabOptionV3 = function (allowTab) {
    var iconArrow = $("#iconArrow");

    //hTabTitle.text('');
    //iconArrow.hide();

    if (iconArrow.attr("class") == "icon-arrow-down") {
        iconArrow.removeClass("icon-arrow-down");
        iconArrow.addClass("icon-arrow-up");
    }
    else {
        iconArrow.removeClass("icon-arrow-up");
        iconArrow.addClass("icon-arrow-down");
    }

    $(".tab-pane-benefs").each(function () {
        $(this).removeClass("active");
        $(this).removeClass("in");
    });

    $(".tab-pane-favs").each(function () {
        $(this).removeClass("active");
        $(this).removeClass("in");
    });

    if (!allowTab) {
        $(".nav-benefs li").each(function () {
            $(this).removeClass("active");
        });
        $(".nav-favs li").each(function () {
            $(this).removeClass("active");
        });

    }

    if (iconArrow.attr("class") == "icon-arrow-up") {
        var selPanel = hdnSelectedPanel.val();
        if (selPanel == '' || selPanel == 'benef') {
            var liHtml = $("#divBeneficiares a");
            liHtml.addClass("activePane")
            liBeneficiaries.addClass("active");
            var benefPanel = $("#benef");
            benefPanel.addClass("active");
            benefPanel.addClass("in");
            var iconArrow = $("#iconArrow");
            //iconArrow.show();
            iconArrow.addClass("icon-arrow-up");
            iconArrow.removeClass("icon-arrow-down");

        }
        else if (selPanel == 'favorit') {
            liFavorits.addClass("active");
            var favoritPanel = $("#favorit");
            favoritPanel.addClass("active");
            favoritPanel.addClass("in");
            var iconArrow = $("#iconArrow");
            //iconArrow.show();
            iconArrow.addClass("icon-arrow-up");
            iconArrow.removeClass("icon-arrow-down");

        }
    } else {
        var liHtmlFavo = $("#divFavorit a");
        var liHtml = $("#divBeneficiares a");
        liHtmlFavo.removeClass("activePane");
        liHtml.removeClass("activePane");
        var favoritPanel = $("#favorit");
        favoritPanel.removeClass("active");
        favoritPanel.removeClass("in");
        var benefPanel = $("#benef");
        benefPanel.removeClass("active");
        benefPanel.removeClass("in");
    }
}

eBankit.Presentation.Beneficiary.CloseTabOptionV4 = function (allowTab) {
    var iconArrow = $("#iconArrow");

    if (iconArrow.attr("class") == "icon-arrow-down") {
        iconArrow.removeClass("icon-arrow-down");
        iconArrow.addClass("icon-arrow-up");
    }
    else {
        iconArrow.removeClass("icon-arrow-up");
        iconArrow.addClass("icon-arrow-down");
    }

    $(".tab-pane-benefs").each(function () {
        $(this).removeClass("active");
        $(this).removeClass("in");
    });

    $(".tab-pane-favs").each(function () {
        $(this).removeClass("active");
        $(this).removeClass("in");
    });

    if (!allowTab) {
        $(".nav-tabs-selectors li").each(function () {
            $(this).removeClass("active");
        });
    }

    if (iconArrow.attr("class") == "icon-arrow-up") {
        var selPanel = hdnSelectedPanel.val();
        if (selPanel == 'favorit' || selPanel == '') {
            liFavorits.addClass("active");
            liFavorits.addClass("activePane");
            var favoritPanel = $("#favorit");
            favoritPanel.addClass("active");
            favoritPanel.addClass("in");
            var iconArrow = $("#iconArrow");
            //iconArrow.show();
            iconArrow.addClass("icon-arrow-up");
            iconArrow.removeClass("icon-arrow-down");

        }
    } else {
        var liHtmlFavo = $("#divFavorit a");
        liFavorits.removeClass("activePane");
        liHtmlFavo.removeClass("activePane");
        var favoritPanel = $("#favorit");
        favoritPanel.removeClass("active");
        favoritPanel.removeClass("in");
    }
}


eBankit.Presentation.Beneficiary.SetVals = function (index) {
    //var benArray = JSON.parse(_hidBeneficiaryArray.val());
    //var ben = benArray[index];
    _hidSelectedBeneficiary.val(index);
    // console.info(_hidSelectedBeneficiary.val());
}

eBankit.Presentation.Beneficiary.SetFavVals = function (index) {
    //var favArray = JSON.parse(_hidFavoritArray.val());
    //var fav = favArray[index];
    //_hidSelectedFavorit.val(JSON.stringify(fav));
    _hidSelectedFavorit.val(index);
    // console.info(_hidSelectedFavorit.val());
}

eBankit.Presentation.Beneficiary.SetOperVals = function (index) {
    var operArray = JSON.parse(_hidOperationArray.val());
    var oper = operArray[index];
    _hidSelectedOperation.val(JSON.stringify(oper));
    // console.info(_hidSelectedOperation.val());
}







$(document).ready(function () {
    //
    var iconArrow = $("#iconArrow");
    var benef = $("#benef");
    var favorit = $("#favorit");
    var operations = $("#operations");
    var panelIdToShow = hdnSelectedPanel.val();

    hdnSelectedPanel.val(panelIdToShow);

    if (panelIdToShow == "benef") {
        benef.addClass("active");
        benef.addClass("in");
        favorit.removeClass("active");
        favorit.removeClass("in");
        operations.removeClass("active");
        operations.removeClass("in");
    }
    else if (panelIdToShow == "favorit") {
        favorit.addClass("active");
        favorit.addClass("in");
        benef.removeClass("active");
        benef.removeClass("in");
        operations.removeClass("active");
        operations.removeClass("in");
    }
    else if (panelIdToShow == "favorit") {
        operations.addClass("active");
        operations.addClass("in");
        favorit.removeClass("active");
        favorit.removeClass("in");
        operations.removeClass("active");
        operations.removeClass("in");
    }
    else {
        //iconArrow.hide();
        iconArrow.removeClass("icon-arrow-up");
        iconArrow.addClass("icon-arrow-down");
    }
});




