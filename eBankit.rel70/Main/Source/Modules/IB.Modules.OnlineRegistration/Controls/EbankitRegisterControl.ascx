<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EbankitRegisterControl.ascx.cs" Inherits="eBankit.UI.Controls.InternetBanking.EbankitRegisterControl" %>

<%@ Register TagPrefix="it" Namespace="eBankit.UI.Controls" Assembly="eBankit.UI.Controls" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div class="col-lg-12 clearPadding">
	<asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
</div>
<div class="clearBoth"></div>

<asp:Panel ID="pnUserData" runat="server">
	<div class="panel-enrol-title">
		<asp:Literal ID="litStep1TopMessage" runat="server" Text="<%$FrontEndResources:Subscription,ContractStep1 %>"></asp:Literal>
	</div>
	<div class="panel-login-inputs">
		<asp:HiddenField ID="hdnDocumentType" runat="server" />
		<it:textboxcontrol_v2 id="txtName" showlabel="true" textmode="SingleLine" isrequired="true" label="<%$FrontEndResources:Register,Name %>" runat="server" watermark="<%$FrontEndResources:Register,NameWatermark %>" />
		<it:textboxcontrol_v2 id="txtAccount" showlabel="true" minlength="7" maxlength="26" isrequired="true" textmode="SingleLine" label="<%$FrontEndResources:Register,AccountNumber %>" runat="server" watermark="<%$FrontEndResources:Register,AccountNumberWatermark %>" />
		<it:textboxcontrol_v2 id="txtTaxID" minlength="9" maxlength="9" isrequired="true" watermark="<%$FrontEndResources:Register,TaxID %>" label="<%$FrontEndResources:Register,TaxID %>" runat="server" />

		<it:formradiolist_v3 id="frlDocumentType" runat="server" cssclass="big-radioButton" labeltext="<%$FrontEndResources:Register,DocumentNumber %>" repeatdirection="Horizontal" hidelabel="false" />

		<div id="divCitizenID" class="field-own" runat="server">
			<it:textboxcontrol_v2 id="txtID" showlabel="true" minlength="7" maxlength="20" textmode="SingleLine" label="<%$FrontEndResources:Register,CitizenID %>" runat="server" watermark="<%$FrontEndResources:Register,CitizenIDWatermark %>" />
			<it:datepickertextboxmetrocontrol_v3 id="dtIDValidate" runat="server" width="100px" cssclass="field field_v2 metro break datepicker-borderless"
				label="<%$FrontEndResources:Register,dtDocumentIDValidate%>" 
				validationmindatemessage="<%$FrontEndResources:Register,dtDocumentIDValidateMinDateMessage %>"
				validationrequiredmessage="<%$FrontEndResources:Register,dtDocumentIDValidateRequiredMessage %>"
				validationmessage="<%$FrontEndResources:Register,dtDocumentIDValidateMessage %>" />
		</div>
		<div id="divPassport" class="hidden" runat="server">
			<it:textboxcontrol_v2 id="txtPassport" minlength="9" maxlength="9" watermark="<%$FrontEndResources:Register,PassportNumber %>" label="<%$FrontEndResources:Register,PassportNumber %>" runat="server" />
			<it:datepickertextboxmetrocontrol_v3 id="dtPassport" runat="server" width="100px" cssclass="field field_v2 metro break datepicker-borderless"
				label="<%$FrontEndResources:Register,dtPessportValidate%>" 
				validationmindatemessage="<%$FrontEndResources:Register,dtPessportValidateMinDateMessage %>"
				validationrequiredmessage="<%$FrontEndResources:Register,dtPessportValidateRequiredMessage %>"
				validationmessage="<%$FrontEndResources:Register,dtPessportValidateMessage %>" />
		</div>
		<it:textboxcontrol_v2 id="txtEmail" minlength="7" maxlength="200" isrequired="true" label="<%$FrontEndResources:Register,Email %>" watermark="<%$FrontEndResources:Register,Email %>" runat="server" />
		<it:numbertextboxcontrol_v3 id="txtPhone" showtooltiplikehelp="true" tooltipkey="txtRegisterPhone" tooltipplacement="right" watermark="<%$FrontEndResources:Register,txtPhoneWatermark %>" minlength="7" maxlength="20" isrequired="true" label="<%$FrontEndResources:Register,Phone %>" runat="server" />
	</div>
	<div class="row marginTop15">
		<div class="col-xs-6 visible-lg">
		</div>
		<div class="col-lg-3 col-xs-6">
			<asp:Button ID="Button1" CssClass="btn btn-default btn-margin btn-block" Text="<%$FrontEndResources:Register,Cancel %>" runat="server" />
		</div>
		<div class="col-lg-3 col-xs-6">
			<asp:Button ID="btnRegister" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Register,Next %>" runat="server" OnClientClick="return eBankit.Presentation.Register2.ValidateRegister();" />
		</div>
	</div>
</asp:Panel>
<asp:Panel ID="pnSecurityQuestions" runat="server" Visible="false">
	<div class="panel-enrol-title">
		<asp:Literal ID="litStep2QuestionsTopMessage" runat="server" Text="<%$FrontEndResources:Subscription,ContractStep2 %>"></asp:Literal>
	</div>
	<div class="panel-login-inputs">
		<div id="questions">
			<asp:Repeater ID="rptSecurityQuestions" runat="server">
				<ItemTemplate>
					<it:dropdownlistcontrol_v2 id="ddlQuestion" isrequired="true" label="<%$FrontEndResources:TRX01150,ddlQuestion%>" runat="server" />
					<it:textboxcontrol_v2 id="txtAnswer" isrequired="true" textmode="Password" label="<%$FrontEndResources:TRX01150,txtAnswer%>" runat="server" />
					<it:flowseparator id="flwSeparator" runat="server" />
				</ItemTemplate>
			</asp:Repeater>
		</div>
	</div>
	<div class="row marginTop15 noMarginLeft">
		<div class="col-xs-6 visible-lg">
		</div>
		<div class="col-lg-3 col-xs-6">
			<asp:Button ID="Button4" CssClass="btn btn-default btn-margin btn-block" Text="<%$FrontEndResources:Register,Cancel %>" runat="server" />
		</div>
		<div class="col-lg-3 col-xs-6">
			<asp:Button ID="Button5" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Register,Next %>" runat="server" OnClientClick="return eBankit.Presentation.Register2.ValidateQuestions();" />
		</div>
	</div>

</asp:Panel>
<asp:Panel ID="pnSecurityImages" runat="server" Visible="false">
	<div class="panel-enrol-title">
		<asp:Literal ID="litStep2ImagesTopMessage" runat="server" Text="<%$FrontEndResources:Subscription,ContractStep2 %>"></asp:Literal>
	</div>
	<div class="panel-login-inputs">
		<asp:HiddenField ID="hdnSelectedImageId" runat="server" />
		<asp:HiddenField ID="hdnHasImage" runat="server" />
		<asp:HiddenField ID="hdnHasCaption" runat="server" />

		<div id="securityImagesList" class="image-container-control">
			<asp:Repeater ID="rptSecurityImages" runat="server">
				<ItemTemplate>
					<div id="divImageContainer" runat="server" class="image-container-item" onclick="selectImage(this);">
						<div id="divImageContainerImage" runat="server" class="image-container-image">
							<div class="image-container-overlay">
							</div>
							<asp:Image ID="imageSecurity" runat="server" Height="136" Width="136" />
						</div>
						<div id="divSelector" runat="server" class="image-container-selector">
							<div id="divSelectorFill" runat="server" class="image-container-selector-fill">
							</div>
						</div>
					</div>
				</ItemTemplate>
			</asp:Repeater>
			<br />
			<it:textboxcontrol_v2 id="txtImageCaption" maxlength="0" minlength="0" showlabel="true" textmode="SingleLine" visible="False" isrequired="true" label="<%$FrontEndResources:Register,ImageCaption %>" runat="server" />
		</div>
	</div>
	<div class="row marginTop15 noMarginLeft">
		<div class="col-xs-6 visible-lg">
		</div>
		<div class="col-lg-3 col-xs-6">
			<asp:Button ID="Button6" CssClass="btn btn-default btn-margin btn-block" Text="<%$FrontEndResources:Register,Cancel %>" runat="server" />
		</div>
		<div class="col-lg-3 col-xs-6">
			<asp:Button ID="Button7" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Register,Next %>" runat="server" OnClientClick="return eBankit.Presentation.Register2.ValidateImages();" />
		</div>
	</div>
</asp:Panel>

<asp:Panel ID="pnNewKey" runat="server" Visible="false">
	<div class="panel-enrol-title">
		<asp:Literal ID="litStep2TopMessage" runat="server" Text="<%$FrontEndResources:Subscription,ContractStep2 %>"></asp:Literal>
	</div>
	<div class="panel-login-inputs">
		<it:textboxcontrol_v2 id="txtContract" showlabel="true" isdisabled="true" visible="false" textmode="SingleLine" label="<%$FrontEndResources:Register,Contract %>" runat="server" watermark="<%$FrontEndResources:Register,ContractWatermark %>" />
		<it:textboxcontrol_v2 id="txtuserName" showlabel="true" textmode="SingleLine" isrequired="true" label="<%$FrontEndResources:Register,Username %>" runat="server" />
		<it:textboxcontrol_v2 id="txtNewKey" showtooltiplikehelp="true" isrequired="true" tooltipkey="txtNewKeyInfo" tooltipplacement="right" showlabel="true" minlength="7" maxlength="20" textmode="Password" label="<%$FrontEndResources:Register,NewKey %>" runat="server" watermark="<%$FrontEndResources:Register,NewKeyWatermark %>" />
		<it:textboxcontrol_v2 id="txtConfirmNewKey" showtooltiplikehelp="true" isrequired="true" tooltipkey="txtConfirmNewKeyInfo" tooltipplacement="right" showlabel="true" minlength="7" maxlength="20" textmode="Password" label="<%$FrontEndResources:Register,NewKeyConfirm %>" runat="server" watermark="<%$FrontEndResources:Register,NewConfirmKeyWatermark %>" />
		<asp:Label ID="lblValidationMessage" Text="<%$FrontEndResources:Register,RegisterMessage %>" runat="server"></asp:Label>
	</div>
	<div class="row marginTop15 noMarginLeft">
		<div class="col-xs-6 visible-lg">
		</div>
		<div class="col-lg-3 col-xs-6">
			<asp:Button ID="Button2" CssClass="btn btn-default btn-margin btn-block" Text="<%$FrontEndResources:Register,Cancel %>" runat="server" />
		</div>
		<div class="col-lg-3 col-xs-6">
			<asp:Button ID="Button3" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Register,Next %>" runat="server" OnClientClick="if(eBankit.Presentation.Register2.ValidateInputsConfirm()){return eBankit.Presentation.Register2.ValidateConfirmKey()};return false;" />
		</div>
	</div>
</asp:Panel>

<asp:HiddenField ID="hdnInputTextField" runat="server" />
<asp:HiddenField ID="hdnPanelVisible" runat="server" />
<asp:HiddenField ID="hdnCredentialType" runat="server" />

<script type="text/javascript">

	var txtName = $('#<%=txtName.TextBoxClientID %>');
	var txtAccount = $('#<%=txtAccount.TextBoxClientID %>');
	var txtEmail = $('#<%=txtEmail.TextBoxClientID %>');
	var txtPhone = $('#<%=txtPhone.TextBoxClientID %>');

	var TextBoxNewKey = $('#<%=txtNewKey.TextBoxClientID %>');
	var TextBoxConfirmNewKey = $('#<%=txtConfirmNewKey.TextBoxClientID %>');
	var LabelBoxNewKey = $('#<%=txtNewKey.LabelClientID %>');
	var LabelBoxConfirmNewKey = $('#<%=txtConfirmNewKey.LabelClientID %>');
	var hdnInputTextField = $('#<%=hdnInputTextField.ClientID %>');
	var hdnPanelVisible = $('#<%=hdnPanelVisible.ClientID %>');

	var txtTaxID = $('#<%=txtTaxID.TextBoxClientID %>');
	var hdnRadio = $('#<%=hdnDocumentType.ClientID %>');
	var txtPassport = $('#<%=txtPassport.TextBoxClientID %>');
	var divCitizenID = $('#<%=divCitizenID.ClientID %>');
	var divPassport = $('#<%=divPassport.ClientID %>');
	var hdnSecurityImage = $("#<%=this.hdnSelectedImageId.ClientID%>");
	var hdnHasImage = $("#<%=this.hdnHasImage.ClientID%>");
	var hdnHasCaption = $("#<%=this.hdnHasCaption.ClientID%>");

	var hdnCredentialType = $("#<%=this.hdnCredentialType.ClientID%>");

</script>

<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("register-1.0.js".ResolveModuleScriptUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>
