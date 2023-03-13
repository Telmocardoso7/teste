$(document).ready(function () {
    if ($("#automaticClose").val().toUpperCase().toLowerCase() === 'true') {
        $("#automaticCloseTxt").removeAttr("hidden");
        setTimeout('self.close()', 4000);
    } else {
        $("#manualCloseTxt").removeAttr("hidden");
    }
});