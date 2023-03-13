<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="OnlinePassword.ascx.cs" Inherits="eBankit.UI.Modules.Web.AccountOpening.OnlinePassword" %>

<asp:UpdatePanel ID="updatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
    <ContentTemplate>
        <div id="scroolContent" class="col-xs-12 col-sm-12 col-md-10 col-lg-12 controlsShowHide metro content-accounts overflowHidden panel-choose">
        <asp:Label ID="Label1" runat="server" class="title-product-account" Text="<%$FrontEndResources:AccountOpening,InternetBankingStepTitle %>"></asp:Label>
            <ul id="sliderLoanProducts" class="bxsliderprods">
                <li class="col-xs-12 col-sm-12 col-md-10 col-lg-12 accountopening-ib-element" >
                    <div id="descAccount" runat="server" class="col-xs-12 col-sm-12 col-md-12 col-lg-11 account-element">
                        <div class="col-xs-8 accountopening-ib-panel-image">
                            <asp:Image ID="divInternetBankingImage" runat="server" ImageUrl="<%$ebFile:~/currentmodule/Content/currenttheme/images/accounttype_youth.png%>" />
                        </div>
                        <div class="col-xs-2 accountopening-ib-panel-label">
                            <asp:Label ID="lblInternetBankingTitle" CssClass="accountopening-ib-title" runat="server" Text="<%$FrontEndResources:AccountOpening,InternetBankingProductTitle %>" />    
                            <asp:Label ID="lblInternetBankingDescription" CssClass="accountopening-ib-content" Text="<%$FrontEndResources:AccountOpening,InternetBankingProductDescription %>" runat="server" />
                        </div>
                    </div>
                </li>
                <div style="clear:both;"></div>
            </ul>
            <div class="accountopening-ib-password-panel">
                <div class="col-xs-6 passfield" >
                    <it:TextBoxControl ID="txtPassword" Width="100%" ShowLabel="true" TextMode="Password" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,InternetBankingPassword %>" runat="server" />
                </div>
                <div class="col-xs-6 passfield" >  
                    <it:TextBoxControl ID="txtPasswordConfirm" Width="100%" ShowLabel="true" TextMode="Password" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,InternetBankingPasswordConfirm %>" runat="server" />
                </div>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
