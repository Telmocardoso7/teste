<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00216_01.ascx.cs" Inherits="TRX00216_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divTransaction" class="transaction-content" runat="server">
    <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div id="transactionContent" class="transaction-content accountDetail marginBottom10" runat="server">
                <asp:Panel ID="pnControls" CssClass="clearPadding" runat="server">
                    <it:FlowInnerContainer ID="flwContainer" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" Title="<%$FrontEndResources:TRX00216,litCharacteristics%>" runat="server">
                        <div>
                            <it:FlowLabel_v3 ID="flwCardName" Label="<%$FrontEndResources:TRX00216,flwCardName%>" Text="-" runat="server" />
                            <it:FlowLabel_v3 ID="flwCardNumber" Label="<%$FrontEndResources:TRX00216,flwCardNumber%>" Text="-" runat="server" />
                            <it:FlowLabel_v3 ID="flwCardAccountNumber" Label="<%$FrontEndResources:TRX00216,flwCardAccountNumber%>" Text="-" runat="server" />
                            <it:FlowLabel_v3 ID="flwEmitionDate" Label="<%$FrontEndResources:TRX00216,flwEmitionDate%>" Text="-" runat="server" />
                            <it:FlowLabel_v3 ID="flwMaturityDate" Label="<%$FrontEndResources:TRX00216,flwMaturityDate%>" Text="-" runat="server" />
                        </div>
                    </it:FlowInnerContainer>
                    <it:FlowInnerContainer ID="flwContainerMotive" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" Title="<%$FrontEndResources:TRX00216,flwContainerMotive%>" runat="server">
                        <div>
                            <it:DropDownListControl_v2 ID="ddlCancelMotive" IsRequired="true" ShowLabel="true" runat="server" Width="195px" Label="<%$FrontEndResources:TRX00216,Motive %>" AutoPostBack="false" />
                        </div>
                    </it:FlowInnerContainer>
                </asp:Panel>
                <div class="clearBoth"></div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00216-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>

<script type="text/javascript">

    eBankit.Presentation.TRX00216 = {}

    eBankit.Presentation.TRX00216.ValidateCustom = function () {
        var ddlCancelMotive = $('[id$=ddlCancelMotive_dlField]');
        var ret = true;

        if (ddlCancelMotive.find('option:selected').val() == '-1') {
            eBankit.Presentation.InsertValidateMsg_V2(ddlCancelMotive, top.eBankit.Presentation.GetResource("ddlCancelMotiveErroMsg"));
            ret = false;
        } else {
            eBankit.Presentation.RemoveValidateMsg(ddlCancelMotive);
        }

        return ret;
    }

</script>
