<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EbankitUserNameControl.ascx.cs" Inherits="eBankit.UI.Controls.InternetBanking.EbankitUserNameControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<p class="text-responsive-1-3">
	<asp:Literal ID="litTitleUsername" runat="server" Text="<%$FrontEndResources:Register,TitleUsername %>"></asp:Literal>
</p>

<div class="panel-login-inputs panel-register-unlabelled">
	<it:textboxcontrol_v2 id="txtuserName" cssclass="field field-labeless" showlabel="true" textmode="SingleLine" isrequired="true" watermark="<%$FrontEndResources:Register,Username %>" runat="server" />
</div>

<script type="text/javascript">
	var TextBoxUsername = $('#<%=txtuserName.TextBoxClientID %>');
</script>

<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("registerUsername-2.0.js".ResolveModuleScriptUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>
