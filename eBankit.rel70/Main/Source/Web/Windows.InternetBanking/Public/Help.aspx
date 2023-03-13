<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Popup.Master" CodeBehind="Help.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Help" %>
<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="FeaturedContent">
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:PlaceHolder ID="phHeader" runat="server"></asp:PlaceHolder>
    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
    <asp:Panel ID="pnContent" runat="server">
        <asp:Literal ID="litContent" runat="server"></asp:Literal>
    </asp:Panel>
</asp:Content>
