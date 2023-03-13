
function fillStars(rating, Obj) {
    $('[id$=hdnRate]').val(rating);
    $('[id$=btnStarsSubmit]').attr("onclick", "SetSurvey();")
    $('[id$=btnStarsSubmit]').addClass("active");
    var stars = document.getElementsByName(Obj.name);
    for (i = 0; i < stars.length; i++) {
        if (stars[i].id.split('star')[1] <= rating) { stars[i].src = "/Content/Themes/ebankIT/images/user_engagement_hub/rating_star_selected.png" }
        else { stars[i].src = "/Content/Themes/ebankIT/images/user_engagement_hub/rating_star_default.png" }
    }

    return true;
}

function fillStarsKeyPress(rating, Obj) {
    if (event.keyCode == "32") {
        fillStars(rating, Obj);
    }
    event.preventDefault();
}

function fillStarsHover(rating, Obj) {
    var stars = document.getElementsByName(Obj.name);
    for (i = 0; i < stars.length; i++) {

        if (stars[i].id.split('star')[1] <= rating) { stars[i].src = "/Content/Themes/ebankIT/images/user_engagement_hub/rating_star_hover.png" }
        else { stars[i].src = "/Content/Themes/ebankIT/images/user_engagement_hub/rating_star_default.png" }
    }
    return true;
}

function verifyStarsSelected(Obj) {
    var stars = document.getElementsByName(Obj.name);
    var rate = $('[id$=hdnRate]').val();
    for (i = 0; i < stars.length; i++) {
        if (stars[i].id.split('star')[1] <= rate) { stars[i].src = "/Content/Themes/ebankIT/images/user_engagement_hub/rating_star_selected.png" }
        else { stars[i].src = "/Content/Themes/ebankIT/images/user_engagement_hub/rating_star_default.png" }
    }
}

function fillThumbs(Obj) {
    var thumbs = document.getElementsByName(Obj.name);
    $('[id$=btnSubmitThumbs]').attr("onclick", "SetSurvey();")
    $('[id$=btnSubmitThumbs]').addClass("active");
    if (Obj.id.split('thumb')[1] == 2) {
        $('[id$=hdnRate]').val('ThumbDown');
        thumbs[1].src = "/Content/Themes/ebankIT/images/user_engagement_hub/thumbs_down_selected.png";
        thumbs[0].src = "/Content/Themes/ebankIT/images/user_engagement_hub/thumbs_up_default.png";
    }
    else {
        $('[id$=hdnRate]').val('ThumbUp');
        thumbs[1].src = "/Content/Themes/ebankIT/images/user_engagement_hub/thumbs_down_default.png";
        thumbs[0].src = "/Content/Themes/ebankIT/images/user_engagement_hub/thumbs_up_selected.png";
    }
    return true;
}

function fillThumbsKeyPress(Obj) {
    if (event.keyCode == "32") {
        fillThumbs(Obj);
    }

    event.preventDefault();
}

function fillThumbsHover(Obj) {
    var thumbs = document.getElementsByName(Obj.name);
    thumbs[0].src = "/Content/Themes/ebankIT/images/user_engagement_hub/thumbs_up_default.png";
    thumbs[1].src = "/Content/Themes/ebankIT/images/user_engagement_hub/thumbs_down_default.png";

    if (Obj.id.split('thumb')[1] == 2) {
        thumbs[1].src = "/Content/Themes/ebankIT/images/user_engagement_hub/thumbs_down_hover.png";
    }
    else {
        thumbs[0].src = "/Content/Themes/ebankIT/images/user_engagement_hub/thumbs_up_hover.png";
    }
    return true;
}

function verifyThumbsSelected(Obj) {
    var thumbs = document.getElementsByName(Obj.name);
    var thumb = $('[id$=hdnRate]').val();
    thumbs[0].src = "/Content/Themes/ebankIT/images/user_engagement_hub/thumbs_up_default.png";
    thumbs[1].src = "/Content/Themes/ebankIT/images/user_engagement_hub/thumbs_down_default.png";
    if (thumb == 'ThumbDown') {
        thumbs[1].src = "/Content/Themes/ebankIT/images/user_engagement_hub/thumbs_down_selected.png";
    }
    else if (thumb == 'ThumbUp') {
        thumbs[0].src = "/Content/Themes/ebankIT/images/user_engagement_hub/thumbs_up_selected.png";
    }

}

SetSurvey = function () {
    var btnSetSurvey = $('[id$=btnSubmitSurvey]');
    btnSetSurvey.click();
}

CloseSurvey = function () {
    var btnClSurvey = $('[id$=btnClosedSurvey]');
    btnClSurvey.click();
}

HideDivSurvey = function () {
    var divSurv = $('[id$=divSurvey]');
    if (divSurv.length > 0) {
        divSurv[0].style.display = 'none';
    }
}

ShowMessageSucess = function () {
    HideDivSurvey();
    var divMsgSuccess = $('[id$=divMessageSuccess]');
    var divSurveyMessage = $('[id$=divSurveyMessage]');
    if (divMsgSuccess.length > 0 && divSurveyMessage.length > 0) {
        divMsgSuccess[0].style.display = 'block';
        divSurveyMessage[0].style.display = 'block';
    }
}

ShowMessageError = function () {
    HideDivSurvey();
    var divMsgError = $('[id$=divMessageError]');
    var divSurveyMessage = $('[id$=divSurveyMessage]');
    if (divMsgError.length > 0 && divSurveyMessage.length > 0) {
        divMsgError[0].style.display = 'block';
        divSurveyMessage[0].style.display = 'block';
    }
}