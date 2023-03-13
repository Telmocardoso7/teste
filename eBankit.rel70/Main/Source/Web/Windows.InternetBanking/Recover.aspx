<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/BaseFullRegister.Master" CodeBehind="Recover.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Recover" %>

<%@ Register TagPrefix="it" Namespace="eBankit.UI.Controls" Assembly="eBankit.UI.Controls" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="HeadContent">
	<link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("Recover.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContentFull">
	<asp:PlaceHolder ID="backLogin" runat="server">
		<img id="imgLogin" src="/Content/Themes/ebankIT/images/logo.png" class="carousel-example-generic" runat="server" />
	</asp:PlaceHolder>

	<div id="ebLogin" class="col-xs-12 col-sm-4">
		<div class="row">
			<div class="col-xs-6">
				<img class="logo img-responsive" src="<%=eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("header/ico_logo_header.png"),Utils.CacheVersionKey.Image) %>" alt="" />
			</div>
			<div class="col-xs-6">
				<div class="noprint langSelector">
					<it:variationcontrol id="VariationControl" runat="server" />
				</div>
			</div>
			<div style="clear: both;"></div>
		</div>
		<asp:PlaceHolder ID="pnRecoverControl" runat="server"></asp:PlaceHolder>
	</div>
	<div style="clear: both;"></div>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/Services/loginBackground-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Content/Themes/ebankIT/components/LoginBackground.css", eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</asp:Content>
