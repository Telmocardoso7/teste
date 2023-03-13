<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00611_01.ascx.cs" Inherits="TRX00611_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <asp:UpdatePanel ID="updContent" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <it:FlowInnerContainer ID="flwData1" Title="<%$FrontEndResources:TRX00611,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <div>
                    <it:FormRadioList_v3 ID="ctlIsHomeDelivery" runat="server" CssClass="big-radioButton" LabelText="<%$FrontEndResources:TRX00611,ctlIsHomeDelivery %>" RepeatDirection="Horizontal" HideLabel="false" />
                    <div id="divBranchDelivery" runat="server" class="hidden-panel">
                        <div class="field field_v2 metro break">
                            <asp:UpdatePanel ID="upBranch" runat="server" UpdateMode="Always">
                                <ContentTemplate>
                                    <it:DropDownListControl_v2 ID="ddlBankBranch" IsRequired="true" Label="<%$FrontEndResources:TRX00611,ddlBankBranch%>" runat="server" />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </div>
                        <div class="clearBoth"></div>
                    </div>
                </div>
            </it:FlowInnerContainer>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00611-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00611-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
