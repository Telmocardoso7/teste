<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="AccountGroupEdit.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Controls.Contract.AccountGroupEdit" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TransactionFeaturedContent" runat="server">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro text-brand-terciary" style="margin: 20px auto">
        <h3 class="head head-top">
            <asp:Literal ID="litTitle" Text="<%$FrontEndResources:AccountEdit,Title%>" runat="server"></asp:Literal>
        </h3>
    </div>
    <%--Top disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
    <asp:Literal ID="literalGenericTop" runat="server"></asp:Literal>
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-max divInformational border-bottom-brand-terciary" style="margin: 20px auto">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro text-brand-terciary" style="margin: 20px auto">
            <asp:Literal ID="Literal5" Text="<%$FrontEndResources:AccountEdit,Informational%>" runat="server"></asp:Literal>
        </div>
    </div>

    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="TransactionMainContent" runat="server">

    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("AccountGroupEdit.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />

    <div id="divMainContent" runat="server">

        <section class="costumer-contract-details">

            <div class="ebankit-accordion-list" id="divContractDetails" runat="server">

                <asp:UpdatePanel runat="server" ID="upTransactions" UpdateMode="Always" class="ebankit-accordion-list col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro muc-no-border-top">
                    <ContentTemplate>

                        <div class="col-xs-12 bs-reduced bs-head-metro title-grid">
                            <h3 class="head">
                                <asp:Literal ID="Literal2" Text="<%$FrontEndResources:ContractDetails,AccountsGroups%>" runat="server"></asp:Literal>
                            </h3>
                        </div>
                        <hr class="no-margin" />
                        <div runat="server" id="divContainerAccounts" class="grid-contract-items grid-no-pagination ">

                            <asp:Repeater runat="server" ID="rptAcountsGroups" OnItemDataBound="rptAcountsGroups_ItemDataBound">
                                <HeaderTemplate>
                                    <table class="table hovered table-resp-to1199 noarrow  no-margin ebankit-accordion-list">
                                        <thead class="theadcol">
                                            <tr class="table-header">
                                                <th class="formatTableData padding8Important visible-md visible-lg visible-sm text-brand-terciary">
                                                    <asp:Label runat="server" ID="lblHeaderCol1" Text="<%$FrontEndResources:ContractDetails,Group%>"></asp:Label>
                                                </th>
                                                <th class="formatTableData padding8Important visible-md visible-lg visible-sm text-brand-terciary" style="max-width: 150px;">
                                                    <asp:Label runat="server" ID="lblHeaderCol2" Text="<%$FrontEndResources:AddVEAccountsV2,ActiveAccountsHeader%>"></asp:Label>
                                                </th>
                                                <th class="formatTableData padding8Important visible-md visible-lg visible-sm text-brand-terciary"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr class="panel-heading collapsed" data-toggle="collapse" href="#listaccounts-<%# Eval("GroupIndex") %>">

                                        <td>
                                            <asp:Label runat="server" ID="lblValCol1" Text="<%$FrontEndResources:AccountGroup,OtherEntitiesAccountGroup%>"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label runat="server" ID="lblValCol2"></asp:Label>
                                        </td>
                                        <td class="detail-group-head " style="width: 60px;">
                                            <div class="step-muc-actions" style="position: inherit !important">
                                                <asp:LinkButton ID="LinkButton1" runat="server" data-toggle="tooltip" TabIndex="0" data-placement="top" data-container="body" ToolTip="<%$FrontEndResources:ContractDetails,Expand%>" data-original-title="" CssClass="muc-exp-col muc-details-expand "></asp:LinkButton>
                                            </div>
                                        </td>
                                    </tr>
                                    <br />
                                    <tr id="listaccounts-<%# Eval("GroupIndex") %>" aria-expanded="false" class="collapse" style="width: 100%;">
                                        <td class="container" colspan="3">
                                            <div class="input-account-search" id="divAccountSearch" runat="server">
                                                <asp:TextBox runat="server" ID="searchAccount" class="form-control-box" onKeyUp="searchAccountOnGroup(this)"></asp:TextBox>
                                                <span class="input-account-addon input-group-addon" id="searchacc"></span>
                                                <span class="input-account-addon input-group-addon clear" id="clearacc" onclick="clearSearch(this)" onkeypress="clearSearchKeyboard(this)" tabindex="0" style="display: none"></span>
                                            </div>
                                            <div runat="server" id="divAccountsInGroupContssent" class="col-xs-12 bs-reduced bs-head-metro account-subtitle-header">
                                                <div class="displayInlineBlock">
                                                    <h3 class="head">
                                                        <asp:Literal ID="Literal2" Text="<%$FrontEndResources:ContractDetails,Accounts%>" runat="server"></asp:Literal>
                                                    </h3>
                                                </div>
                                                <div class="displayInlineBlock groupCounter" id="divCounter" runat="server">
                                                    <asp:Literal ID="literalAccountsSelectedCounter" Text="<%$FrontEndResources:AddVEAccountsV2,AccountsCounter%>" runat="server"></asp:Literal>

                                                </div>
                                                <asp:HiddenField runat="server" Value="<%$FrontEndResources:AddVEAccountsV2,AccountsCounter%>" ID="hdnCounterTranslation" />
                                            </div>
                                            <br />
                                            <div class="container-accounts" id="group-<%# Eval("GroupName") %>">

                                                <!-- Accounts -->
                                                <asp:Repeater runat="server" ID="rptAccount" OnItemDataBound="rptAccount_ItemDataBound">
                                                    <HeaderTemplate>
                                                        <table class="table hovered table-resp-to1199 noarrow  no-margin ebankit-accordion-list">
                                                            <thead>
                                                                <tr class="table-header">
                                                                    <th class="formatTableData padding8Important visible-md visible-lg visible-sm col-xs-4 text-brand-terciary">
                                                                        <div class="cbcontainer ">
                                                                            <asp:CheckBox ID="chkAllSelectActive" runat="server" />
                                                                            <div class="checkmark select-all custom-muc-chk" data-toggle="tooltip" data-placement="bottom" data-container="body" data-original-title='<%= this.translateCheckboxTooltip %>'></div>
                                                                            <asp:Label ID="lblActive" runat="server" Text="<%$FrontEndResources:AccountEdit,TitleColumnActive%>" CssClass="lblContractResponsive marginRight10" />
                                                                            <asp:Label runat="server" ID="lblImgPendingNotOtherEntity" class="img-info" TabIndex="0"
                                                                                ToolTip="<%$FrontEndResources:AccountEdit,AccountActiveTooltip%>"
                                                                                data-toggle="tooltip" data-placement="top" data-container="body" data-original-title=""></asp:Label>
                                                                        </div>
                                                                    </th>
                                                                    <th class="formatTableData padding8Important visible-md visible-lg visible-sm text-brand-terciary">
                                                                        <div class="cbcontainer ">
                                                                            <asp:Label runat="server" CssClass="lblSubtitleAccountsGrid" Text="<%$FrontEndResources:ContractDetails,AccountNumber%>"></asp:Label>
                                                                        </div>
                                                                    </th>
                                                                    <th class="formatTableData padding8Important visible-md visible-lg visible-sm text-brand-terciary"></th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr class="account-wrapper item infoAccount">
                                                            <td class="col-xs-3">
                                                                <div class="cbcontainer ">
                                                                    <asp:CheckBox ID="chkSelectActive" runat="server" />
                                                                    <div class="checkmark single custom-muc-chk" id="divChkSingle" runat="server"></div>
                                                                </div>
                                                            </td>
                                                            <td class="col-xs-5" style="text-align: left;">
                                                                <asp:Label runat="server" ID="lblAccountNumber"></asp:Label>
                                                            </td>
                                                            <td class="col-xs-4" style="text-align: left;" runat="server" id="tdPendingLabel">

                                                                <asp:Label runat="server" ID="lblPendingNotOtherEntity" Text="<%$FrontEndResources:AccountEdit,PendingApproval%>"
                                                                    ToolTip="<%$FrontEndResources:AccountEdit,AccountStatusTooltip%>"
                                                                    data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="MUCPendingApprovalLabel"></asp:Label>

                                                                <asp:Label runat="server" ID="lblImgPendingNotOtherEntity" class="img-info" TabIndex="0"
                                                                    ToolTip="<%$FrontEndResources:AccountEdit,AccountStatusTooltip%>"
                                                                    data-toggle="tooltip" data-placement="top" data-container="body" data-original-title=""></asp:Label>

                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>

                                                <!-- Pending Accounts -->
                                                <asp:Repeater runat="server" ID="rptAccountPending" OnItemDataBound="rptAccountPending_ItemDataBound" Visible="false">
                                                    <HeaderTemplate>
                                                        <table class="table hovered table-resp-to1199 noarrow  no-margin ebankit-accordion-list">
                                                            <thead>
                                                                <tr class="table-header">
                                                                    <th class="formatTableData padding8Important visible-md visible-lg visible-sm text-brand-terciary">
                                                                        <div class="cbcontainer title-grid">
                                                                            <asp:Label runat="server" CssClass="lblSubtitleAccountsGrid" Text="<%$FrontEndResources:ContractDetails,AccountNumber%>"></asp:Label>
                                                                        </div>
                                                                    </th>
                                                                    <th class="formatTableData padding8Important visible-md visible-lg visible-sm col-xs-4 text-brand-terciary"></th>
                                                                    <th></th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr class="account-wrapper item">
                                                            <td class="col-xs-9" style="text-align: left;">
                                                                <asp:Label runat="server" ID="lblAccountNumberPending"></asp:Label>
                                                            </td>
                                                            <td class="col-xs-1">

                                                                <asp:Label runat="server" Text="<%$FrontEndResources:AccountEdit,PendingApproval%>"
                                                                    ToolTip="<%$FrontEndResources:AccountEdit,AccountStatusTooltip%>"
                                                                    data-toggle="tooltip" data-placement="top" data-container="body" data-original-title=""></asp:Label>

                                                                <asp:Label runat="server" class="img-info" TabIndex="0"
                                                                    ToolTip="<%$FrontEndResources:AccountEdit,AccountStatusTooltip%>"
                                                                    data-toggle="tooltip" data-placement="top" data-container="body" data-original-title=""></asp:Label>

                                                            </td>
                                                            <td class="col-xs-2">
                                                                <p class="action-buttons">
                                                                    <asp:LinkButton ID="LinkButton2" runat="server" ToolTip="<%$FrontEndResources:AccountEdit,DeleteAccount%>"
                                                                        data-toggle="tooltip" data-placement="top" data-container="body" data-original-title=""
                                                                        CommandArgument='<%# Eval("TransactionalAccountNumber") %>' OnClick="btnDeleteRowPending_Click"
                                                                        CssClass="btn-delete">
                                                                    </asp:LinkButton>
                                                                </p>
                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>

                                            </div>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </tbody>
                                    </table>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
                <!-- Button New -->
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max trs_buttons">
                    <div class="trs_buttons-action">
                        <asp:LinkButton ID="btnNew" runat="server" OnClick="BtnAddAccount_Click" CssClass="btn btn-default">
                            <asp:Literal ID="litBtnNew" Text="<%$FrontEndResources:AccountEdit,AddBtn%>" runat="server"></asp:Literal>
                        </asp:LinkButton>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max trs_buttons">
                    <div class="trs_buttons-action">
                        <asp:LinkButton ID="btnContractGoBack" runat="server" OnClick="BtnContractGoBack_Click" CssClass="btn btn-default">
                            <asp:Literal ID="litBtnGoBack" Text="<%$FrontEndResources:TrusteeEdit,ButtonCancel%>" runat="server"></asp:Literal>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnTrusteeSave" runat="server" OnClick="BtnAccountSave_Click" CssClass="btn btn-primary">
                            <asp:Literal ID="litBtnTrusteeSave" Text="<%$FrontEndResources:TrusteeEdit,ButtonSave%>" runat="server"></asp:Literal>
                        </asp:LinkButton>
                    </div>
                </div>

            </div>

        </section>

    </div>
    <%--Bottom disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
    <asp:Literal ID="literalGenericBottom" runat="server"></asp:Literal>
    <script>

        var textForExpand = '<%= this.translateExpand %>';
        var textForCollapse = '<%= this.translateCollapse %>';
        var NewEditAccountsVE = <%= this.NewEditAccountsVE.ToString().ToLower() %>;

        $(document).ready(function () {
            $('.groupCounter').each(function () {
                var countCheck = $(this).parent().siblings('div').find($('.account-wrapper [id^="MainContent_TransactionMainContent_rptAcountsGroups_rptAccount_"]:checked')).length;
                var hdnCounterVal = $(this).siblings('input').val();
                $(this).html(hdnCounterVal.format(countCheck));
            });

            $(".MUCAddAcoountsDisabled").each(function () {
                
                $(this).siblings('input').attr('tabindex','-1');
            });

            numberSingleChecked = 0;

            $($('[id*="_chkAllSelectActive"]').parent()).keyup(function (e) {
                if (e.keyCode === 32 || e.keyCode === 13) {
                    $($(this)).parent().find(".select-all").trigger("click");
                };
            });
            $('tbody .account-wrapper input[id^="MainContent_TransactionMainContent_rptAcountsGroups_rptAccount_"]').change(function (e) {
                
                var index = $(this).parent().parent().parent().parent();

                if (index.find($('.account-wrapper [id^="MainContent_TransactionMainContent_rptAcountsGroups_rptAccount_"]:checked')).length == index.find($('.account-wrapper input[id^="MainContent_TransactionMainContent_rptAcountsGroups_rptAccount_"]')).length) {
                    index.parent().find($('[id*="_chkAllSelectActive"]')).prop('checked', true);
                    var chksCounter = index.find('input[type="checkbox"]:checked');
                    var hdnCounterVal = $(this).parents(8).siblings('.account-subtitle-header').find('.groupCounter').siblings('input').val();
                    $(this).parents(8).siblings('.account-subtitle-header').find('.groupCounter').html(hdnCounterVal.format(chksCounter.length));

                }
                else {
                    var chksCounter = index.find('input[type="checkbox"]:checked');
                    index.parent().find($('[id*="_chkAllSelectActive"]')).prop('checked', false);
                    numberSingleChecked--;
                    var hdnCounterVal = $(this).parents(8).siblings('.account-subtitle-header').find('.groupCounter').siblings('input').val();
                    $(this).parents(8).siblings('.account-subtitle-header').find('.groupCounter').html(hdnCounterVal.format(chksCounter.length));
                }

            });
        });
    </script>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/Services/MUC/ebankit-muc-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>

</asp:Content>
