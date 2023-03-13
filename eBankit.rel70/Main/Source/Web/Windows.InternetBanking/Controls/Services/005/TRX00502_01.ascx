<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00502_01.ascx.cs" Inherits="TRX00502_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divTransaction" class="transaction-content" style="margin-bottom: 10px;" runat="server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <it:FlowInnerContainer ID="flwNoData" Title="<%$FrontEndResources:TRX00506,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <div>
                    <div id="flwFavoritsEmpty" class="metro panel-content panel-info-gen" runat="server">
                        <p>
                            <i class="icon-info"></i>
                            <asp:Literal ID="Literal1" Text='<%$FrontEndResources:TRX00506,EmptyMessage %>' runat="server"></asp:Literal>
                        </p>
                    </div>
                </div>
            </it:FlowInnerContainer>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Panel ID="pnControls" CssClass="clearPadding" runat="server">
                <it:FlowInnerContainer ID="flwContainer" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" HideTitle="true" Title="<%$FrontEndResources:TRX00502,litCharacteristics%>" runat="server">
                    <div>
                        <it:FlowLabel_v3 ID="lblAccountName" Label="<%$FrontEndResources:TRX00502,lblAccountName%>" runat="server" Visible="false" />
                        <it:FlowLabel_v3 ID="lblAccountNumber" Label="<%$FrontEndResources:TRX00502,lblAccountNumber%>" runat="server" Visible="false"  />
                        <it:FlowLabel_v3 ID="lblCurrency" Label="<%$FrontEndResources:TRX00502,lblCurrency%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblInterestRate" Label="<%$FrontEndResources:TRX00502,lblInterestRate%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblStartDate" Label="<%$FrontEndResources:TRX00502,lblStartDate%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblMaturityDate" Label="<%$FrontEndResources:TRX00502,lblMaturityDate%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblLastInstallmentDate" Label="<%$FrontEndResources:TRX00502,lblLastInstallmentDate%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblNextInstallmentDate" Label="<%$FrontEndResources:TRX00502,lblNextInstallmentDate%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblCurrentInstallment" Label="<%$FrontEndResources:TRX00502,lblCurrentInstallment%>" runat="server" />
                    </div>
                </it:FlowInnerContainer>

                <it:FlowInnerContainer ID="flwClass" Title="<%$FrontEndResources:TRX00502,litNextIncome%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                    <div>
                        <it:FlowLabel_v3 ID="lblInicialValue" Label="<%$FrontEndResources:TRX00502,lblInicialValue%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblActualBalance" Label="<%$FrontEndResources:TRX00502,lblActualBalance%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblNextInstallment" Label="<%$FrontEndResources:TRX00502,lblNextInstallment%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblUnpaidInterest" Label="<%$FrontEndResources:TRX00502,lblUnpaidInterest%>" runat="server" />
                        <it:FlowLabel_v3 ID="lblIrregularCapital" Label="<%$FrontEndResources:TRX00502,lblIrregularCapital%>" runat="server" />
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

    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00502-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
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
