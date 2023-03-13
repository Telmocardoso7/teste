<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EbankitQuestionsControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.EbankitQuestionsControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div class="panel-enrol-title">
	<asp:Literal ID="litTitleQuestions" runat="server" Text="<%$FrontEndResources:Register,TitleQuestions %>"></asp:Literal>

</div>
<div class="panel-login-inputs panel-register-unlabelled">
	<asp:Repeater ID="rptQuestions" runat="server">
		<ItemTemplate>
			<it:dropdownlistcontrol_v2 id="ddlQuestion" isrequired="true" showlabel="false" runat="server" />
			<it:textboxcontrol_v2 id="txtAnswer" isrequired="true" textmode="Password" watermark="<%$FrontEndResources:Register,Answer%>" runat="server" />
			<it:flowseparator id="flwSeparator" runat="server" />
		</ItemTemplate>
	</asp:Repeater>
</div>

<script type="text/javascript">
	
</script>

<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("registerQuestions-2.0.js".ResolveModuleScriptUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>
