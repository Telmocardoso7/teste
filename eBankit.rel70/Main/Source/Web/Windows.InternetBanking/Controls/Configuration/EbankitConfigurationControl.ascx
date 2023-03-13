<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EbankitConfigurationControl.ascx.cs" Inherits="EbankitConfigurationControl" %>

<div class="fullWidth noFloatOfHidden landingAccountContainer clearPadding paddingTop20 paddingBottom20 bottomBorderInfoTopMessage" runat="server">
    <div class="info-bottom-text col-lg-8 col-max">
        <asp:Label Text="<%$FrontEndResources:UserConfigurations,GenSettingsInfoTop%>" CssClass="infoTopMessage" runat="server"></asp:Label>
    </div>
</div>

<div id="MainForm" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max" runat="server">
    <div id="ConfigurationsContainer" runat="server"></div>
    <it:FlowCommandsContainer ID="fccActionButtons" runat="server">
        <RightButtons>
            <it:LinkButtonControl ID="btnCancel" runat="server" Text="<%$FrontEndResources:UserConfigurations,Cancel%>" Enabled="true" ActionType="Back"
                CustomCssClass="btn-default" OnClick="btnCancel_Click"></it:LinkButtonControl>
            <it:LinkButtonControl ID="btnSubmit" runat="server" ActionType="Conclusion" CustomCssClass="btn-small" Text="<%$FrontEndResources:UserConfigurations,SubmitButton%>"
                OnClick="btnSubmit_Click" />
        </RightButtons>
    </it:FlowCommandsContainer>
</div>
