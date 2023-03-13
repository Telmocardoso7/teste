<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="AlertsAccountSubscription.aspx.cs" Inherits="eBankit.UI.Modules.Web.Alerts.AlertsAccountSubscription" %>

<%@ Register TagPrefix="it" TagName="AlertsAccountConfiguration" Src="Controls/AlertsConfiguration/AlertsAccountConfiguration.ascx" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="TransactionFeaturedContent">
    <div class="col-lg-8 col-max">
        <section class="featured">
            <div class="bs-reduced metro">
                <div id="FeaturedContent_TransactionFeaturedContent_UpdatePanel2">
                    <div class="fullWidth spacer10"></div>
                    <hgroup class="title">
                        <h3 class="head head-top">
                            <asp:Literal ID="Literal6" Text="<%$FrontEndResources:AccountNotifications,Title%>" runat="server"></asp:Literal></h3>
                    </hgroup>
                    <div class="clearBoth"></div>

                </div>
            </div>
        </section>
    </div>

</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="TransactionMainContent">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:PlaceHolder ID="phHeaderTransaction" runat="server"></asp:PlaceHolder>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <asp:PlaceHolder ID="phHeader" runat="server"></asp:PlaceHolder>
    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
    <asp:Panel ID="pnContentTop" CssClass="col-lg-12 clearPadding" runat="server">
    </asp:Panel>
    <asp:Panel ID="pnContentMiddle" CssClass="col-lg-12" runat="server"></asp:Panel>

    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:PlaceHolder ID="phMessageTransaction" runat="server"></asp:PlaceHolder>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="custom-accounts-panel tab-pane metro sortable-list ui-sortable">
        <div class="headerContainer" id="infoTopMessage" runat="server">
            <div class="metro info-bottom-text col-lg-8 col-max heavyMargin">
                <asp:Label ID="lblInfoMessageAccounts" Text="<%$FrontEndResources:AlertsAccountSubscription,InfoTopMessage %>" CssClass="infoTopMessage" runat="server"></asp:Label>
                <br />
                <asp:Label ID="lblMandatoryInfo" Text="" CssClass="infoTopMessage" runat="server" tabindex="0"></asp:Label>
            </div>
        </div>

        <div class="clearBoth marginBottom10"></div>
    </div>
    <asp:PlaceHolder ID="phSelector" runat="server"></asp:PlaceHolder>
    <div id="divRightControls" class="col-lg-2 col-right col-right2" style="padding-left: 0px;" runat="server">
        <asp:PlaceHolder ID="phRightControls" runat="server"></asp:PlaceHolder>
    </div>
    <div id="divRightTransaction" class="col-lg-8 col-max trx-container" runat="server">
        <asp:UpdatePanel ID="updPanel" runat="server">
            <ContentTemplate>
                <asp:Panel ID="configurationPanel" Visible="true" runat="server">
                    <it:alertsaccountconfiguration enableviewstate="true" id="alertsAccountConfigurationControl" runat="server" />
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="clearBoth"></div>
    <script type="text/javascript" src="./Scripts/alertsModule.js"></script>
    <script type="text/javascript" src="./TextBox/CurrencyTextBox/CurrencyTextBoxControlAutoJs/autoNumeric.js"></script>
</asp:Content>
