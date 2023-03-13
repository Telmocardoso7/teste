<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="TrusteeEdit.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Controls.Contract.TrusteeEdit" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Content ID="Content2" ContentPlaceHolderID="TransactionFeaturedContent" runat="server">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto">
        <h3 class="head head-top">
            <asp:Literal ID="litTitle" Text="<%$FrontEndResources:TrusteeEdit,Title%>" runat="server"></asp:Literal>
        </h3>
    </div>
    <%--Top disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
    <asp:Literal ID="literalGenericTop" runat="server"></asp:Literal>
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-max divInformational border-bottom-brand-terciary" style="margin: 20px auto">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro text-brand-terciary" style="margin: 20px auto">
            <asp:Literal ID="Literal3" Text="<%$FrontEndResources:TrusteeEdit,Informational%>" runat="server"></asp:Literal>
        </div>
    </div>

    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="TransactionMainContent" runat="server">

    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TrusteeEdit.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />

    <div id="divMainContent" runat="server">

        <section class="muc costumer-contract-details">

            <div class="ebankit-accordion-list col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro muc-no-border-top" id="divContractDetails" runat="server">

                <asp:HiddenField ID="hdnMUCAllowEditContractOwnership" runat="server" />
                <h3 class="head">
                    <asp:Literal ID="litTrusteesOwners" Text="<%$FrontEndResources:TrusteeEdit,GridTitle%>" runat="server"></asp:Literal>
                </h3>
                <hr class="no-margin" />
                <it:GridViewControl ID="gvTrustees" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow no-margin contractTableResponsive"
                    EmptyDataText="<%$FrontEndResources:ContractDetails,NoTrusteesOwners%>"
                    GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="GVTrustees_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2 noPaddingHeader textOverflowInital" HeaderText="<%$FrontEndResources:ContractDetails,TrustreeName%>">
                            <HeaderTemplate>
                                <div class="col-xs-12 noPaddingLeft noPaddingRight adjustMargin">
                                    <div class="col-xs-5 col-md-3 noPaddingLeft noPaddingRight">
                                        <div class="cbcontainer cbcontainer-trustee ">
                                            <asp:CheckBox ID="chkAllSelectInclude" runat="server" />
                                            <div class="checkmark select-all checkAllInclude custom-muc-chk" colchk="1"></div>
                                        </div>
                                    </div>
                                    <div class="col-xs-7 col-md-8 noPaddingLeft noPaddingRight">
                                        <asp:Label ID="lblInclude" runat="server" Text="<%$FrontEndResources:TrusteeEdit,TitleColumnActive%>" CssClass="lblContractResponsive marginRight10 lblSpanHeadTrustee text-brand-terciary breakWhiteSpaces" Style="margin-top: 5px;" />
                                    </div>
                                </div>

                            </HeaderTemplate>
                            <ItemTemplate>
                                <div class="cbcontainer cbcontainer-trustee" colchk="1">
                                    <asp:CheckBox ID="chkSelectInclude" runat="server" />
                                    <div id="divInclude" class="checkmark single checkInclude custom-muc-chk" colchk="1" runat="server" data-flag-owner="false"></div>
                                </div>
                                <asp:Label ID="lblCustomerNumber" runat="server" Text="" Visible="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-3 noPaddingHeader textOverflowInital" HeaderText="<%$FrontEndResources:ContractDetails,TrustreeName%>">
                            <HeaderTemplate>
                                <div class="col-xs-12 noPaddingLeft noPaddingRight adjustMargin">
                                    <div class="col-xs-12 noPaddingLeft noPaddingRight">
                                        <div class="col-xs-4 col-md-2 noPaddingLeft noPaddingRight">
                                            <div class="cbcontainer cbcontainer-trustee ">
                                                <asp:CheckBox ID="chkAllSelectOwner" runat="server" />
                                                <div id="divAllOwner" class="checkmark select-all checkAllOwner custom-muc-chk" colchk="2" runat="server"></div>
                                            </div>

                                        </div>
                                        <div class="col-xs-8 col-md-8 noPaddingLeft noPaddingRight">
                                            <asp:Label ID="lblIsOwner" runat="server" Text="<%$FrontEndResources:TrusteeEdit,TitleColumnIsOwner%>" CssClass="lblContractResponsive marginRight10 lblSpanHeadTrustee text-brand-terciary breakWhiteSpaces overflowNotSet" Style="margin-top: 5px;" />
                                        </div>
                                    </div>
                                </div>

                            </HeaderTemplate>
                            <ItemTemplate>
                                <div class="cbcontainer cbcontainer-trustee " colchk="2">
                                    <asp:CheckBox ID="chkSelectOwner" runat="server" />
                                    <div id="divOwner" class="checkmark single checkOwner custom-muc-chk" colchk="2" runat="server" data-flag-owner="false"></div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary noPaddingHeader textOverflowInital" HeaderText="<%$FrontEndResources:ContractDetails,TrustreeName%>">
                            <HeaderTemplate>
                                <div class="col-xs-12 noPaddingLeft noPaddingRight adjustMargin" style="margin-bottom: 20px;">
                                    <asp:Label runat="server" Text="<%$FrontEndResources:ContractDetails,TrustreeName%>" CssClass="lblContractResponsive marginRight10 lblSpanHeadTrustee text-brand-terciary" />
                                </div>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblResponsiveOwnerName" runat="server" Text="<%$FrontEndResources:ContractDetails,TrustreeName%>" CssClass="lblContractResponsive marginRight10 text-brand-terciary" />
                                <asp:Label ID="lblTrustreeName" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary noPaddingHeader textOverflowInital">
                            <HeaderTemplate>
                                <div class="col-xs-12 noPaddingLeft noPaddingRight adjustMargin" style="margin-bottom: 20px;">
                                    <asp:Label runat="server" Text="<%$FrontEndResources:ContractDetails,Username%>" CssClass="lblContractResponsive marginRight10 lblSpanHeadTrustee text-brand-terciary" />
                                </div>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblResponsiveOwnerUsername" runat="server" Text="<%$FrontEndResources:ContractDetails,Username%>" CssClass="lblContractResponsive marginRight10" />
                                <asp:Label ID="lblTrustreeAlias" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary noPaddingHeader textOverflowInital" HeaderText="<%$FrontEndResources:ContractDetails,AlternativeUsername%>">
                            <HeaderTemplate>
                                <div class="col-xs-12 noPaddingLeft noPaddingRight adjustMargin" style="margin-left: 10px;">
                                    <asp:Label runat="server" Style="width: 110px;" Text="<%$FrontEndResources:ContractDetails,AlternativeUsername%>" CssClass="lblContractResponsive marginRight10 lblSpanHeadTrustee text-brand-terciary alternative-user-header" />
                                </div>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblResponsiveOwnerAlternativeUsername" runat="server" Text="<%$FrontEndResources:ContractDetails,AlternativeUsername%>" CssClass="lblContractResponsive marginRight12" />
                                <asp:Label ID="lblTrustreeAlternativeAlias" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary noPaddingHeader textOverflowInital" HeaderText="<%$FrontEndResources:ContractDetails,LastAccess%>">
                            <HeaderTemplate>
                                <div class="col-xs-12 noPaddingLeft noPaddingRight adjustMargin" style="margin-bottom: 20px; margin-left: 0px;">
                                    <asp:Label runat="server" Text="<%$FrontEndResources:ContractDetails,LastAccess%>" CssClass="lblContractResponsive marginRight10 lblSpanHeadTrustee text-brand-terciary" />
                                </div>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblResponsiveLastAccess" runat="server" Text="<%$FrontEndResources:ContractDetails,LastAccess%>" CssClass="lblContractResponsive marginRight10" />
                                <asp:Label ID="lblLastAccess" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="col-md-2 col-sm-6 col-xs-1 col-xs-offset-2 col-sm-offset-1 col-md-offset-0 ">
                            <ItemTemplate>
                                <p class="action-buttons">
                                    <asp:LinkButton ID="btnDeleteRow" runat="server"
                                        ToolTip="<%$FrontEndResources:TrusteeEdit,PopupCancelBtnConfirmDeclineOperation%>"
                                        CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' data-modal="yes" OnClick="btnDelete_Click"
                                        data-delete-singular="" CssClass="btn-delete"></asp:LinkButton>
                                </p>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </it:GridViewControl>

                <!-- Pending -->
                <div id="divPending" class="gridPending" runat="server">
                    <h3 class="head">
                        <asp:Literal ID="Literal4" Text="<%$FrontEndResources:TrusteeEdit,GridTitlePending%>" runat="server"></asp:Literal>
                    </h3>
                    <hr class="no-margin" />
                </div>
                <it:GridViewControl ID="gvPendingTrustees" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow no-margin contractTableResponsive"
                    EmptyDataText="<%$FrontEndResources:ContractDetails,NoTrusteesOwners%>"
                    GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="GVPendingTrustees_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary" HeaderText="<%$FrontEndResources:ContractDetails,TrustreeName%>">
                            <HeaderTemplate>
                                <div style="position: absolute;">
                                    <asp:Label runat="server" Text="<%$FrontEndResources:ContractDetails,TrustreeName%>" CssClass="lblContractResponsive marginRight10 lblSpanHeadTrustee text-brand-terciary" />
                                </div>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="lblResponsiveOwnerName" runat="server" Text="<%$FrontEndResources:ContractDetails,TrustreeName%>" CssClass="lblContractResponsive marginRight10 text-brand-terciary" />
                                <asp:Label ID="lblTrustreeName" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine col-xs-8 text-brand-terciary" HeaderText="">
                            <ItemTemplate>
                                <div class="pendingAlignRight">
                                    <asp:Label runat="server" Text="<%$FrontEndResources:TrusteeEdit,PendingApproval%>"
                                        ToolTip="<%$FrontEndResources:TrusteeEdit,TrusteeStatusTooltip%>"
                                        data-toggle="tooltip" data-placement="top" data-container="body" data-original-title=""></asp:Label>

                                    <asp:Label runat="server" class="img-info" TabIndex="0"
                                        ToolTip="<%$FrontEndResources:TrusteeEdit,TrusteeStatusTooltip%>"
                                        data-toggle="tooltip" data-placement="top" data-container="body" data-original-title=""></asp:Label>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="col-md-2 col-sm-6 col-xs-1 col-xs-offset-2 col-sm-offset-1 col-md-offset-0 text-brand-terciary pendingAlignRight">
                            <ItemTemplate>
                                <p class="action-buttons">
                                    <asp:LinkButton ID="btnDeletePendingRow" runat="server"
                                        ToolTip="<%$FrontEndResources:TrusteeEdit,ButtonDeletePending%>"
                                        CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' data-modal="no" OnClick="btnDeletePending_Click"
                                        data-delete-singular="" CssClass="btn-delete"></asp:LinkButton>
                                </p>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </it:GridViewControl>

                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max trs_buttons" style="border-bottom: 1px solid #ededed; height: 80px; border-top: 1px solid #ededed;">
                    <div class="trs_buttons-action" style="margin-top: 20px;">
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="BtnAddUser_Click" CssClass="btn btn-default">
                            <asp:Literal ID="Literal1" Text="<%$FrontEndResources:AddUsersToContract,ButtonAddUser%>" runat="server"></asp:Literal>
                        </asp:LinkButton>
                    </div>
                </div>
                <div class="clearBoth"></div>
                <br />
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max trs_buttons">
                    <div class="trs_buttons-action">
                        <asp:LinkButton ID="btnContractGoBack" runat="server" OnClick="BtnContractGoBack_Click" CssClass="btn btn-default">
                            <asp:Literal ID="litBtnGoBack" Text="<%$FrontEndResources:TrusteeEdit,ButtonCancel%>" runat="server"></asp:Literal>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnTrusteeSave" runat="server" OnClick="BtnTrusteeSave_Click" CssClass="btn btn-primary">
                            <asp:Literal ID="litBtnTrusteeSave" Text="<%$FrontEndResources:TrusteeEdit,ButtonSave%>" runat="server"></asp:Literal>
                        </asp:LinkButton>
                    </div>
                </div>

            </div>

        </section>
    </div>
    <%--Bottom disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
    <asp:Literal ID="literalGenericBottom" runat="server"></asp:Literal>
    <script type="text/javascript">
        var control = {};
        control.Init = function () {
            $("[data-delete-singular]").on("click", function (event) {
                var elem = $(this);
                event.preventDefault();
                itcore_ui.ShowTopPopupConfirm_V3(
                    "",
                '<%=eBankit.Common.Globalization.Translate.GetTransactionString("TrusteeEdit", "PopupDeclineTitle")%>',
                '<%=eBankit.Common.Globalization.Translate.GetTransactionString("TrusteeEdit", "PopupDeclineConfirmationMessage")%>',
                    elem.attr("href"), '',
                '<%=eBankit.Common.Globalization.Translate.GetTransactionString("GroupEdit", "PopupBtnKeep")%>',
                '<%=eBankit.Common.Globalization.Translate.GetTransactionString("TrusteeEdit", "PopupCancelBtnConfirmDeclineOperation")%>');

                return false;
            });
        }

        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            control.Init();
        });

        reConfig = function () {
            $('.action-delete').on('click', function () {
                var anchor = $(this).prev('a');
                $(anchor).trigger('click');
            });
        }

        $(document).ready(function () {
            control.Init();
            reConfig();
            var hdnMUCAllowEditContractOwnership = $('[id$=hdnMUCAllowEditContractOwnership]');

            $("#MainContent_TransactionMainContent_gvTrustees_chkAllSelectOwner").attr("aria-label", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TrusteeEdit", "accessibilityChkAllSelectOwner")%>");
            $("#MainContent_TransactionMainContent_gvTrustees_chkAllSelectOwner").parent().find("div").eq(0).attr("title", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TrusteeEdit", "accessibilityChkAllSelectOwner")%>");

            $("#MainContent_TransactionMainContent_gvTrustees_chkAllSelectInclude").attr("aria-label", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TrusteeEdit", "accessibilityChkAllSelectInclude")%>");
            $("#MainContent_TransactionMainContent_gvTrustees_chkAllSelectInclude").parent().find("div").eq(0).attr("title", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TrusteeEdit", "accessibilityChkAllSelectInclude")%>");

            $($("#MainContent_TransactionMainContent_gvTrustees_chkAllSelectOwner").parent()).keyup(function (e) {
                if (hdnMUCAllowEditContractOwnership.val().toLowerCase() == 'true') {
                    if (e.keyCode === 32 || e.keyCode === 13) {
                        $("#MainContent_TransactionMainContent_gvTrustees_chkAllSelectOwner").parent().find(".select-all").trigger("click");
                    }
                } else {
                    event.preventDefault();
                }
            });

            $($("#MainContent_TransactionMainContent_gvTrustees_chkAllSelectInclude").parent()).keyup(function (e) {

                if (e.keyCode === 32 || e.keyCode === 13) {
                    $("#MainContent_TransactionMainContent_gvTrustees_chkAllSelectInclude").parent().find(".select-all").trigger("click");
                };
            });

            $('[id^="MainContent_TransactionMainContent_gvTrustees_chkSelectInclude_"]').attr("aria-label", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TrusteeEdit", "accessibilityChkAllSelectInclude")%>");
            $('[id^="MainContent_TransactionMainContent_gvTrustees_divInclude_"]').attr("title", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TrusteeEdit", "accessibilityChkAllSelectInclude")%>");

            $('[id^="MainContent_TransactionMainContent_gvTrustees_chkSelectOwner_"]').attr("aria-label", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TrusteeEdit", "accessibilityChkAllSelectOwner")%>");
            $('[id^="MainContent_TransactionMainContent_gvTrustees_divOwner_"]').attr("title", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TrusteeEdit", "accessibilityChkAllSelectOwner")%>");

            $('[id^="MainContent_TransactionMainContent_gvTrustees_chkSelectInclude_"]').change(function (e) {
                if ($(this).parent().find("div").attr("data-flag-owner") == "true")
                    $(this).prop('checked', true);

                if ($('[id^="MainContent_TransactionMainContent_gvTrustees_chkSelectInclude_"]:checked').length == $('[id^="MainContent_TransactionMainContent_gvTrustees_chkSelectInclude_"]').length)
                    $("#MainContent_TransactionMainContent_gvTrustees_chkAllSelectInclude").prop('checked', true);
                else
                    $("#MainContent_TransactionMainContent_gvTrustees_chkAllSelectInclude").prop('checked', false);
            });
            $('[id^="MainContent_TransactionMainContent_gvTrustees_chkSelectOwner_"]').change(function (e) {
                if (hdnMUCAllowEditContractOwnership.val().toLowerCase() == 'true') {
                    if ($(this).parent().find("div").attr("data-flag-owner") == "true")
                        $(this).prop('checked', true);

                    if ($('[id^="MainContent_TransactionMainContent_gvTrustees_chkSelectOwner_"]:checked').length == $('[id^="MainContent_TransactionMainContent_gvTrustees_chkSelectOwner_"]').length)
                        $("#MainContent_TransactionMainContent_gvTrustees_chkAllSelectOwner").prop('checked', true);
                    else
                        $("#MainContent_TransactionMainContent_gvTrustees_chkAllSelectOwner").prop('checked', false);
                } else {
                    if ($(this).parent().find("div").attr("data-flag-owner") == "true")
                        $(this).prop('checked', true);
                    else
                        $(this).prop('checked', false);
                    e.preventDefault();
                }
            });
        });
    </script>

    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/Services/MUC/ebankit-muc-trustees-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>

    <style>
        .table > thead > tr > th {
            vertical-align: bottom;
            border-bottom: 0px solid transparent;
        }

        .pagination {
            margin: 2px 0;
        }

        .adjustMargin {
            margin-left: 8px;
        }
    </style>
</asp:Content>
