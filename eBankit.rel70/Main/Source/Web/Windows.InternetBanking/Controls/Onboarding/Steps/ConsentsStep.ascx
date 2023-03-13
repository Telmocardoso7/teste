<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ConsentsStep.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Controls.Onboarding.Steps.ConsentsStep" %>

<div>
    <it:PS_OutputMessageControl id="outputMessageControl" runat="server" />

    <%@ Register Src="~/Modules/Subscription/Controls/Onboarding/ConsentsControl.ascx" TagPrefix="it" TagName="ProductStepConsentsControl" %>
    <it:productstepconsentscontrol id="ctrConsents" runat="server" />
</div>
