<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="InvalidPermission.ascx.cs" Inherits="InvalidPermission" %>

<asp:Panel ID="pnControls" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" runat="server">
    <it:FlowInnerContainer CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
        <h2 class="head-error"><asp:Literal ID="Literal1" Text="<%$FrontEndResources:ErroPage,NotAccessMessageTitle %>" runat="server"></asp:Literal></h2>
        <p class="head-error-subtitle"><asp:Literal ID="litMessageSubTitle" Text="<%$FrontEndResources:ErroPage,NotAccessMessageNew %>" runat="server"></asp:Literal></p>
    </it:FlowInnerContainer>
    <div class="clearBoth"></div>
</asp:Panel>
<div class="clearBoth"></div>

