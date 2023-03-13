<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Ebankit3StepsLoginControl.ascx.cs" Inherits="Ebankit3StepsLoginControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<%@ Register Src="~/Controls/Security/EbankitLoginSecurityQuestions.ascx" TagPrefix="it" TagName="EbankitLoginSecurityQuestions" %>

<div class="login-container" style="padding-bottom: 20px;">
    <div id="divMessage" class="grayContainer alert-warning_v3" runat="server" visible="false">
        <div class="div-icon-warning_v3" style="background-position: 50% 50%; width: 100%;"></div>
        <h4 class="alert-heading">
            <asp:Literal ID="litMessageLogin" runat="server" Text="<%$FrontEndResources:TRX00203,litAccountsNotFound %>" /></h4>
        <div class="clearBoth"></div>
       
    </div>
    <asp:Panel ID="pnFirstStep" runat="server">
        <p class="text-responsive-1-3 loginWelcomeMessage">
            <asp:Label ID="lblWelcomeTitleFirstStep" Text="<%$FrontEndResources:Login,WelcomeTitleFirstStep %>" runat="server"></asp:Label>
        </p>
        <div class="panel-login-inputs">
            <it:TextBoxControl ID="txtUserName" MaxLength="36" ShowLabel="false" Label="<%$FrontEndResources:Login,UserName %>" runat="server" Watermark="<%$FrontEndResources:Login,UserNameWatermark %>" />
        </div>
    </asp:Panel>
    <asp:Panel ID="pnSecondStep" runat="server" Visible="false">
        <p class="text-responsive-1-3 loginWelcomeMessage">
            <asp:Label ID="lblWelcomeTitleSecondStep" Text="<%$FrontEndResources:Login,WelcomeTitleSecondStep %>" runat="server"></asp:Label>
        </p>
        <div class="panel-login-inputs panel-questions">
            <it:TextBoxControl ID="txtSecurityQuestion" TextMode="Password" runat="server" />
        </div>
    </asp:Panel>
    <asp:Panel ID="pnThirdStep" runat="server" Visible="false">
        <p class="text-responsive-1-3 loginWelcomeMessage login-security-image">
            <asp:Label ID="lblWelcomeTitleThirdStep" Text="<%$FrontEndResources:Login,WelcomeTitleThirdStep %>" runat="server"></asp:Label>
        </p>
        <div id="divSecurityImageOverlay" class="panel-login-inputs marginTop15 login-security-image login-image-container-item" runat="server">
            <div id="divImageContainerImage" runat="server" class="image-container-image">
                <div class="image-container-overlay">
                </div>
                <asp:Image ID="imgSecurityImage" runat="server" Height="136" Width="136" />
            </div>
        </div>
        <div class="panel-login-inputs login-security-image-caption">
            <asp:Label ID="lblSecurityImageCaption" CssClass="marginTop10" runat="server"></asp:Label>
        </div>
        <div class="panel-login-inputs">
            <asp:CheckBox ID="chkConfirmSecurityImage" runat="server" CssClass="login-security-image-check marginTop15 marginBottom15" Text="<%$FrontEndResources:Login,ConfirmSecurityImage %>" />
        </div>
        <div class="panel-login-inputs">
            <p class="text-responsive-1-3 loginWelcomeMessage">
                <asp:Label ID="Label1" Text="<%$FrontEndResources:Login,EnterAccessCode %>" runat="server"></asp:Label>
            </p>
            <it:TextBoxControl ID="txtPassword" MaxLength="20" ShowLabel="false" TextMode="Password" Label="<%$FrontEndResources:Login,Password %>" runat="server" Watermark="<%$FrontEndResources:Login,PasswordWatermark %>" />
        </div>
    </asp:Panel>
    <it:EbankitLoginSecurityQuestions ID="controlQuestions" runat="server" Visible="false" />
    <div id="ValidationMessage" runat="server" visible="False" class="ValidationMessage marginTop15"></div>
    <div id="divPasswordRecovery" class="ebankit-pointer-text clearPadding forgetPwdContainer" data-toggle="collapse" data-target="#collapseForgetPwd">
        <div>
            <span class="metro icon-circle clearPadding">
                <i id="collapseForgetPwdIcon" class="icon-arrow-right"></i>
            </span>
        </div>
        <span class="text-responsive-1 fSize12 cursorPointer">
            <asp:Literal ID="Literal4" Text="<%$FrontEndResources:Login,ForgetPwdTitle %>" runat="server" />
        </span>
        <div style="clear: both;"></div>
    </div>
    <div id="collapseForgetPwd" class="panel-collapse collapse marginTop15">
        <div class="panel-body row text-responsive-1">
            <asp:Literal ID="litPasswordRecoverMessage" runat="server" />
        </div>
        <div id="divRecoverPwdLink" class="recoverlink" runat="server">
            <asp:HyperLink runat="server" ID="linkPasswordRecover" NavigateUrl="Recover.aspx" Text="<%$FrontEndResources:Login,Recover %>"></asp:HyperLink>
        </div>
    </div>
    <asp:Panel ID="divExtendedControls" runat="server"></asp:Panel>
    <asp:Panel ID="pnFirstStepButtons" runat="server">
        <div class="row marginTop15">
            <div class="col-lg-12">
                <asp:Button ID="btnGoToSecondStep" CssClass="btn btn-success btn-margin btn-block" Text="<%$FrontEndResources:Login,Continue %>" runat="server" OnClientClick="return eBankit.Presentation.Login.ValidateUserName();" />
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnSecondStepButtons" runat="server" Visible="false">
        <div class="row marginTop15">
            <div class="col-lg-12">
                <asp:Button ID="btnGoToThirdStep" CssClass="btn btn-success btn-margin btn-block" Text="<%$FrontEndResources:Login,Continue %>" runat="server" OnClientClick="return eBankit.Presentation.Login.ValidateSecurityQuestion();" />
            </div>
            <div class="col-lg-12">
                <asp:Button ID="btnCancelSecondStep" CssClass="btn btn-cancel btn-margin btn-block" Text="<%$FrontEndResources:Login,Cancel %>" runat="server" />
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnThirdStepButtons" runat="server" Visible="false">
        <div class="row marginTop15">
            <div class="col-lg-12">
                <asp:Button ID="btnLogin" CssClass="btn btn-success btn-margin btn-block" Text="<%$FrontEndResources:Login,Login %>" runat="server" OnClientClick="return eBankit.Presentation.Login.ValidatePasswordAndImage();" />
            </div>
            <div class="col-lg-12">
                <asp:Button ID="btnCancelThirdStep" CssClass="btn btn-cancel btn-margin btn-block" Text="<%$FrontEndResources:Login,Cancel %>" runat="server" />
            </div>
        </div>
    </asp:Panel>
    <div class="registerlink marginTop15">
        <asp:HyperLink runat="server" ID="linkRegister" NavigateUrl="Register.aspx" >
            <div class="row">
                <div class="onbording-register-image col-xs-3">
                    <img src="<%="tour_identity.png".ResolveImagePath()%>" id="previousIconImg" alt="" />
                </div>
                <div class="col-xs-9 onbording-register-container">
                    <div class="onbording-register-title">
                        <asp:Literal ID="LiteralRegisterOnbordingTitle" Text="<%$FrontEndResources:Login, OBRegisterTitle%>" runat="server" />
                    </div>
                    <div class="onbording-register-description">
                        <asp:Literal ID="LiteralRegisterOnbordingText" Text="<%$FrontEndResources:Login, OBRegisterDesc%>" runat="server" />
                    </div>
                </div>
            </div>
        </asp:HyperLink>
    </div>
</div>
<div class="login-container" style="padding-top: 0px;">
    <div>
        <div class="AlertText">
            <asp:Literal runat="server" ID="alert"></asp:Literal>
        </div>
    </div>
    <div style="clear: both;"></div>
</div>
<div class="text-center footer-credits credits-login">
    <span>
        <asp:Literal ID="lblMasterCredits" Text="2015 &copy; EBANKIT" runat="server"></asp:Literal></span>
</div>
<div style="clear: both;"></div>
<asp:HiddenField ID="hdnInputTextField" runat="server" />
<script type="text/javascript">
    var TextBoxLogin = $('#<%=txtUserName.TextBoxClientID %>');
    var TextBoxPassword = $('#<%=txtPassword.TextBoxClientID %>');
    var TextSecurityQuestion = $('#<%=txtSecurityQuestion.TextBoxClientID %>');
    var SecurityImageCheck = $('#<%=chkConfirmSecurityImage.ClientID %>');
    var LabelBoxLogin = $('#<%=txtUserName.LabelClientID %>');
    var hdnInputTextField = $('#<%=hdnInputTextField.ClientID %>');
    var showKeyboardTitle = '<%=eBankit.Common.Globalization.Translate.GetTransactionString("Login","ShowKeyboardTitle") %>';
    var hideKeyboardTitle = '<%=eBankit.Common.Globalization.Translate.GetTransactionString("Login","HideKeyboardTitle") %>';
</script>
<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("login-1.0.js".ResolveJsUrl("services"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>