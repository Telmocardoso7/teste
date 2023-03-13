<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ConclusionStep.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Controls.Onboarding.Steps.Contracting.ConclusionStep" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div class="onboarding-conclusion-container">
    <i class="onboarding-icon-success"></i>

    <h1>
        <asp:Literal runat="server" ID="litTitle" Text="<%$FrontEndResources:Onboarding,Conclusion_ControlTitle %>"></asp:Literal>
    </h1>

    <h2 class="without-color no-margin">
        <asp:Literal runat="server" ID="litSubTitle" Text="<%$FrontEndResources:Onboarding,Conclusion_ControlSubTitle %>"></asp:Literal>
    </h2>

    <div class="col-xs-12 no-padding">
        <div class="default-button-container">
            <asp:LinkButton ID="GoIBButton" CssClass="btn_action_1" Text="<%$FrontEndResources:Onboarding,GoToIbButton %>" runat="server"></asp:LinkButton>
        </div>

        <div class="row app-download-container">
            <div class="download-title without-color">
                <asp:Literal runat="server" ID="litDownloadApp" Text="<%$FrontEndResources:Onboarding,DownloadApp %>"></asp:Literal>
            </div>
        </div>
    </div>

    <div class="row app-download-container">
        <div class="col-xs-12 col-sm-6 no-padding google-icon"></div>
        <div class="col-xs-12 col-sm-6 no-padding apple-icon"></div>
    </div>
</div>
