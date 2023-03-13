<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX02102_01.ascx.cs" Inherits="TRX02102_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div id="divContent" runat="server" class="transaction-content accountDetail marginBottom10">
    <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Panel ID="pnControls" CssClass="clearPadding" runat="server">
                <it:FlowInnerContainer ID="flwContainer" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" Title="<%$FrontEndResources:TRX02102,litCharacteristics%>" runat="server">
                    <div>
                        <it:FlowLabel_v3 ID="flwAccountName" Label="<%$FrontEndResources:TRX02102,litAccountName%>" runat="server" />
                        <it:FlowLabel_v3 ID="flwAccountNumber" Label="<%$FrontEndResources:TRX02102,litAccountNumber%>" runat="server" />
                        <it:FlowLabel_v3 ID="flwIBAN" ShowToolTipLikeHelp="true" ToolTipKey="flwIBANExtAccount" Label="<%$FrontEndResources:TRX02102,flwIBAN%>" runat="server" />
                        <it:FlowLabel_v3 ID="flwAccountType" Label="<%$FrontEndResources:TRX02102,flwAccountType%>" runat="server" />
                    </div>
                </it:FlowInnerContainer>
                <it:FlowInnerContainer ID="flwContainerBalance" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" Title="<%$FrontEndResources:TRX02102,litBalanceTitle%>" runat="server">
                    <div>
                        <it:FlowLabel_v3 ID="flwBalance" Label="<%$FrontEndResources:TRX02102,litBalance%>" runat="server" />
                    </div>
                </it:FlowInnerContainer>
                <div class="clearBoth"></div>
                <div class="proof-inner">
                    <asp:PlaceHolder ID="phProofInner" runat="server"></asp:PlaceHolder>
                </div>
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="clearBoth"></div>
</div>
