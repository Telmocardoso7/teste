$(document).ready(function () {
    TransformImgSvg();
});




//Transform IMG SVG into Html SVG
function TransformImgSvg() {
    $('img.svg').each(function () {
        var $img = jQuery(this);
        var imgID = $img.attr('id');
        var imgClass = $img.attr('class');
        var imgURL = $img.attr('src');
        var imgAlt = $img.attr('alt');
        var imgTitle = $img.attr('title');

        $.get(imgURL, function (data) {
        
            // Get the SVG tag, ignore the rest
            var $svg = $(data).find('svg');

            // Add replaced image's ID to the new SVG
            if (typeof imgID !== 'undefined') {
                $svg = $svg.attr('id', imgID);
            }
            if (typeof imgAlt !== 'undefined') {
                $svg = $svg.attr('alt', imgAlt);
            }
            if (typeof imgTitle !== 'undefined') {
                $svg = $svg.attr('title', imgTitle);
            }
            // Add replaced image's classes to the new SVG
            if (typeof imgClass !== 'undefined') {
                $svg = $svg.attr('class', imgClass + ' replaced-svg');
            }

            // Remove any invalid XML tags as per http://validator.w3.org
            $svg = $svg.removeAttr('xmlns:a');

            // Replace image with new SVG
            $img.replaceWith($svg);
        }, 'xml');
    });
}
