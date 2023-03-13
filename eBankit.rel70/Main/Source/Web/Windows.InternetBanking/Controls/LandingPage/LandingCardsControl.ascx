<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LandingCardsControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.LandingCardsControl" %>

<it:FlowContainerDetail ID="flwCardsContainer" CssClass="panel panel-detail metro header-small panel-detail-noborder" Title="<%$FrontEndResources:Custom,PanelCards%>" MoreUrl="#" runat="server">
    <div id="divContent" class="col-lg-12" style="text-align: center; padding:0px;margin-bottom: -15px;" runat="server">
        <div id="divCardsTile" class="tile double live tile-nohover" data-role="live-tile" data-effect="slideUp" style="height: 160px; width: 100%; background-color: transparent; margin-bottom: 0px;">
            <div class="tile-content image">
                <div class="image-container">
                    <img id="imgCards1" src="<%$ebFile:~/Content/currenttheme/images/cartao_5.png%>" alt="" runat="server" />
                    <div class="overlay" style="height: auto;">
                        Credit card
                    </div>
                </div>
            </div>
            <div class="tile-content image">
                <div class="image-container">
                    <img id="imgCards2" src="<%$ebFile:~/Content/currenttheme/images/cartao_6.png%>" alt="" runat="server" />
                    <div class="overlay" style="height: auto;">
                        Debit card
                    </div>
                </div>
            </div>
        </div>
    </div>
</it:FlowContainerDetail>
