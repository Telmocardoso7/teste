<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/BaseFullEmpty.Master" CodeBehind="GenericError.aspx.cs" Inherits="eBankit.UI.Modules.Web.AccountOpening.GenericError" %>

<asp:Content runat="server" ID="BodyFeaturedContent" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .submessage {
            margin-left: 10%;
            padding-top: 10px;
            color: #3BA1D1;
        }

        @media (min-width: 480px) {
            .submessage {
                margin-left: 85px;
            }
        }
    </style>

</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContentFull">

<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto">
    <hgroup class="title">
        <h3 class="head head-top">
            <asp:Literal ID="Literal1" Text="<%$FrontEndResources:ErroPage,GenericMessageTitle %>" runat="server"></asp:Literal>
        </h3>
    </hgroup>
</div>

<section class="grayContainer content-message metro">
    <div class="col-lg-8 col-max">
        <div class="alert-danger fade in col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
            <div class="div-icon-danger_v2"></div>
            <h4 class="head-error" style="font-size: 17px;">
                <asp:Literal ID="litTitleWarning" Text="<%$FrontEndResources:ErroPage,GenericMessageNew2 %>" runat="server"></asp:Literal>
            </h4>
            <h3 style="font-size: 15px;"><asp:Literal ID="Literal2" Text="<%$FrontEndResources:ErroPage,SubMessage %>" runat="server"></asp:Literal></h3>
        </div>
    </div>
</section>
<div class="clearBoth"></div>

</asp:Content>
