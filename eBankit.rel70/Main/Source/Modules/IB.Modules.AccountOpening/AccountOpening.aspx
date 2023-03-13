<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/BaseFull.Master" CodeBehind="AccountOpening.aspx.cs" Inherits="eBankit.UI.Modules.Web.AccountOpening.AccountOpening" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<%@ Register TagPrefix="st" TagName="AccountType" Src="Controls/AccountType.ascx" %>
<%@ Register TagPrefix="st" TagName="NewEntity" Src="Controls/NewEntity.ascx" %>
<%@ Register TagPrefix="st" TagName="EntityDetails" Src="Controls/EntityDetails.ascx" %>
<%@ Register TagPrefix="st" TagName="OnlinePassword" Src="Controls/OnlinePassword.ascx" %>
<%@ Register TagPrefix="st" TagName="CustomStep" Src="Controls/CustomStep.ascx" %>
<%@ Register TagPrefix="st" TagName="Summary" Src="Controls/Summary.ascx" %>

<asp:Content runat="server" ID="HeadContent" ContentPlaceHolderID="HeadContent">
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("styles.css".ResolveModuleCssUrl() , eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContentFull">

    <asp:Panel CssClass="register" runat="server" ID="registerPanel">

        <asp:UpdatePanel ID="updatePanelTitle" runat="server" ChildrenAsTriggers="false" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-centered fullWidth clearPadding nMarginLeft15">
                    <div class="main-title-control intPosition-title">
                        <asp:Label ID="lblTitle" CssClass="titleAccOp" Text="<%$FrontEndResources:AccountOpening,FormTitle%>" runat="server"></asp:Label>
                    </div>
                    <div class="main-title-control intPosition-title divSubTitle">
                        <asp:Label ID="lblSubTitle" CssClass="subtitleAccOp" Text="<%$FrontEndResources:AccountOpening,FormSubTitle%>" runat="server"></asp:Label>
                    </div>
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnStepNext" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnStepConclusion" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnStepConclusionOnlineRegistration" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>

        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 accountopening-steps-container" style="float: right;">
            <div class="accountopening-steps">
                <ul>
                    <li runat="server" id="liStep1" data-value="0" class="step step-selected" onclick="JumpToStep(this);">
                        <span>
                            <asp:Literal ID="litStepAccountType" Text="<%$FrontEndResources:AccountOpening,StepAccountType %>" runat="server"></asp:Literal>
                        </span>
                    </li>
                    <li runat="server" id="liStepSeparator2" class="accountopening-separator">
                        <div class="accountopening-separator-container"></div>
                    </li>
                    <li runat="server" id="liStep2" data-value="1" class="step step-disabled" onclick="JumpToStep(this);">
                        <span>
                            <asp:Literal ID="litStepNewEntity" Text="<%$FrontEndResources:AccountOpening,StepNewEntity %>" runat="server"></asp:Literal>
                        </span>
                    </li>
                    <li runat="server" id="liStepSeparator3" class="accountopening-separator">
                        <div class="accountopening-separator-container"></div>
                    </li>
                    <li runat="server" id="liStep3" data-value="2" class="step step-disabled" onclick="JumpToStep(this);">
                        <span>
                            <asp:Literal ID="litStepEntityDetails" Text="<%$FrontEndResources:AccountOpening,StepEntityDetails %>" runat="server"></asp:Literal>
                        </span>
                    </li>
                    <li runat="server" id="liStepSeparator4" class="accountopening-separator">
                        <div class="accountopening-separator-container"></div>
                    </li>
                    <li runat="server" id="liStep4" data-value="3" class="step step-disabled" onclick="JumpToStep(this);">
                        <span>
                            <asp:Literal ID="litStepCustomStep" Text="<%$FrontEndResources:AccountOpening,CustomStepTitle %>" runat="server"></asp:Literal>
                        </span>
                    </li>
                    <li runat="server" id="liStepSeparator5" class="accountopening-separator">
                        <div class="accountopening-separator-container"></div>
                    </li>
                    <li runat="server" id="liStep5" data-value="4" class="step step-disabled" onclick="JumpToStep(this);">
                        <span>
                            <asp:Literal ID="litStepConfirm" Text="<%$FrontEndResources:AccountOpening,StepConfirm %>" runat="server"></asp:Literal>
                        </span>
                    </li>
                    <li runat="server" id="liStepSeparator6" class="accountopening-separator">
                        <div class="accountopening-separator-container"></div>
                    </li>
                    <li runat="server" id="liStep6" data-value="5" class="step step-disabled" onclick="JumpToStep(this);">
                        <span>
                            <asp:Literal ID="litStepOnlinePassword" Text="<%$FrontEndResources:AccountOpening,StepOnlinePassword %>" runat="server"></asp:Literal>
                        </span>
                    </li>
                </ul>
            </div>
        </div>
        <asp:UpdatePanel ID="updatePanel" runat="server" ChildrenAsTriggers="true" UpdateMode="Always">
            <ContentTemplate>
                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 middle container fullHeight clearPadding nMarginLeft15 main-content-acc" style="float: left;">
                    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>

                    <div class="col-lg-12 clearPadding">
                        <asp:Literal ID="litCampaign" runat="server"></asp:Literal>
                    </div>

                    <asp:Panel ID="pnAccountType" CssClass="content col-lg-12 col-xs-12 col-sm-12 col-md-12 main-content-acc" runat="server" Visible="false">
                        <st:AccountType ID="accountType" runat="server" />
                    </asp:Panel>

                    <asp:Panel ID="pnNewEntity" runat="server" Visible="false">
                        <st:NewEntity ID="newEntity" runat="server" />
                    </asp:Panel>

                    <asp:Panel ID="pnEntityDetails" runat="server" Visible="false">
                        <st:EntityDetails ID="entityDetails" runat="server" />
                    </asp:Panel>

                    <asp:Panel ID="pnCustomStep" runat="server" Visible="false">
                        <st:CustomStep ID="customStep" runat="server" />
                    </asp:Panel>

                    <asp:Panel ID="pnOnlinePassword" runat="server" Visible="false">
                        <st:OnlinePassword ID="onlinePassword" runat="server" />
                    </asp:Panel>

                    <asp:Panel ID="pnSummary" runat="server" Visible="false">
                        <st:Summary ID="summary" runat="server" />
                    </asp:Panel>

                    <asp:Panel ID="pnNewKey" runat="server">
                        <div class="row" style="margin-left: 0px; margin-top: 20px;">

                            <div class="col-xs-6 visible-lg">
                            </div>
                            <div class="col-lg-3 col-xs-6">
                                <asp:Button ID="StepCancel" CssClass="btn btn-default btn-margin btn-block" Text="<%$FrontEndResources:AccountOpening,Cancel %>" runat="server" OnClick="CancelRegister_Click" />
                            </div>
                            <div class="col-lg-3 col-xs-6">
                                <asp:Button ID="btnStepNext" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:AccountOpening,Next %>" runat="server" OnClientClick=" return SetStepSelected();" OnClick="btnStepNext_Click" />
                            </div>
                            <div class="col-lg-3 col-xs-6">
                                <asp:Button ID="btnStepConclusion" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:AccountOpening,Confirm %>" runat="server" OnClientClick=" return SetStepSelected();" OnClick="btnStepConclusion_Click" />
                            </div>
                            <div class="col-lg-3 col-xs-6">
                                <asp:Button ID="btnStepConclusionOnlineRegistration" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:AccountOpening,Complete %>" runat="server" OnClientClick=" return OnlinePassCheck();" OnClick="btnStepConclusionOnlineRegistration_Click" />
                            </div>
                        </div>
                    </asp:Panel>

                </div>

                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 accountopening-steps-container" style="float: right;">
                    <div class="register-help">
                        <h2>
                            <asp:Literal ID="Literal4" Text="<%$FrontEndResources:Register,NeedHelp %>" runat="server"></asp:Literal></h2>
                        <div class="help-item">
                            <h3>
                                <asp:Literal ID="Literal5" Text="<%$FrontEndResources:Register,CallUs %>" runat="server"></asp:Literal></h3>
                            <span class="register-phone">
                                <asp:Literal ID="Literal6" Text="<%$FrontEndResources:Register,CellPhoneNumber %>" runat="server"></asp:Literal></span>
                            <span class="register-text">
                                <asp:Literal ID="Literal7" Text="<%$FrontEndResources:Register,RegisterInfo %>" runat="server"></asp:Literal></span>
                        </div>
                    </div>
                </div>
                <asp:HiddenField ID="hdnStepJumper" runat="server" />
                <asp:Button ID="StepJumper" runat="server" CssClass="hidden" OnClick="StepJumper_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>

        <div class="clearBoth"></div>

    </asp:Panel>

    <div class="clearBoth"></div>
    <asp:HiddenField ID="hdnInputTextField" runat="server" />
    <asp:HiddenField ID="hdnPanelVisible" runat="server" />
    <asp:HiddenField ID="hdnCustomStepActive" runat="server" Value="1" />
    <asp:HiddenField ID="hdnMinAgeOfHolder" runat="server" Value="18" />
    <asp:HiddenField ID="hdnCurrentPanel" runat="server" Value="liStep1" />
    <script type="text/javascript">

        Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(MyScrollTo);

        var needScroll = false;

        function MyScrollTo() {
            if (needScroll) {
                $("html, body").animate({ scrollTop: 0 }, 600);
            }
        }

        function JumpToStep(elem) {
            var currentStep = $(".step-selected").attr("data-value");

            if (currentStep > $(elem).attr("data-value")) {
                $("[id*='hdnStepJumper']").val($(elem).attr("data-value"));
                SetStep($(elem).attr("data-value"));
                $("[id*='StepJumper']").click();
            }

            currentStep = $(".step-selected").attr("data-value");

            $(".step").each(function () {
                if (currentStep > $(this).attr("data-value")) {
                    $(this).addClass('step-previous');
                    $(this).removeClass('step-disabled');
                }
                else if (currentStep == $(this).attr("data-value")) {
                    $(this).removeClass('step-disabled');
                }
                else {
                    $(this).removeClass('step-previous');
                    $(this).addClass('step-disabled');
                }
            });
        }

        function SetCurrentStepAfterFullPostBack(currentStep) {

            $(".step").each(function () {
                if (currentStep > $(this).attr("data-value")) {
                    $(this).addClass('step-previous');
                    $(this).removeClass('step-disabled');
                    $(this).removeClass('step-selected');
                }
                else if (currentStep == $(this).attr("data-value")) {
                    $(this).removeClass('step-disabled');
                    $(this).addClass('step-selected');
                }
                else {
                    $(this).removeClass('step-previous');
                    $(this).removeClass('step-selected');
                    $(this).addClass('step-disabled');
                }
            });
        }

        function EvaluatePreviousStep() {
            var currentStep = $(".step-selected").attr("data-value");
            var elem = $(".step-selected");

            $(".step").each(function () {
                if (currentStep > $(this).attr("data-value")) {
                    $(this).addClass('step-previous');
                    $(this).removeClass('step-disabled');
                }
                else if (currentStep == $(this).attr("data-value")) {
                    $(this).removeClass('step-disabled');
                }
                else {
                    $(this).removeClass('step-previous');
                    $(this).addClass('step-disabled');
                }
            });

        }

        function SetStep(currentStep) {
            $(".step-selected").each(function () {
                $(this).removeClass("step-selected");
            });
            $("li[data-value='" + currentStep + "']").addClass("step-selected");
            $("[id*='hdnCurrentPanel']").val('liStep' + eval(parseInt(currentStep) + 1));
        }

        function SelectTab(elem, tab) {

            $(".ActivityTabs").each(function (index) {
                $(this).removeClass('selected');
            });

            if (elem != null) {
                $(elem).addClass('selected');
            }
            else {
                $(".ActivityTabs").first().addClass('selected');
            }

            $(".tab").each(function (index) {
                $(this).hide();
            });

            $('#entityData' + tab).show();

            var currentStep = $(".step-selected").attr("data-value");

            $(".step").each(function () {
                if (currentStep > $(this).attr("data-value")) {
                    $(this).addClass('step-previous');
                    $(this).removeClass('step-disabled');
                }
                else if (currentStep == $(this).attr("data-value")) {
                    $(this).removeClass('step-disabled');
                }
                else {
                    $(this).removeClass('step-previous');
                    $(this).addClass('step-disabled');
                }
            });

            $("[id*='hdnSelectedTab']").val(tab);
        };

        function SetStepSelected() {

            if (eBankit.Presentation.RegisterAccount.ValidateRegister()) {
                var currentPanel = $('#<%=hdnCurrentPanel.ClientID %>');
                var customStepActive = $('#<%=hdnCustomStepActive.ClientID %>');

                var step1 = $("[id*='liStep1']");
                var step2 = $("[id*='liStep2']");
                var step3 = $("[id*='liStep3']");
                var step4 = $("[id*='liStep4']");
                var step5 = $("[id*='liStep5']");
                var step6 = $("[id*='liStep6']");

                step1.removeClass('step-selected');
                step2.removeClass('step-selected');
                step3.removeClass('step-selected');
                step4.removeClass('step-selected');
                step5.removeClass('step-selected');
                step6.removeClass('step-selected');

                switch (currentPanel.val()) {
                    case 'liStep1':
                        step2.addClass('step-selected');
                        step2.removeClass('step-disabled');
                        $('#<%=hdnCurrentPanel.ClientID %>').val('liStep2');
                        break;
                    case 'liStep2':
                        step3.addClass('step-selected');
                        step3.removeClass('step-disabled');
                        $('#<%=hdnCurrentPanel.ClientID %>').val('liStep3');
                        break;
                    case 'liStep3':

                        if (customStepActive.val() == 1) {
                            step4.addClass('step-selected');
                            step4.removeClass('step-disabled');
                            $('#<%=hdnCurrentPanel.ClientID %>').val('liStep4');
                        }
                        else {
                            step5.addClass('step-selected');
                            step5.removeClass('step-disabled');
                            $('#<%=hdnCurrentPanel.ClientID %>').val('liStep5');
                        }

                        break;
                    case 'liStep4':
                        step5.addClass('step-selected');
                        step5.removeClass('step-disabled');
                        $('#<%=hdnCurrentPanel.ClientID %>').val('liStep5');
                        break;
                    case 'liStep5':
                        step6.addClass('step-selected');
                        step6.removeClass('step-disabled');
                        $('#<%=hdnCurrentPanel.ClientID %>').val('liStep6');
                        break;
                    case 'liStep6':
                        step6.addClass('step-selected');
                        step6.removeClass('step-disabled');
                        $('#<%=hdnCurrentPanel.ClientID %>').val('liStep6');
                        break;
                    default:
                        step1.addClass('step-selected');
                        step1.removeClass('step-disabled');
                        $('#<%=hdnCurrentPanel.ClientID %>').val('liStep1');
                        break;
                }

                return true;
            }
            else {

                PrepareInvalidControls();
                return false;
            }
        }

    </script>
    <%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("register-new-account.js".ResolveModuleScriptUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>
</asp:Content>
