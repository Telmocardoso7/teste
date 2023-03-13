

$(".save-consent input[type='checkbox']").on('change', function () {
    var input = $(this);
    var consentId = input.closest('.save-consent').siblings('input[id*=consentId]').val();
    var versionId = input.closest('.save-consent').siblings('input[id*=versionId]').val();
    var checkConsent = input.is(':checked');
    __doPostBack('consentBTn', consentId+'-' + versionId+'-' +checkConsent);
    });

$(document).ready(function () {
    $("input[id*='chkConsent']").each(function () {
        var textID = $(this).closest("td").parent().find("span[id*='ConsentText']").attr('id');
        $(this).attr("aria-labelledby", textID);
    });

});