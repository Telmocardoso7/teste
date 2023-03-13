<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginConsentControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.LoginConsentControl" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>


<div id="consentMainContainer" runat="server">
    <p class="text-responsive-1-3 loginWelcomeMessage text-center">
        <h2 class="head head-top text-center">
            <asp:Literal ID="litTitle" Text="<%$FrontEndResources:Consent,Login_Title%>" runat="server"></asp:Literal>
        </h2>
    </p>

    <div runat="server" id="divConsentError" class="loginConsentErrorContainer">
        <img src="../../Content/Themes/ebankIT/images/icon/ic_generic_message_warning.png" />
        <br />
        <asp:Label runat="server" ID="lblErrorMessage"></asp:Label>
    </div>

    <p class="text-responsive-1-3 loginWelcomeMessage text-center">
        <asp:Label ID="lblInfoMessageExternal" class="col-xs-12 searchBarContainer" Text="<%$FrontEndResources:Consent,Login_Info %>" CssClass="text-responsive-1-3" runat="server"></asp:Label>
    </p>
    <div class="ConsentContent">
        <asp:Literal ID="ConsentContentPage" runat="server"></asp:Literal>
    </div>
    <asp:Button ID="Accept" CssClass="btn btn-primary test btn-margin btn-block changes-profile" Style="margin-bottom: 20px;" OnClick="Response_Click" Text="<%$FrontEndResources:Consent,Login_Accept %>" runat="server" CommandArgument="ACCEPT" />
    <p class="text-center">
        <asp:Literal ID="AcceptContentPage" runat="server"></asp:Literal>
    </p>
    <asp:Button ID="Reject" CssClass="btn btn-cancel btn-margin btn-block" Style="margin-bottom: 20px;" OnClick="Response_Click" Text="<%$FrontEndResources:Consent,Login_Reject %>" runat="server" />
    <p class="text-center">
        <asp:Literal ID="RejectContentPage" runat="server"></asp:Literal>
    </p>
    <asp:HiddenField ID="ConsentId" ClientIDMode="Static" runat="server" />
    <asp:HiddenField ID="ConsentIsMandatory" ClientIDMode="Static" runat="server" />
</div>

