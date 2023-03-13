<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LandingBigestCampaignsControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.LandingBigestCampaignsControl" %>

<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max no-padding">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-right clearPadding">
        <it:FlowContainerDetail ID="flwMessagesContainer" CssClass="panel panel-detail panel-message metro header-small" runat="server">
            <div class="col-xs-12 col-md-12 col-lg-4" style="text-align: center; padding: 0px 0px 0px 0px;">
                <div class="panel-campaigns-item panel-campaigns-bigest">
                    <div id="linkCampaignImage1" class="image-container" runat="server">
                        <img id="campaignImage1" class="hidden-xs hidden-sm" src="<%$ebFile:~/Content/currenttheme/images/no_campaign.jpg%>" alt="" runat="server" />
                        <img id="campaignImage1Landscape" class="hidden-md hidden-lg" src="<%$ebFile:~/Content/currenttheme/images/no_campaign.jpg%>" alt="" runat="server" />
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-md-12 col-lg-4" style="text-align: center; padding: 0px 0px 0px 0px;">
                <div class="panel-campaigns-item panel-campaigns-bigest">
                    <div id="linkCampaignImage2" class="image-container" runat="server">
                        <img id="campaignImage2" class="hidden-xs hidden-sm" src="<%$ebFile:~/Content/currenttheme/images/no_campaign.jpg%>" alt="" runat="server" />
                        <img id="campaignImage2Landscape" class="hidden-md hidden-lg" src="<%$ebFile:~/Content/currenttheme/images/no_campaign.jpg%>" alt="" runat="server" />
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-md-12 col-lg-4" style="text-align: center; padding: 0px 0px 0px 0px;">
                <div class="panel-campaigns-item panel-campaigns-bigest">
                    <div id="linkCampaignImage3" class="image-container" runat="server">
                        <img id="campaignImage3" class="hidden-xs hidden-sm" src="<%$ebFile:~/Content/currenttheme/images/no_campaign.jpg%>" alt="" runat="server" />
                        <img id="campaignImage3Landscape" class="hidden-md hidden-lg" src="<%$ebFile:~/Content/currenttheme/images/no_campaign.jpg%>" alt="" runat="server" />
                    </div>
                </div>
            </div>
            <div class="clearBoth"></div>
        </it:FlowContainerDetail>
    </div>
</div>
