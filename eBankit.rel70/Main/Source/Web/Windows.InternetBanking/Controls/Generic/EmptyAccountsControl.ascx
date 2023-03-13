<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EmptyAccountsControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.Controls.Generic.EmptyAccountsControl" %>

<section>
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced bs-head-metro transp emptyaccount-container">
        <div>
            <img src="<%= eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("warning_no_access.svg"), eBankit.Common.Sites.Utils.CacheVersionKey.Image) %>" />
        </div>

        <h3>
            <asp:Literal ID="litTitleWarning" Text="<%$FrontEndResources:EmptyAccounts,litTitleWarning %>" runat="server"></asp:Literal>
        </h3>

        <h4>
            <asp:Literal ID="litSubMessage" Text="<%$FrontEndResources:EmptyAccounts,litSubMessage %>" runat="server"></asp:Literal>
        </h4>

        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-left clearPadding">
            <div id="Canceldelegate" class="col-xs-12 col-sm-4 col-sm-offset-4" runat="server" visible="false">
                <asp:LinkButton runat="server" ID="btnCanceldelegate" class="btn-emptyaccount btn btn-default" Text="<%$FrontEndResources:EmptyAccounts,GoBackButton%>"></asp:LinkButton>
            </div>
            <div id="warningActions" runat="server">
                <div class="col-xs-12 col-sm-4 col-sm-offset-2">
                    <asp:LinkButton runat="server" ID="btnCancel" class="btn-emptyaccount btn btn-default" Text="<%$FrontEndResources:EmptyAccounts,GoBackButton%>"></asp:LinkButton>
                </div>
                <div class="col-xs-12 col-sm-4">
                    <asp:LinkButton runat="server" ID="btnOpenAcc" CssClass="btn-emptyaccount btn btn-primary" Text="<%$FrontEndResources:EmptyAccounts,GoOpenAccountButton%>"></asp:LinkButton>
                </div>
            </div>
        </div>
    </div>
</section>
