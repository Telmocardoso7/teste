<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LandingContentControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.LandingContentControl" %>

<it:FlowContainerDetail ID="flwMessagesContainer" CssClass="panel panel-detail panel-message header-small panel-campaigns metro" runat="server">
    <div class="col-xs-12 col-md-12 col-sm-12 col-lg-8 col-max SecurityAlertText">
        <div style="width: 33%; float: left;">

            <a ID="img1Link" runat="server">
                <img id="imgOperator" src="<%$ebFile:~/Content/currenttheme/no_campaign_small.jpg%>" alt="" class="img-responsive" runat="server" />
            </a>
        </div>

        <div style="width: 33%; float: left;">
            <a ID="img2Link" runat="server">
                <img id="imgOperator2" src="<%$ebFile:~/Content/currenttheme/images/no_campaign_small.jpg%>"   alt="" class="img-responsive" runat="server" />
            </a>
        </div>

        <div style="width: 33%; float: left;">
            <a ID="img3Link" runat="server">
                <img id="imgOperator3" src="<%$ebFile:~/Content/currenttheme/images/no_campaign_small.jpg%>"   alt="" class="img-responsive" runat="server" />
            </a>
        </div>
        <div class="clearBoth"></div>
    </div>
</it:FlowContainerDetail>

