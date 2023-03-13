<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ConsentAssociateAccountsControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.PSD2.ConsentAssociateAccountsControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>


<div id="ConsentAssociateAccountsContainer" class="consent-container" runat="server">
    <div class="divMessageInfo">
        <asp:Label ID="lblInfoMessageExternal" class="messageInfo" Text="<%$FrontEndResources:Consent,AccountsSubTitle%>" runat="server"></asp:Label>
    </div>

    <div class="divMessageDetail">
        <asp:Literal ID="ConsentContentPage" runat="server"></asp:Literal>
    </div>

    <div class="divActionsConsent">
        <div ID="RejectContainer" runat="server" class="divConsentReject">
            <asp:Button ID="Reject" CssClass="btnConsentReject" OnClick="Response_Click" Text="<%$FrontEndResources:Consent,Reject%>" runat="server" />
            <p class="textInfo">
                <asp:Literal ID="RejectContentPage" runat="server"></asp:Literal>
            </p>
        </div>
        <div ID="AcceptContainer" runat="server" class="divConsentAccept">
            <asp:Button ID="Accept" CssClass="btnConsentAccept" OnClick="Response_Click" Text="<%$FrontEndResources:Consent,Accept%>" runat="server" />
            <p class="textInfo">
                <asp:Literal ID="AcceptContentPage" runat="server"></asp:Literal>
            </p>
        </div>       
    </div>
</div>

