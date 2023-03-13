<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerCampaignsControl.ascx.cs" Inherits="CustomerCampaignsControl" %>

<asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
    <ContentTemplate>
        <it:FlowContainerDetail ID="flwOperations" CssClass="panel panel-detail metro header-small panel-detail-noborder panel-small" Title="<%$FrontEndResources:Campaigns,Title%>" runat="server">

        </it:FlowContainerDetail>
    </ContentTemplate>
</asp:UpdatePanel>
