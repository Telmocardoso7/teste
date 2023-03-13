<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Popup.Master" CodeBehind="DetailContainer.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Security.Transactions.DetailContainer" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:PlaceHolder ID="phHeader" runat="server"></asp:PlaceHolder>
    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
    <it:ProxyTransaction ID="txpTransactions" runat="server" />
</asp:Content>
