<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ConfirmLeaveControl.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Controls.Onboarding.ConfirmLeaveControl" %>

<div id="leaveContent" class="onboarding-leave-container" runat="server" style="display: none;">
    <i class="onboarding-icon-warning"></i>

    <h1>
        <asp:Literal runat="server" ID="litTitle" Text="<%$FrontEndResources:Onboarding,Leave_Title %>"></asp:Literal>
    </h1>

    <h2 class="without-color">
        <asp:Literal runat="server" ID="litSubTitle" Text="<%$FrontEndResources:Onboarding,Leave_SubTitle %>"></asp:Literal>
    </h2>

    <div class="btn-actions-orchestrator-container">
        <div class="btn-action-orchestrator-container">
            <asp:LinkButton ID="btnCancel" CssClass="btn_action_3 btn-action-orchestrator" Text="<%$FrontEndResources:Onboarding,Leave_Action %>" runat="server" />
        </div>
        <div class="btn-action-orchestrator-container">
            <asp:Button ID="btnContinue" CssClass="btn_action_1 btn-action-orchestrator" Text="<%$FrontEndResources:Onboarding,Leave_Stay %>" runat="server" />
        </div>
    </div>
</div>
