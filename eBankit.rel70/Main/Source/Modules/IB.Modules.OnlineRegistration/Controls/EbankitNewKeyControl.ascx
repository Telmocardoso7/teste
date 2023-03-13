<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EbankitNewKeyControl.ascx.cs" Inherits="eBankit.UI.Controls.InternetBanking.EbankitNewKeyControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<p class="text-responsive-1-3">
    <asp:Literal ID="litTitleNewKey" runat="server" Text="<%$FrontEndResources:Register,TitleNewKey %>"></asp:Literal>
</p>

<div class="panel-login-inputs panel-register-unlabelled">
    <it:textboxcontrol_v2 id="txtUserName" cssclass="field field-labeless" showtooltiplikehelp="true" isrequired="true" tooltipkey="txtNewKeyInfo" tooltipplacement="left" minlength="7" maxlength="20" watermark="<%$FrontEndResources:Register,Username %>" runat="server" onkeyup="eBankit.Presentation.RegisterNewKey.ValidateName()"/>
    <it:textboxcontrol_v2 id="txtNewKey" cssclass="field field-labeless" showtooltiplikehelp="true" isrequired="true" tooltipkey="txtNewKeyInfo" tooltipplacement="left" minlength="7" maxlength="20" textmode="Password" watermark="<%$FrontEndResources:Register,NewKey %>" runat="server"  onkeyup="eBankit.Presentation.RegisterNewKey.ValidateNewKey()"/>
    <it:textboxcontrol_v2 id="txtConfirmNewKey" cssclass="field field-labeless" showtooltiplikehelp="true" isrequired="true" tooltipkey="txtConfirmNewKeyInfo" tooltipplacement="left" minlength="7" maxlength="20" textmode="Password" watermark="<%$FrontEndResources:Register,NewKeyConfirm %>" runat="server" onkeyup="eBankit.Presentation.RegisterNewKey.ValidateConfirmNewKey()"/>
    <it:textboxcontrol_v2 id="txtHardToken" cssclass="field field-labeless" showtooltiplikehelp="true" isrequired="true" tooltipkey="txtHardToken" tooltipplacement="left" minlength="7" maxlength="20" textmode="Password" watermark="<%$FrontEndResources:Register,NewHardToken %>" runat="server" visible="False" onkeyup="eBankit.Presentation.RegisterNewKey.ValidateNewHardToken()" />
    <it:textboxcontrol_v2 id="txtCustomToken" cssclass="field field-labeless" showtooltiplikehelp="true" isrequired="true" tooltipkey="txtCustomToken" tooltipplacement="left" minlength="7" maxlength="20" textmode="Password" watermark="<%$FrontEndResources:Register,NewCustomToken %>" runat="server" hidden="true" onkeyup="eBankit.Presentation.RegisterNewKey.ValidateNewCustomToken"/>
    <asp:HiddenField ID="hdnCredentialType" runat="server" />
</div>

<script type="text/javascript">
    var TextBoxUserName = $('#<%=txtUserName.TextBoxClientID %>')
    var TextBoxNewKey = $('#<%=txtNewKey.TextBoxClientID %>');
    var TextBoxConfirmNewKey = $('#<%=txtConfirmNewKey.TextBoxClientID %>');
    var hdnCredentialType = $("#<%=this.hdnCredentialType.ClientID%>");
    var TextboxHardToken = $('#<%=txtHardToken.TextBoxClientID %>');
    var TextBoxCustomToken = $('#<%=txtCustomToken.TextBoxClientID %>');
</script>

<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("registerNewKey-2.0.js".ResolveModuleScriptUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>
