var IE6 = (navigator.userAgent.indexOf("MSIE 6") >= 0) ? true : false;
var IE7 = (navigator.userAgent.indexOf("MSIE 7") >= 0) ? true : false;
var IE8 = (navigator.userAgent.indexOf("MSIE 8") >= 0) ? true : false;

if (IE6 || IE7 || IE8) {
    //
    
    document.location.href("~/NotSupported.aspx".replace("~/", baseUrl));
}