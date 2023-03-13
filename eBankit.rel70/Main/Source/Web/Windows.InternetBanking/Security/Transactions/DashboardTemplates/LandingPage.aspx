<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="LandingPage.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Security.Transactions.DashboardTemplates.LandingPage" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="TransactionFeaturedContent">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max" style="min-height: 0px;">
        <section class="featured">
            <div class="content-wrapper">
                <hgroup class="title">
                    <h3><%: SubTitle %></h3>
                </hgroup>
            </div>
        </section>
    </div>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("jquery.editable.js".ResolveJsUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("metro.min.js".ResolveJsUrl("metro"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="TransactionMainContent">
    <asp:PlaceHolder ID="phHeader" runat="server"></asp:PlaceHolder>
    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
    <asp:PlaceHolder ID="phSelector" runat="server"></asp:PlaceHolder>

    <asp:PlaceHolder ID="phContainer1" runat="server" Visible="false"></asp:PlaceHolder>
    <div class="clearBoth"></div>

    <asp:PlaceHolder ID="phContainer2" runat="server" Visible="false"></asp:PlaceHolder>
    <div class="clearBoth"></div>

    <asp:PlaceHolder ID="phContainer3" runat="server" Visible="false"></asp:PlaceHolder>
    <div class="clearBoth"></div>

    <asp:PlaceHolder ID="phContainer4" runat="server" Visible="false"></asp:PlaceHolder>
    <div class="clearBoth"></div>

    <div id="phCustom_0" class="bannerContainer" runat="server" visible="false">
        <div class="col-lg-12">
            <img src="<%= eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("loading-blue.gif"),eBankit.Common.Sites.Utils.CacheVersionKey.Image) %>" alt="loading" />
        </div>
    </div>

    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max no-padding campaign-image-no-padding">
        <div id="campaignDashboardBottomBanner" runat="server" visible="false"></div>
    </div>



    <div id="phCustom_1" class="bannerContainer" runat="server" visible="false">
        <div class="col-lg-12">
            <img src="<%=eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("loading-blue.gif"),eBankit.Common.Sites.Utils.CacheVersionKey.Image) %>" alt="loading" />
        </div>
    </div>


    <div id="phCustom_2" class="bannerContainer" runat="server" visible="false">
        <div class="col-lg-12">
            <img src="<%=eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("loading-blue.gif"),eBankit.Common.Sites.Utils.CacheVersionKey.Image) %>" alt="loading" />
        </div>
    </div>


    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max no-padding">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-right clearPadding">
            <div id="phCustom_3" class="bannerContainer" runat="server" visible="false">
                <div class="col-lg-12">
                    <img src="<%=eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("loading-blue.gif"),eBankit.Common.Sites.Utils.CacheVersionKey.Image) %>" alt="loading" />
                </div>
            </div>
            <div id="phCustom_4" class="bannerContainer" runat="server" visible="false">
                <div class="col-lg-12">
                    <img src="<%=eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("loading-blue.gif"),eBankit.Common.Sites.Utils.CacheVersionKey.Image) %>" alt="loading" />
                </div>
            </div>
            <div id="phCustom_5" class="bannerContainer" runat="server" visible="false">
                <div class="col-lg-12">
                    <img src="<%=eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("loading-blue.gif"),eBankit.Common.Sites.Utils.CacheVersionKey.Image) %>" alt="loading" />
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("custom-1.0.js".ResolveJsUrl("Services"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
</asp:Content>
