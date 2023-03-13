<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/BaseFull.Master" CodeBehind="RecoverLogin.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.RecoverLogin" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContentFull">
	<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-centered fullHeight fullWidth clearPadding nMarginLeft15">
		<asp:Panel CssClass="recover" runat="server" ID="tokenPanel">
			<div class="welcomeMessageLogin">
				<asp:Literal ID="Literal2" Text="<%$FrontEndResources:Login,WellcomeMessage %>" runat="server"></asp:Literal>
			</div>
			<div class="recover-message">
				<asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 fullHeight clearPadding ">			
				<div class="col-lg-12 clearPadding">
					<asp:Literal ID="litCampaign" runat="server"></asp:Literal>
				</div>
				<div class="clearBoth"></div>
				<asp:Panel ID="pnSMSToken" runat="server">
					<div class="panel-enrol-title">
						<asp:Literal ID="Literal5" Text="<%$FrontEndResources:Register,SMSTokenTitle %>" runat="server" />
					</div>
					<div class="panel-login-inputs">
						<asp:Label ID="lblSmsTokenMessage" CssClass="panel-line-info-alert" Text="<%$FrontEndResources:Register,SMSTokenMessage %>" runat="server"></asp:Label>
						<asp:Label ID="lblSmsTokenAlert" Text="<%$FrontEndResources:Register,SMSTokenAlert %>" runat="server"></asp:Label>
						<a id="aResendHere" href="#" onclick="eBankit.Presentation.Register.ResendSMS();" runat="server"></a>
                        <asp:Label ID="lblSmsResend" Text="<%$FrontEndResources:Register,ResendSMS%>" runat="server"></asp:Label>
						<it:TextBoxControl_v2 ID="txtSMSToken" MinLength="5" MaxLength="10" TextMode="Password" Label="<%$FrontEndResources:Register,SMSToken%>" runat="server" Watermark="<%$FrontEndResources:Register,SMSToken %>" />
					</div>
				</asp:Panel>
				<div class="clearBoth"></div>
				<asp:Panel ID="pnNewKey" CssClass="panel-margin-top" runat="server">
					<div class="panel-enrol-title">
						<asp:Literal ID="Literal3" Text="<%$FrontEndResources:Register,AccessKeyTitle %>" runat="server" />
					</div>
					<div class="panel-login-inputs">
						<asp:Label ID="Label1" CssClass="panel-line-info-alert" Text="<%$FrontEndResources:Register,NextTimeMessage %>" runat="server"></asp:Label>

						<it:TextBoxControl_v2 ID="txtNewKey" MinLength="7" MaxLength="20" TextMode="Password" Label="<%$FrontEndResources:Register,NewKey %>" runat="server" Watermark="<%$FrontEndResources:Register,NewKeyWatermark %>" />
						<it:TextBoxControl_v2 ID="txtNewKeyConfirm" MinLength="7" MaxLength="20" TextMode="Password" Label="<%$FrontEndResources:Register,NewKeyConfirm %>" runat="server" Watermark="<%$FrontEndResources:Register,NewKeyConfirmWatermark %>" />


						<div class="ValidationMessage">
							<asp:Label ID="lblValidationMessage" Text="<%$FrontEndResources:Register,RegisterMessage %>" runat="server"></asp:Label>
						</div>

					</div>
				</asp:Panel>
				<div class="row marginTop15 noMarginLeft">
					<div class="col-xs-6 visible-lg">
					</div>
					<div class="col-lg-3 col-xs-6">
						<asp:Button ID="btnRegister" CssClass="btn btn-success btn-margin btn-block" Style="margin-top: 10px;" Text="<%$FrontEndResources:Register,Next %>" runat="server" OnClientClick="return eBankit.Presentation.Register.ValidateInputs();" OnClick="btnRegister_Click" />
					</div>
					<div class="col-lg-3 col-xs-6">
						<asp:Button ID="btnCancelQuestions" CssClass="btn btn-cancel btn-margin btn-block" Style="margin-top: 10px;" Text="<%$FrontEndResources:Recover,Cancel %>" runat="server" OnClick="btnCancelQuestions_Click" />
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-12 visible-lg visible-md visible-sm">
				<div class="recover-help" style="margin-top: 0px;">
					<h2>
						<asp:Literal ID="Literal4" Text="<%$FrontEndResources:Register,NeedHelp %>" runat="server"></asp:Literal></h2>
					<div class="help-item">
						<h3>
							<asp:Literal ID="Literal6" Text="<%$FrontEndResources:Register,CallUs %>" runat="server"></asp:Literal></h3>
						<span class="recover-phone">
							<asp:Literal ID="Literal7" Text="<%$FrontEndResources:Register,CellPhoneNumber %>" runat="server"></asp:Literal></span>
						<span class="recover-text">
							<asp:Literal ID="Literal8" Text="<%$FrontEndResources:Register,RegisterInfo %>" runat="server"></asp:Literal></span>
					</div>
				</div>
			</div>
			<div class="clearBoth"></div>
		</asp:Panel>
	</div>
	<div class="clearBoth"></div>

	<asp:HiddenField ID="hdnInputTextField" runat="server" />
	<asp:HiddenField ID="hdnPanelVisible" runat="server" />
	<asp:HiddenField ID="trackLat" runat="server" />
	<asp:HiddenField ID="trackLon" runat="server" />
	<asp:Button ID="btnResendSMS" Style="display: none;" OnClick="btnResendSMS_Click" runat="server" />

	<script type="text/javascript">
		var btnResendSMSId = '<%=btnResendSMS.UniqueID %>';
		var TextBoxNewKey = $('#<%=txtNewKey.TextBoxClientID %>');
		var LabelBoxNewKey = $('#<%=txtNewKey.LabelClientID %>');
		var hdnInputTextField = $('#<%=hdnInputTextField.ClientID %>');
		var hdnPanelVisible = $('#<%=hdnPanelVisible.ClientID %>');
		var TextBoxNewKeyConfirm = $('#<%=txtNewKeyConfirm.TextBoxClientID %>');
		var LabelBoxNewKeyConfirm = $('#<%=txtNewKeyConfirm.LabelClientID %>');
		var txtSMSToken = $('#<%=txtSMSToken.TextBoxClientID %>');

		function getLocation() {
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(showPosition);
			}
		}
		function showPosition(position) {
			var lat = $('[id$=trackLat]');
			lat.val(position.coords.latitude);
			var lon = $('[id$=trackLon]');
			lon.val(position.coords.longitude);
		}

		$(document).ready(function () {
			getLocation();
		});
	</script>

	<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("register-1.0.js".ResolveJsUrl("services"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>
</asp:Content>
