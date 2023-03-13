<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EbankitMultiRegisterControl.ascx.cs" Inherits="eBankit.UI.Controls.InternetBanking.EbankitMultiRegisterControl" %>

<%@ Register TagPrefix="it" Namespace="eBankit.UI.Controls" Assembly="eBankit.UI.Controls" %>
<%@ Register Src="~/modules/OnlineRegistration/Controls/EbankitNewKeyControl.ascx" TagPrefix="it" TagName="NewKeycontrol" %>
<%@ Register Src="~/modules/OnlineRegistration/Controls/EbankitQuestionsControl.ascx" TagPrefix="it" TagName="QuestionsControl" %>
<%@ Register Src="~/modules/OnlineRegistration/Controls/EbankitImagesControl.ascx" TagPrefix="it" TagName="ImagesControl" %>
<%@ Register Src="~/modules/OnlineRegistration/Controls/EbankitUserNameControl.ascx" TagPrefix="it" TagName="UserNameControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div class="col-lg-12 clearPadding register register-message">
	<asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
</div>
<div class="clearBoth"></div>
<h2><asp:Literal ID="litRegisterTitle" runat="server" Text="<%$FrontEndResources:Register,ContractTitle %>"></asp:Literal></h2>
<asp:Panel ID="pnStepInit" class="register register-multi" runat="server">
	<div class="panel-enrol-title">
		<asp:Literal ID="litTitleStep1" runat="server" Text="<%$FrontEndResources:Register,TitleCustomerDetails %>"></asp:Literal>
	</div>
	<div class="panel-login-inputs panel-register-unlabelled">
		<it:textboxcontrol_v2 id="txtName" showlabel="true" textmode="SingleLine" isrequired="true" runat="server" watermark="<%$FrontEndResources:Register,Name %>" />
		<it:textboxcontrol_v2 id="txtAccount" showlabel="true" minlength="7" maxlength="26" isrequired="true" textmode="SingleLine" runat="server" watermark="<%$FrontEndResources:Register,AccountNumber %>" />
		<it:textboxcontrol_v2 id="txtTaxID" minlength="9" maxlength="9" isrequired="true" watermark="<%$FrontEndResources:Register,TaxID %>" runat="server" />	
		<it:formradiolist_v3 id="frlDocumentType" runat="server" cssclass="big-radioButton" repeatdirection="Horizontal" hidelabel="false" />
		<div id="divCitizenID" class="field-own" runat="server">
			<it:textboxcontrol_v2 id="txtID" showlabel="true" minlength="7" maxlength="20" textmode="SingleLine" runat="server" watermark="<%$FrontEndResources:Register,CitizenID %>" />
			<it:datepickertextboxmetrocontrol_v3 id="dtIDValidate" runat="server" width="100px" cssclass="field field_v2 metro break datepicker-borderless"
				 watermark="<%$FrontEndResources:Register,dtDocumentIDValidate%>" 
				validationmindatemessage="<%$FrontEndResources:Register,dtDocumentIDValidateMinDateMessage %>"
				validationrequiredmessage="<%$FrontEndResources:Register,dtDocumentIDValidateRequiredMessage %>"
				validationmessage="<%$FrontEndResources:Register,dtDocumentIDValidateMessage %>" />
		</div>
		<div id="divPassport" class="hidden" runat="server">
			<it:textboxcontrol_v2 id="txtPassport" minlength="9" maxlength="9" watermark="<%$FrontEndResources:Register,PassportNumber %>" runat="server" />
			<it:datepickertextboxmetrocontrol_v3 id="dtPassport" runat="server" width="100px" cssclass="field field_v2 metro break datepicker-borderless"
					watermark="<%$FrontEndResources:Register,dtPessportValidate%>" 
					validationmindatemessage="<%$FrontEndResources:Register,dtPessportValidateMinDateMessage %>"
					validationrequiredmessage="<%$FrontEndResources:Register,dtPessportValidateRequiredMessage %>"
					validationmessage="<%$FrontEndResources:Register,dtPessportValidateMessage %>" />
		</div>
		<it:textboxcontrol_v2 id="txtEmail" minlength="7" maxlength="200" isrequired="true" watermark="<%$FrontEndResources:Register,Email %>" runat="server" />
		<it:numbertextboxcontrol_v3 id="txtPhone" showtooltiplikehelp="true" tooltipkey="txtRegisterPhone" tooltipplacement="right" minlength="7" maxlength="20" isrequired="true" watermark="<%$FrontEndResources:Register,Phone %>" runat="server" />
	</div>
	<div class="row marginTop15">
		<div class="col-xs-1 visible-lg"></div>
		<div class="col-lg-5 col-xs-6">
			<asp:Button  ID="btnCancelStep1" CssClass="btn btn-default btn-margin btn-block" Text="<%$FrontEndResources:Register,Cancel %>" runat="server"/>
		</div>
		<div class="col-lg-5 col-xs-6">
			<asp:Button  ID="btnNextStep1" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Register,Next %>" runat="server" OnClientClick="return eBankit.Presentation.Register2.ValidateRegister();" />
		</div>
	</div>       
</asp:Panel>
<asp:Panel ID="pnStep2" class="register register-multi" runat="server">
	<it:NewKeycontrol id="ebNewKey" runat="server" />
	<div class="row marginTop15">
		<div class="col-xs-1 visible-lg"></div>
		<div class="col-lg-5 col-xs-6">
			<asp:Button  ID="btnCancelStep2" ActionType="Back" CssClass="btn btn-default btn-margin btn-block" Text="<%$FrontEndResources:Register,Cancel %>" runat="server"/>
		</div>
		<div class="col-lg-5 col-xs-6">
			<asp:Button  ID="btnNextStep2" ActionType="Next" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Register,Next %>" runat="server" OnClientClick="return eBankit.Presentation.RegisterNewKey.ValidateInputsConfirm();" />
		</div>
	</div>  
</asp:Panel>
<asp:Panel ID="pnStep3" class="register register-multi" runat="server">
	<it:QuestionsControl id="ebQuestions" runat="server" />
	<div class="row marginTop15">
		<div class="col-xs-1 visible-lg"></div>
		<div class="col-lg-5 col-xs-6">
			<asp:Button  ID="btnCancelStep3" CssClass="btn btn-default btn-margin btn-block" Text="<%$FrontEndResources:Register,Cancel %>" runat="server"/>
		</div>
		<div class="col-lg-5 col-xs-6">
			<asp:Button  ID="btnNextStep3" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Register,Next %>" runat="server" OnClientClick="return eBankit.Presentation.RegisterQuestions.ValidateQuestions();" />
		</div>
	</div>  
</asp:Panel>
<asp:Panel ID="pnStep4" class="register register-multi" runat="server">
	<it:ImagesControl id="ebImagesControl" runat="server" />
	<div class="row marginTop15">
		<div class="col-xs-1 visible-lg"></div>
		<div class="col-lg-5 col-xs-6">
			<asp:Button  ID="btnCancelStep4" CssClass="btn btn-default btn-margin btn-block" Text="<%$FrontEndResources:Register,Cancel %>" runat="server"/>
		</div>
		<div class="col-lg-5 col-xs-6">
			<asp:Button  ID="btnNextStep4" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Register,Next %>" runat="server" OnClientClick="return eBankit.Presentation.RegisterImages.ValidateImages();" />
		</div>
	</div>  
</asp:Panel>
<asp:Panel ID="pnStep5" class="register register-multi" runat="server">
	<it:UserNameControl id="ebUserNameControl" runat="server"/>
	<div class="row marginTop15">
		<div class="col-xs-1 visible-lg"></div>
		<div class="col-lg-5 col-xs-6">
			<asp:Button  ID="btnCancelStep5" CssClass="btn btn-default btn-margin btn-block" Text="<%$FrontEndResources:Register,Cancel %>" runat="server"/>
		</div> 
		<div class="col-lg-5 col-xs-6">
			<asp:Button  ID="btnNextStep5" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Register,Next %>" runat="server" OnClientClick="return eBankit.Presentation.RegisterUsername.ValidateUsername();" />
		</div>
	</div>  
</asp:Panel>
<asp:Panel ID="pnStep6" class="register register-multi" runat="server">
	<div class="panel-enrol-title">
		<asp:Literal ID="litTitleStep6" runat="server" Text="<%$FrontEndResources:Register,TitleStep6 %>"></asp:Literal>
	</div>	
	<div class="row marginTop15">
		<div class="col-xs-1 visible-lg"></div>
		<div class="col-lg-5 col-xs-6">
			<asp:Button  ID="btnCancelStep6" CssClass="btn btn-default btn-margin btn-block" Text="<%$FrontEndResources:Register,Cancel %>" runat="server"/>
		</div> 
		<div class="col-lg-5 col-xs-6">
			<asp:Button  ID="btnNextStep6" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Register,Next %>" runat="server" />
		</div>
	</div>  
</asp:Panel>
<asp:Panel ID="pnStepLast" class="register register-multi" runat="server">
	<div class="panel-login-inputs panel-register-unlabelled">
		<it:FlowLabel_v2  CssClass="sucess-text" ID="flwNewAlias" runat="server"/>
		<div class="sucess-text" >
			<b><asp:Literal ID="conclusionMsg" Text="<%$FrontEndResources:Register,ConclusionMsg %>" runat="server"></asp:Literal></b>
			<br>
			<asp:Literal ID="Literal1" Text="<%$FrontEndResources:Register,ConclusionMsg2 %>" runat="server"></asp:Literal>
		</div>
	</div>
	<div class="row marginTop15">
	<div class="col-xs-1 visible-lg"></div>
		<div class="col-lg-5 col-xs-6 col-lg-offset-3">
			<asp:Button  ID="btnEnter" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Register,Login %>" runat="server"/>
		</div>
	</div>  
</asp:Panel>

<script type="text/javascript">

	var txtName = $('#<%=txtName.TextBoxClientID %>');
	var txtAccount = $('#<%=txtAccount.TextBoxClientID %>');
	var txtEmail = $('#<%=txtEmail.TextBoxClientID %>');
	var txtPhone = $('#<%=txtPhone.TextBoxClientID %>');
		
	var txtTaxID = $('#<%=txtTaxID.TextBoxClientID %>');
	var txtPassport = $('#<%=txtPassport.TextBoxClientID %>');
	var divCitizenID = $('#<%=divCitizenID.ClientID %>');
	var divPassport = $('#<%=divPassport.ClientID %>');
		
</script>

<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("register-2.0.js".ResolveModuleScriptUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>
