<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OnboardingOrchestrator.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Controls.Onboarding.OnboardingOrchestrator" %>

<%@ Register Src="~/Modules/Subscription/Controls/Onboarding/ConfirmLeaveControl.ascx" TagPrefix="it" TagName="ConfirmLeaveControl" %>

<div class="onboarding-header-container col-xs-12 clearPadding">
    <div class="onboarding-header-toggler">
        <div class="secondary-buttons-container col-xs-6 col-sm-4  clearPadding">
            <it:PS_ActionContainerControl id="secondaryActionContainer" runat="server" />
        </div>
        <div class="title-container hidden-xs col-sm-4 clearPadding">
            <h3>
                <asp:Literal ID="titleContainer" runat="server"></asp:Literal>
            </h3>
        </div>

    </div>
</div>

<div class="orchestrator-container">
    <div class="header-container">
        <div>
            <div class="title-container hidden-sm hidden-md hidden-lg clearPadding">
                <h3>
                    <asp:Literal ID="titleContainerPhone" runat="server"></asp:Literal>
                </h3>
            </div>
            
            <it:PS_BreadcrumbsControl id="breadcrumbs" resources="false" displaymode="4" cssclasses="breadcrumbs-minimalist" runat="server" />
        </div>
    </div>

    <it:PS_OutputMessageControl id="outputMessage" runat="server" />

    <div class="body-container">
        <asp:PlaceHolder ID="stepPlaceholder" runat="server"></asp:PlaceHolder>
    </div>
    <it:PS_ActionContainerControl id="actionContainer" runat="server" />
</div>

<it:confirmleavecontrol id="ConfirmLeaveControl" runat="server" />