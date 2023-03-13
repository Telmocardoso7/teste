<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00206_01.ascx.cs" Inherits="TRX00206_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContainer" class="transaction-content" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div id="transactionContent" class="transaction-content accountDetail marginBottom10" runat="server">
                <asp:Panel ID="pnControls" CssClass="clearPadding" runat="server">
                    <it:FlowInnerContainer ID="flwContainer" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" Title="<%$FrontEndResources:TRX00206,TitleDataContainer%>" runat="server">
                        <div>
                            <it:FlowLabel ID="lblCardNumber" Label="<%$FrontEndResources:TRX00206,lblCardAccount%>" runat="server" />
                            <it:FlowLabel ID="lblCardAccountNumber" Label="<%$FrontEndResources:TRX00206,lblCurrentAccount%>" runat="server" />
                            <it:FlowLabel ID="flwOldOption" Label="<%$FrontEndResources:TRX00206,ddlOldOption%>" runat="server" />
                            <it:DropDownListControl_v2 ID="ddlNewOption" ShowLabel="true" runat="server" IsRequired="true" Width="195px" Label="<%$FrontEndResources:TRX00206,ddlNewOption %>" AutoPostBack="false" />
                        </div>
                    </it:FlowInnerContainer>
                </asp:Panel>
                <div class="clearBoth"></div>
            </div>

        </ContentTemplate>
    </asp:UpdatePanel>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00206-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>

<script type="text/javascript">

    eBankit.Presentation.TRX00206 = {}

    eBankit.Presentation.TRX00206.ValidateCustom = function () {
        var ddlNewOption = $('[id$=ddlNewOption_dlField]');
        var ret = true;

        if (ddlNewOption.find('option:selected').val() == '-1') {
            eBankit.Presentation.InsertValidateMsg_V2(ddlNewOption, top.eBankit.Presentation.GetResource("ddlNewOptionErroMsg"));
            ret = false;
        } else {
            eBankit.Presentation.RemoveValidateMsg(ddlNewOption);
        }

        return ret;
    }

</script>
