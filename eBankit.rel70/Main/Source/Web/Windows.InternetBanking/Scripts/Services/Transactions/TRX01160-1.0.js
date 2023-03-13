eBankit.Presentation.TRX01160 = {};

function selectImage(divImage) {
    unselectAllImages();
    var divImageContainer = $(divImage).find(".image-container-selector");
    divImageContainer.addClass("selected");
    divImageContainer.find(".image-container-selector-fill").html("&#10004;");
    hdnSecurityImage.val($(divImage).find("img").attr('key'));
};

function unselectAllImages() {
    $('.image-container-item').each(function (i, el) {
        var divImageContainer = $(el).find(".image-container-selector");
        divImageContainer.removeClass("selected");
        divImageContainer.find(".image-container-selector-fill").html("");
    });
};


function validateImages() {
    var valImage = false;

    if ($('.image-container-item').length == 0) {
        valImage = true;
    }
    else if (hdnSecurityImage.val() != "") {
        $('.image-container-item').each(function (i, el) {
        var divImageContainer = $(el).find(".image-container-selector");
        if (divImageContainer.hasClass("selected")) {
                valImage = true;
            }
        });
    } 

    if (!valImage) {
        $('.image-container-item').css("border", "2px solid red");
    }

    return valImage;
};

eBankit.Presentation.TRX01160.ValidateCustom = function () {    
    return validateImages();
};