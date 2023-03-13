
function pageLoad(sender, args) {
    var iconStepPosition = $("img[id*='iconStepPosition']");

    if (iconStepPosition.length > 0 && iconStepPosition[0].alt === "") iconStepPosition.attr('alt', '');
}