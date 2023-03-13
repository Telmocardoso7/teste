<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="EbankitCartItemDetail.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Controls.Cart.EbankitCartItemDetail" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<%@ Import Namespace="eBankit.Lib.ApiModel.SecurityCenter.Contracts.Contract" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="TransactionFeaturedContent">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto">
        <h3 class="head head-top">
            <asp:Literal ID="litTitle" Text="<%$FrontEndResources:EbankitCartItemDetail,Title%>" runat="server"></asp:Literal>
        </h3>
    </div>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="TransactionMainContent">
    <div class="grayContainer">
        <it:FlowInnerContainer ID="flwPendOper" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server" role="button" aria-pressed="false">
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 break-none trx-information">
                <p class="accounts-panel-p">
                    <asp:Literal ID="litOper" Text="<%$FrontEndResources:EbankitCartItemDetail,litOper%>" runat="server"></asp:Literal>
                </p>
                <h3 class="favorit-center accounts-panel-h" id="hCCOperValue" runat="server">
                    <asp:Literal ID="litCartItemName" runat="server"></asp:Literal>
                </h3>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 break-xs trx-information">
                <p class="accounts-panel-p">
                    <asp:Literal ID="litChannel" Text="<%$FrontEndResources:EbankitCartItemDetail,litChannel%>" runat="server"></asp:Literal>
                </p>
                <h3 class="favorit-center accounts-panel-h" id="hCCChannelValue" runat="server">
                    <asp:Literal ID="litCartChannelType" runat="server"></asp:Literal>
                </h3>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-4 break-md trx-information">
                <p class="accounts-panel-p">
                    <asp:Literal ID="litCreator" Text="<%$FrontEndResources:EbankitCartItemDetail,AddedOn%>" runat="server"></asp:Literal>
                </p>
                <h3 class="favorit-center accounts-panel-h" id="h1" runat="server">
                    <asp:Literal ID="litCartCreatedDate" runat="server"></asp:Literal>
                </h3>
            </div>
            <div style="clear: both;"></div>
        </it:FlowInnerContainer>
    </div>
    <it:FlowInnerContainer ID="flwOperDetails" Title="<%$FrontEndResources:EbankitCartItemDetail,OperDetailsTitle %>" CustomCssClass="bs-reduced bs-head-metro bs-reduced-transaction" runat="server"  role="button" aria-pressed="false">
        <asp:Panel ID="pnControls" CustomCssClass="bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
            <div class="clearBoth"></div>
        </asp:Panel>

    </it:FlowInnerContainer>
    <div class="trs_buttons col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro transp">
        <div class="trs_buttons-action">
            <asp:Button ID="btnBack" Text="<%$FrontEndResources:EbankitCartItemDetail,BTNBACK%>" class="btn btn-default" runat="server" OnClick="BtnBack_Click" />
            <asp:LinkButton ID="btnDelete" Text="<%$FrontEndResources:EbankitCartItemDetail,BTNDELETE%>" class="btn btn-default" runat="server" data-modal="yes" OnClick="BtnDelete_Click" />
            <asp:Button ID="btnEdit" Text="<%$FrontEndResources:EbankitCartItemDetail,BTNEDIT%>" class="btn btn-default" runat="server" OnClick="BtnEdit_Click" />

        </div>
    </div>
    <div class="text-center">
        <asp:UpdatePanel ID="updDelete" runat="server" UpdateMode="Always">
            <ContentTemplate>
                <asp:HiddenField ID="hdnReloadPage" runat="server" />
                <asp:HiddenField ID="hdnEditPage" runat="server" />
                <asp:HiddenField ID="hdnTransactioId" runat="server" />
                <asp:HiddenField ID="hdnCartItemId" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>

    <script>
        $('input[id$=btnBack], input[id$=btnEdit]').on('keydown', function (e) {
            if (e.keyCode === 32) {
                e.preventDefault();
            }
            if (e.keyCode === 13) {
                $(this).click();
            }
        });
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(function () {
            UpdateMainPage();
        });
        function UpdateMainPage() {
            var hdnReload = $("[id$=hdnReloadPage]");
            var hdnEdit = $("[id$=hdnEditPage]");
            var hdnTrans = $("[id$=hdnTransactioId]");
            var hdnCart = $("[id$=hdnCartItemId]");
            if (hdnReload.length && hdnReload.val() === "true") {
                eBankit.window.top.document.location.href = '/Security/Transactions/Transactions.aspx?trxid=<%=ConfigurationManager.AppSettings["OPERATION.Key.TransactionsCart"].ToString() %><%=ConfigurationManager.AppSettings["projectId"].ToString() %>&notification=2';
            }
        };
        $("[id$=btnDelete]").on("click", function (event) {
            var elem = $(this);
            event.preventDefault();
            itcore_ui.ShowTopPopupConfirm_V3(
                    "<%=eBankit.Common.Globalization.Translate.GetTransactionString("EbankitCartItemDetail", "PopupCancelContentMessage").Replace("\"", "&quot;") %>",
                    '<%=eBankit.Common.Globalization.Translate.GetTransactionString("EbankitCartItemDetail", "PopupDeclineTitle")%>',
                    '<%=eBankit.Common.Globalization.Translate.GetTransactionString("EbankitCartItemDetail", "PopupDeclineConfirmationMessage")%>',
                    elem.attr("href"), '',
                    '<%=eBankit.Common.Globalization.Translate.GetTransactionString("EbankitCartItemDetail", "PopupCancelBtnKeepOperation")%>',
                    '<%=eBankit.Common.Globalization.Translate.GetTransactionString("EbankitCartItemDetail", "PopupCancelBtnConfirmDeclineOperation")%>');

            return false;
        });
    </script>
</asp:Content>
