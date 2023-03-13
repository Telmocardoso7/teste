<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/BaseFull.Master" CodeBehind="FirstLogin.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.FirstLogin" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContentFull">
    <asp:Panel runat="server" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-centered fullHeight fullWidth clearPadding nMarginLeft15">
        <asp:Panel CssClass="recover" runat="server" ID="tokenPanel">
            <div class="welcomeMessageLogin">
                <asp:Literal ID="Literal2" Text="<%$FrontEndResources:Login,WellcomeMessage %>" runat="server"></asp:Literal>
            </div>
            <asp:Panel ID="consentMainPanel" class="col-xs-12 col-sm-12 col-md-8 col-lg-8 fullHeight clearPadding " Visible="false" runat="server">
                <p class="text-responsive-1-3 loginWelcomeMessage text-center">
                    <h2 class="head head-top text-center">
                        <asp:Literal ID="litTitle" Text="<%$FrontEndResources:Consent,Login_Title%>" runat="server"></asp:Literal>
                    </h2>
                </p>
                <p class="text-responsive-1-3 loginWelcomeMessage text-center" style="margin: 20px 0;">
                    <asp:Label ID="lblInfoMessageExternal" class="col-xs-12 searchBarContainer" Text="<%$FrontEndResources:Consent,Login_Info %>" CssClass="text-responsive-1-3" runat="server"></asp:Label>
                </p>
                <div class="ConsentContent">
                    <asp:Literal ID="ConsentContentPage" runat="server"></asp:Literal>
                </div>
                <p class="col-xs-12" style="margin-top:20px">
                    <asp:Button ID="Accept" CssClass="btn btn-primary test btn-margin col-xs-offset-3 col-xs-3 changes-profile" Style="width: 300px!important;" CommandArgument="ACCEPT" OnClick="Response_Click" Text="<%$FrontEndResources:Consent,Login_Accept %>" runat="server" />
                </p>
                <p class="text-center">
                    <asp:Literal ID="AcceptContentPage" runat="server"></asp:Literal>
                </p>
                <p class="col-xs-12" style="margin-top:20px">
                    <asp:Button ID="Reject" CssClass="btn btn-cancel btn-margin col-xs-offset-3 col-xs-6 text-center" Style="width: 300px!important;" CommandArgument="REJECT" OnClick="Response_Click" Text="<%$FrontEndResources:Consent,Login_Reject %>" runat="server" />
                </p>
                <p class="text-center">
                    <asp:Literal ID="RejectContentPage" runat="server"></asp:Literal>
                </p>
            </asp:Panel>
            <asp:Panel runat="server" ID="RecoverFirstLogin" class="col-xs-12 col-sm-12 col-md-8 col-lg-8 fullHeight clearPadding ">
                <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
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
                <asp:Panel ID="pnNewKey" CssClass="marginTop15" runat="server">
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
                <div class="clearBoth"></div>
                <asp:Panel ID="pnSecurityQuestions" CssClass="marginTop15" runat="server" Visible="false">
                    <div class="panel-enrol-title">
                        <asp:Literal Text="<%$FrontEndResources:Register,SecurityQuestionsTitle %>" runat="server" />
                    </div>
                    <div class="panel-login-inputs rpt-security-questions">
                        <asp:Label ID="lblInfoSecurityQuestions" runat="server" class="panel-line-info-alert" Text="<%$FrontEndResources:Register,InfoSecurityQuestions%>"></asp:Label>
                        <asp:Repeater ID="rptQuestions" runat="server" OnItemDataBound="rptQuestions_ItemDataBound">
                            <ItemTemplate>
                                <div class="marginTop15">
                                    <it:DropDownListControl_v2 ID="ddlQuestion" IsRequired="true" Label="<%$FrontEndResources:TRX01150,ddlQuestion%>" runat="server" />
                                    <it:TextBoxControl_v2 ID="txtAnswer" IsRequired="true" TextMode="Password" Label="<%$FrontEndResources:TRX01150,txtAnswer%>" runat="server" />
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </asp:Panel>
                <div class="clearBoth"></div>
                <div class="row marginTop15 noMarginLeft">
                    <div class="col-xs-6 visible-lg">
                    </div>
                    <div class="col-lg-3 col-xs-6">
                    </div>
                    <div class="col-lg-3 col-xs-6">
                        <asp:Button ID="btnRegister" CssClass="btn btn-success btn-margin btn-block" Style="margin-top: 10px;" Text="<%$FrontEndResources:Register,Next %>" runat="server" OnClientClick="return eBankit.Presentation.Register.ValidateInputs();" OnClick="btnRegister_Click" />
                    </div>
                </div>
            </asp:Panel>
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
    </asp:Panel>
    <div class="clearBoth"></div>

    <asp:HiddenField ID="hdnInputTextField" runat="server" />
    <asp:HiddenField ID="hdnPanelVisible" runat="server" />
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
    </script>

    <%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("register-1.0.js".ResolveJsUrl("services"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>
</asp:Content>
