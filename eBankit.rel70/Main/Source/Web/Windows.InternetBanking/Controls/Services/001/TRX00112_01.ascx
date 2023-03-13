<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00112_01.ascx.cs" Inherits="TRX00112_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" class="transaction-content" runat="server">
    <it:FlowInnerContainer ID="flwData1" Title="<%$FrontEndResources:TRX00112,TitlePrincipalDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
        <div>
            <it:NumberTextBoxControl_v2 ID="TextFirstCheque" IsRequired="true" MaxLength="9" MinLength="0" Label="<%$FrontEndResources:TRX00110,lblFirstCheckValue%>"
                MinValueMessageValidation="<%$FrontEndResources:TRX00111,txtQuantityMinValue%>" runat="server" />

            <it:NumberTextBoxControl_v2 ID="TextLastCheque" IsRequired="true" MaxLength="9" MinLength="0" Label="<%$FrontEndResources:TRX00110,lblLastGroupCheque%>"
                MinValueMessageValidation="<%$FrontEndResources:TRX00111,txtQuantityMinValue%>" runat="server" />


           <%-- <it:TextBoxControl_v2 ID="TextFirstCheque1" IsRequired="true" MaxLength="8" Label="<%$FrontEndResources:TRX00110,lblFirstCheckValue%>" Rows="1" runat="server" TextMode="SingleLine"/>
            <it:TextBoxControl_v2 ID="TextLastCheque2" IsRequired="true" MaxLength="8" Label="<%$FrontEndResources:TRX00110,lblLastGroupCheque%>" runat="server" TextMode="SingleLine" Visible ="true" />
            --%>
            <it:DropDownListControl_v2 ID="ddlCancelReasons" IsRequired="true" Label="<%$FrontEndResources:TRX00112,lblMotivo%>" runat="server" />
            <%--<it:TextBoxControl_v2 ID="TextCurrency" IsRequired="false" MinLength="0" Label="<%$FrontEndResources:TRX00110,lblCurrency%>" runat="server" TextMode="SingleLine" Enabled ="false"  />--%>
        </div>
    </it:FlowInnerContainer>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00112-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
<script type="text/javascript">

    eBankit.Presentation.TRX00112 = {}
    eBankit.Presentation.TRX00112.ValidateCustom = function () {
        var ret = true;

        if ($("[id$=ddlCancelReasons_dlField] :selected").val() == "-1") {
            eBankit.Presentation.InsertValidateMsg($("[id$=ddlCancelReasons_dlField]"), top.eBankit.Presentation.GetResource("ddlCancelReasons_RequireSelectValue"));
            ret = false;
        } else {
            eBankit.Presentation.RemoveValidateMsg($("[id$=ddlCancelReasons_dlField]"));
        }

        return ret;
    }


</script>
