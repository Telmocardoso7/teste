<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/BaseFull.Master" CodeBehind="AccountOpeningDocuments.aspx.cs" Inherits="eBankit.UI.Modules.Web.AccountOpening.AccountOpeningDocuments" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Content runat="server" ID="HeadContent" ContentPlaceHolderID="HeadContent">
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("styles.css".ResolveModuleCssUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContentFull">
    <asp:Panel CssClass="register" runat="server" ID="registerPanel">

        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-centered fullWidth clearPadding nMarginLeft15">
            <div class="main-title-control intPosition-title">
                <asp:Label ID="lblTitle" CssClass="titleAccOp" Text="<%$FrontEndResources:AccountOpening,FormTitle%>" runat="server"></asp:Label>
            </div>
            <div class="main-title-control intPosition-title divSubTitle">
                <asp:Label ID="Label1" CssClass="subtitleAccOp" Text="<%$FrontEndResources:AccountOpening,FormSubTitle%>" runat="server"></asp:Label>
            </div>
        </div>
        <div class="col-lg-4 col-md-4 col-sm-4 col-sx-12 accountopening-steps-container stepsContent" style="float:right">
            <div class="accountopening-steps-disabled">
                <ul>
                    <li runat="server" id="liStep1" data-value="0" class="step">
                        <div class="accountopening-stepcontrol-confirm">&#10003</div>
                        <span class="accountopening-stepcontrol-confirm-text">
                            <asp:Literal ID="litStepAccountType" Text="<%$FrontEndResources:AccountOpening,StepAccountType %>" runat="server"></asp:Literal>
                        </span>
                    </li>
                    <li runat="server" id="liStepSeparator2" class="accountopening-separator">
                        <div class="accountopening-separator-container"></div>
                    </li>
                    <li runat="server" id="liStep2" data-value="1" class="step">
                        <div class="accountopening-stepcontrol-confirm">&#10003</div>
                        <span class="accountopening-stepcontrol-confirm-text">
                            <asp:Literal ID="litStepNewEntity" Text="<%$FrontEndResources:AccountOpening,StepNewEntity %>" runat="server"></asp:Literal>
                        </span>
                    </li>
                    <li runat="server" id="liStepSeparator3" class="accountopening-separator">
                        <div class="accountopening-separator-container"></div>
                    </li>
                    <li runat="server" id="liStep3" data-value="2" class="step">
                        <div class="accountopening-stepcontrol-confirm">&#10003</div>
                        <span class="accountopening-stepcontrol-confirm-text">
                            <asp:Literal ID="litStepEntityDetails" Text="<%$FrontEndResources:AccountOpening,StepEntityDetails %>" runat="server"></asp:Literal>
                        </span>
                    </li>
                    <li runat="server" id="liStepSeparator4" class="accountopening-separator">
                        <div class="accountopening-separator-container"></div>
                    </li>
                    <li runat="server" id="liStep4" data-value="3" class="step">
                        <div class="accountopening-stepcontrol-confirm">&#10003</div>
                        <span class="accountopening-stepcontrol-confirm-text">
                            <asp:Literal ID="litStepConfirm" Text="<%$FrontEndResources:AccountOpening,StepConfirm %>" runat="server"></asp:Literal>
                        </span>
                    </li>
                    <li runat="server" id="liStepSeparator5" class="accountopening-separator">
                        <div class="accountopening-separator-container"></div>
                    </li>
                    <li runat="server" id="liStep5" data-value="4" class="step">
                        <div class="accountopening-stepcontrol-confirm">&#10003</div>
                        <span class="accountopening-stepcontrol-confirm-text">
                            <asp:Literal ID="litStepOnlinePassword" Text="<%$FrontEndResources:AccountOpening,StepOnlinePassword %>" runat="server"></asp:Literal>
                        </span>
                    </li>
                </ul>
            </div>
        </div>
        <asp:UpdatePanel ID="updatePanel" runat="server">
            <ContentTemplate>
                <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 fullHeight middle container clearPadding nMarginLeft15" style="float:left">
                     <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
                    <asp:Label ID="lblDocumentsTitle1" CssClass="accountopening-title" Text="<%$FrontEndResources:AccountOpening,DocumentsTitle1 %>" runat="server" />
                    <asp:Label ID="lblDocumentsDescription1" CssClass="accountopening-description" Text="<%$FrontEndResources:AccountOpening,DocumentsDescription1 %>" runat="server" />
                    <asp:Label ID="lblDocumentsDescription2" CssClass="accountopening-description" Text="<%$FrontEndResources:AccountOpening,DocumentsDescription2 %>" runat="server" />
                    <br />

                    <div class="col-lg-12 clearPadding">
                        <div class="documentation-title">
                            <div class="accountopening-document-pdf-image"></div>
                            <div class="accountopening-document-title">
                                <asp:Label CssClass="accountopening-subtitle-label" runat="server" ID="lblResultMessage" Text="<%$FrontEndResources:AccountOpening,DocumentsTitle%>"></asp:Label>
                            </div>
                        </div>
                      
                        <div id="tableDiv" class="accountopening-document-table-div">
                            <table class="accountopening-document-table">
                                <tr>
                                    <th></th>
                                    <th>
                                        <asp:Label CssClass="accountopening-document-header-label" runat="server" ID="Label5" Text="<%$FrontEndResources:AccountOpening,DocumentsPrint%>"></asp:Label>
                                    </th>
                                </tr>

                                 <asp:Repeater ID="repeaterDocuments" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td>
                                                <div class="accountopening-document-panel">
                                                    <asp:LinkButton ID="lnkDocument" CssClass="accountopening-document-label" runat="server"></asp:LinkButton>
                                                    <asp:Label ID="lblDocumentDescription" CssClass="accountopening-document-description" runat="server" Text="<%$FrontEndResources:AccountOpening,DocumentsDescription%>"></asp:Label>
                                                </div>
                                            </td>
                                            <td>
                                                 <asp:LinkButton ID="lnkDocumentImg" CssClass="accountopening-document-pdf-image accountopening-document-table-pdf-image" runat="server"></asp:LinkButton>
                                            </td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>

                            </table>
                        </div>

                         <div class="accountopening-documents-confirm-panel">
                            <asp:HiddenField ID="hdnConfirmField" runat="server" Value="0" />
                            <div id="confirmDocuments" class="accountopening-documents-confirm-choosen" onclick="makeTick(this);"></div>
                            <asp:Label ID="Label6" runat="server" CssClass="accountopening-documents-confirm-label" Text="<%$FrontEndResources:AccountOpening,DocumentsConfirm%>"></asp:Label>
                         </div>
                    </div>
                    <div class="clearBoth"></div>
                    <asp:Panel ID="pnNewKey" runat="server">

                        <div class="row" style="margin-left: 0px; margin-top: 20px;">
                            <div class="col-xs-6 visible-lg">
                            </div>
                            <div class="col-lg-3 col-xs-6">
                                <asp:Button ID="StepCancel" CssClass="btn btn-default btn-margin btn-block" Text="<%$FrontEndResources:AccountOpening,Cancel %>" OnClick="btnStepCancel_Click" runat="server" />
                            </div>
                            <div class="col-lg-3 col-xs-6">
                                <asp:Button ID="StepNext" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:AccountOpening,Next %>" OnClick="btnStepNext_Click" OnClientClick=" return CheckAgreement();" runat="server" />
                            </div>
                        </div>

                    </asp:Panel>
                </div>           <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 accountopening-steps-container" style="float:right;" >
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
            </ContentTemplate>
        </asp:UpdatePanel>

        
        <div class="clearBoth"></div>
    </asp:Panel>
    <div class="clearBoth"></div>

<script type="text/javascript">

    Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(MyScrollTo);
    var needScroll = false;
    function MyScrollTo() {
        if (needScroll) {
            $("html, body").animate({ scrollTop: 0 }, 600);
        }
    }

    makeTick = function (elem) {

        var hdnConfirmField = $("[id*='hdnConfirmField']");

        if (hdnConfirmField.val() == 0) {
            $(elem).html("&#10003");
            hdnConfirmField.val(1);
        }
        else {
            $(elem).html("");
            hdnConfirmField.val(0);
        }
    }

    function CheckAgreement() {
        var ret = true;

        if($("[id*='hdnConfirmField']").val()==0)
        {
            eBankit.Presentation.InsertValidateMsg($(".accountopening-documents-confirm-panel"), top.eBankit.Presentation.GetResource("RequiredConditions"));
            $(".accountopening-documents-confirm-panel").next(".has-error").addClass("errorLabel");
            ret = false;
        }
        else {
            eBankit.Presentation.RemoveValidateMsg($(".accountopening-documents-confirm-panel"));
        }
        return ret;
    }
</script>

</asp:Content>
