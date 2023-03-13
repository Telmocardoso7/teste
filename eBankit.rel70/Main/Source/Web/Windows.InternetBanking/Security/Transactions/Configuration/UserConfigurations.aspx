<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="UserConfigurations.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Security.Transactions.Configuration.UserConfigurations" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="TransactionFeaturedContent">
    <div class="col-lg-8 col-max">
        <section class="featured">
            <div class="bs-reduced metro">
                <div id="FeaturedContent_TransactionFeaturedContent_UpdatePanel2">
                    <div class="fullWidth spacer10"></div>
                    <hgroup class="title">
                        <h3 class="head head-top">
                            <asp:Literal ID="Literal6" Text="<%$FrontEndResources:UserConfigurations,Title%>" runat="server"></asp:Literal></h3>
                        <h3></h3>
                    </hgroup>
                    <div class="clearBoth"></div>

                </div>
            </div>
        </section>
    </div>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="TransactionMainContent">
    <asp:PlaceHolder ID="phHeader" runat="server"></asp:PlaceHolder>
    <div class="message-custom-page">
        <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
    </div>
    <div id="TransactionContent" runat="server"></div>
</asp:Content>

