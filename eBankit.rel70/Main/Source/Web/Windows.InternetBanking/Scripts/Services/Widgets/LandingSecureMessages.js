$(document).ready(function () {
    $('.messages-icon.message-details').click(function () {
        var messageId = $(this).attr('MessageId');
        window.location.href = '/Security/Transactions/Transactions.aspx?trxid=TRX00901' + projId +'&tab=1&msgId=' + messageId;
        return false;
    });

    $('.messages-icon.no-messages').click(function () {
        window.location.href = '/Security/Transactions/Transactions.aspx?trxid=TRX00901' + projId + '&tab=1';
        return false;
    });
});