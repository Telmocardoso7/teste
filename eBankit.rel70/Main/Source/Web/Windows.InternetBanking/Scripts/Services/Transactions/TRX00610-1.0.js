eBankit.Presentation.TRX00610 = {};

RequestNewMatrixCard = function () {
    eBankit.Presentation.SetBlockPageCommon();
    $('body').block();
    eBankit.document.location.href = '/Security/Transactions/Transactions.aspx?trxid=TRX00611' + projId;
};


