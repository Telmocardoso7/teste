eBankit.Presentation.TRX00220 = {};
var $moreInfos = $(".moreinfo");
var $labels = $(".MoreInfoText");

ExpandMoreInformation = function (object, productId) {
    var $moreInfo = $('.moreinfo[data-id=' + productId + ']'); //Get the element with the info
    var $label = $(object).find(".MoreInfoText"); //Get the current icon
    var destinationPadding = parseInt($moreInfo.parent().children('.lineContainer').css('padding-top')) + 20;

    $moreInfos.each(function () {
        destinationPadding = parseInt($(this).parent().children('.lineContainer').css('padding-top')) + 20;
        $(this).parent().children('.lineContainer').animate({
            paddingBottom: destinationPadding + 'px'
        }, 'fast');
    });

    $moreInfos.not($moreInfo).stop(true, true).slideUp(); // toggle others

    if ($moreInfo.css('display') == 'none') {
        destinationPadding = 0;
    }
    
    if (destinationPadding == 0) {
            $moreInfo.parent().children('.lineContainer').animate({paddingBottom: destinationPadding + 'px'}, 'fast',function () {
                $moreInfo.stop(true, true).slideToggle('fast', function () {//toggle slide


                    if (object.innerText == top.eBankit.Presentation.GetResource("LessInfo") || $(object).hasClass("opened")) {
                        if (!$(object).hasClass("divMoreInformationTablet")) {
                            object.innerText = top.eBankit.Presentation.GetResource("MoreInfo");
                        }

                        $(".opened").removeClass("opened");
                    } else {
                        if (!$(object).hasClass("divMoreInformationTablet")) {
                            object.innerText = top.eBankit.Presentation.GetResource("LessInfo");
                            $(".opened").html(top.eBankit.Presentation.GetResource("MoreInfo"));
                        }

                        $(".opened").removeClass("opened");
                        $(object).addClass("opened");
                    }

                });
            });
        } else {
            $moreInfo.stop(true, true).slideToggle('fast', function () {//toggle slide


                if (object.innerText == top.eBankit.Presentation.GetResource("LessInfo") || $(object).hasClass("opened")) {
                    if (!$(object).hasClass("divMoreInformationTablet")) {
                        object.innerText = top.eBankit.Presentation.GetResource("MoreInfo");
                    }

                    $(".opened").removeClass("opened");
                } else {
                    if (!$(object).hasClass("divMoreInformationTablet")) {
                        object.innerText = top.eBankit.Presentation.GetResource("LessInfo");
                        $(".opened").html(top.eBankit.Presentation.GetResource("MoreInfo"));
                    }

                    $(".opened").removeClass("opened");
                    $(object).addClass("opened");
                }

            });

            $moreInfo.parent().children('.lineContainer').animate({
                paddingBottom: destinationPadding + 'px'
            }, 'fast');
        }
    };

GoToConstitute = function (productId) {
    eBankit.Presentation.SetBlockPageCommon();
    $('body').block();
    eBankit.document.location.href = '/Security/Transactions/Transactions.aspx?trxid=TRX00221' + projId + '&prdId=' + productId;
};