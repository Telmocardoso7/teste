<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ErrorCampaignControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.ErrorCampaignControl" %>

<it:FlowContainerDetail ID="flwMessagesContainer" CssClass="panel panel-detail panel-message metro header-small panel-campaigns" runat="server">
    <div class="col-lg-12 metro" style="text-align: center; padding: 0px; margin-bottom: 0px;">
        <div class="panel-campaigns-item panel-campaigns-bigest">
            <div id="publicCampaignImage" class="image-container" runat="server">
                <img id="campaignImage" src="#" alt="" runat="server" />
                <%--<div class="overlay-fluid">
                    <asp:Literal ID="litImageDescription" runat="server"></asp:Literal>
                </div>--%>
            </div>
        </div>
    </div>
    <div class="clearBoth"></div>
</it:FlowContainerDetail>

