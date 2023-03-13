<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01801_01.ascx.cs" Inherits="TRX01801_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<%@ Import Namespace="eBankit.Common" %>
<%@ Import Namespace="eBankit.Common.Extensions" %>


<div id="divContent" runat="server" class="transaction-content">
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01801-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    <script type="text/javascript">
        var TRX01801 = {};

        TRX01801.Init = function () {
            $("[data-delete-plural]").on("click", function (event) {
                var elem = $(this);
                event.preventDefault();
                itcore_ui.ShowTopPopupConfirm_V3(
                    "<%=eBankit.Common.Globalization.Translate.GetTransactionString("EbankitCart", "PopupCancelContentMessage").Replace("\"", "&quot;") %>",
                    "<%=eBankit.Common.Globalization.Translate.GetTransactionString("EbankitCart", "PopupDeclineTitle")%>",
                    "<%=eBankit.Common.Globalization.Translate.GetTransactionString("EbankitCart", "PopupDeclineConfirmationMessage")%>",
                    elem.attr("href"), "",
                    "<%=eBankit.Common.Globalization.Translate.GetTransactionString("EbankitCart", "PopupCancelBtnKeepOperation")%>",
                    "<%=eBankit.Common.Globalization.Translate.GetTransactionString("EbankitCart", "PopupCancelBtnConfirmDeclineOperation")%>");

                return false;
            });

            $("[data-delete-singular]").on("click", function (event) {
                var elem = $(this);
                event.preventDefault();
                itcore_ui.ShowTopPopupConfirm_V3(
                     "<%=eBankit.Common.Globalization.Translate.GetTransactionString("EbankitCartItemDetail", "PopupCancelContentMessage").Replace("\"", "&quot;") %>",
                    "<%=eBankit.Common.Globalization.Translate.GetTransactionString("EbankitCartItemDetail", "PopupDeclineTitle")%>",
                    "<%=eBankit.Common.Globalization.Translate.GetTransactionString("EbankitCartItemDetail", "PopupDeclineConfirmationMessage")%>",
                    elem.attr("href"), "",
                    "<%=eBankit.Common.Globalization.Translate.GetTransactionString("EbankitCartItemDetail", "PopupCancelBtnKeepOperation")%>",
                    "<%=eBankit.Common.Globalization.Translate.GetTransactionString("EbankitCartItemDetail", "PopupCancelBtnConfirmDeclineOperation")%>");

                return false;
            });
        }

        $(document).ready(function () {
            TRX01801.Init();
        });

        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            TRX01801.Init();
        });
    </script>
    <div class="cart-container">
        <div class=" panel-detail">
            <div>
                <div id="divSearchCriteria" runat="server">
                    <div class="metro">
                        <div class="panel" data-role="panel" id="divFilter">
                            <asp:UpdatePanel runat="server" ID="updatePanel1">
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnSearch" />
                                </Triggers>
                                <ContentTemplate>
                                    <div class="listHeader">
                                        <div class="col-lg-8 col-max panel-header panel-header-3 panel-header-4">
                                            <asp:Literal ID="litSearchInfo" runat="server"></asp:Literal>
                                            <div class="img-search-panel">
                                                <img onclick="$('.panel-search').slideToggle();" src="<%$ebFile:~/Content/currenttheme/images/products/ico_search_transactions.png%>" runat="server" id="imgSearch" tabindex="0" role="button" alt="search" />
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <div class="col-lg-8 col-max panel-content panel-search">
                                <asp:HiddenField runat="server" ID="displayFormat"></asp:HiddenField>

                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 paddingTop10" id="datesRangeSearch">
                                    <it:DatePickerTextBoxRangeMetroControl_v3 ID="dpFromTo" Label="<%$FrontEndResources:TRX01801,From%>" LabelTo="<%$FrontEndResources:TRX01801,To%>" runat="server" ValidationRequiredMessage="<%$FrontEndResources:DATALIST,RequiredDateMessage%>" CssClass="field field_v2 field-full metro" />
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <it:DropDownListControl_v2 ID="ddlChannel" Label="<%$FrontEndResources:TRX01801,Channel%>" runat="server" CssClass="field field_v2 field_select field-full" />
                                </div>
                                <div class="clearBoth"></div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 paddingTop10">
                                    <it:DropDownListControl_v2 ID="ddlTransactionType" Label="<%$FrontEndResources:TRX01801,TransactionType%>" runat="server" CssClass="field field_v2 field_select field-full ddlTransactionType " />
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 paddingTop10">
                                    <it:DropDownListControl_v2 ID="ddlAccountNumber" Label="<%$FrontEndResources:TRX01801,SourceAccount%>" runat="server" CssClass="field field_v2 field_select field-full" />
                                </div>
                                <div class="clearBoth"></div>
                                <br>
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right paddingTop10">
                                    <asp:Button ID="btnSearch" CssClass="btn btn-primary btn-margin btn-search-filter" Text="<%$FrontEndResources:TRX01801,Search %>" runat="server" OnClick="btnSearch_Click" />
                                </div>
                                <div class="clearBoth"></div>
                            </div>
                        </div>
                    </div>
                    <div class="clearBoth"></div>
                </div>
            </div>
        </div>

        <asp:UpdatePanel runat="server" ID="upTransactions" UpdateMode="Always">

            <ContentTemplate>
                <asp:ListView ID="rptT" runat="server" ItemPlaceholderID="ItemsDiv" OnItemDataBound="rptT_ItemDataBound" DataKeyNames="CartTransactionItemId">

                    <EmptyDataTemplate>
                        <div class="cart-grid-empty">
                            <div class="cart-grid-empty-icon">
                                <span class="cart-body-empty"></span>
                            </div>
                            <div class="cart-grid-empty-content">
                                <p class="cart-grid-empty-content">
                                    <asp:Literal ID="litMessage1" runat="server" />
                                </p>
                                <br />
                                <asp:Literal ID="litMessage2" runat="server" />
                            </div>
                        </div>
                    </EmptyDataTemplate>
                    <LayoutTemplate>
                        <div id="tabs-waiting-autho">
                            <div class="col-xs-12 pending-operation-message transaction-content" id="infoDivPendingCounterMessage" runat="server">
                                <!--full-->
                                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                                    <div class="pull-left pending-operation-literal">
                                        <asp:Literal runat="server" ID="litCountTransactionsInfo"></asp:Literal>
                                    </div>
                                    <div class="dropdown pull-right no-padding cancel-expired-operations col-xs-3" style="top: 10px">
                                        <it:DropDownListControl_v2 ID="ddlSort" Label="<%$FrontEndResources:TRX01801,SortList%>" AutoPostBack="true" runat="server" ShowLabel="false" OnSelectedChanged="ddlSort_SelectedIndexChanged" />
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="cart-sub-header-container col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                            <div class="cart-sub-header-body row">

                                <div class="trs_buttons col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro transp">
                                    <div class="cbcontainer">
                                        <asp:CheckBox ID="cbSelected"  runat="server" />
                                        <div class="checkmark all"></div>
                                    </div>
                                    <asp:Label AssociatedControlID="cbSelected" runat="server" Text="<%$FrontEndResources:TRX01801,SelectAllTransactions %>" CssClass="pending-check-label" />

                                    <div id="pnlButtonsTop" class="trs_buttons_top_action">

                                        <asp:LinkButton ID="btnDeleteAllTop" runat="server" Text="<%$FrontEndResources:TRX01801,DeleteAllSelected%>" OnClick="btnDeleteSelected_Click" CssClass="btn btn-default cartButton btnDeleteAllTop" data-modal="yes" data-delete-plural="" />

                                        <asp:LinkButton ID="btnCheckoutTop" WorkflowAction="Next" CausesValidation="true" CssClass="btn btn-primary checkout checkoutExecuteTop" runat="server">
                                                <asp:Literal Text="<%$FrontEndResources:TRX01801,ExecuteAllSelected%>" runat="server"></asp:Literal>
                                        </asp:LinkButton>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <hr class="hr-margin-40">
                        </div>
                        <asp:Panel ID="pnlNotifications" runat="server" CssClass="cart-header-notifications" Visible="false">
                            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">

                                <div class="cart-header-body  ">

                                    <asp:Literal ID="litNotificationMessage" runat="server" />

                                </div>

                            </div>
                        </asp:Panel>
                        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                            <div runat="server" id="ItemsDiv">
                            </div>
                        </div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <asp:Panel ID="divCartItemRow" CssClass="cart-item-body row " runat="server">

                            <div class="col-md-1 col-sm-2 col-xs-2 " style="padding-right: 0; padding-left: 0;">
                                <div class="cbcontainer" tabindex="0" role="button" aria-pressed="false">
                                    <asp:CheckBox ID="cbSelected" runat="server" />
                                    <div class="checkmark single"></div>
                                </div>
                                <div id="transactionIcon" runat="server" class="cart-transaction-icon " style="margin-right: 0; padding-right: 0;">
                                    <img id="imgOperationType" runat="server">
                                </div>
                            </div>
                            <div class="col-md-3 col-sm-10 col-xs-3 text-truncate ">
                                <p class="key">
                                    <asp:Literal ID="litTransactionName" runat="server" Text=' <%# Eval("TransactionTitle") %>' />
                                </p>
                                <p>
                                    <asp:Literal ID="Literal6" runat="server" Text=' <%# Eval("TransactionDescription") %>' />
                                </p>
                            </div>
                            <div class="col-md-3 col-sm-6 col-sm-offset-0 col-xs-3 col-xs-offset-0 col-md-offset-0 text-truncate ">
                                <p class="key">
                                    <asp:Literal ID="Literal3" runat="server" Text='<%$FrontEndResources:TRX01801,inAccount%>' />
                                </p>
                                <p class="text-truncate">

                                    <asp:Literal ID="Literal5" runat="server" Text=' <%# Eval("SourceAccount") %>' />
                                </p>
                            </div>
                            <div class="col-md-3 col-sm-3 col-xs-4 col-xs-offset-0 col-sm-offset-0 col-md-offset-0 text-truncate ">
                                <div class="col-xs-6">
                                    <p class="key">
                                        <asp:Literal ID="Literal2" runat="server" Text='<%$FrontEndResources:TRX01801,Amount%>' />
                                    </p>
                                    <p class="text-black">
                                        <asp:Literal ID="Label3" runat="server" Text='<%# Eval("CurrencySymbolAndValue") %>' />
                                    </p>

                                </div>
                                <div class="col-xs-6">
                                    <p class="key">
                                        <asp:Literal ID="Literal7" runat="server" Text='<%$FrontEndResources:TRX01801,AddedOn%>' />
                                    </p>
                                    <p>
                                        <asp:Literal ID="Literal4" runat="server" Text=' <%# Eval("CreatedOnlyDate") %>' />
                                    </p>

                                </div>
                            </div>
                            <div class="col-md-2 col-sm-6 col-xs-1 col-xs-offset-2 col-sm-offset-1 col-md-offset-0 ">
                                <p class="action-buttons">
                                    <asp:LinkButton ID="btnDelete" runat="server" ToolTip="<%$FrontEndResources:TRX01801,Delete%>" CommandArgument='<%# Eval("CartTransactionItemId") %>' Text="<span class='action-delete'></span>" data-modal="yes" OnClick="btnDelete_Click" data-delete-singular=""></asp:LinkButton>
                                    <asp:Label runat="server" CssClass="action-edit" ID="lnkEdit" ToolTip="<%$FrontEndResources:TRX01801,Edit%>" />
                                    <asp:LinkButton ID="btnDetail" runat="server" ToolTip="<%$FrontEndResources:TRX01801,Detail%>" CommandArgument='<%# Eval("CartTransactionItemId") %>' CommandName="Id" Text="<span class='action-view-details'></span>" OnClick="btnDetail_Click"></asp:LinkButton>
                                </p>
                            </div>
                        </asp:Panel>
                    </ItemTemplate>
                </asp:ListView>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <div class="trs_buttons col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro transp">
        <asp:Panel ID="pnlButtons" runat="server" CssClass="trs_buttons-action">
            <asp:LinkButton ID="btnDeleteAll" runat="server" Text="<%$FrontEndResources:TRX01801,DeleteAllSelected%>" CssClass="btn btn-default cartButton btnDelete-all-bottom" OnClientClick="return false;" />

            <it:WorkflowLinkButton ID="btnCheckout" WorkflowAction="Next" CausesValidation="true" CssClass="btn btn-primary checkout checkoutExecuteSelected" runat="server">
                    <span>&nbsp;</span><asp:Literal Text="<%$FrontEndResources:TRX01801,ExecuteAllSelected%>" runat="server"></asp:Literal>
            </it:WorkflowLinkButton>

        </asp:Panel>
    </div>

    <div class="cart-footer-container">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">

            <asp:UpdatePanel runat="server" ID="updatePanel2">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSearch" />
                </Triggers>
                <ContentTemplate>
                    <div class="cart-content-container">
                        <asp:Literal runat="server" Text="<%$FrontEndResources:TRX01801,cartUploadHelp%>" />
                    </div>
                    <div class="cart-btn-container">
                        <asp:Button ID="btnDownload" CssClass="btn btn-primary btn-margin" Text="<%$FrontEndResources:TRX01801,btnCartDownload %>" OnClientClick="javascript:window.open('/Security/Transactions/Cart/CartDownload.aspx'); return false;" runat="server" />
                        <asp:Button ID="btnUpload" CssClass="btn btn-primary btn-margin" Text="<%$FrontEndResources:TRX01801,btnCartUpload %>" OnClick="btnUpload_Click" runat="server" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>

    </div>

    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("/Scripts/Services/Transactions/TRX01801-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>

    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01801-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />


</div>
