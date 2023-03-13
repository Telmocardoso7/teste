<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/BaseFullEmpty.Master" CodeBehind="LandingPagePreview.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.LandingPagePreview" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContentFull">
    <style type="text/css">
        .landing-preview {
            background-image: url('/preview/content/Images/landingpagepreview.png');
            background-repeat: no-repeat;
            background-position: 0px 0px;
            height: 2338px;
        }

        .content-container {
            width: 332px;
            height: 303px;
            border: solid 1px #b4b4b4;
            display: inline-block;
            position: absolute;
            bottom: 382px;
            background-color: #ffffff;
            opacity: .5;
        }

        .content-container:after {
            content: "Edit content";
            font-size: 64px;
            position: absolute;
            top: 35px;
            left: 20px;
            text-align: center;
            color: #b4b4b4;
        }

        .content-container:hover, .content-container.content-selected {
            border: solid 5px #808080;
            opacity: 0;
            cursor: pointer;
        }

        .content-container.content-1 {
            margin-left: 170px;
        }

        .content-container.content-2 {
            margin-left: 503px;
        }

        .content-container.content-3 {
            margin-left: 836px;
        }
    </style>
    <script type="text/javascript">
        jQuery(document).ready(function () {

        });

        function SelectContent(contentId) {
            $('.content-container').removeClass('content-selected');
            $('.content-' + contentId).addClass('content-selected');
        }
    </script>
    <div id="ebLandingpagePreview" class="col-xs-12 landing-preview">
        <div class="content-container content-1" onclick="SelectContent(1);"></div>
        <div class="content-container content-2" onclick="SelectContent(2);"></div>
        <div class="content-container content-3" onclick="SelectContent(3);"></div>
    </div>
</asp:Content>
