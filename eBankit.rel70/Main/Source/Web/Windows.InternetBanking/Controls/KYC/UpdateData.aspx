<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="UpdateData.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Controls.KYC.UpdateData" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Content ID="FeaturedContent" ContentPlaceHolderID="TransactionFeaturedContent" runat="server">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto">
        <h3 class="head head-top">
            <asp:Literal ID="litTitle" Text="<%$FrontEndResources:KYC,UpdateDataTitle%>" runat="server"></asp:Literal>
        </h3>
    </div>

    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="TransactionMainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("KYCUpdate.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />

    <div id="divMainContent" runat="server">
        <section class="grayContainer costumer-data-container" style="margin: 0;">
            <div class="col-lg-8 col-max">
                <div class="contract-img img-container">
                    <img src="<%$ebFile:~/Content/currenttheme/images/IconKYC.png%>" alt="" class="img-icon-kyc" runat="server" />
                </div>
                <div class="contract-title bs-reduced bs-head-metro">
                    <h3 class="head font-head-kyc">
                        <asp:Literal ID="literalHead" runat="server"></asp:Literal>
                    </h3>
                </div>
            </div>
        </section>

        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max trs_buttons">
            <div class="trs_buttons-action">
                <asp:LinkButton ID="btLogOut" runat="server" OnClick="BtLogOut_Click" CssClass="btn btn-default">
                    <asp:Literal ID="litLogOut" Text="<%$FrontEndResources:KYC,BtLogOut%>" runat="server"></asp:Literal>
                </asp:LinkButton>
                <asp:LinkButton ID="btRemind" runat="server" OnClick="BtRemind_Click" CssClass="btn btn-default">
                    <asp:Literal ID="litRemind" Text="<%$FrontEndResources:KYC,BtRemind%>" runat="server"></asp:Literal>
                </asp:LinkButton>
                <asp:LinkButton ID="btVerify" runat="server" OnClick="BtVerify_Click" CssClass="btn btn-primary btn-save">
                    <asp:Literal ID="litVerify" Text="<%$FrontEndResources:KYC,BtVerify%>" runat="server"></asp:Literal>
                </asp:LinkButton>
            </div>
        </div>

    </div>
</asp:Content>

