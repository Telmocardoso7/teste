<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Base.Master" CodeBehind="Content.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Content" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-centered">
        <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding: 5px; margin-top: 10px;">
            <asp:Literal ID="phContent" runat="server"></asp:Literal>
        </div>
        <div class="clearBoth"></div>
    </div>
</asp:Content>





