<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00111_01.ascx.cs" Inherits="TRX00111_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" class="transaction-content" runat="server">
    <it:FlowInnerContainer ID="flwData1" Title="<%$FrontEndResources:TRX00111,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
        <div id="Div1" class="transaction-content noMarginErrors" runat="server">
            <div>
                <it:DropDownListControl_v2 ID="ddlEntity" Label="<%$FrontEndResources:TRX00111,ddlEntity%>" runat="server" OnSelectedChanged="ddlEntity_SelectedChanged"/>
                <it:NumberTextBoxControl_v2 ID="txtQuantity" OnlyPositiveValues="True" IsRequired="true" IsNumber="true"
                    MinValueMessageValidation="<%$FrontEndResources:TRX00111,txtQuantityMinValueCheque%>"
                    MaxLength="1" MinLength="0" Label="<%$FrontEndResources:TRX00111,txtQuantity%>"
                    runat="server" />
                <it:DropDownListControl_v2 ID="ddlChequeType" Label="<%$FrontEndResources:TRX00111,ddlChequeType%>" runat="server"/>
         
            </div>
        </div>
    </it:FlowInnerContainer>
    <it:FlowInnerContainer ID="flwData2" Title="<%$FrontEndResources:TRX00111,tituloChequesEntrega %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
        <div>
            <it:TextBoxControl_v2 ID="txtInstructions" IsRequired="false" MinLength="0" Label="<%$FrontEndResources:TRX00111,txtInstructions%>" runat="server" Rows="6" TextMode="MultiLine" Visible="false" />
            <it:DropDownListControl_v2 ID="ddlBranch" IsRequired="True" Label="<%$FrontEndResources:TRX00111,ddlBranch%>" runat="server" />
        </div>
    </it:FlowInnerContainer>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00111-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
<script type="text/javascript">
    $(document).ready(function() {
        $("[id$=ddlBranch_dlField]").on('blur', eBankit.Presentation.TRX00111.ValidateBranch);
    });

    eBankit.Presentation.TRX00111 = {};

    eBankit.Presentation.TRX00111.ValidateBranch = function() {
        var ret = true;
        if ($("[id$=ddlBranch_dlField] :selected").val() == "-1") {
            eBankit.Presentation.InsertValidateMsg($("[id$=ddlBranch_dlField]"), top.eBankit.Presentation.GetResource("ddlBranch_RequireSelectValue"));
            ret = false;
        } else {
            eBankit.Presentation.RemoveValidateMsg($("[id$=ddlBranch_dlField]"));
        }
        return ret;
    };

    eBankit.Presentation.TRX00111.ValidateCustom = function() {
        var ret = true;
        ret = eBankit.Presentation.TRX00111.ValidateBranch();
        return ret;
    };
</script>
