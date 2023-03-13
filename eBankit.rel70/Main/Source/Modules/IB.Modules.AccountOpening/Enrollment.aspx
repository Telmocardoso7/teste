<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Base.Master" AutoEventWireup="true" CodeBehind="Enrollment.aspx.cs" Inherits="eBankit.UI.Modules.Web.AccountOpening.Enrollment" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<%@ Register TagPrefix="st" TagName="EnrolmentData" Src="Controls/EnrolmentData.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link rel="stylesheet" type="text/css" href="<%= Utils.GetCacheVersion("styles.css".ResolveModuleCssUrl(), Utils.CacheVersionKey.CStyleSheet) %>" />
    <style>
        .enrollment .alert-danger,
        .enrollment .alert-success {
            padding: 5px;
            position: relative;
            min-height: 50px;
            width: 100% !important;
        }

        .enrollment .alert .doc {
            top: 15px;
            right: 15px;
            position: absolute;
        }
        .grayContainer >.col-max{
            width:auto;
        }
        .errorMsg {
    color: #D24627;
    font-size: 11px;
    font-weight: normal;
    position: absolute;
    /*left: 30%;*/
    margin-bottom: 0px;
    margin-top: 5px;
}
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <div class="panel-user" style="margin-top: 20px;">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max no-padding">
            <it:FlowContainerDetail ID="FlowContainerDetail1" CssClass="panel panel-detail panel-user-top" runat="server">
                <div class="field field_v2">
                    <div class="panelUserCenter-wrapper">
                        <div>
                            <div>
                                <div class="panelUserLeft-wrapper panelUserCenter-margins">
                                    <img id="imgTop" src="<%$ebFile:~/Content/currenttheme/images/user-icon.png %>" alt="" class="img-user img-thumbnail img-circle img-user-left" runat="server" />
                                </div>
                                <div class="panel-user-data">
                                    <h5 class="overflowEllipsis welcomeMessage">
                                        <asp:Literal ID="litClientNameTop" runat="server"></asp:Literal></h5>
                                    <p class="pull-bottom field-col-3 overflowEllipsis lastAcess">
                                        <asp:Label ID="lblLastAccessTop" Text="" runat="server"></asp:Label>
                                    </p>
                                </div>
                                <div class="clearBoth"></div>
                            </div>
                        </div>
                    </div>
                    <div class="clearBoth"></div>
                </div>
            </it:FlowContainerDetail>
        </div>
    </div>
    <asp:Panel CssClass="register" runat="server" ID="registerPanel">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max no-padding middle container">
            <div class="col-xs-12 col-sm-8 col-md-8 col-lg-8 clearPadding content">
                <div>
                    <h2 class="register-title">
                        <asp:Literal ID="Literal6" Text="<%$FrontEndResources:AccountOpening,AccOpeningFormTitle %>" runat="server" />
                    </h2>
                    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
                    <div class="enrollment">
                        <asp:Panel ID="pnNewKey" runat="server">
                            <div id="divMainContainer" runat="server" visible="false">
                                <asp:Label ID="lblDocumentsTitle1" CssClass="accountopening-title" Text="<%$FrontEndResources:AccountOpening,EnrollmentTitle1 %>" runat="server" />
                                <asp:Label ID="lblDocumentsTitle2" CssClass="accountopening-title" Text="<%$FrontEndResources:AccountOpening,EnrollmentTitle2 %>" runat="server" />
                                <asp:Label ID="lblDocumentsDescription1" CssClass="accountopening-description" Text="<%$FrontEndResources:AccountOpening,EnrollmentDescription1UploadInactive %>" runat="server" />
                                <asp:Label ID="lblDocumentsDescription2" CssClass="accountopening-description" Text="<%$FrontEndResources:AccountOpening,EnrollmentDescription2 %>" runat="server" />
                            </div>
                            <div id="divUploadContainer" runat="server" visible="false">
                                <asp:Label ID="lblDocumentsUploadTitle1" CssClass="accountopening-title" Text="<%$FrontEndResources:AccountOpening,EnrollmentTitle1 %>" runat="server" />
                                <asp:Label ID="lblDocumentsUploadTitle2" CssClass="accountopening-title" Text="<%$FrontEndResources:AccountOpening,EnrollmentTitle2 %>" runat="server" />
                                <asp:Label ID="lblDocumentsUploadDescription1" CssClass="accountopening-description" Text="<%$FrontEndResources:AccountOpening,EnrollmentDescription1UploadInactive %>" runat="server" />
                                <asp:Label ID="lblDocumentsUploadDescription2" CssClass="accountopening-description" Text="<%$FrontEndResources:AccountOpening,EnrollmentDescription2 %>" runat="server" />
                            </div>
                            <div id="divIBContainer" runat="server" visible="false">
                                <asp:Label ID="lblDocumentsIBTitle1" CssClass="accountopening-title" Text="<%$FrontEndResources:AccountOpening,EnrollmentTitle1 %>" runat="server" />
                                <asp:Label ID="lblDocumentsIBTitle2" CssClass="accountopening-title" Text="<%$FrontEndResources:AccountOpening,EnrollmentTitle2 %>" runat="server" />
                                <asp:Label ID="lblDocumentsIBDescription1" CssClass="accountopening-description" Text="<%$FrontEndResources:AccountOpening,EnrollmentDescription1UploadInactive %>" runat="server" />
                                <asp:Label ID="lblDocumentsIBDescription2" CssClass="accountopening-description" Text="<%$FrontEndResources:AccountOpening,EnrollmentDescription2 %>" runat="server" />
                            </div>
                            <div id="divUploadWithIBContainer" runat="server" visible="false">
                                <asp:Label ID="lblDocumentsUploadWithIBTitle1" CssClass="accountopening-title" Text="<%$FrontEndResources:AccountOpening,EnrollmentTitle1 %>" runat="server" />
                                <asp:Label ID="lblDocumentsUploadWithIBTitle2" CssClass="accountopening-title" Text="<%$FrontEndResources:AccountOpening,EnrollmentTitle2 %>" runat="server" />
                                <asp:Label ID="lblDocumentsUploadWithIBDescription1" CssClass="accountopening-description" Text="<%$FrontEndResources:AccountOpening,EnrollmentDescription1 %>" runat="server" />
                                <asp:Label ID="lblDocumentsUploadWithIBDescription2" CssClass="accountopening-description" Text="<%$FrontEndResources:AccountOpening,EnrollmentDescription2 %>" runat="server" />
                            </div>
                            <p class="accountopening-title" style="padding: 20px 5px 10px;">
                                <asp:Literal ID="l" runat="server" Text="<%$FrontEndResources:AccountOpening,ContractsListTitle %>"></asp:Literal>
                            </p>
                            <div class="panel-login-inputs" style="margin-bottom: 35px">
                                <div style="padding: 5px 0;">
                                    <asp:Repeater ID="repeaterDocuments" runat="server">
                                        <ItemTemplate>
                                            <div class="enrollment-contract" style="border: none; padding-bottom: 5px !important;">
                                                <asp:LinkButton ID="lnkDocument" Text="<%$FrontEndResources:Subscription,RegisterFormTitle %>" CssClass="contract-element" runat="server" />
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </asp:Panel>
                    </div>
                </div>
                <div class="clearBoth"></div>
                
             <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12"><asp:PlaceHolder ID="phMessageTransaction" runat="server" Visible="false"></asp:PlaceHolder></div>
                <div id="divContainerDocumentsUpload" runat="server" class=" fullHeight nMarginLeft15">
                    <span class="accountopening-title" style="padding: 20px 5px 10px;">
                        <asp:Label ID="DocumentsLbl" Text="<%$FrontEndResources:Subscription,DocumentInProcess %>" runat="server" /></span>
                    <div class="panel-login-inputs">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-lg-12 col-max fullWidth accountopening-tab-background">
                            <section>
                                <div class="col-lg-12 col-left noprint clearPadding paddingTop5 paddingBottom5">
                                    <ul class="ActivityTabs_Wrapper row">
                                        <asp:Repeater ID="repeaterDocumentTypes" runat="server">
                                            <ItemTemplate>
                                                <li id="holderElem" runat="server">
                                                    <asp:LinkButton runat="server" href="javascript:void(0);" ID="tabCollateralizedDetail" class="ActivityTabs All">
                                                        <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                                                            <ContentTemplate>
                                                                <div class="ActivityTabs_Title">
                                                                    <div class="EnrolmentTabs_Icon_Configuration" style="padding-top: 15px !important;">
                                                                        <asp:Label runat="server" CssClass="lblCustomer" ID="lblCounterName2"></asp:Label>
                                                                    </div>
                                                                    <div class="ActivityTabs_Counter">
                                                                        <asp:Literal ID="litCounterValue2" runat="server"></asp:Literal>
                                                                    </div>
                                                                </div>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </asp:LinkButton>
                                                </li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </div>
                            </section>
                        </div>

                        <div class="panel panel-default" style="padding: 0 5%;">
                            <div class="panel-body content" style="padding-left: 0px; padding-right: 0px;"> 
                                <asp:Repeater ID="repeaterDocumentsContent" runat="server">
                                    <ItemTemplate>
                                        <div id='entityData<%# Container.DataItem %>' class="tab">
                                            <st:EnrolmentData ID="entityData" runat="server" />
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>

                                <div class="clearBoth"></div>
                                <div class="col-xs-12 clearPadding" style="margin-top: 20px;">
                                     <asp:Button ID="btnLogin" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Register,Exit %>" runat="server" OnClick="btnExit_Click" />
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 visible-lg visible-md visible-sm" style="float: right;">
                <div class="register-help" style="margin-top: 0px">
                    <h2>
                        <asp:Literal ID="Literal7" Text="<%$FrontEndResources:Register,NeedHelp %>" runat="server"></asp:Literal></h2>
                    <div class="help-item">
                        <h3>
                            <asp:Literal ID="Literal8" Text="<%$FrontEndResources:Register,CallUs %>" runat="server"></asp:Literal></h3>
                        <span class="register-phone">
                            <asp:Literal ID="Literal5" Text="<%$FrontEndResources:Register,CellPhoneNumber %>" runat="server"></asp:Literal></span>
                        <span class="register-text">
                            <asp:Literal ID="Literal9" Text="<%$FrontEndResources:Register,RegisterInfo %>" runat="server"></asp:Literal></span>
                    </div>
                </div>
            </div>

        </div>
        <div class="clearBoth"></div>
    </asp:Panel>
    <div class="clearBoth"></div>
    <asp:HiddenField ID="hdnInputTextField" runat="server" />
    <asp:HiddenField ID="hdnPanelVisible" runat="server" />
    <asp:HiddenField ID="hdnSelectedTab" runat="server" />
    <script type="text/javascript">
        
        $(document).ready(function () {
            var selectedTab = $("input[id*='hdnSelectedTab']").val();
            SelectTab("[id*='tabCollateralizedDetail_" + selectedTab + "']", selectedTab);
           
        });

        function ShowWarning(text)
        {
            itcore_ui.ShowTopPopupWarning(text, top.eBankit.Presentation.GetResource("WarningTitle"));
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
                }
                else {
                    $(this).removeClass('step-previous');
                }
            });

            $("[id*='hdnSelectedTab']").val(tab);
        };
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>



