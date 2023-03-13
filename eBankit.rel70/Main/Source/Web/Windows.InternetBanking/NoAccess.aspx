<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Base.Master" CodeBehind="NoAccess.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.NoAccess" %>

<asp:Content runat="server" ID="BodyFeaturedContent" ContentPlaceHolderID="FeaturedContent">
   
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2 class="head-error"><asp:Literal ID="Literal1" Text="<%$FrontEndResources:ErroPage,NotAccessMessageTitle %>" runat="server"></asp:Literal></h2>
    <p class="head-error-subtitle"><asp:Literal ID="litMessageSubTitle" Text="<%$FrontEndResources:ErroPage,NotAccessMessageNew %>" runat="server"></asp:Literal></p>
</asp:Content>
