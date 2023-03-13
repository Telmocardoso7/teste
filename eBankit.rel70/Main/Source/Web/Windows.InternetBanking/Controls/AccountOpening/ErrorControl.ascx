<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ErrorControl.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Controls.AccountOpening.ErrorControl" %>

<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-left clearPadding accountOpening-content">
    <it:PS_OutputMessageControl id="outputMessageControl" runat="server" />

    <div class="btn-actions-orchestrator-container error-container">
        <div Id="dvGoHome" class="btn-action-orchestrator-container">
            <asp:LinkButton ID="btnGoHome" CssClass="btn_action_3 btn-action-orchestrator" Text="<%$FrontEndResources:AccountOpening,GoHomeBtn %>" runat="server" />
        </div>

        <div Id="dvTryAgain" class="btn-action-orchestrator-container" Visible="false" runat="server">
            <asp:LinkButton ID="btnTryAgain" CssClass="btn_action_1 btn-action-orchestrator" Text="<%$FrontEndResources:AccountOpening,TryAgainBtn %>" runat="server" />
        </div>
    </div>
</div>