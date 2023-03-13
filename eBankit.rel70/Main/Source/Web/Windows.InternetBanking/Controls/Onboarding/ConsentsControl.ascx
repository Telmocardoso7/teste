<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ConsentsControl.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Controls.Onboarding.ConsentsControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div Id="divConsentContainer" runat="server">
    <h2>
        <asp:Literal Id="litTitle" Text="<%$FrontEndResources:Onboarding,ConsentTitle%>" runat="server"></asp:Literal>
    </h2>

    <asp:Repeater Id="rptConsent" runat="server">
        <ItemTemplate>
            <div class="consent-item" data-consent-id='<%# Eval("ConsentId") %>' data-consent-version='<%# Eval("VersionId") %>'>
                <div class="consent-content">
                    <asp:Literal ID="ConsentContent" Text='<%# Eval("Content.Content") %>' runat="server"></asp:Literal>
                </div>

                <div class="btn-consent-wrapper">
                    <div id="RejectContainer" class="btn-consent-container" Visible='<%# Convert.ToBoolean(Eval("IsMandatory")) != true %>' runat="server">
                        <asp:Button Id="RejectBtn" CssClass="btn-consent btn-consent-next btn-consent-reject"
                            Text="<%$FrontEndResources:Onboarding,ConsentReject %>" runat="server" />
                        <p class="text-center">
                            <asp:Literal Id="RejectContent" Text='<%# Eval("Content.DeclineContent") %>' Visible='<%# Convert.ToBoolean(Eval("IsMandatory")) != true %>' runat="server"></asp:Literal>
                        </p>
                    </div>

                    <div class="btn-consent-container">
                        <asp:Button Id="AcceptBtn" CssClass="btn-consent btn-consent-next btn-consent-accept"
                            Text="<%$FrontEndResources:Onboarding,ConsentAccept %>" runat="server" />
                        <p class="text-center">
                            <asp:Literal Id="AcceptContent" Text='<%# Eval("Content.AcceptContent") %>' runat="server"></asp:Literal>
                        </p>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>

<div Id="divEmptyMessage" visible="false" runat="server">
    <asp:Label Id="lblEmpty" class="col-xs-12 searchBarContainer" Text="<%$FrontEndResources:Onboarding,ConsentEmpty%>" CssClass="text-responsive-1-3" runat="server"></asp:Label>
</div>

<%--  Inputs for orchestration   --%>
<input Id="txtConsentData" type="hidden" runat="server" />
<asp:LinkButton Id="ExecuteTrigger" CssClass="btn-consent-trigger" Text="Trigger" runat="server" />