<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Base.Master" CodeBehind="CancelCard.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.CancelCard" %>

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
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
        <div style="padding-bottom: 14px;">
            <h2 class="head-error text-responsive-1" style="font-size:24px; font-weight:bold; margin-bottom:0px !important;">
                <asp:Literal ID="cancelcardtitle" Text="<%$FrontEndResources:TRX00210158,Title %>" runat="server"></asp:Literal>
            </h2>
        </div>
        <div id="divWarningMessage" class="metro" style="padding-top: 20px;" runat="server">
            <div class="alert alert-warning fade in" id="MainContent_TransactionMainContent_divMessage">
                <div class="div-warning">
                    <i class="icon-info" style="vertical-align: -8%"></i>
                </div>
                <h4 class="alert-heading">
                    <asp:Literal ID="cancelcardmessage" runat="server"></asp:Literal>
                </h4>
                <div class="clearBoth"></div>
            </div>
        </div>
    </div>

    <div class="clearBoth"></div>

    <script type="text/javascript">
        $(document).ready(function () {
            var tsTimeStampBigestCamp = new Date().getTime();
            $.get("/PublicContentContainer.aspx", {
                action: "get", time: tsTimeStampBigestCamp, controlid: "ErrorCampaignControl", path: "Generic"
            }, function (data) {
                var containerCamp = jQuery("<div></div>").html(data).find(".contentcontainer").html();
                $("#phErrorCampaign").html(containerCamp);

            });
        });
    </script>
</asp:Content>
