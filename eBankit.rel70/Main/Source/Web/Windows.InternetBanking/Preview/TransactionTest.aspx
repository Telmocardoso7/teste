<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="TransactionTest.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.TransactionTest" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="TransactionFeaturedContent">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
        <section class="featured">
            <div class="bs-reduced metro">
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="fullWidth spacer10"></div>
                        <hgroup class="title">
                            <h3 class="head head-top"><%: Title %></h3>
                            <h3><%: SubTitle %></h3>
                        </hgroup>
                        <div class="clearBoth"></div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </section>
    </div>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("metro.min.js".ResolveJsUrl("metro"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("autoNumeric.js".ResolveJsUrl("Services/Amount"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="TransactionMainContent">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:PlaceHolder ID="phHeaderTransaction" runat="server"></asp:PlaceHolder>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <asp:PlaceHolder ID="phHeader" runat="server"></asp:PlaceHolder>
    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
    <asp:Panel ID="pnContentTop" CssClass="col-lg-12 clearPadding" runat="server">
    </asp:Panel>
    <asp:Panel ID="pnContentMiddle" CssClass="col-lg-12" runat="server"></asp:Panel>
    <div id="divTopOperations" class="col-lg-12" runat="server">
        <asp:PlaceHolder ID="phTopControls" runat="server"></asp:PlaceHolder>
    </div>
    <asp:PlaceHolder ID="phSelector" runat="server"></asp:PlaceHolder>
    <div id="divLeftOperations" class="col-lg-2 col-right clearPadding" runat="server">
        <asp:PlaceHolder ID="phLeftControls" runat="server"></asp:PlaceHolder>
    </div>
    <div id="divRightControls" class="col-lg-2 col-right col-right2" style="padding-left: 0px;" runat="server">
        <asp:PlaceHolder ID="phRightControls" runat="server"></asp:PlaceHolder>
    </div>
    <div id="divRightTransaction" class="col-lg-8 col-left col-transaction clearPadding divRightTransaction" runat="server">
        <asp:UpdatePanel ID="updPanel" runat="server">
            <ContentTemplate>
                <asp:PlaceHolder ID="phMessageTransaction" runat="server"></asp:PlaceHolder>
            </ContentTemplate>
        </asp:UpdatePanel>
        <it:ProxyTransactionTest ID="txpTransactions" runat="server" />
    </div>
    <div id="divBottomOperations" class="col-lg-12 clearPadding" runat="server">
        <asp:PlaceHolder ID="phBottomControls" runat="server"></asp:PlaceHolder>
    </div>
    <div class="clearBoth"></div>
    <script type="text/javascript">
        METRO_AUTO_REINIT = true;

        $(document).ready(function () {
            var elementId = $('[id$=btnCancelFlowItem]').removeAttr("href");
        });
    </script>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("autoNumeric.js".ResolveJsUrl("Services/Amount"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
</asp:Content>
