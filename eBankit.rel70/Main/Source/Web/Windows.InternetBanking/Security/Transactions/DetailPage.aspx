<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Popup.Master" CodeBehind="DetailPage.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Security.Transactions.DetailPage" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="FeaturedContent">
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:PlaceHolder ID="phHeader" runat="server"></asp:PlaceHolder>
    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
    <div class="panel-favorit" style="border: 0;" id="divMain">
        <div style="margin-top: 15px; margin-bottom: 15px;">
            <asp:Panel ID="pnlTitle" Style="padding: 10px 0px 0px; padding-left: 50px; padding-right: 50px; min-height: 200px" runat="server">
                <div class="clearBoth"></div>
            </asp:Panel>
            <div class="clearBoth"></div>
        </div>

        <div style="border-top: 1px @brand-primary solid; margin-right: 50px; margin-left: 50px; margin-bottom: 25px;"></div>
        <asp:Panel ID="pnControls" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12" Style="padding: 10px 0px; padding-left: 50px !important; padding-right: 50px !important; min-height: 100px" runat="server">
            <div class="clearBoth"></div>
        </asp:Panel>

        <asp:Panel ID="Panel1" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12" Style="padding: 10px 0px; padding-left: 50px !important; padding-right: 50px !important;" runat="server">
            <input type="button" id="btnAuthorizeOperation" class="btn btn-primary btnAuthorizeRight" value="<%$FrontEndResources:TRX01010,Authorize%>" runat="server" />
            <div class="clearBoth"></div>
        </asp:Panel>
    </div>
    <div class="clearBoth"></div>

    <style type="text/css">
        .field .label-left {
            display: inline-block !important;
            width: 40% !important;
            text-align: right !important;
            padding: 2px 30px 5px 5px !important;
            letter-spacing: 0.01em !important;
            float: left !important;
            font-family: "Gotham Book" !important;
            font-size: 14px !important;
            color: rgb(1, 115, 167) !important;
        }
    </style>
</asp:Content>


