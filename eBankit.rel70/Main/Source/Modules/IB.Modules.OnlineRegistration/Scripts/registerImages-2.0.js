eBankit.Presentation.RegisterImages = {};

eBankit.Presentation.RegisterImages.ValidateImages = function (elem) {
    var valImage;
    var valCaption;
    var ret = false;
    this.ValidateCaption();
    if (hdnHasImage.val() == "true") {
        $('.image-container-item').each(function (i, el) {
            var divImageContainer = $(el).find(".image-container-selector");
            if (divImageContainer.hasClass("selected")) {
                valImage = true;
            }
        });
    }
    if (!valImage && hdnHasImage.val() == "true") {
        $('.image-container-item').css("border", "2px solid red");
    }

    if (hdnHasCaption.val() == "true") {
        if (!($.trim($('#securityImagesList :text').val()) == "")) {
            valCaption = true;
            eBankit.Presentation.RemoveValidateMsg($('#securityImagesList :text'), top.eBankit.Presentation.GetResource("ImageCaptionInvalid"));

        } else {
            eBankit.Presentation.InsertValidateMsg($('#securityImagesList :text'), top.eBankit.Presentation.GetResource("ImageCaptionInvalid"));
            valCaption = false;
        }
    }
    if (this.ValidateCaption())
        ret = false;

    if ((!valImage && hdnHasImage.val() == "true") || (!valCaption && hdnHasCaption.val() == "true")) {
        ret = false;
    } else {
        ret = true;
    }

    return ret;
};

function selectImage(divImage) {
    unselectAllImages();
    var divImageContainer = $(divImage).find(".image-container-selector");
    divImageContainer.addClass("selected");
    divImageContainer.find(".image-container-selector-fill").html("&#10004;");
    hdnSecurityImage.val($(divImage).find("img").attr('key'));
    $('.image-container-item').css("border", "2px white");
};
function unselectAllImages() {
    $('.image-container-item').each(function (i, el) {
        var divImageContainer = $(el).find(".image-container-selector");
        divImageContainer.removeClass("selected");
        divImageContainer.find(".image-container-selector-fill").html("");
    });
};

$(document).ready(function () {

    //
});

eBankit.Presentation.RegisterImages.ValidateCaption = function (elem) {
    if (!($.trim($('#securityImagesList :text').val()) == "")) {
        valCaption = true;
        eBankit.Presentation.RemoveValidateMsg($('#securityImagesList :text'), top.eBankit.Presentation.GetResource("ImageCaptionInvalid"));

    } else {
        eBankit.Presentation.InsertValidateMsg($('#securityImagesList :text'), top.eBankit.Presentation.GetResource("ImageCaptionInvalid"));
        valCaption = false;
    }
};

function AddRequiredFieldValidator(controlElement, elem) {

   
};
