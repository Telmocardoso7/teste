<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ErrorControl.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Controls.Onboarding.ErrorControl" %>

<div class="onboarding-error-container">
    <i class="onboarding-icon-error"></i>

    <h1>
        <asp:Literal ID="litErrorTitle" Text="<%$FrontEndResources:Onboarding,ErrorTitle %>" runat="server"></asp:Literal>
    </h1>

    <h2 class="without-color">
        <asp:Literal ID="litErrorSubTitle" Text="<%$FrontEndResources:Onboarding,ErrorSubTitle %>" runat="server"></asp:Literal>
    </h2>

    <div id="divDescriptionLeave" runat="server">
        <h3 class="without-color generic-error-text-description-style">
            <asp:Literal ID="litErrorDescriptionRecover" Text="<%$FrontEndResources:Onboarding,ErrorDescriptionLeave %>" runat="server"></asp:Literal>
        </h3>
    </div>

    <div id="divDescriptionRecover" runat="server">
        <h3 class="without-color generic-error-text-description-style">
            <asp:Literal ID="litErrorDescription" Text="<%$FrontEndResources:Onboarding,ErrorDescriptionRecover %>" runat="server"></asp:Literal>
        </h3>
    </div>

    <div class="col-xs-12 default-button-container">
        <div id="divLogin" class="generic-error-btn-action" runat="server">
            <div class="generic-btn-action">
                <asp:LinkButton ID="btnRecoverPassword" CssClass="btn_action_1" Text="<%$FrontEndResources:Onboarding,btnRecoverPassword %>" runat="server" />
            </div>
            <div class="generic-btn-action">
                <asp:LinkButton ID="btnLogin" CssClass="btn-link" Text="<%$FrontEndResources:Onboarding,btnLogin %>" runat="server" />
            </div>
        </div>

        <div id="divLeave" class="btn-actions-orchestrator-container" runat="server">
            <div class="btn-action-orchestrator-container">
                <asp:LinkButton ID="btnLeave" CssClass="btn_action_3 btn-action-orchestrator" Text="<%$FrontEndResources:Onboarding,btnLeave %>" runat="server" />
            </div>
            <div id="divTryAgain" class="btn-action-orchestrator-container" runat="server">
                <asp:LinkButton ID="btnTryAgain" CssClass="btn_action_1 btn-action-orchestrator" Text="<%$FrontEndResources:Onboarding,btnTryAgain %>" runat="server" />
            </div>
        </div>

    </div>
</div>
