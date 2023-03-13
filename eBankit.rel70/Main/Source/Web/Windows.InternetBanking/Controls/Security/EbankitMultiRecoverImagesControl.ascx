<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EbankitMultiRecoverImagesControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.EbankitMultiRecoverImagesControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div class="panel-questions">
    <p class="text-responsive-1-3 loginWelcomeMessage login-security-image">
        <asp:Label ID="lblWelcomeTitleThirdStep" Text="<%$FrontEndResources:Login,WelcomeTitleThirdStep %>" runat="server"></asp:Label>
    </p>
    <div id="divSecurityImageOverlay" class="marginTop15 login-security-image login-image-container-item" runat="server">
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
</div>

<script type="text/javascript">
	
</script>

<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("recoverQuestions-1.0.js".ResolveJsUrl("services"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>