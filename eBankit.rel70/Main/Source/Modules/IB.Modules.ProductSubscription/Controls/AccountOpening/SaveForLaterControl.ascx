<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SaveForLaterControl.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Controls.AccountOpening.SaveForLaterControl" %>

<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-left clearPadding accountOpening-content">
    <it:PS_OutputMessageControl id="outputMessageControl" runat="server" />

    <h3>
        <asp:Literal ID="litTitle" Text="<%$FrontEndResources:AccountOpening,SaveForLaterTitle %>" runat="server" />
    </h3>
    <p>
        <asp:Label ID="litDescription" Text="<%$FrontEndResources:AccountOpening,SaveForLaterDescription%>" runat="server" />
        <br />
        <asp:Label ID="litMoreDescription" Text="<%$FrontEndResources:AccountOpening,SaveForLaterMoreDescription%>" runat="server" />
    </p>

    <div class="btn-actions-orchestrator-container">
        <div class="btn-action-orchestrator-container" runat="server">
            <asp:LinkButton ID="btnGoHome" CssClass="btn_action_3 btn-action-orchestrator" Text="<%$FrontEndResources:AccountOpening,SaveForLaterGoHome %>" runat="server" />
        </div>
    </div>
</div>
