<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00223_01.ascx.cs" Inherits="TRX00223_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div id="divContent" runat="server" class="transaction-content">
    <asp:UpdatePanel ID="updContent" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div id="transactionContent" class="transaction-content accountDetail marginBottom10" runat="server">
                <asp:Panel ID="pnControls" CssClass="clearPadding" runat="server">

                    <it:FlowInnerContainer ID="flwData1" Title="<%$FrontEndResources:TRX00223,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                        <div>
                            <it:CheckBoxSwitchControl_v3 ID="ckbFreezeCard" runat="server" Label="<%$FrontEndResources:TRX00223,ckbFreezeCard %>" InfoText="<%$FrontEndResources:TRX00223,ckbFreezeCardDescription %>" OnClientClick="ChangeStatusFreeze(this)" />
                        </div>
                    </it:FlowInnerContainer>
                    <it:FlowInnerContainer ID="FlowInnerContainer1" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server" Style="padding-top: 15px;">

                        <div id="optionsCard" runat="server">
                            <it:CheckBoxSwitchControl_v3 ID="ckbContactlessPayments" runat="server" Label="<%$FrontEndResources:TRX00223,ckbContactlessPayments %>" InfoText="<%$FrontEndResources:TRX00223,ckbContactlessPaymentsDescription %>" AddBottomLine="true" />
                            <it:CheckBoxSwitchControl_v3 ID="ckbSwipePayments" runat="server" Label="<%$FrontEndResources:TRX00223,ckbSwipePayments %>" InfoText="<%$FrontEndResources:TRX00223,ckbSwipePaymentsDescription %>" AddBottomLine="true" />
                            <it:CheckBoxSwitchControl_v3 ID="ckbOnlineTransactions" runat="server" Label="<%$FrontEndResources:TRX00223,ckbOnlineTransactions %>" InfoText="<%$FrontEndResources:TRX00223,ckbOnlineTransactionsDescription %>" AddBottomLine="true" />
                            <it:CheckBoxSwitchControl_v3 ID="ckbATMWithdrawals" runat="server" Label="<%$FrontEndResources:TRX00223,ckbATMWithdrawals %>" InfoText="<%$FrontEndResources:TRX00223,ckbATMWithdrawalsDescription %>" AddBottomLine="true" />
                            <it:CheckBoxSwitchControl_v3 ID="ckbLocationBasedSecurity" runat="server" Label="<%$FrontEndResources:TRX00223,ckbLocationBasedSecurity %>" InfoText="<%$FrontEndResources:TRX00223,ckbLocationBasedSecurityDescription %>" />
                        </div>
                    </it:FlowInnerContainer>
                </asp:Panel>
                <div class="clearBoth"></div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/Services/Transactions/TRX00223-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00223-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>


