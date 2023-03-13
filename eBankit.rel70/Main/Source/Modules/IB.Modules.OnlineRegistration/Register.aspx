<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/BaseFullRegister.Master" CodeBehind="Register.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Register" %>

<%@ Register TagPrefix="it" Namespace="eBankit.UI.Controls" Assembly="eBankit.UI.Controls" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="HeadContent">
	<link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("styles.css".ResolveModuleCssUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContentFull">
	<style>
        .uploadfile {
            border: 1px solid #0173a7;
            background: white;
            color: #0173a7;
            width: 100%;
            padding-top: 10.5px;
            padding-bottom: 10.5px;
            text-align: center;
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
            height: 40px;
        }

		.carousel-example-generic {
			position: fixed;
			min-width: 100%;
			min-height: 100%;
			width: auto;
			height: auto;
			z-index: -100;
		}

		.videologin {
			position: fixed;
			top: 50%;
			left: 50%;
			min-width: 100%;
			min-height: 100%;
			width: auto;
			height: auto;
			z-index: -100;
			-webkit-transform: translateX(-50%) translateY(-50%);
			transform: translateX(-50%) translateY(-50%);
			background: url('/Content/Themes/ebankIT/images/login/Banner_ebankit.jpg') no-repeat;
			background-size: cover;
			-webkit-transition: 1s opacity;
			transition: 1s opacity;
		}

		.carousel, .item, .active {
			height: 100%;
		}

		.carousel-inner {
			height: 100%;
		}

		#container {
			margin: 0px auto;
			width: 100%;
			height: 320px;
			border: 10px #333 solid;
		}

			#container .photoArea {
				border: 2px dashed white;
				width: 120px;
				height: 180px;
				position: absolute;
				margin-top: 10%;
				margin-left: 30%;
				-webkit-border-radius: 50%;
				-moz-border-radius: 50%;
				border-radius: 50%;
			}

		#videoElement {
			width: 100%;
			height: 100%;
			background-color: #666;
		}

		.canvasvideo {
			width: 100%;
			height: 320px;
		}
	</style>

	<asp:PlaceHolder ID="backLogin" runat="server">
		<img id="imgLogin" src="/Content/Themes/ebankIT/images/logo.png" class="carousel-example-generic" runat="server" />
	</asp:PlaceHolder>

	<div id="ebLogin" class="col-xs-12 col-sm-4">
		<div class="row">
			<div class="col-xs-6">
				<img class="logo img-responsive" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("header/ico_logo_header.png".ResolveImagePath(), eBankit.Common.Sites.Utils.CacheVersionKey.Image) %>" alt="" />
			</div>
			<div class="col-xs-6">
				<div class="noprint langSelector">
					<it:variationcontrol id="VariationControl" runat="server" />
				</div>
			</div>
			<div style="clear: both;"></div>
		</div>
		<asp:PlaceHolder ID="pnRegisterControl" runat="server"></asp:PlaceHolder>
	</div>
	<div style="clear: both;"></div>
	<script type="text/javascript">

		jQuery(document).ready(function () {
			$('.carousel').carousel({
				pause: "false",
				interval: 4000
			});

			$('.carousel').css({ 'margin': 0, 'width': $(window).outerWidth(), 'height': $(window).outerHeight() });
			$('.carousel .item').css({ 'position': 'fixed', 'width': '100%', 'height': '100%' });
			$('.carousel-inner div.item img').each(function () {
				var imgSrc = $(this).attr('src');
				$(this).parent().css({ 'background': 'url(' + imgSrc + ') center center no-repeat', '-webkit-background-size': '100% ', '-moz-background-size': '100%', '-o-background-size': '100%', 'background-size': '100%', '-webkit-background-size': 'cover', '-moz-background-size': 'cover', '-o-background-size': 'cover', 'background-size': 'cover' });
				$(this).remove();
			});

			$(window).on('resize', function () {
				$('.carousel').css({ 'width': $(window).outerWidth(), 'height': $(window).outerHeight() });
			});
		});

		window.onbeforeunload = function () {
			if (!eBankit.Presentation.NoLoading)
				if (typeof (SessionGuid) == 'undefined')
					eBankit.Presentation.BlockPageForNormalRequest();
			$('body').css("position", "");
		};
	</script>
</asp:Content>
