<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01101_01.ascx.cs" Inherits="TRX01101_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<!-- CHANGE PASSWORD DIV -->
<div id="divContent" runat="server" class="transaction-content">
    <it:FlowInnerContainer ID="FlowInnerContainer1" Title="<%$FrontEndResources:TRX01101,flwContractData %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
        <div>
            <it:FlowLabel_v2 ID="flwContract" Label="<%$FrontEndResources:TRX01101,lblContract %>" runat="server" />
        </div>
    </it:FlowInnerContainer>
    <it:FlowInnerContainer ID="flwData1" Title="<%$FrontEndResources:TRX01101,flwData %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
        <div>
            <it:TextBoxControl_v2 ID="txtoldKey" TextMode="Password" IsRequired="true" MaxLength="8" MinLength="8" Label="<%$FrontEndResources:TRX01101,txtoldKey %>" OnClick="currTxt = txtoldKey; txtoldKey.val('');" runat="server" />
            <it:TextBoxControl_v2 ID="txtnewKey" TextMode="Password" IsRequired="true" MaxLength="8" MinLength="8" Label="<%$FrontEndResources:TRX01101,txtnewKey %>" OnClick="currTxt = txtnewKey; txtnewKey.val(''); " runat="server" />
            <it:TextBoxControl_v2 ID="txtconfirmNewKey" TextMode="Password" IsRequired="true" MaxLength="8" MinLength="8" Label="<%$FrontEndResources:TRX01101,txtconfirmNewKey %>" OnClick="currTxt = txtconfirmKey; txtconfirmKey.val('');" runat="server" />
        </div>
    </it:FlowInnerContainer>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01101-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
<!-- JAVASCRIPT -->
<script type="text/javascript">

    eBankit.Presentation.TRX01101 = {}

    // VALIDATE FORM FIELDS
    eBankit.Presentation.TRX01101.ValidateForm = function () {

        //alert("Old: " + txtoldKey.val() + "\nNew: " + txtnewKey.val() + "\nConfirm: " + txtconfirmKey.val());

        var isValid = true;

        if (txtoldKey.val() == '20142014') {
            isValid = false;
            eBankit.Presentation.InsertValidateMsg(txtoldKey, top.eBankit.Presentation.GetResource("wrongPassword"));
            return isValid = false;
        }

        //Check if oldKey and newKey are different
        if (txtoldKey.val() == txtnewKey.val()) {
            isValid = false;
            eBankit.Presentation.InsertValidateMsg(txtoldKey, top.eBankit.Presentation.GetResource("samePassword"));
            eBankit.Presentation.InsertValidateMsg(txtnewKey, top.eBankit.Presentation.GetResource("samePassword"));
            return isValid = false;
        }

        //Check if newKey and confirmKey are the same        
        if (txtnewKey.val() != txtconfirmKey.val()) {
            //eBankit.Presentation.InsertValidateMsg(TextBoxLogin, top.eBankit.Presentation.GetResource("RequiredUserName"));
            eBankit.Presentation.InsertValidateMsg(txtnewKey, top.eBankit.Presentation.GetResource("differentPassword"));
            eBankit.Presentation.InsertValidateMsg(txtconfirmKey, top.eBankit.Presentation.GetResource("differentPassword"));
            return isValid = false;
        }

        return isValid;
    }

</script>
