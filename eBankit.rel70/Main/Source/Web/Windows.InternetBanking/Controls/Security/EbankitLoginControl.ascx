<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EbankitLoginControl.ascx.cs" Inherits="EbankitLoginControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div id="loginContainer" class="login-container" style="padding-bottom: 20px;" runat="server">
    <p class="text-responsive-1-3 loginWelcomeMessage">
        <asp:Label ID="lblWellcomeTitle" Text="<%$FrontEndResources:Login,WellcomeTitle %>" runat="server"></asp:Label>
    </p>
    <div id="divMessage" class="grayContainer alert-warning_v3" runat="server" visible="false">
        <div class="div-icon-warning_v3" style="background-position: 50% 50%; width: 100%;"></div>
        <h4 class="alert-heading">
            <asp:Literal ID="litMessageLogin" runat="server" Text="<%$FrontEndResources:TRX00203,litAccountsNotFound %>" /></h4>
        <div class="clearBoth"></div>
    </div>
    <div class="panel-login-inputs">
        <it:TextBoxControl ID="txtUserName" MaxLength="36" ShowLabel="false" Label="<%$FrontEndResources:Login,UserName %>" runat="server" Watermark="<%$FrontEndResources:Login,UserNameWatermark %>" />
        <it:TextBoxControl ID="txtPassword" MaxLength="36" ShowLabel="false" TextMode="Password" Label="<%$FrontEndResources:Login,Password %>" runat="server" Watermark="<%$FrontEndResources:Login,PasswordWatermark %>" />
        <div id="ValidationMessage" runat="server" visible="False" class="ValidationMessage"></div>
    </div>
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
    <div id="collapseForgetPwd" class="panel-collapse collapse">
        <div class="panel-body row text-responsive-1">
            <asp:Literal ID="litPasswordRecoverMessage" runat="server" />
        </div>
        <div id="divRecoverPwdLink" class="recoverlink" runat="server">
            <asp:HyperLink runat="server" ID="linkPasswordRecover" NavigateUrl="Recover.aspx" Text="<%$FrontEndResources:Login,Recover %>"></asp:HyperLink>
        </div>
    </div>
    <asp:Panel ID="divExtendedControls" runat="server"></asp:Panel>
    <asp:Button ID="btnLogin" CssClass="btn btn-primary btn-margin btn-block" Style="margin-bottom: 30px;" Text="<%$FrontEndResources:Login,Login %>" runat="server" OnClientClick="return eBankit.Presentation.Login.ValidateInputs();" />
    <div class="registerlink">
        <asp:HyperLink runat="server" ID="linkRegister" NavigateUrl="Register.aspx" >
            <div class="row">
                <div class="onbording-register-image col-xs-3">
                    <img src="<%="tour_identity.png".ResolveImagePath()%>" id="previousIconImg" alt="" />
                </div>
                <div class="col-xs-9 onbording-register-container">
                    <div class="onbording-register-title">
                        <asp:Literal ID="LiteralRegisterOnbordingTitle" Text="<%$FrontEndResources:Login,OBRegisterTitle %>" runat="server" />
                    </div>
                    <div class="onbording-register-description">
                        <asp:Literal ID="LiteralRegisterOnbordingText" Text="<%$FrontEndResources:Login,OBRegisterDesc %>" runat="server" />
                    </div>
                </div>
            </div>
        </asp:HyperLink>
    </div>
</div>
<div id="alertContainer" class="login-container" style="padding-top: 0px;" runat="server">
    <div>
        <div class="AlertText">
            <asp:Literal runat="server" ID="alert"></asp:Literal>
        </div>
    </div>
    <div style="clear: both;"></div>
</div>

<div style="clear: both;"></div>
<asp:HiddenField ID="hdnInputTextField" runat="server" />
<script type="text/javascript">
    var TextBoxLogin = $('#<%=txtUserName.TextBoxClientID %>');
    var LabelBoxLogin = $('#<%=txtUserName.LabelClientID %>');
    var hdnInputTextField = $('#<%=hdnInputTextField.ClientID %>');
    var TextBoxPassword = $('#<%=txtPassword.TextBoxClientID %>');
    var showKeyboardTitle = '<%=eBankit.Common.Globalization.Translate.GetTransactionString("Login","ShowKeyboardTitle") %>';
    var hideKeyboardTitle = '<%=eBankit.Common.Globalization.Translate.GetTransactionString("Login","HideKeyboardTitle") %>';
</script>
<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("login-1.0.js".ResolveJsUrl("services"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>
