<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerCampaignControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.CustomerCampaignControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<%@ Import Namespace="eBankit.Common.Sites" %>


<div class="col-lg-8 col-max campaign-bottom-banner-container">
    <asp:UpdatePanel ID="updPanelCampaign" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <div class="bottom-banner-img-container marginTop50">
                <div class="col-xs-12 col-md-12 col-lg-12 " style="padding: 0px 0px 0px 0px;">
                    <div class="panel-campaigns-item panel-campaign-image">
                        <button id="btnDismiss" type="button" class="btn-campaign-dismiss" runat="server" visible="false" onclientclick="return false;"></button>
                        <asp:PlaceHolder ID="phBannerImage" runat="server" Visible="false"></asp:PlaceHolder>
                        <asp:PlaceHolder ID="phBannerCustom" runat="server" Visible="false"></asp:PlaceHolder>
                        <asp:PlaceHolder ID="phBannerSlider" runat="server" Visible="false"></asp:PlaceHolder>
                        <asp:PlaceHolder ID="phBannerVideo" runat="server" Visible="false"></asp:PlaceHolder>
                        <asp:PlaceHolder ID="phBannerText" runat="server" Visible="false"></asp:PlaceHolder>
                        <asp:PlaceHolder ID="phBannerHtml" runat="server" Visible="false"></asp:PlaceHolder>
                    </div>
                </div>
            </div>
            <div class="clearBoth"></div>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>

<script type="text/javascript" src="<%= Utils.GetCacheVersion("ebankitControls/campaign/customer-campaign.min.js".ResolveJsUrl(), Utils.CacheVersionKey.JScript) %>"></script>



