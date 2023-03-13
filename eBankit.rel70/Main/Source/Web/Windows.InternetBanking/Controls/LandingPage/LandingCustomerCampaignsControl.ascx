<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LandingCustomerCampaignsControl.ascx.cs" Inherits="LandingCustomerCampaignsControl"  %>

<asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
    <ContentTemplate>
        <div id="campaignContainer1" class="bannerContainer" runat="server" visible="false">
            <div class="col-xs-12 col-md-12 col-lg-12" style="text-align: center; padding: 0px 0px 0px 0px;">
                <div class="panel-campaigns-item panel-campaigns-banner">
                    <div id="linkCampaignImage1" class="image-container" runat="server">
                        <img id="campaignImage1" class="hidden-xs hidden-sm" src="<%$ebFile:~/Content/currenttheme/images/no_campaign.jpg%>" alt="" runat="server" />
                        <img id="campaignImage1Landscape" class="hidden-md hidden-lg" src="<%$ebFile:~/Content/currenttheme/images/no_campaign.jpg%>" alt="" runat="server" />
                    </div>
                </div>
            </div>
        </div>
        <div id="campaignContainer2" class="bannerContainer" runat="server" visible="false">
            <div class="col-xs-12 col-md-12 col-lg-12" style="text-align: center; padding: 0px 0px 0px 0px;">
                <div id="mt_CFL"></div>
            </div>
        </div>
        <div id="campaignContainer3" class="bannerContainer" runat="server" visible="false">
            <div class="col-xs-12 col-md-12 col-lg-12" style="text-align: center; padding: 0px 0px 0px 0px;">
                <div id="mt_Slider"></div>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
