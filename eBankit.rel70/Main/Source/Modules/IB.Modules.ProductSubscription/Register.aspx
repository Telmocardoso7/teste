<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/BaseFullEmpty.Master" CodeBehind="Register.aspx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Register" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<%@ Import Namespace="eBankit.Common.Sites" %>
<%@ Register Src="~/Modules/Subscription/Controls/Onboarding/OnboardingIntroduction.ascx" TagPrefix="ebk" TagName="OnboardingIntroduction" %>
<%@ Register Src="~/Modules/Subscription/Controls/Onboarding/OnboardingOrchestrator.ascx" TagPrefix="ebk" TagName="OnboardingOrchestrator" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContentFull">
    <link rel="stylesheet" type="text/css" href="<%= Utils.GetCacheVersion("onboarding.css".ResolveModuleCssUrl(true), Utils.CacheVersionKey.CStyleSheet) %>" />
    <div id="marketingContent" class="hidden-xs hidden-sm col-md-6 onboarding-marketing-content" runat="server">
        <div class="onboarding-logo" runat="server">
            <img id="imgOnboardingLogo" src="<%= Utils.GetCacheVersion("onboarding-logo.svg".ResolveModuleImagePath(),Utils.CacheVersionKey.Image) %>" />
        </div>
        <div class="onboarding-marketing-images-container">
            <asp:Image ID="imgPlaceholderMarketing" runat="server" Visible="false"/>
            <asp:Repeater  ID="rptMarketing" runat="server" OnItemDataBound="rptMarketing_ItemDataBound">
                <ItemTemplate>
                        <asp:Image ID="imgMarketing" runat="server"/>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div id="marketingDescriptionContainer" class="onboarding-marketing-description-container" runat="server">
            <h4>
                <asp:Literal ID="marketingTitle" runat="server"></asp:Literal></h4>
            <h5>
                <asp:Literal ID="marketingDescription" runat="server"></asp:Literal></h5>
            <div>
                <h5>
                    <asp:HyperLink ID="learnMoreLink" rel="noopener noreferrer" Target="_blank" Text="<%$FrontEndResources:Onboarding,LearnMoreLink %>" runat="server"></asp:HyperLink></h5>
                <div id="marketingFooter" runat="server"></div>
            </div>
        </div>
    </div>

    <div class="col-xs-12 col-sm-12 col-md-6 onboarding-content">
        <div class="language-selector">
            <it:variationcontrol id="VariationControl" runat="server" />
        </div>
        <asp:UpdatePanel ID="onboardingContent" runat="server" class="onboarding-content-container">
            <ContentTemplate>
                <asp:Panel ID="pnIntroduction" runat="server" CssClass="onboarding-introduction-container">
                    <ebk:onboardingintroduction id="onboardingIntroduction" runat="server"></ebk:onboardingintroduction>
                </asp:Panel>

                <asp:PlaceHolder ID="phOnboardingOrchestrator" runat="server"></asp:PlaceHolder>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <script type="text/javascript" src="<%= Utils.GetCacheVersion("Onboarding/onboarding-common.js".ResolveModuleJsUrl(), Utils.CacheVersionKey.JScript) %>"></script>
    <script type="text/javascript" src="<%= Utils.GetCacheVersion("validation-fields.js".ResolveModuleJsUrl(), Utils.CacheVersionKey.JScript) %>"></script>
</asp:Content>


