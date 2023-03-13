<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="DynamicLandingPage.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Security.Transactions.DashboardTemplates.DynamicLandingPage" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<%@ Import Namespace="eBankit.Common.Sites" %>

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
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("slick.min.js".ResolveJsUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="TransactionMainContent">
    <div class="dashboard-wrapper">
        <asp:PlaceHolder ID="phWidgets" runat="server" Visible="false"></asp:PlaceHolder>
    </div>
    
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("custom-1.0.js".ResolveJsUrl("Services"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("dashboard.js".ResolveJsUrl("ebankitControls/dashboard"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
</asp:Content>
