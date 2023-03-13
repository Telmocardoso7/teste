<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00211_01.ascx.cs" Inherits="TRX00211_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divTransaction" class="transaction-content" style="margin-bottom: 10px;" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <it:FlowInnerContainer ID="flwNoData" Title="<%$FrontEndResources:TRX00211,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <div>
                    <div id="flwFavoritsEmpty" class="metro panel-content panel-info-gen" runat="server">
                        <p>
                            <i class="icon-info"></i>
                            <asp:Literal ID="Literal1" Text='<%$FrontEndResources:TRX00211,EmptyMessage %>' runat="server"></asp:Literal>
                        </p>
                    </div>
                </div>
            </it:FlowInnerContainer>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Panel ID="pnControls" CssClass="clearPadding" runat="server">
                <%--<it:FlowInnerContainer ID="flwContainer" CustomCssClass="bs-reduced bs-head-metro bs-reduced-transaction" HideTitle="true" Title="<%$FrontEndResources:TRX00211,litCharacteristics%>" runat="server">--%>
                <it:FlowInnerContainer ID="flwContainer" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                    <div>
                        <it:FlowLabel_v3 ID="lblAccountNumber" Label="<%$FrontEndResources:TRX00211,lblAccountNumber%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblAccountName" Label="<%$FrontEndResources:TRX00211,lblAccountName%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblBranch" Label="<%$FrontEndResources:TRX00211,lblBranch%>" runat="server" />
                    </div>
                </it:FlowInnerContainer>
                <it:FlowInnerContainer ID="flwContainerLimit" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" Title="<%$FrontEndResources:TRX00211,litTemporaryLimit%>" runat="server">
                    <div>
                        <it:FlowLabel_v3 ID="lblLimit" Label="<%$FrontEndResources:TRX00211,lblLimit%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblTemporaryLimit" Label="<%$FrontEndResources:TRX00211,lblTemporaryLimit%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblLimitTemporaryDate" Label="<%$FrontEndResources:TRX00211,lblLimitTemporaryDate%>" runat="server" />
                    </div>
                </it:FlowInnerContainer>
                <it:FlowInnerContainer ID="flwContainerBalance" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" Title="<%$FrontEndResources:TRX00211,litBalanceTitle%>" runat="server">
                    <div>
                        <it:FlowLabel_v3 ID="lblBalance" Label="<%$FrontEndResources:TRX00211,lblBalance%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblPendingOperation" Label="<%$FrontEndResources:TRX00211,lblPendingOperation%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblAvailableBalance" Label="<%$FrontEndResources:TRX00211,lblAvailableBalance%>" runat="server" />
                    </div>
                </it:FlowInnerContainer>
                <it:FlowInnerContainer ID="flwContainerPayment" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" Title="<%$FrontEndResources:TRX00211,litPayments%>" runat="server">
                    <div>
                        <it:FlowLabel_v3 ID="lblInterestRate" Label="<%$FrontEndResources:TRX00211,lblInterestRate%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblMinimValue" Label="<%$FrontEndResources:TRX00211,lblMinimValue%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblPaymentDate" Label="<%$FrontEndResources:TRX00211,lblPaymentDate%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblLastPaymentValue" Label="<%$FrontEndResources:TRX00211,lblLastPaymentValue%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblLastPaymentDate" Label="<%$FrontEndResources:TRX00211,lblLastPaymentDate%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblMonthValue" Label="<%$FrontEndResources:TRX00211,lblMonthValue%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblPaymentOptionForMonth" Label="<%$FrontEndResources:TRX00211,lblPaymentOptionForMonth%>" runat="server" />
                    </div>
                </it:FlowInnerContainer>
                <it:FlowInnerContainer ID="flwContainerExtract" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" Title="<%$FrontEndResources:TRX00211,litExtracts%>" runat="server">
                    <div>
                        <it:FlowLabel_v3 ID="lblLastExtractDate" Label="<%$FrontEndResources:TRX00211,lblLastExtractDate%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblLastMonthCloseDate" Label="<%$FrontEndResources:TRX00211,lblLastMonthCloseDate%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblDayToClose" Label="<%$FrontEndResources:TRX00211,lblDayToClose%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblManageType" Label="<%$FrontEndResources:TRX00211,lblManageType%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblAssociatedCurrentAccount" Label="<%$FrontEndResources:TRX00211,lblAssociatedCurrentAccount%>" runat="server" />
                    </div>
                </it:FlowInnerContainer>
                <div class="clearBoth"></div>
            </asp:Panel>
            <asp:HiddenField ID="isCredit" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="clearBoth"></div>
    <div class="proof-inner">
        <asp:PlaceHolder ID="phProofInner" runat="server"></asp:PlaceHolder>
    </div>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00211-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
<script type="text/javascript">
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        var hdnIsCredit = $('[id$=isCredit]');
        var target = document.getElementsByClassName("proof-inner")[0];
        if (typeof target !== "undefined") {
            if (hdnIsCredit.val() == "False")
                target.style.display = "none";
            else
                target.style.display = "block";
        }
    });
    $(document).ready(function () {
        var hdnIsCredit = $('[id$=isCredit]');
        var target = document.getElementsByClassName("proof-inner")[0];
        if (typeof target !== "undefined") {
            if (hdnIsCredit.val() == "False")
                target.style.display = "none";
            else
                target.style.display = "block";
        }
    });
</script>
