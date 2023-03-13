<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LandingCampaignsControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.LandingCampaignsControl" %>

<it:FlowContainerDetail ID="flwMessagesContainer" CssClass="panel panel-detail panel-message metro header-small panel-campaigns" runat="server">
    <asp:Repeater ID="repeater" runat="server" OnItemDataBound="repeater_ItemDataBound">
        <HeaderTemplate>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="text-align: center; padding: 0px; margin-bottom: 0px;">
        </HeaderTemplate>
        <ItemTemplate>
            <div class="panel-campaigns-item">
                <div id="linkCampaignImage" class="image-container" runat="server">
                    <img id="campaignImage" src="#" alt="" runat="server" />
                    <%--<div class="overlay-fluid">
                        <asp:Literal ID="litImageDescription" runat="server"></asp:Literal>
                    </div>--%>
                </div>
            </div>
        </ItemTemplate>
        <FooterTemplate>
            <div class="clearBoth"></div>
            </div>
        </FooterTemplate>
    </asp:Repeater>
    <asp:Literal ID="nocampaigns" runat="server" Text="<%$FrontEndResources:Campaigns,NoCampaigns %>"></asp:Literal>
</it:FlowContainerDetail>

