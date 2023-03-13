<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ContactInformationStep.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Controls.Onboarding.Steps.ContactInformationStep" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Panel ID="pNewClientModule" runat="server" CssClass="custom-form">
    <h2>
        <asp:Literal runat="server" ID="LitTitle" Text="<%$FrontEndResources:Onboarding,ContactInformationStep %>"></asp:Literal>
    </h2>

    <div>
        <label class="field-label"><asp:Literal runat="server" Text="<%$FrontEndResources:Onboarding,MobileNumber%>"></asp:Literal></label>
        <label class="field-info"><asp:Literal runat="server" Text="<%$FrontEndResources:Onboarding,FieldInfoMessage%>"></asp:Literal></label>
        <it:PhoneTextBoxControl ID="txtMobileNumber" TextMode="Phone" RenderMode="ListItem" CssClass="field break no-margin" IsRequired="true" runat="server" RegexExpression="^\d+$"
                ValidationInvalidInputMessage="<%$ FrontEndResources:Onboarding,txtMobileNumberValidationError %>" ValidationRequiredMessage="<%$ FrontEndResources:Onboarding,txtMobileNumberEmptyError %>"
                ShowLabel="false" DropDownLabel="<%$ FrontEndResources:Onboarding,CountryCode %>" Label="<%$ FrontEndResources:Onboarding,MobilePhoneNumber %>"/>     
    </div>

    <div class="row">
        <div class="col-md-12">
            <it:TextBoxControl_v2 ID="txtEmailAddress" Label="<%$FrontEndResources:Onboarding,EmailAddress%>" IsRequired="true" runat="server" RegexExpression="^[^\s@]+@[^\s@]+\.[^\s@]+$"
                ValidationInvalidInputMessage="<%$ FrontEndResources:Onboarding,txtEmailAddressValidationError %>" ValidationRequiredMessage="<%$ FrontEndResources:Onboarding,txtEmailAddressEmptyError %>"/>
        </div>
    </div>
</asp:Panel>