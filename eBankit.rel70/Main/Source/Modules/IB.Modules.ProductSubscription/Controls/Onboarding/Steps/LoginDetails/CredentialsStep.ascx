<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CredentialsStep.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Controls.Onboarding.Steps.CredentialsStep" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<h2>
    <asp:Literal runat="server" ID="LitLoginDetailsTitle"></asp:Literal>
</h2>
<h4>
    <asp:Literal runat="server" ID="litSubTitle" Text="<%$ FrontEndResources:Onboarding,CredentialsStepTitle %>"></asp:Literal></h4>
<p>
    <asp:Literal runat="server" ID="litDescription" Text="<%$ FrontEndResources:Onboarding,CredentialsStepSubTitle %>"></asp:Literal></p>
<it:textboxcontrol_v2 id="txtUsername" label="<%$ FrontEndResources:Onboarding,txtUsername %>" runat="server" isrequired="true" validationrequiredmessage="<%$ FrontEndResources:JS,ValidationRequiredInputChangeUsernameMessage%>"
    validationinvalidinputmessage="<%$ FrontEndResources:Onboarding,txtUsernameValidationError %>" />
<asp:Button ID="btnVerifyUserName" runat="server" CssClass="hidden" OnClick="btnVerifyUserName_Click" />
<asp:HiddenField ID="hdnValidUsername" runat="server" />
<it:textboxcontrol_v2 id="txtPassword" label="<%$ FrontEndResources:Onboarding,txtPassword %>" textmode="Password" passwordvisibletoggle="true" isrequired="true" runat="server"
    validationinvalidinputmessage="<%$ FrontEndResources:Onboarding,txtPasswordValidationError %>" validationrequiredmessage="<%$ FrontEndResources:Onboarding,txtPasswordEmptyError %>" />
<it:textboxcontrol_v2 id="txtConfirmPassword" label="<%$ FrontEndResources:Onboarding,txtConfirmPassword %>" textmode="Password" passwordvisibletoggle="true" isrequired="true" runat="server"
    validationinvalidinputmessage="<%$ FrontEndResources:Onboarding,txtPasswordValidationError %>" validationrequiredmessage="<%$ FrontEndResources:Onboarding,txtConfirmPasswordEmptyError %>" />
<input type="hidden" runat="server" id="regexPattern" />