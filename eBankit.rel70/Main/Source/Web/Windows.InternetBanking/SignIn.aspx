<%@ Page Language="C#" EnableEventValidation AutoEventWireup="true" MasterPageFile="~/Masters/BaseFullEmpty.Master" CodeBehind="SignIn.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.SignIn" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContentFull" EnableViewState="false">
    <asp:PlaceHolder ID="backLogin" EnableViewState="false" runat="server">
        <img id="imgLogin" src="/Content/Themes/ebankIT/images/logo.png" class="carousel-example-generic" runat="server" />
    </asp:PlaceHolder>

    <div id="ebLogin" class="col-xs-12 col-sm-6 col-md-5 col-lg-4">
        <div class="row">
            <div class="col-xs-6">
                <img class="logo img-responsive" src="<%=eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("header/ico_logo_header.png"),eBankit.Common.Sites.Utils.CacheVersionKey.Image) %>" alt="" />
            </div>
            <div class="col-xs-6">
                <div class="noprint langSelector">
                    <it:VariationControl id="VariationControl" runat="server" />
                </div>
            </div>
            <div style="clear: both;"></div>
        </div>
        <%--	<div id="container">
			<div class="photoArea"></div>
			<video autoplay="true" id="videoElement">
			</video>
		</div>
		<button id="snap" onclick="SpanPhoto(); return false;">Snap Photo</button>
		<canvas id="canvas" class="canvasvideo"></canvas>--%>
        <h2>
            <asp:Literal ID="Literal2" Text="<%$FrontEndResources:Login,WellcomeMessage %>" runat="server"></asp:Literal>
        </h2>
        <asp:PlaceHolder ID="phLoginControl" runat="server"></asp:PlaceHolder>
        <div id="consentContainer" class="login-container" runat="server" visible="false">
             <asp:PlaceHolder ID="phConsentControl" runat="server"></asp:PlaceHolder>

            <p class="text-center cancelContainer">
                <asp:LinkButton ID="btnCancelConsent" runat="server" CssClass="cancelBtn" Text="<%$FrontEndResources:Login,Cancel %>" OnClick="Cancelbtn_Click" />
            </p>
        </div>

        <div id="profileContainer" class="login-container" runat="server" visible="false">
            <p class="text-responsive-1-3 loginWelcomeMessage text-center">
                <asp:Label ID="selectLabel" CssClass="col-xs-12 searchBarContainer" Text="<%$FrontEndResources:Login,SelectTitle %>" runat="server"></asp:Label>
            </p>
            <asp:PlaceHolder ID="phSelectControl" runat="server"></asp:PlaceHolder>
            <p class="text-center cancelContainer">
                <asp:LinkButton ID="btnCancel" runat="server" CssClass="cancelBtn" Text="<%$FrontEndResources:Login,Cancel %>" OnClick="Cancelbtn_Click" />
            </p>
        </div>
        <div id="campaignPhoneVisible" >
            <asp:PlaceHolder ID="campaignPhone" EnableViewState="false" runat="server" Visible="true">
            </asp:PlaceHolder>
        </div>
        
        <div class="text-center footer-credits credits-login">
            <span>
                <asp:Literal ID="lblMasterCredits" Text="2015 &copy; EBANKIT" runat="server"></asp:Literal>
            </span>

        </div>

        <div style="clear: both;"></div>

        <script type="text/javascript">
            sessionStorage.clear(); // Clear session control vars
        </script>
        <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/Services/loginBackground-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
        <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("LoginBackground.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />

        <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/policies.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>

        <script>
            Policies.PrivacyPolicyURL = '<%= ConfigurationManager.AppSettings["PrivacyPolicyURL"] %>';
            Policies.CookiesPolicyURL  = '<%= ConfigurationManager.AppSettings["CookiesPolicyURL"] %>';
        </script>


    </div>
        
</asp:Content>

