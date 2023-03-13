<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GenericConsentsControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.Controls.Generic.GenericConsentsControl" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>


<div id="GenericConsentContainer" class="consent-container" runat="server">
    <h3>
        <asp:Label ID="litTitle" Text="<%$FrontEndResources:Consent,ControlTitle%>" CssClass="consent-title" runat="server"></asp:Label>
    </h3>

    <p>
        <asp:Label ID="lblInfoMessageExternal" class="col-xs-12 searchBarContainer" Text="<%$FrontEndResources:Consent,ControlSubTitle%>" CssClass="text-responsive-1-3 consent-subtitle" runat="server"></asp:Label>
    </p>

    <div>
        <asp:Literal ID="ConsentContentPage" runat="server"></asp:Literal>
    </div>

    <div class="btn-consent-wrapper">

        <div id="RejectContainer" class="btn-consent-container" runat="server">
            <asp:Button ID="Reject" CssClass="btn-consent btn-consent-reject" OnClick="Response_Click" Text="<%$FrontEndResources:Consent,Reject%>" runat="server" />
            <p class="text-center">
                <asp:Literal ID="RejectContentPage" runat="server"></asp:Literal>
            </p>
        </div>
        <div id="AcceptContainer" class="btn-consent-container" runat="server">
            <asp:Button ID="Accept" CssClass="btn-consent btn-consent-accept col-xs-10 changes-profile" OnClick="Response_Click" Text="<%$FrontEndResources:Consent,Accept%>" runat="server" />
            <p class="text-center">
                <asp:Literal ID="AcceptContentPage" runat="server"></asp:Literal>
            </p>
        </div>
        <asp:HiddenField ID="ConsentId" ClientIDMode="Static" runat="server" />
        <asp:HiddenField ID="ConsentIsMandatory" ClientIDMode="Static" runat="server" />
    </div>
</div>
