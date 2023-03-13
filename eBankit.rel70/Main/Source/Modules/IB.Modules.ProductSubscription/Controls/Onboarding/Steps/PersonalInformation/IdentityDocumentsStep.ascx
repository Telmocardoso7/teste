<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="IdentityDocumentsStep.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Controls.Onboarding.Steps.LoginDetails.IdentityDocumentsStep" %>

<h2>
    <asp:Literal runat="server" ID="LitTitle" Text="<%$FrontEndResources:Onboarding,IdentityDocumentsStep %>"></asp:Literal>
</h2>

<label class="field-label">
    <asp:Literal ID="LitLabelDocs" runat="server" Text="<%$FrontEndResources:Onboarding,LitLabelDocs %>"></asp:Literal>
</label>
<asp:HiddenField ID="hdnOpenTab" runat="Server" />

<asp:Repeater ID="rptDocuments" runat="server" OnItemDataBound="rptDocuments_ItemDataBound">
    <HeaderTemplate>
        <ul class="nav nav-tabs content-tabs">
    </HeaderTemplate>
    <ItemTemplate>
        <li id="liTabContainer" data-toggle="tab" runat="server">
            <label>
                <asp:Literal ID="litTabTitle" runat="server"></asp:Literal>
            </label>
        </li>
    </ItemTemplate>
    <FooterTemplate>
        </ul>
    </FooterTemplate>
</asp:Repeater>
 
<div class="tab-content">
    <div id="divContentCitizenCard" class="tab-pane" runat="server">
        <it:textboxcontrol_v2 id="txtIDNumber" label="<%$FrontEndResources:Onboarding,txtIDNumber %>" IsRequired="true" runat="server" ValidationRequiredMessage="<%$ FrontEndResources:Onboarding,Document4EmptyError %>" />
    </div>
    <div id="divContentPassport" class="tab-pane" runat="server">
        <it:textboxcontrol_v2 id="txtPassport" label="<%$FrontEndResources:Onboarding,txtPassport %>" IsRequired="true" runat="server" ValidationRequiredMessage="<%$ FrontEndResources:Onboarding,Document3EmptyError %>" />
    </div>
</div>
