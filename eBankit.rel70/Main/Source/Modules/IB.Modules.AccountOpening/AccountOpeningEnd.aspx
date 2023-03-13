<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/BaseFull.Master" CodeBehind="AccountOpeningEnd.aspx.cs" Inherits="eBankit.UI.Modules.Web.AccountOpening.AccountOpeningEnd" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<asp:Content runat="server" ID="HeadContent" ContentPlaceHolderID="HeadContent">
     <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("styles.css".ResolveModuleCssUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</asp:Content>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="MainContentHead">
    <div id="divRightTransaction" class="col-lg-12 success-panel" runat="server">
        <div class="col-xs-12 col-sm-12 col-md-11 col-lg-10">
            <asp:Panel runat="server" ID="DisplayResult" CssClass="contentSuccessMsg col-lg-10 col-xs-12  col-sm-12 col-md-12">
                <asp:Label runat="server" ID="Label2" CssClass="success-mark" Text="&#10003;"></asp:Label>    
                <asp:Label runat="server" ID="lblResultMessage" Text="<%$FrontEndResources:AccountOpening,SuccessMessage%>"></asp:Label>
            </asp:Panel>
        </div>
    </div>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContentFull">
    
    <asp:Panel CssClass="register" runat="server" ID="registerPanel">

        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-centered fullWidth clearPadding nMarginLeft15">
            <div class="main-title-control intPosition-title">
                <asp:Label ID="lblTitle" CssClass="titleAccOp" Text="<%$FrontEndResources:AccountOpening,FormTitle%>" runat="server"></asp:Label>
            </div>
            <div class="main-title-control intPosition-title divSubTitle">
                <asp:Label ID="Label1" CssClass="subtitleAccOp" Text="<%$FrontEndResources:AccountOpening,FormSubTitle%>" runat="server"></asp:Label>
            </div>
        </div>
     
        <asp:UpdatePanel ID="updatePanel" runat="server">
            <ContentTemplate>
                <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 fullHeight clearPadding nMarginLeft15 accountopening-panel-end" style="padding-top:100px;">

                    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
                    <div class="col-lg-12 clearPadding">
                        <div>
                            <div id="linkCampaignImage" class="image-container" style="margin-bottom: 15px;" runat="server">
                                <asp:Image ID="campaignImage" runat="server" />
                            </div>
                            <div>
                                <div id="divMainContent" runat="server">
                                    <asp:Label ID="lblEndTitle1" CssClass="accountopening-title" runat="server" Text="<%$FrontEndResources:AccountOpening,EndTitle1%>" />
                                </div>

                                <div id="divInternetBankingContent" runat="server">
                                    <asp:Label ID="lblEndTitle1IB" CssClass="accountopening-title" runat="server" Text="<%$FrontEndResources:AccountOpening,EndTitle1IB%>" />
                                    <br /> 
                                    <br />
                                    <asp:Label ID="lblEndTitle2IB" CssClass="accountopening-title" runat="server" Text="<%$FrontEndResources:AccountOpening,EndTitle2%>" />
                                    <asp:Label ID="lblEndDescription1IB" CssClass="accountopening-description" runat="server" Text="<%$FrontEndResources:AccountOpening,EndDescription1%>" />
                                    <asp:Label ID="lblEndDescription2IB" CssClass="accountopening-description" runat="server" Text="<%$FrontEndResources:AccountOpening,EndDescription2%>" />
                                    <asp:Label ID="lblEndDescription3IB" CssClass="accountopening-title" runat="server" Text="<%$FrontEndResources:AccountOpening,EndDescription3%>" />
                                </div>

                            </div>
                        </div>
                        
                        <div id="divMainLoginContainer" runat="server" >
                            <!-- TO FILL -->
                        </div>

                        <div id="divInternetBankingLoginContainer" runat="server" class="row" style="margin-left: 0px; margin-top: 20px;">
                            <div class="col-lg-3 col-xs-6 btn-get-login-container ">
                                <asp:Button ID="btnLogin" CssClass="btn btn-warning btn-margin btn-block btn-get-Login" Text="<%$FrontEndResources:AccountOpening,GoToLogin %>" runat="server" OnClick="btnStepNext_Click" />
                            </div>
                        </div>

                        <div>
                            <div id="divMainMailingContent" runat="server">
                                <asp:Label ID="lblEndDescription4" CssClass="accountopening-description" runat="server" Text="<%$FrontEndResources:AccountOpening,EndDescription4%>" />
                                <asp:Label ID="lblEndDescription5" CssClass="accountopening-description" runat="server" Text="<%$FrontEndResources:AccountOpening,EndDescription5%>" />
                            </div>

                            <div id="divInternetBankingMailingContent" runat="server">
                                <asp:Label ID="lblEndDescription4IB" CssClass="accountopening-description" runat="server" Text="<%$FrontEndResources:AccountOpening,EndDescription4IB%>" />
                                <asp:Label ID="lblEndDescription5IB" CssClass="accountopening-description" runat="server" Text="<%$FrontEndResources:AccountOpening,EndDescription5%>" />
                            </div>
                        </div>

                    </div>
                    <div class="clearBoth"></div>

                    <asp:Panel ID="pnNewKey" runat="server">

                    </asp:Panel>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <div class="col-lg-4 col-md-4 col-sm-12 visible-lg visible-md visible-sm" style="margin-top:20px;">
            <div class="register-help" style="margin-top:100px;">
                <h2 style="margin-top:0px;">
                    <asp:Literal ID="Literal4" Text="<%$FrontEndResources:Register,NeedHelp %>" runat="server"></asp:Literal></h2>
                <div class="help-item">
                    <h3>
                        <asp:Literal ID="Literal5" Text="<%$FrontEndResources:Register,CallUs %>" runat="server"></asp:Literal></h3>
                    <span class="register-phone">
                        <asp:Literal ID="Literal6" Text="<%$FrontEndResources:Register,CellPhoneNumber %>" runat="server"></asp:Literal></span>
                    <span class="register-text">
                        <asp:Literal ID="Literal7" Text="<%$FrontEndResources:Register,RegisterInfo %>" runat="server"></asp:Literal></span>
                </div>
            </div>
        </div>

        <div class="clearBoth"></div>
    </asp:Panel>
    <div class="clearBoth"></div>
</asp:Content>
