<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PhoneValidationStep.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Controls.Onboarding.Steps.PhoneValidationStep" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<it:PS_OutputMessageControl id="outputMessageControl" runat="server" />

<h2>
    <asp:Literal ID="LitTitle" Text="<%$FrontEndResources:Onboarding,PhoneValidationStep %>" runat="server"></asp:Literal>
</h2>

<p>
    <asp:Literal ID="LitSubTitle"  runat="server"></asp:Literal>
</p>

<it:textboxcontrol_v2 id="txtSMSToken" label="<%$FrontEndResources:Onboarding,SMSToken%>" textmode="Password" passwordvisibletoggle="true" isrequired="true" runat="server"
    validationrequiredmessage="<%$ FrontEndResources:Onboarding,txtSMSTokenEmptyError %>" />

<div>
    <asp:LinkButton ID="btnRequestNewCode" CssClass="btnRequestNewCode" runat="server" Text="<%$FrontEndResources:Onboarding,RequestNewCode %>" />
</div>

<div id="div_Captcha" style="display: none">
    <label class="field-label">
        <asp:Literal runat="server" ID="ltCaptcha" Text="<%$FrontEndResources:Onboarding,CaptchaRequired %>"></asp:Literal></label>
    <div id="reCaptchaElement"></div>
</div>

<asp:Button ID="btnReSendSMSToken" UseSubmitBehavior="false" OnClick="ReSendSMSToken" CssClass="hidden" runat="server"></asp:Button>

<%--Device Fields--%>
<asp:HiddenField ID="hdnBrowserFingerPrint" runat="server" ClientIDMode="Static" />
<asp:HiddenField ID="hdnBrowserName" runat="server" ClientIDMode="Static"/>
<asp:HiddenField ID="hdnOperationSystem" runat="server" ClientIDMode="Static" />