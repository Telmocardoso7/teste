<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EbankitUserNameControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.EbankitUserNameControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div class="panel-enrol-title">
	<asp:Literal ID="litTitleUsername" runat="server" Text="<%$FrontEndResources:Enrollment, Contrato %>"></asp:Literal>
</div>
<div class="panel-login-inputs panel-register-unlabelled">
	<it:textboxcontrol_v2 id="txtuserName" showlabel="true" textmode="SingleLine" isrequired="true" watermark="<%$FrontEndResources:Register,Username %>" runat="server" />
</div>
<script type="text/javascript">
	var TextBoxUsername = $('#<%=txtuserName.TextBoxClientID %>');
</script>

<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("registerUsername-2.0.js".ResolveModuleScriptUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>
