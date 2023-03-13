<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01102_01.ascx.cs" Inherits="TRX01102_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <it:FlowInnerContainer ID="FlowInnerContainer1" Title="<%$FrontEndResources:TRX01102,flwContractData %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
        <div>
            <it:FlowLabel_v2 ID="flwContract" Label="<%$FrontEndResources:TRX01102,lblContract %>" runat="server" />
        </div>
    </it:FlowInnerContainer>
    <it:FlowInnerContainer ID="flwData1" Title="<%$FrontEndResources:TRX01102,flwNewKey %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
        <div>
            <it:TextBoxControl_v2 ID="txtoldKey" TextMode="Password" IsRequired="true" Label="<%$FrontEndResources:TRX01102,txtOldKey %>" OnClick="currTxt = txtoldKey; txtoldKey.val('');" runat="server" />
            <it:TextBoxControl_v2 ID="txtnewKey" TextMode="Password" IsRequired="true" Label="<%$FrontEndResources:TRX01102,txtNewKey %>" OnClick="currTxt = txtnewKey; txtnewKey.val('');" runat="server" />
            <it:TextBoxControl_v2 ID="txtconfirmNewKey" TextMode="Password" IsRequired="true" Label="<%$FrontEndResources:TRX01102,txtConfirmNewKey %>" OnClick="currTxt = txtconfirmKey; txtconfirmKey.val('');" runat="server" />
        </div>
    </it:FlowInnerContainer>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01102-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
<!-- JAVASCRIPT -->
<script type="text/javascript">

    eBankit.Presentation.TRX01102 = {}

    // VALIDATE FORM FIELDS
    eBankit.Presentation.TRX01102.ValidateForm = function () {

        var isValid = true;

        if (/^(.)\1+$/.test(txtnewKey.val())) {
            isValid = false;
            eBankit.Presentation.InsertValidateMsg(txtnewKey, top.eBankit.Presentation.GetResource("invalidKey"));
            return false;
        }

        //Check if oldKey and newKey are different
        if (txtoldKey.val() == txtnewKey.val()) {
            isValid = false;
            eBankit.Presentation.InsertValidateMsg(txtoldKey, top.eBankit.Presentation.GetResource("sameKey"));
            eBankit.Presentation.InsertValidateMsg(txtnewKey, top.eBankit.Presentation.GetResource("sameKey"));
            return false;
        }

        //Check if newKey and confirmKey are the same        
        if (txtnewKey.val() != txtconfirmKey.val()) {
            eBankit.Presentation.InsertValidateMsg(txtnewKey, top.eBankit.Presentation.GetResource("differentKey"));
            eBankit.Presentation.InsertValidateMsg(txtconfirmKey, top.eBankit.Presentation.GetResource("differentKey"));
            return false;
        }

        return isValid;
    }



</script>
