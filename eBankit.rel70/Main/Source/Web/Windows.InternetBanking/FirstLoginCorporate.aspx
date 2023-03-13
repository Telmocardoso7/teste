<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/BaseFull.Master" CodeBehind="FirstLoginCorporate.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.FirstLoginCorporate" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContentFull">

    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-centered fullHeight fullWidth clearPadding nMarginLeft15">
        <asp:Panel CssClass="recover" runat="server" ID="tokenPanel">
            <div class="welcomeMessageLogin">
                <asp:Literal ID="Literal2" Text="<%$FrontEndResources:Login,WellcomeMessage %>" runat="server"></asp:Literal>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 fullHeight clearPadding ">
                <asp:UpdatePanel ID="udpFirstLogin" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        
                <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
                        <%-- Security Questions --%>
                        <asp:Panel ID="step1" runat="server" CssClass="panel-login-inputs" Visible="false">
                            <div class="row">
                                <div class="col-xs-12 col-md-8 col-md-offset-2 question-control">
                                    <it:QuestionsControl id="ebQuestions" runat="server" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="row marginTop15">
                                    <div class="col-xs-1 hidden-xs"></div>
                                    <div class="col-xs-6 col-sm-5">
                                        <asp:Button ID="btnCancelStep1" CssClass="btn btn-default btn-margin btn-block" Text="<%$FrontEndResources:Register,Cancel %>" runat="server" OnClick="btnCancelStep1_Click" />
                                    </div>
                                    <div class="col-xs-6 col-sm-5">
                                        <asp:Button ID="btnNextStep1" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Register,Next %>" runat="server" OnClientClick="return eBankit.Presentation.RegisterQuestions.ValidateQuestions();" OnClick="btnNextStep1_Click" />
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>

                        <%-- Security Image --%>
                        <asp:Panel ID="step2" runat="server" CssClass="panel-login-inputs" Visible="false">
                            <div class="row">
                                <div class="col-xs-12 col-md-8 col-md-offset-2 images-control">
                                    <it:ImagesControl id="ebImages" runat="server" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="row marginTop15">
                                    <div class="col-xs-1 hidden-xs"></div>
                                    <div class="col-xs-6 col-sm-5">
                                        <asp:Button ID="btnCancelStep2" CssClass="btn btn-default btn-margin btn-block" Text="<%$FrontEndResources:Register,Cancel %>" runat="server" OnClick="btnCancelStep2_Click" />
                                    </div>
                                    <div class="col-xs-6 col-sm-5">
                                        <asp:Button ID="btnNextStep2" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Register,Next %>" runat="server" OnClientClick="return eBankit.Presentation.RegisterImages.ValidateImages();" OnClick="btnNextStep2_Click" />
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>

                        <%-- Create username --%>
                        <asp:Panel ID="step3" runat="server" CssClass="panel-login-inputs" Visible="false">
                            <div class="row">
                                <div class="col-xs-12 col-md-8 col-md-offset-2 username-control">
                                    <it:UserNameControl id="ebUserName" runat="server" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="row marginTop15">
                                    <div class="col-xs-1 hidden-xs"></div>
                                    <div class="col-xs-6 col-sm-5">
                                        <asp:Button ID="btnCancelStep3" CssClass="btn btn-default btn-margin btn-block" Text="<%$FrontEndResources:Register,Cancel %>" runat="server" OnClick="btnCancelStep3_Click" />
                                    </div>
                                    <div class="col-xs-6 col-sm-5">
                                        <asp:Button ID="btnNextStep3" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Register,Next %>" runat="server" OnClientClick="return eBankit.Presentation.RegisterUsername.ValidateUsername();" OnClick="btnNextStep3_Click" />
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>

                        <%-- Change password --%>
                        <asp:Panel ID="step4" runat="server" CssClass="panel-login-inputs" Visible="false">
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
                            <div class="panel-margin-top">
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
                            </div>
                            <div class="row">
                                <div class="row marginTop15">
                                    <div class="col-xs-1 hidden-xs"></div>
                                    <div class="col-xs-6 col-sm-5">
                                        <asp:Button ID="Button1" CssClass="btn btn-default btn-margin btn-block" Text="<%$FrontEndResources:Register,Cancel %>" runat="server" OnClick="btnCancelStep3_Click" />
                                    </div>
                                    <div class="col-xs-6 col-sm-5">
                                        <asp:Button ID="Button2" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Register,Next %>" runat="server" OnClientClick="return eBankit.Presentation.RegisterUsername.ValidateUsername();" OnClick="btnNextStep3_Click" />
                                    </div>
                                </div>
                            </div>
                        </asp:Panel>

                        <%-- Error --%>
                        <asp:Panel ID="stepError" runat="server" CssClass="panel-login-inputs" Visible="false">
                            <div class="row">
                               Erro, VOLTAR AO LOGIN
                            </div>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <%--<div class="col-lg-12 clearPadding">
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
                        <div style="margin-bottom: 10px;">
                            <asp:Label ID="lblSmsResend" Style="float: left;" Text="<%$FrontEndResources:Register,ResendSMS%>" runat="server"></asp:Label>
                            <a id="aResendHere" href="#" onclick="eBankit.Presentation.Register.ResendSMS();" style="float: left; margin-left: 5px;" runat="server"></a>
                            <div style="clear: both;"></div>
                        </div>
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
                    </div>
                    <div class="col-lg-3 col-xs-6">
                        <asp:Button ID="btnRegister" CssClass="btn btn-success btn-margin btn-block" Style="margin-top: 10px;" Text="<%$FrontEndResources:Register,Next %>" runat="server" OnClientClick="return eBankit.Presentation.Register.ValidateInputs();" OnClick="btnRegister_Click" />
                    </div>
                </div>--%>
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


    <script>
        eBankit.Presentation.RegisterQuestions = {};
        eBankit.Presentation.RegisterQuestions.ValidateQuestions = function (elem) {
            var ret;
            var valQuestion = true;
            var valAnswer = true;
            $('.cd-select').each(function (i, el) {
                if (!$(el).val() == "") {
                    eBankit.Presentation.RemoveValidateMsg($(el), top.eBankit.Presentation.GetResource("InvalidSecurityQuestion"));
                } else {
                    eBankit.Presentation.InsertValidateMsg($(el), top.eBankit.Presentation.GetResource("InvalidSecurityQuestion"));
                    valQuestion = false;
                }
            });


            $('.trx-field').each(function (i, el) {
                if (!($.trim($(el).val()) == "")) {
                    eBankit.Presentation.RemoveValidateMsg($(el), top.eBankit.Presentation.GetResource("RequiredSecurityQuestion"));
                } else {
                    valAnswer = false;
                    eBankit.Presentation.InsertValidateMsg($(el), top.eBankit.Presentation.GetResource("RequiredSecurityQuestion"));
                }
            });


            if (!valQuestion || !valAnswer) {
                ret = false;
            }
            else {
                ret = true;
            }
            return ret;
        };
        eBankit.Presentation.RegisterImages = {};
        eBankit.Presentation.RegisterImages.ValidateImages = function (elem) {
            var valImage;
            var valCaption;
            var ret = false;

            if (hdnHasImage.val() == "true") {
                $('.image-container-item').each(function (i, el) {
                    var divImageContainer = $(el).find(".image-container-selector");
                    if (divImageContainer.hasClass("selected")) {
                        valImage = true;
                    }
                });
            }
            if (!valImage && hdnHasImage.val() == "true") {
                $('.image-container-item').css("border", "2px solid red");
            }

            if (hdnHasCaption.val() == "true") {
                if (!($.trim($('#securityImagesList :text').val()) == "")) {
                    valCaption = true;
                    eBankit.Presentation.RemoveValidateMsg($('#securityImagesList :text'), top.eBankit.Presentation.GetResource("ImageCaptionInvalid"));
                } else {
                    eBankit.Presentation.InsertValidateMsg($('#securityImagesList :text'), top.eBankit.Presentation.GetResource("ImageCaptionInvalid"));
                    valCaption = false;
                }
            }

            if ((!valImage && hdnHasImage.val() == "true") || (!valCaption && hdnHasCaption.val() == "true")) {
                ret = false;
            } else {
                ret = true;
            }
            return ret;
        };
        eBankit.Presentation.RegisterUsername = {};
        eBankit.Presentation.RegisterUsername.ValidateUsername = function (elem) {
            var ret = true;

            if (TextBoxUsername != undefined) {
                if (TextBoxUsername.val() == '' && (elem == undefined || elem.id == TextBoxUsername[0].id)) {

                    eBankit.Presentation.InsertValidateMsg(TextBoxUsername, top.eBankit.Presentation.GetResource("RequiredUserName"));
                    ret = false;
                }
                else if (TextBoxUsername.val() != '') {
                    eBankit.Presentation.RemoveValidateMsg(TextBoxUsername);
                    TextBoxUsername.popover('hide');
                }
            }
            return ret;
        };


        function selectImage(divImage) {
            unselectAllImages();
            var divImageContainer = $(divImage).find(".image-container-selector");
            divImageContainer.addClass("selected");
            divImageContainer.find(".image-container-selector-fill").html("&#10004;");
            hdnSecurityImage.val($(divImage).find("img").attr('key'));
        };
        function unselectAllImages() {
            $('.image-container-item').each(function (i, el) {
                var divImageContainer = $(el).find(".image-container-selector");
                divImageContainer.removeClass("selected");
                divImageContainer.find(".image-container-selector-fill").html("");
            });
        };

    </script>
  <%--  <asp:HiddenField ID="hdnInputTextField" runat="server" />
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

    <%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("register-1.0.js".ResolveJsUrl("services"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>--%>
</asp:Content>
