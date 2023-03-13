var eBankit = eBankit || {};
eBankit.AccountOpening = eBankit.AccountOpening || {};

$(document).ready(function () {

    if (eBankit.AccountOpening.Conclusion == undefined) {
        eBankit.AccountOpening.Conclusion = (function () {
            var Load = function () {
                var item = $("[id$=aoProofControl] li");
                item.on("click", function (e) {
                    //Associate the click of a proof control to the 
                    ToogleContainer(e);
                });
            };

            var ToogleContainer = function (event) {
                var targetImage = $("#" + event.currentTarget.id).find("img");

                if ($(event.currentTarget.dataset.target).is(":visible")) {
                    //hide target Proof container
                    $(event.currentTarget.dataset.target).hide();

                    //reset the image of the target to its original
                    var baseImg = targetImage[0].dataset.img;
                    targetImage.attr("src", baseImg);

                    //Show the Details Container
                    $("[id$=div_Details]").show();
                } else {
                    //hide all Proof Containers
                    $("[id$=aoProofControl] li").each(
                        function () {
                            var ok = $(this)[0].dataset.target;
                            $(ok).hide();
                        })

                    //reset all buttons to their original
                    $("[id$=aoProofControl] li img").each(
                        function () {
                            var ok = $(this)[0].dataset.img;
                            $(this).attr("src", ok);
                        })

                    //change the target button to be the hover button
                    var activeImg = targetImage[0].dataset.activeimg;
                    targetImage.attr("src", activeImg);

                    //show the container and hide the Details Container
                    $(event.currentTarget.dataset.target).show();
                    $("[id$=div_Details]").hide();
                }
            };

            return {
                Load: Load,
                ToogleContainer: ToogleContainer
            };
        }());
    }

    eBankit.AccountOpening.Conclusion.Load();
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(eBankit.AccountOpening.Conclusion.Load);
});


AccountOpeningConclusionAcessibility = function () {
    $(document).ready(function () {
        $("img[id*=aoProofImage_], span[id*=LblFileDownload_], div[id*=repeaterDiv_]").on('keydown', function (e) {
            if (e.keyCode === 32) {
                e.preventDefault();
                $(this).click();
            }
        });
    });
};