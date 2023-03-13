<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01112_01.ascx.cs" Inherits="TRX01112_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div id="divContent" runat="server" class="transaction-content">
	<it:FlowInnerContainer ID="FlowInnerContainer1" Title="<%$FrontEndResources:TRX01102,flwContractData %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
		<div>
			<it:FlowLabel_v2 ID="flwContract" Label="<%$FrontEndResources:TRX01102,lblContract %>" runat="server" />
		</div>
	</it:FlowInnerContainer>
	<it:FlowInnerContainer ID="flwData1" Title="<%$FrontEndResources:TRX01102,flwNewKey %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
		<div>			
			<it:TextBoxControl_v2 ID="txtoldKey" TextMode="Password" IsRequired="true" pattern=".*\S+.*" Label="<%$FrontEndResources:TRX01102,txtOldKey %>" OnClick="currTxt = txtoldKey;txtoldKey.val('')"  runat="server" />
			<it:TextBoxControl_v2 ID="txtnewKey" TextMode="Password" IsRequired="true" Label="<%$FrontEndResources:TRX01102,txtNewKey %>" OnClick="currTxt = txtnewKey;txtnewKey.val('') " runat="server" />
			<it:TextBoxControl_v2 ID="txtconfirmNewKey" TextMode="Password" IsRequired="true" Label="<%$FrontEndResources:TRX01102,txtConfirmNewKey %>" OnClick="currTxt = txtconfirmKey;txtconfirmKey.val('')" runat="server" />
		    <input type="hidden" runat="server" id="regexPattern" />
		</div>
	</it:FlowInnerContainer>
	<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01112-1.0.js".ResolveJsUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
	<link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01112-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>



