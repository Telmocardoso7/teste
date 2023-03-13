<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EbankitIdentityServerLoginControl.ascx.cs" Inherits="EbankitIdentityServerLoginControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div id="loginContainer" class="login-container" style="padding-bottom: 20px;" runat="server">
    <div id="divMessage" class="grayContainer alert-warning_v3" runat="server" visible="false">
        <div class="div-icon-warning_v3" style="background-position: 50% 50%; width: 100%;"></div>
        <h4 class="alert-heading">
            <asp:Literal ID="litMessageLogin" runat="server" Text="<%$FrontEndResources:TRX00203,litAccountsNotFound %>" /></h4>
        <div class="clearBoth"></div>
    </div>
    <div id="divMessageRecover" class="grayContainer alert-success" runat="server" visible="false">
        <div class="div-icon-success_v3" style="background-position: 50% 50%; width: 100%;"></div>
        <h4 class="alert-heading">
            <asp:Literal ID="litMessageLoginRecover" runat="server" Text="<%$FrontEndResources:TRX00203,litAccountsNotFound %>" /></h4>
        <div class="clearBoth"></div>
    </div>
    <asp:Panel ID="pnFirstStep" runat="server">
        <h3 style="text-align:center;">
            <asp:Literal ID="lblWellcomeTitle" Text="<%$FrontEndResources:Login,WellcomeTitleExternalLogin %>" runat="server"></asp:Literal>
        </h3>
        <p style="text-align:center;">
            <asp:Label ID="lblWellcomeSubtitle" Text="<%$FrontEndResources:Login,WellcomeTitleUserName %>" runat="server"></asp:Label>
        </p>
        <div class="panel-login-inputs">
            <it:TextBoxControl ID="txtUserName" MaxLength="36" ShowLabel="false" Label="<%$FrontEndResources:Login,UserName %>" runat="server" Watermark="<%$FrontEndResources:Login,UserNameWatermark %>" />
        </div>
    </asp:Panel>
    <asp:Panel ID="pnSecondStep" runat="server" Visible="false">
        <div class="panel-login-inputs">
            <it:TextBoxControl ID="txtPassword" MaxLength="36" ShowLabel="false" TextMode="Password" Label="<%$FrontEndResources:Login,Password %>" runat="server" Watermark="<%$FrontEndResources:Login,PasswordWatermark %>" />
            <it:TextBoxControl ID="txtHardToken" MaxLength="36" ShowLabel="false" TextMode="Password" Label="<%$FrontEndResources:Login,HardToken %>" runat="server" Watermark="<%$FrontEndResources:Login,HardTokenWatermark %>" />
        </div>
    </asp:Panel>
    <div id="ValidationMessage" runat="server" visible="False" class="ValidationMessage"></div>
    <asp:Panel ID="divExtendedControls" runat="server"></asp:Panel>
    <asp:Panel ID="pnFirstStepButtons" runat="server">
        <div class="row marginTop15">
            <div class="col-lg-12">
                <asp:Button ID="btnLogin" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Login,OidcLoginBtn %>" runat="server" OnClientClick="return eBankit.Presentation.Login.ValidateUserName();" />
                <%--<asp:Button ID="btnGoToSecondStep" CssClass="btn btn-success btn-margin btn-block" Text="<%$FrontEndResources:Login,Continue %>" runat="server" OnClientClick="return eBankit.Presentation.Login.ValidateUserName();" />--%>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="pnSecondStepButtons" runat="server" Visible="false">
        <div class="row marginTop15">
            <div class="col-lg-12">
                <%--<asp:Button ID="btnLogin" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Login,Login %>" runat="server" OnClientClick="return eBankit.Presentation.Login.ValidateInputs();" />--%>
            </div>
            <div class="col-lg-12">
                <asp:Button ID="btnCancelSecondStep" CssClass="btn btn-cancel btn-margin btn-block" Text="<%$FrontEndResources:Login,Cancel %>" runat="server" />
            </div>
        </div>
    </asp:Panel>
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
<asp:HiddenField ID="hdnBrowserFingerPrint" runat="server" />
<asp:HiddenField ID="hdnBrowserName" runat="server" />
<asp:HiddenField ID="hdnOperationSystem" runat="server" />


<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("fingerprint2.js".ResolveJsUrl("services"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>
<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("ua-parser.js".ResolveJsUrl("services"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>


<script type="text/javascript">
    var TextBoxLogin = $('#<%=txtUserName.TextBoxClientID %>');
    var LabelBoxLogin = $('#<%=txtUserName.LabelClientID %>');
    var hdnInputTextField = $('#<%=hdnInputTextField.ClientID %>');
    var TextBoxPassword = $('#<%=txtPassword.TextBoxClientID %>');
    var TextBoxHardToken = $('#<%=txtHardToken.TextBoxClientID %>');
    var showKeyboardTitle = '<%=eBankit.Common.Globalization.Translate.GetTransactionString("Login", "ShowKeyboardTitle") %>';
    var hideKeyboardTitle = '<%=eBankit.Common.Globalization.Translate.GetTransactionString("Login", "HideKeyboardTitle") %>';

    var fingerprintReport = function () {
        var d1 = new Date();
        Fingerprint2.get(
            {

                preprocessor: function (key, value) {
                    if (key == "userAgent") {
                        var parser = new UAParser(value);
                        var userAgentMinusVersion = ((typeof parser.getOS().name === "undefined") ? "" : parser.getOS().name) +
                            ((typeof parser.getOS().version === "undefined") ? "" : parser.getOS().version) + ' ' +
                            ((typeof parser.getBrowser().name === "undefined") ? "" : parser.getBrowser().name) +
                            //((typeof parser.getBrowser().major === "undefined") ? "" : parser.getBrowser().major) + ' ' +
                            ((typeof parser.getCPU().architecture === "undefined") ? "" : parser.getCPU().architecture) + ' ' +
                            ((typeof parser.getEngine().name === "undefined") ? "" : parser.getEngine().name) + ' ' +
                            ((typeof parser.getDevice().name === "undefined") ? "" : parser.getDevice().name) + ' ' +
                            ((typeof parser.getDevice().version === "undefined") ? "" : parser.getDevice().version);

                        $('#<%=hdnOperationSystem.ClientID %>').val(((typeof parser.getOS().name === "undefined") ? "" : parser.getOS().name));
                        $('#<%=hdnBrowserName.ClientID %>').val(((typeof parser.getBrowser().name === "undefined") ? "" : parser.getBrowser().name) + ((typeof parser.getBrowser().version === "undefined") ? "" : '/' + parser.getBrowser().version));
                        //var name1=parser.getResult();
                        userAgentMinusVersion = userAgentMinusVersion.trimStart().trimEnd();

                        return userAgentMinusVersion;
                    }

                    if (key == "openDatabase") {
                        if ($('#<%=MinLat.ClientID %>').val() && $('#<%=MinLon.ClientID %>').val()) {
                            return $('#<%=MinLat.ClientID %>').val() + '|' + $('#<%=MinLon.ClientID %>').val();
                        }
                        else {
                            return '';
                        }
                    }

                    return value;
                },
                excludes: {
                    //userAgent:true,
                    webdriver: true,
                    language: true,
                    colorDepth: true,
                    deviceMemory: true,
                    hardwareConcurrency: true,
                    screenResolution: true,
                    availableScreenResolution: true,
                    //timezoneOffset:true,
                    //timezone:true,
                    sessionStorage: true,
                    localStorage: true,
                    indexedDb: true,
                    addBehavior: true,
                    //openDatabase: true,
                    cpuClass: true,
                    //platform:true,
                    plugins: true,
                    canvas: true,
                    //webgl:true,
                    //webglVendorAndRenderer:true,
                    adBlock: true,
                    hasLiedLanguages: true,
                    hasLiedResolution: true,
                    hasLiedOs: true,
                    hasLiedBrowser: true,
                    touchSupport: true,
                    fonts: true,
                    audio: true,
                    pixelRatio: true,
                    doNotTrack: true,
                    fontsFlash: true,
                    enumerateDevices: true
                }
            },
            function (components) {
                var murmur = Fingerprint2.x64hash128(components.map(function (pair) { return pair.value }).join(), 31);
                $('#<%=hdnBrowserFingerPrint.ClientID %>').val(murmur);

            });
    };

    fingerprintReport();
</script>

<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("login-1.0.js".ResolveJsUrl("services"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>
