<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Popup.Master" AutoEventWireup="true" CodeBehind="TicketDetails.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Security.Transactions.TicketDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel-favorit" style="border: 0;">
        <div style="margin-top: 10px; margin-bottom: 20px; margin-right: 35px; text-align: center; padding-bottom:30px;">
            <div class="img-operation-div">
                <span class="img-operation-span"></span>
                <img id="imgOperationType" style="margin-bottom:20px;" src="<%$ebFile:~/Content/currenttheme/images/icon/ico_products_operations_available.png%>" alt="" class="img-operation" runat="server" />
                <h3>
                    <asp:Literal runat="server" Text="<%$FrontEndResources:TRX01702_details,TicketDetailsTitle%>"></asp:Literal></h3>
            </div>
        </div>

        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro bs-popup  transp" style="margin-top: 40px;">
            <it:FlowLabel_v3 ID="flwProcessId" Label="<%$FrontEndResources:TRX01702_details,processId%>" runat="server" />
            <it:FlowLabel_v3 ID="flwTitle" Label="<%$FrontEndResources:TRX01702_details,title%>" runat="server" />
            <it:FlowLabel_v3 ID="flwDescription" Label="<%$FrontEndResources:TRX01702_details,description%>" runat="server" />
            <it:FlowLabel_v3 ID="flwProcessState" Label="<%$FrontEndResources:TRX01702_details,processState%>" runat="server" />
            <it:FlowLabel_v3 ID="flwCreationDate" Label="<%$FrontEndResources:TRX01702_details,creationDate%>" runat="server" />
            <it:FlowLabel_v3 ID="flwResolution" Label="<%$FrontEndResources:TRX01702_details,resolution%>" runat="server" />
        </div>
        <div class="clearBoth"></div>
    </div>
</asp:Content>
