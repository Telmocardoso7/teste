<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01171_01.ascx.cs" Inherits="TRX01171_01" %>

<%@ Import Namespace="eBankit.Business.Entities.InternetBanking" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div id="divContent" runat="server" class="transaction-content">
    <asp:UpdatePanel ID="updContent" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div class=" infoArticleMessage col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro bs-reduced-transaction  transp">
                <p class="infoArticleMessage">
                    <asp:Label runat="server" Text="<%$FrontEndResources:TRX01171,DeleteDataInfoArticleMessage %>"></asp:Label>
                </p>
            </div>


            <div class="reasonsWrapper col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro bs-reduced-transaction  transp">
                <div style="display: none;"></div>
                <div class="wrapperDeleteData">
                    <span class="alert-warning_v4"></span>
                    <br />
                    <asp:Label runat="server" CssClass="requestMessageTitle" Text="<%$FrontEndResources:TRX01171,warningRequestTitle %>"></asp:Label>
                    <p></p>
                    <asp:Label runat="server" CssClass="requestMessageDescription" Text="<%$FrontEndResources:TRX01171,warningRequestDescription %>"></asp:Label>
                </div>


                <asp:Label runat="server" CssClass="reasonsTitle" Text="<%$FrontEndResources:TRX01171,reasonsTitle %>"></asp:Label>


                <it:FormRadioList_v3 runat="server" ID="radioButton" CssClass="big-radioButton" />
                <asp:Label runat="server" Text="<%$FrontEndResources:TRX01171,selectReasonError %>" CssClass="errorHidden"></asp:Label>
            </div>


            <input type="hidden" runat="server" id="hdnReasonSelected" class="hdnReasonSelected" />
        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/Services/Transactions/TRX01171-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01171-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />

</div>


