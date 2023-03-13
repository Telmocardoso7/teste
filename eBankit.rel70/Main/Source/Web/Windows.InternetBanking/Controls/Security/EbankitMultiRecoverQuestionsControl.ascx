<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EbankitMultiRecoverQuestionsControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.EbankitMultiRecoverQuestionsControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div class="panel-enrol-title">
	<asp:Literal ID="litTitleQuestions" runat="server" Text="<%$FrontEndResources:Recover,RecoverQuestions %>"></asp:Literal>
</div>
<div class="panel-login-inputs panel-questions">
	<asp:Repeater ID="rptQuestions" runat="server">
		<ItemTemplate>
			<it:TextBoxControl_v2 ID="txtQuestion" IsRequired="true" TextMode="Password" runat="server" Watermark="<%$FrontEndResources:Recover,QuestionWatermark %>"/>
			<it:FlowSeparator ID="flwSeparator" runat="server" />
		</ItemTemplate>
	</asp:Repeater>
</div>

<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("recoverQuestions-1.0.js".ResolveJsUrl("services"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>
