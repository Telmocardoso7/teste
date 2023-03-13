<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DocumentsStep.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Controls.Onboarding.Steps.DocumentsStep" %>

<%@ Register Src="~/Modules/Subscription/Controls/Onboarding/DocumentsControl.ascx" TagPrefix="it" TagName="DocumentsControl" %>

<h2>
    <asp:Literal runat="server" ID="ContractingTitle" Text="<%$FrontEndResources:Onboarding,Contracting_Title %>"></asp:Literal></h2>
<p>
    <asp:Literal runat="server" ID="ContractingSubTitle" Text="<%$FrontEndResources:Onboarding,Contracting_Description %>"></asp:Literal>
</p>
<asp:PlaceHolder ID="phDocuments" runat="server">
    <it:DocumentsControl id="documentContainer" runat="server" />
</asp:PlaceHolder>
<div>
    <asp:CheckBox ID="ckbAcceptTerms" runat="server" />
    <asp:Label ID="lblAcceptTerms" runat="server" AssociatedControlID="ckbAcceptTerms" Text="<%$FrontEndResources:Onboarding,Contracting_AcceptTerms %>" />
    <label id="lblCheckError" class="label-checkbox-error" style="display: none;">
        <asp:Literal ID="litCheckError" Text="<%$FrontEndResources:Onboarding,Contracting_AcceptTerms_Error %>" runat="server"></asp:Literal></label>
</div>
