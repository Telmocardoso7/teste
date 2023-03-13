<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CredentialNoAuthorization.ascx.cs" Inherits="CredentialNoAuthorization" %>
<div class="col-lg-12 col-left" style="padding-right: 0px; padding-left: 0px;">
    <it:Crumbs ID="crbsTransaction" runat="server" EnableViewState="false" IsInternetBanking="true" />
</div>
<div class="clearBoth"></div>
<section class="content-message metro col-lg-8 col-max">
    <div class="alert alert-success fade in" id="MainContent_TransactionMainContent_divMessage">
        <div class="div-icon-success_v2"><i class=""></i></div>
        <h3 class="alert-heading"><asp:Literal ID="litAlertTitle" Text="<%$GenericFrontEndResources:AlertTitle%>" runat="server"></asp:Literal></h3>
        <h4 class="alert-heading"><asp:Literal ID="litCredentialTitle" Text="<%$FrontEndResources:CredentialNoAuthorization,CredentialTitle%>" runat="server"></asp:Literal></h4>
        <div class="clearBoth"></div>
    </div>
</section>
<div style="margin-left: 15px;">
    <it:FlowInnerContainer ID="flHeaderTitle" CustomCssClass="col-max bs-reduced bs-inner-border" HideTitle="true" runat="server">
        <section id="authentForm" class="credential">
            <p>
                <asp:Literal Text="<%$FrontEndResources:CredentialNoAuthorization,NoCredentialMessage %>" runat="server"></asp:Literal>
            </p>
            <div class="clearBoth"></div>
        </section>
        <div class="clearBoth"></div>
    </it:FlowInnerContainer>
</div>
