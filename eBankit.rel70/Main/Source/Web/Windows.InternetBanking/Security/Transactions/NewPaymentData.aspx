<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Popup.Master" CodeBehind="NewPaymentData.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Security.Transactions.NewPaymentData" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div id="divTitle" runat="server" class="col-xs-12 col-sm-10 col-md-10 col-lg-10 col-lg-8 col-max">
        <div runat="server" style="padding-top: 20px;">
            <div runat="server" style="float: left;">
                <asp:Label ID="lblTitleManual" CssClass="LinkTxtColor" Text="<%$FrontEndResources:TRX01601,TitleContainerPop%>" runat="server" />
            </div>
            <hr />
        </div>

        <div id="Div1" class="transaction-content noMarginErrors" runat="server">
            <it:TextBoxControl_v2 ID="txtType" autocomplete="off" IsRequired="true" Label="<%$FrontEndResources:TRX01601,txtType%>" runat="server" />
            <it:TextBoxControl_v2 ID="txtBenefName" MaxLength="20" autocomplete="off" IsRequired="true" Label="<%$FrontEndResources:TRX01601,txtBenefName%>" runat="server" />
            <it:TextBoxControl_v2 ID="txtIban" MaxLength="25" autocomplete="off" IsRequired="true" Label="<%$FrontEndResources:TRX01601,txtIban%>" runat="server" />
            <it:CurrencyTextBoxControlAuto ID="txtAmount" IsRequired="true" ValidateWithAccountBalance="true"
                ShowCurrency="true" AllowValuesUnderOne="true"
                MaxLength="0" Width="50%" ValidationRequiredMessage="<%$FrontEndResources:TRX01601,txtAmountValidationRequiredMessage %>"
                ValidationMinValueInputMessage="txtQuantityMinValue" MinValue="0.01"
                ValidationInvalidInputMessage="<%$FrontEndResources:TRX01601,txtAmountValidationInvalidInputMessage %>"
                Label="<%$FrontEndResources:TRX01601,txtAmount%>" runat="server" />

            <it:TextBoxControl_v2 ID="txtReference" Width="50%" MaxLength="20" autocomplete="off" IsRequired="true" Label="<%$FrontEndResources:TRX01601,txtReference%>" runat="server" />
        </div>
        <hr />
        <div class="clearBoth"></div>
        <div class="trs_buttons col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro transp">
            <div class="trs_buttons">
                <button id="btnBack" class="btn btn-default" onclick="top.itcore_ui.HideModal()" runat="server"><span>&nbsp;</span><asp:Literal Text="<%$GenericFrontEndResources:cancel%>" runat="server"></asp:Literal></button>
                <button id="btnNewPayment" type="button" class="btn btn-primary" onclick="AddPaymentRow()" runat="server"><span>&nbsp;</span><asp:Literal Text="<%$FrontEndResources:TRX01601,confirm%>" runat="server"></asp:Literal></button>
            </div>
        </div>
    </div>
    <asp:Button ID="btnAddPayment" CssClass="hidden" runat="server" />
    <asp:HiddenField ID="hdnHasObeject" runat="server" />
     <script type="text/javascript">
        function AddPaymentRow() {
            var typeField = $('[id$=txtType_txField]');
            var txtBenefName = $('[id$=txtBenefName_txField]');
            var txtIban = $('[id$=txtIban_txField]');
            var txtAmount = $('[id$=txtAmount_txField]');
            var txtReference = $('[id$=txtReference_txField]');
            var ibanRegex = /^[A-Z]{2}[0-9]{2}[0-9]{21}/;

            var validation = true;

            if (typeField.val().trim() == '') {
                eBankit.Presentation.InsertValidateMsg_V2(typeField, top.eBankit.Presentation.GetResource("RequiredField"));
                validation = false;
            } else {
                eBankit.Presentation.RemoveValidateMsg(typeField);
            }

            if (txtBenefName.val().trim() == '') {
                eBankit.Presentation.InsertValidateMsg_V2(txtBenefName, top.eBankit.Presentation.GetResource("RequiredField"));
                validation = false;
            } else {
                eBankit.Presentation.RemoveValidateMsg(txtBenefName);
            }
            if (txtIban.val().trim() == '') {
                eBankit.Presentation.InsertValidateMsg_V2(txtIban, top.eBankit.Presentation.GetResource("RequiredField"));
                validation = false;
            } else {               
                txtIban.val(txtIban.val().toUpperCase());
                if (!ibanRegex.test(txtIban.val().replace(/ /g, '')) && txtIban.val() != '') {
                    eBankit.Presentation.InsertValidateMsg_V2(txtIban, top.eBankit.Presentation.GetResource("txtAccountDestIBANInvalidFormat"));
                    validation = false;
                } else {
                    eBankit.Presentation.RemoveValidateMsg(txtIban);
                    validation = true;
                }
            }
            if (txtAmount.val().trim() == '') {
                eBankit.Presentation.InsertValidateMsg_V2(txtAmount, top.eBankit.Presentation.GetResource("RequiredField"));
                validation = false;
            } else {
                eBankit.Presentation.RemoveValidateMsg(txtAmount);
            }
            if (txtReference.val().trim() == '') {
                eBankit.Presentation.InsertValidateMsg_V2(txtReference, top.eBankit.Presentation.GetResource("RequiredField"));
                validation = false;
            } else {
                eBankit.Presentation.RemoveValidateMsg(txtReference);
            }

            if (validation) {
                __doPostBack(btnAddPayment, '');
            }
        }

        $(document).ready(function () {
            var hasObject = $("[id$=hdnHasObeject]").val();
            if (hasObject == "1") {
                top.itcore_ui.HideModal();
                top.ReloadPage();
            }
        });
    </script>
</asp:Content>




