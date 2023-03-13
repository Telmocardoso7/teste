<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CoBrowsing.ascx.cs" Inherits="eBankit.UI.Modules.Web.CoBrowsing" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:HiddenField ID="hdnUnbluApykey" runat="server" />
<asp:HiddenField ID="hdnUnbluServer" runat="server" />
<asp:HiddenField ID="jwtUserToken" runat="server" />

<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("~/Modules/CoBrowsing/Scripts/Unblu/visitor.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>

