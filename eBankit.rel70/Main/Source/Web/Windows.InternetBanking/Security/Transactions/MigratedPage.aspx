<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Base.Master" CodeBehind="MigratedPage.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Security.Transactions.MigratedPage" %>

<asp:Content runat="server" ID="BodyFeaturedContent" ContentPlaceHolderID="FeaturedContent">
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-9 col-centered metro">
        <h2 class="text-blue">
            <asp:Literal ID="Literal2" Text="<%$FrontEndResources:Login,WellcomeMessage %>" runat="server"></asp:Literal></h2>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-9 col-centered">
        <div class="login-container">
            <p class="text-center text-responsive-1-4">
                <asp:Label ID="lblWellcomeTitle" Text="<%$FrontEndResources:ErroPage,GenericMessageNew3 %>" runat="server"></asp:Label>
            </p>
        </div>
    </div>
    <asp:UpdatePanel ID="upCustomerImage" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-9 col-centered" style="padding-right: 0px;">
                <it:FlowCommandsContainer ID="fcSaveImage" runat="server">
                    <RightButtons>
                        <it:LinkButtonControl ID="btnGoToLanding" runat="server" Text="<%$FrontEndResources:Landingpage,btnGoTo%>" Enabled="true" CssClass="btn btn-action" ActionType="None" OnClick="btnGoToLanding_Click"></it:LinkButtonControl>
                    </RightButtons>
                </it:FlowCommandsContainer>
            </div>
            <div class="clearBoth"></div>
        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>
