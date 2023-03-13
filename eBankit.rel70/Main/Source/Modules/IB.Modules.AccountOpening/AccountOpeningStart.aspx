<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/BaseFull.Master" CodeBehind="AccountOpeningStart.aspx.cs" Inherits="eBankit.UI.Modules.Web.AccountOpening.AccountOpeningStart" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<asp:Content runat="server" ID="HeadContent" ContentPlaceHolderID="HeadContent">
     <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("styles.css".ResolveModuleCssUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
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
                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 fullHeight clearPadding nMarginLeft15">

                    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
                    <div class="col-lg-12 clearPadding">
                        <div >
                            <div id="linkCampaignImage" class="image-container" style="margin-bottom: 15px;" runat="server">
                                <asp:Image ID="campaignImage"  runat="server" style="width:100%;"  />
                            </div>
                            <div id="divMainContainer" runat="server" visible="false">
                                <asp:Label ID="lblCampaignTitle" CssClass="accountopening-title" Text="<%$FrontEndResources:AccountOpening,StartTitle %>" runat="server" />
                                <br />
                                <asp:Label ID="lblCampaignDescription" CssClass="accountopening-description" Text="<%$FrontEndResources:AccountOpening,StartDescription %>" runat="server" />
                                <asp:Label ID="lblCampainThingsDescription" CssClass="accountopening-description" Text="<%$FrontEndResources:AccountOpening,StartThingsYouWillNeed %>" runat="server" />
                            </div>
                            <div id="divIBContainer" runat="server" visible="false"> 
                                <asp:Label ID="lblIBCampaignTitle" CssClass="accountopening-title" Text="<%$FrontEndResources:AccountOpening,StartTitle %>" runat="server" />
                                <br />
                                <asp:Label ID="lblIBCampaignDescription" CssClass="accountopening-description" Text="<%$FrontEndResources:AccountOpening,StartDescription %>" runat="server" />
                                <asp:Label ID="lblIBCampainThingsDescription" CssClass="accountopening-description" Text="<%$FrontEndResources:AccountOpening,StartThingsYouWillNeed %>" runat="server" />
                            </div>
                        </div>
                        <asp:Literal ID="litCampaign" runat="server"></asp:Literal>
                        <div class="row" style="margin-left: 0px; margin-top: 20px;">
                            <div class="col-lg-3 col-xs-6" style="float:right;">
                                <asp:Button ID="btnStepNext" CssClass="btn btn-primary btn-margin btn-block btn-get-started" Text="<%$FrontEndResources:AccountOpening,GetStarted %>" runat="server" OnClick="btnStepNext_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="clearBoth"></div>

                    <asp:Panel ID="pnNewKey" runat="server">

                    </asp:Panel>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <div class="col-lg-4 col-md-4 col-sm-4 visible-lg visible-md visible-sm accountopening-steps-container">
            <div class="accountopening-steps">
                <ul>
                    <li runat="server" id="liStep1" data-value="0" class="step">
                        <span>
                            <asp:Literal ID="litStepAccountType" Text="<%$FrontEndResources:AccountOpening,StepAccountType %>" runat="server"></asp:Literal>
                        </span>
                    </li>
                    <li runat="server" id="liStepSeparator2" class="accountopening-separator">
                        <div class="accountopening-separator-container"></div>
                    </li>
                    <li runat="server" id="liStep2" data-value="1" class="step">
                        <span>
                            <asp:Literal ID="litStepNewEntity" Text="<%$FrontEndResources:AccountOpening,StepNewEntity %>" runat="server"></asp:Literal>
                        </span>
                    </li>
                    <li runat="server" id="liStepSeparator3" class="accountopening-separator">
                        <div class="accountopening-separator-container"></div>
                    </li>
                    <li runat="server" id="liStep3" data-value="2" class="step">
                        <span>
                            <asp:Literal ID="litStepEntityDetails" Text="<%$FrontEndResources:AccountOpening,StepEntityDetails %>" runat="server"></asp:Literal>
                        </span>
                    </li>
                    
                    <li runat="server" id="liStepSeparator4" class="accountopening-separator">
                        <div class="accountopening-separator-container"></div>
                    </li>
                    <li runat="server" id="liStep4" data-value="3" class="step">
                        <span>
                            <asp:Literal ID="litStepCustom" Text="<%$FrontEndResources:AccountOpening,StepCustom %>" runat="server"></asp:Literal>
                        </span>
                    </li>
                    <li runat="server" id="liStepSeparator5" class="accountopening-separator">
                        <div class="accountopening-separator-container"></div>
                    </li>
                    <li runat="server" id="liStep5" data-value="4" class="step">
                        <span>
                            <asp:Literal ID="litStepConfirm" Text="<%$FrontEndResources:AccountOpening,StepConfirm %>" runat="server"></asp:Literal>
                        </span>
                    </li>
                    <li runat="server" id="liStepSeparator6" class="accountopening-separator">
                        <div class="accountopening-separator-container"></div>
                    </li>
                    <li runat="server" id="liStep6" data-value="5" class="step">
                        <span>
                            <asp:Literal ID="litStepOnlinePassword" Text="<%$FrontEndResources:AccountOpening,StepOnlinePassword %>" runat="server"></asp:Literal>
                        </span>
                    </li>
                </ul>
            </div>
            <div class="register-help">
                <h2>
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
