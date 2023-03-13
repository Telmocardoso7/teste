<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EbankitMultiRegisterControl_V2.ascx.cs" Inherits="eBankit.UI.Modules.Web.OnlineRegistration.Controls.EbankitMultiRegisterControl_V2" %>
<%@ Register TagPrefix="it" Namespace="eBankit.UI.Controls" Assembly="eBankit.UI.Controls" %>
<%@ Register Src="~/modules/OnlineRegistration/Controls/EbankitNewKeyControl.ascx" TagPrefix="it" TagName="NewKeycontrol" %>
<%@ Register Src="~/modules/OnlineRegistration/Controls/EbankitQuestionsControl.ascx" TagPrefix="it" TagName="QuestionsControl" %>
<%@ Register Src="~/modules/OnlineRegistration/Controls/EbankitImagesControl.ascx" TagPrefix="it" TagName="ImagesControl" %>
<%@ Register Src="~/modules/OnlineRegistration/Controls/EbankitUserNameControl.ascx" TagPrefix="it" TagName="UserNameControl" %>
<%@ Register Src="~/modules/OnlineRegistration/Controls/EbankitContractControl.ascx" TagPrefix="it" TagName="ContractControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div class="col-lg-12 clearPadding register register-message">
    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
</div>
<div class="clearBoth"></div>
<h2>
    <asp:Literal ID="litRegisterTitle" runat="server" Text="<%$FrontEndResources:Register,ContractTitle %>"></asp:Literal></h2>

<asp:Panel ID="pnStepInit" class="register register-multi" runat="server">
    <p class="text-responsive-1-3">
        <asp:Literal ID="litTitleStep1" runat="server" Text="<%$FrontEndResources:Register,TitleCustomerDetails %>"></asp:Literal>
    </p>
    <div class="panel-login-inputs panel-register-unlabelled">
        <it:textboxcontrol_v2 cssclass="field field-labeless" id="txtName" textmode="SingleLine" showtooltiplikehelp="true" isrequired="true" tooltipkey="txtName" tooltipplacement="left" runat="server" watermark="<%$FrontEndResources:Register,Name %>" onkeyup="eBankit.Presentation.Register2.ValidateName()" />
        <it:textboxcontrol_v2 cssclass="field field-labeless" id="txtAccount" minlength="7" maxlength="26" showtooltiplikehelp="true" isrequired="true" tooltipkey="txtAccount" tooltipplacement="left" textmode="SingleLine" runat="server" watermark="<%$FrontEndResources:Register,AccountNumber %>" onkeyup="eBankit.Presentation.Register2.ValidateAccount()" />
        <it:textboxcontrol_v2 cssclass="field field-labeless" id="txtTaxID" minlength="9" maxlength="9" showtooltiplikehelp="true" isrequired="true" tooltipkey="txtTaxID" tooltipplacement="left" watermark="<%$FrontEndResources:Register,TaxID %>" runat="server" onkeyup="eBankit.Presentation.Register2.ValidateTaxId()" />
        <it:FormRadioList_v3 id="frlDocumentType" HideLabel="true" runat="server" cssclass="big-radioButton field-labeless" repeatdirection="Horizontal" />
        <div id="divCitizenID" class="field-own" runat="server">
            <it:textboxcontrol_v2 cssclass="field field-labeless" id="txtID" showtooltiplikehelp="true" isrequired="true" tooltipkey="txtID" tooltipplacement="left" minlength="7" maxlength="20" textmode="SingleLine" runat="server" watermark="<%$FrontEndResources:Register,CitizenID %>" onkeyup="eBankit.Presentation.Register2.ValidateId()" />
            <it:datepickertextboxmetrocontrol_v3 id="dtIDValidate" runat="server" width="100px" cssclass="field break datepicker-borderless field-labeless"
                watermark="<%$FrontEndResources:Register,dtDocumentIDValidate%>"
                validationmindatemessage="<%$FrontEndResources:Register,dtDocumentIDValidateMinDateMessage %>"
                validationrequiredmessage="<%$FrontEndResources:Register,dtDocumentIDValidateRequiredMessage %>"
                validationmessage="<%$FrontEndResources:Register,dtDocumentIDValidateMessage %>" />
        </div>
        <div id="divPassport" class="hidden" runat="server">
            <it:textboxcontrol_v2 cssclass="field field-labeless" id="txtPassport" showtooltiplikehelp="true" isrequired="true" tooltipkey="txtPassport" tooltipplacement="left" minlength="9" maxlength="9" watermark="<%$FrontEndResources:Register,PassportNumber %>" runat="server" onkeyup="eBankit.Presentation.Register2.ValidatePassport()" />
            <it:datepickertextboxmetrocontrol_v3 id="dtPassport" runat="server" width="100px" cssclass="field break datepicker-borderless field-labeless"
                watermark="<%$FrontEndResources:Register,dtPessportValidate%>"
                validationmindatemessage="<%$FrontEndResources:Register,dtPessportValidateMinDateMessage %>"
                validationrequiredmessage="<%$FrontEndResources:Register,dtPessportValidateRequiredMessage %>"
                validationmessage="<%$FrontEndResources:Register,dtPessportValidateMessage %>" />
        </div>
        <it:textboxcontrol_v2 cssclass="field field-labeless" id="txtEmail" minlength="7" maxlength="200" showtooltiplikehelp="true" isrequired="true" tooltipkey="txtEmail" tooltipplacement="left" watermark="<%$FrontEndResources:Register,Email %>" runat="server" onkeyup="eBankit.Presentation.Register2.ValidateEmail()" />
        <it:numbertextboxcontrol_v3 id="txtPhone" showtooltiplikehelp="true" tooltipkey="txtRegisterPhone" cssClass="field field-labeless" tooltipplacement="left" minlength="7" maxlength="20" isrequired="true" watermark="<%$FrontEndResources:Register,Phone %>" runat="server" onkeyup="eBankit.Presentation.Register2.ValidatePhone()" />
    </div>
    <div class="row marginTop15">
        <div class="col-lg-12">
            <asp:Button ID="btnNextStep1" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Register,Next %>" runat="server" OnClientClick="return eBankit.Presentation.Register2.ValidateRegister();" />
        </div>
        <div class="col-lg-12">
            <asp:Button ID="btnCancelStep1" CssClass="btn btn-cancel btn-margin btn-block" Text="<%$FrontEndResources:Register,Cancel %>" runat="server" />
        </div>
    </div>
</asp:Panel>

<asp:Panel ID="pnStep2" class="register register-multi" runat="server">
    <it:newkeycontrol id="ebNewKey" runat="server" />
    <div class="row marginTop15">
        <div class="col-lg-12">
            <asp:Button ID="btnNextStep2" ActionType="Next" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Register,Next %>" runat="server" OnClientClick="return eBankit.Presentation.RegisterNewKey.ValidateInputsConfirm();" />
        </div>
        <div class="col-lg-12">
            <asp:Button ID="btnCancelStep2" ActionType="Back" CssClass="btn btn-cancel btn-margin btn-block" Text="<%$FrontEndResources:Register,Cancel %>" runat="server" />
        </div>
    </div>
</asp:Panel>

<asp:Panel ID="pnStep3" class="register register-multi" runat="server">
    <it:questionscontrol id="ebQuestions" runat="server" />
    <div class="row marginTop15">
        <div class="col-lg-12">
            <asp:Button ID="btnNextStep3" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Register,Next %>" runat="server" OnClientClick="return eBankit.Presentation.RegisterQuestions.ValidateQuestions();" />
        </div>
        <div class="col-lg-12">
            <asp:Button ID="btnCancelStep3" CssClass="btn btn-cancel btn-margin btn-block" Text="<%$FrontEndResources:Register,Cancel %>" runat="server" />
        </div>
    </div>
</asp:Panel>

<asp:Panel ID="pnStep4" class="register register-multi" runat="server">
    <it:imagescontrol id="ebImagesControl" runat="server" />
    <div class="row marginTop15">
        <div class="col-lg-12">
            <asp:Button ID="btnNextStep4" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Register,Next %>" runat="server" OnClientClick="return eBankit.Presentation.RegisterImages.ValidateImages();" />
        </div>
        <div class="col-lg-12">
            <asp:Button ID="btnCancelStep4" CssClass="btn btn-cancel btn-margin btn-block" Text="<%$FrontEndResources:Register,Cancel %>" runat="server" />
        </div>
    </div>
</asp:Panel>

<asp:Panel ID="pnStep5" class="register register-multi" runat="server">
    <it:contractcontrol id="ebContractControl" runat="server" />
    <div class="row marginTop15">
        <div class="col-lg-12">
            <asp:Button ID="btnCancelStep5" CssClass="btn btn-cancel btn-margin btn-block" Text="<%$FrontEndResources:Register,Cancel %>" runat="server" />
        </div>
    </div>
</asp:Panel>

<asp:Panel ID="pnStepLast" class="register register-multi" runat="server">
    <div class="panel-login-inputs panel-register-unlabelled">
        <it:flowlabel_v2 cssclass="sucess-text" id="flwNewAlias" runat="server" />
        <div class="sucess-text">
            <b><asp:Literal ID="conclusionMsg" Text="<%$FrontEndResources:Register,ConclusionMsg %>" runat="server"></asp:Literal></b>
        </div>
    </div>

    <div class="row marginTop15">
        <div class="col-lg-12">
            <asp:Button ID="btnEnter" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Register,Next %>" runat="server" />
        </div>
    </div>
</asp:Panel>

<script type="text/javascript">

    var txtName = $('#<%=txtName.TextBoxClientID %>');
    var txtAccount = $('#<%=txtAccount.TextBoxClientID %>');
    var txtEmail = $('#<%=txtEmail.TextBoxClientID %>');
    var txtPhone = $('#<%=txtPhone.TextBoxClientID %>');
    var txtID = $('#<%=txtID.TextBoxClientID %>');
    var txtPassport = $('#<%=txtPassport.TextBoxClientID %>');

    var txtTaxID = $('#<%=txtTaxID.TextBoxClientID %>');
    var txtPassport = $('#<%=txtPassport.TextBoxClientID %>');
    var divCitizenID = $('#<%=divCitizenID.ClientID %>');
    var divPassport = $('#<%=divPassport.ClientID %>');

</script>

<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("register-2.0.js".ResolveModuleScriptUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>