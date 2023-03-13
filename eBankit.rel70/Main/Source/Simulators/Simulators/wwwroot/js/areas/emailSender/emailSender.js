function ProcessCampaign() {

    $.LoadingSpin("show", 'body', $('#loadingSpin-text').val());
    
    var campaignCode = $("#Campaigns").val();

    var formData = new FormData();
    formData.append("CampaignCode", campaignCode);


    $.ajax({
        url: "/EmailSender/EmailSenderManager/ProcessCampaign",
        data: formData,
        processData: false,
        contentType: false,
        type: "POST",
        success: function (data) {
            $('#MarketingListDetailsId').html(data);
            $.LoadingSpin("hide", 'body'); 
        },
        error: function (xhr) {
            $.LoadingSpin("hide", 'body'); 
        }
    });
}

function GetCampaignResponse() {

    $.LoadingSpin("show", 'body', $('#loadingSpin-text').val());

    var campaignCode = $("#Campaigns").val();

    var formData = new FormData();
    formData.append("CampaignCode", campaignCode);


    $.ajax({
        url: "/EmailSender/EmailSenderManager/GetCampaignResponses",
        data: formData,
        processData: false,
        contentType: false,
        type: "POST",
        success: function (data) {
            $('#MarketingListDetailsId').html(data);
            $.LoadingSpin("hide", 'body');
        },
        error: function (xhr) {
            $.LoadingSpin("hide", 'body');
        }
    });
}