<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ClientNameStep.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Controls.Onboarding.Steps.ClientNameStep" %>
<%@ Import Namespace="Ebankit.Demo.ProductSubscription.Entities.Onboarding" %>

<h2>
    <asp:Literal Id="litTitle" Text="<%$ FrontEndResources:Onboarding,ClientNameStepTitle %>" runat="server"></asp:Literal>
</h2>

<it:textboxcontrol_v2 Id="txtName" label="<%$ FrontEndResources:Onboarding,txtName %>" IsRequired="true" runat="server" RegexExpression="CONSTANT_NAME"
    ValidationInvalidInputMessage="<%$ FrontEndResources:Onboarding,txtNameValidationError %>" ValidationRequiredMessage="<%$ FrontEndResources:Onboarding,txtNameEmptyError %>" />