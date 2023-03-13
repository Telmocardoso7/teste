<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OnboardingIntroduction.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Controls.Onboarding.OnboardingIntroduction" %>

<div class="onboarding-header-container col-xs-12 clearPadding">
    <div class="secondary-buttons-container">
            <div class="onboarding-secondary-actions btn-actions-orchestrator-container">
                 <div class="btn-action-orchestrator-container">
                    <asp:HyperLink ID="cancelIntroBtn" Text="<%$FrontEndResources:ActionContainer,Action_3 %>" CssClass="btn-action-orchestrator btn_action_2" runat="server"></asp:HyperLink>
                </div>
            </div>
    </div>
</div>
<div class="onboarding-introduction-content">
    <div>
        <h1>
            <strong>
                <asp:Literal runat="server" ID="onboardingIntroTitleContainer" Text="<%$FrontEndResources:Onboarding,Intro_ControlTitle %>"></asp:Literal></strong>
        </h1>
        <h2>
            <asp:Literal runat="server" ID="onboardingIntroTitleDescription" Text="<%$FrontEndResources:Onboarding,Intro_ControlSubTitle %>"></asp:Literal>
        </h2>
    </div>
    <div id="onboardingIntroductionContainer" class="onboarding-introduction-carrousel" runat="server">
        <div>
            <div class="onboarding-icon-register onboarding-icon"></div>
            <span class="col-xs-10 col-xs-offset-1 col-md-8 col-md-offset-2">
                <asp:Literal ID="onboardingRegisterDescription" Text="<%$FrontEndResources:Onboarding,Intro_RegisterDescription %>" runat="server"></asp:Literal></span>
        </div>
        <div>
            <div class="onboarding-icon-data onboarding-icon"></div>
            <span class="col-xs-10 col-xs-offset-1 col-md-8 col-md-offset-2">
                <asp:Literal ID="onboardingDataDescription" Text="<%$FrontEndResources:Onboarding,Intro_DataDescription %>" runat="server"></asp:Literal></span>
        </div>
        <div>
            <div class="onboarding-icon-terms onboarding-icon"></div>
            <span class="col-xs-10 col-xs-offset-1 col-md-8 col-md-offset-2">
                <asp:Literal ID="onboardingTermsDescription" Text="<%$FrontEndResources:Onboarding,Intro_TermsDescription %>" runat="server"></asp:Literal></span>
        </div>
    </div>

    <div class="col-xs-12 onboarding-introduction-button-container">
        <asp:Button ID="onboardingStartBtn" CssClass="btn btn-primary" Text="<%$FrontEndResources:Onboarding,Start %>" OnClick="OnboardingStartBtn_Click" runat="server" />
    </div>
</div>



<script type="text/javascript">
    $(document).ready(function () {
        $('.onboarding-introduction-carrousel').slick({
            rtl: document.currentCultureDirection ? true : false,
            draggable: false,
            fade: true,
            pauseOnDotsHover: false,
            pauseOnHover: false,
            autoplaySpeed: 10000,
            autoplay: true,
            dots: true,
            arrows: false,
            dotsClass: "slick-dots onboarding-introduction-carrousel-dots"
        });
    });
</script>
