<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Popup.Master" CodeBehind="RenewSessionPage.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Controls.Core.RenewSessionPage" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<%@ Import Namespace="eBankit.Common.InternetBanking.Utils" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <asp:Button ID="btnRenewSession" CssClass="btn-renew" Style="display: none" runat="server" OnClick="BtnRenewSession_Click" />

    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/ebankitControls/session/renew-session-control.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
</asp:Content>
