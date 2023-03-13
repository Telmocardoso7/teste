<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.LoginControl" %>
<asp:LoginView ID="logvLogin" runat="server" ViewStateMode="Disabled">
    <AnonymousTemplate>
    </AnonymousTemplate>
    <LoggedInTemplate>
    </LoggedInTemplate>
</asp:LoginView>
<div class="login-button desktop-only tablet-only metro noprint" id="divLogin" runat="server">
    <i class="icon-switch"></i>
    <asp:LinkButton ID="btnLogoutLink" Text="<%$FrontEndResources:Login,Logout %>" OnClick="btnLogoutLink_Click" CausesValidation="false" runat="server" OnClientClick="javascript:return closeIntegrations();"></asp:LinkButton>
</div>

<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/IntegrationUtils.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>