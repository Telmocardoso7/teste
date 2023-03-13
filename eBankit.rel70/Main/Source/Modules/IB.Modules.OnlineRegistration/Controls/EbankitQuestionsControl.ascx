<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EbankitQuestionsControl.ascx.cs" Inherits="eBankit.UI.Controls.InternetBanking.EbankitQuestionsControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<p class="text-responsive-1-3">
	<asp:Literal ID="litTitleQuestions" runat="server" Text="<%$FrontEndResources:Register,TitleQuestions %>"></asp:Literal>
</p>

<div class="panel-login-inputs panel-register-unlabelled">
	<asp:Repeater ID="rptQuestions" runat="server">
		<ItemTemplate>
			<it:dropdownlistcontrol_v2 id="ddlQuestion" cssclass="field field-labeless" showtooltiplikehelp="true" isrequired="true" tooltipkey="ddlQuestion" runat="server" onkeyup="eBankit.Presentation.RegisterQuestions.ValidateOptions()"/>
			<it:textboxcontrol_v2 id="txtAnswer" cssclass="field field-labeless" showtooltiplikehelp="true" isrequired="true" tooltipkey="txtAnswer" textmode="Password" watermark="<%$FrontEndResources:Register,Answer%>" runat="server" onkeyup="eBankit.Presentation.RegisterQuestions.ValidateAnswer(this)"/>
			<it:flowseparator id="flwSeparator" runat="server" />
		</ItemTemplate>
	</asp:Repeater>
</div>

<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("registerQuestions-2.0.js".ResolveModuleScriptUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>
