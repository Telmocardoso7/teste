<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Base.Master" CodeBehind="GenericErrorPage.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.GenericErrorPage" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Content runat="server" ID="BodyFeaturedContent" ContentPlaceHolderID="FeaturedContent">
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
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

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
                <h3 style="font-size: 15px;">
                    <asp:Literal ID="Literal2" Text="<%$FrontEndResources:ErroPage,SubMessage %>" runat="server"></asp:Literal></h3>
            </div>
        </div>
    </section>

    <it:SessionControl ID="ssControl" runat="server" />

    <div class="clearBoth"></div>

    <script type="text/javascript">
        $(document).ready(function () {
            var x = window.top.document.getElementById('divModalAlertV1');
            if (x != undefined) {
                $('.logoContainer ').hide();
                $('.mnuContainer').hide();
                $('.menuContainer').hide();
                $("footer").remove();
                $('.grayContainer').css("background", "#ffffff");
                $('.alert-danger').css("background", "#ffffff");
            }
        });

    </script>

</asp:Content>
