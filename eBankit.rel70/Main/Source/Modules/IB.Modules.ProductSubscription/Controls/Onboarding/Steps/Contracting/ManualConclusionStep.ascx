<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ManualConclusionStep.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Controls.Onboarding.Steps.Contracting.ManualConclusionStep" %>

<div class="onboarding-conclusion-container">
    <i class="onboarding-icon-success"></i>

    <h1>
        <asp:Literal runat="server" ID="litTitle" Text="<%$FrontEndResources:Onboarding,ManualConclusion_ControlTitle %>"></asp:Literal>
    </h1>

    <h2 class="without-color">
        <asp:Literal runat="server" ID="litSubTitle" Text="<%$FrontEndResources:Onboarding,ManualConclusion_ControlSubTitle %>"></asp:Literal>
    </h2>

    <h3 class="without-color conclusion-text">
        <asp:Literal runat="server" ID="litDescription" Text="<%$FrontEndResources:Onboarding,ManualConclusion_ControlSubTitle %>"></asp:Literal>
    </h3>

    <div class="col-xs-12 default-button-container">
        <asp:LinkButton ID="offersButton" CssClass="btn_action_1" Text="<%$FrontEndResources:Onboarding,OffersButton %>" runat="server"></asp:LinkButton>
    </div>
</div>
