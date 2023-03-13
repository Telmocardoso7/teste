<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00105_01.ascx.cs" Inherits="TRX00105_01" runat="server" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div id="divContent" runat="server" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro   transp transaction-content">

    <div class="metro">
        <div id="divAccountsNotFound" runat="server" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 panel-top" visible="false">
            <section class="content-message metro">
                <div id="MainContent_TransactionMainContent_divMessage" class="alert alert-info fade in">
                    <div class="div-icon-info"><i class="icon-info"></i></div>
                    <h4 class="alert-heading">
                        <asp:Literal ID="litAccountsNotFound" runat="server" Text="<%$FrontEndResources:TRX00203,litAccountsNotFound %>" /></h4>
                    <div class="clearBoth"></div>
                </div>
            </section>
            <div class="clearBoth"></div>
        </div>
    </div>
    <div class="clearBoth"></div>
    <it:FlowInnerContainer ID="flwCurrentAccounts" Title="<%$FrontEndResources:TRX00131,CATitleContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro " runat="server"></it:FlowInnerContainer>
    <asp:Repeater ID="rptAccounts" runat="server" OnItemDataBound="rptAccounts_ItemDataBound">
        <ItemTemplate>
            <div class="lineSeparator fullWidth">
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max listItemContainer paddingTop45 paddingBottom45 noPaddingLeft">
                    <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 content-body fullWidth">
                        <section>
                            <div class="col-lg-12 col-left clearPadding">
                                <span>
                                    <div class="trx-container">
                                        <div class="product-list">
                                            <span id="icoFavoriteAccount" class="icon-star-accounts" visible="false" runat="server"></span>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding">
                                                <div class=" account">
                                                    <asp:HiddenField ID="hidAccountNumber" runat="server" />
                                                    <%--<div class="listItemOpenButton">
                                                            <span id="btnOpenTable" runat="server" class="btn btn-account-listing-toggle accountExpandicon"></span>
                                                        </div>--%>
                                                    <div class="pull-left col-xs-6 col-sm-6 col-md-4 col-lg-4 content-accounts flLeft clearPadding">
                                                        <div class="scroll-item-icon">
                                                            <span class="img-icon-accounts"></span>
                                                        </div>

                                                        <h4 class="accounts-name">
                                                            <asp:Literal ID="litAccountName" runat="server"></asp:Literal></h4>
                                                        <p class="accountNumber marginTop10 noMarginLeft">
                                                            <asp:Literal ID="litAccountNumber" runat="server"></asp:Literal>
                                                        </p>
                                                    </div>
                                                    <div class="pull-left hidden-xs hidden-sm col-md-3 col-lg-3 favorit-first_v2">
                                                        <p class="accounts-panel-p textAlignLeft">
                                                            <asp:Literal ID="litBalance" Text="<%$FrontEndResources:TRX00105,litBalance%>" runat="server"></asp:Literal>
                                                        </p>
                                                        <h3 class="favorit-center accounts-panel-h field-tooltip textAlignLeft" data-toggle="tooltip" data-placement="top" id="hBalance" runat="server">
                                                            <asp:Literal ID="litBalanceValue" runat="server"></asp:Literal>

                                                            <asp:Label ID="litBalanceValueCurrency" CssClass="CurrencyValue" runat="server"></asp:Label>
                                                        </h3>

                                                    </div>
                                                    <div class="pull-left col-xs-6 col-sm-6 col-md-2 col-lg-2 favorit-first_v2">
                                                        <p class="accounts-panel-p">
                                                            <asp:Literal ID="litAvailableBalance" Text="<%$FrontEndResources:TRX00105,litAvailableBalance%>" runat="server"></asp:Literal>
                                                        </p>
                                                        <h3 class="favorit-center accounts-panel-h field-tooltip" data-toggle="tooltip" data-placement="top" id="hAvailableBalance" runat="server">
                                                            <asp:Literal ID="litAvailableBalanceValue" runat="server"></asp:Literal>

                                                            <asp:Label ID="litAvailableBalanceValueCurrency" CssClass="CurrencyValue" runat="server"></asp:Label>
                                                        </h3>
                                                    </div>
                                                    <div class="col-xs col-sm col-md-3 col-lg-3 account-details" style="text-align: right; margin-right: -15px; position: relative;">
                                                        <asp:LinkButton NavigateUrl="#" ID="aOpenTable" runat="server" CssClass="statements-expand-icon" OnClick="aOpenTable_Click" OnClientClick="showHideTable_custom.call(this,event)"></asp:LinkButton>
                                                        <asp:LinkButton ToolTip="<%$FrontEndResources:TRX00105,litAccountDataLink%>" NavigateUrl="#" ID="aOpenDetail" runat="server" CssClass="accountExpandicon"></asp:LinkButton>

                                                    </div>
                                                    <div class="clearBoth"></div>
                                                    <div id="accountData" runat="server" class="last-statements-table hidden">
                                                        <asp:UpdatePanel runat="server" ID="updPanel" UpdateMode="Conditional">
                                                            <Triggers>
                                                                <asp:AsyncPostBackTrigger ControlID="aOpenTable" EventName="Click" />
                                                            </Triggers>
                                                            <ContentTemplate>
                                                                <div class="col-lg-12 clearPadding">
                                                                    <div class="metro inner-table">
                                                                        <it:GridViewControl ID="grdData" runat="server" AutoGenerateColumns="false" CssClass="table table_v2 table-resp-to1199" IsResponsive="true" AllowPag="false"
                                                                            GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" RecordCounterComplementarText="<%$FrontEndResources:DATALIST,gridDataecordCounterComplementarText %>"
                                                                            class="noPaddingBottom">
                                                                            <Columns>
                                                                            </Columns>
                                                                        </it:GridViewControl>
                                                                        <div id="grdDataEmpty" class="grid-novalues marginBottom15 marginLeft15" visible="false" runat="server">
                                                                            <div id="divProductSelectionInfo" class="login-info-bottom-text" runat="server">
                                                                                <asp:Label ID="lblEmptyGrid" runat="server"></asp:Label>
                                                                                <div class="login-info-bottom-text-icon"></div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </ContentTemplate>
                                                        </asp:UpdatePanel>
                                                    </div>
                                                    <div class="clearBoth"></div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </span>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
            <div class="clearBoth"></div>
        </ItemTemplate>
    </asp:Repeater>








    <it:FlowInnerContainer ID="flwCorporateGroupsAccounts" Title="<%$FrontEndResources:TRX00131,TitleCorporateGroups %>" CustomCssClass="col-max bs-reduced bs-head-metro" runat="server">
        <asp:Repeater ID="rptCorporateGroups" runat="server" OnItemDataBound="rptCorporateGroups_ItemDataBound">
            <ItemTemplate>
                <div class="CorporateGroups" id="pnCorporateGroups" runat="server">
                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max CorporateGroup">
                        <div class="CorporateGroupName">
                            <asp:Literal ID="litTitleGroup" runat="server"></asp:Literal>
                            <asp:Literal ID="litGroupId" runat="server" Visible="false"></asp:Literal>
                        </div>
                        <asp:LinkButton NavigateUrl="#" ID="pnDetailsButton" runat="server" CssClass="CorporateGroupDetail action-view-details" OnClick="aOpenCorporateGroupsAccounts_Click" OnClientClick="showHideGroups_custom.call(this,event)"></asp:LinkButton>
                         <asp:Image runat="server" ID="imgSharedGroup" Visible="true" ImageUrl="~/Content/Themes/ebankIT/images/icon/action/corporate/action-shared.png" CssClass="CorporateGroupDetail sharedIcon" ToolTip="<%$FrontEndResources:TRX00105,sharedIconTooltip%>"/>
                    </div>
                </div>

                <asp:UpdatePanel runat="server" ID="updPanelAccounts" UpdateMode="Conditional">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="pnDetailsButton" EventName="Click" />
                    </Triggers>
                    <ContentTemplate>

                        <div id="pnCorporateGroupsAccounts" runat="server" class="pnCorporateGroupsAccounts-container">
                            <div>
                                <div id="divNoAccountsMessage" class="alert-accounts alert-warning-no-accounts fade in widthInherit" role="alert" aria-atomic="true" runat="server">
                                </div>
                            </div>
                            <asp:Repeater ID="rptCorporateGroupsAccounts" runat="server" OnItemDataBound="rptCorporateGroupsAccounts_ItemDataBound">
                                <ItemTemplate>
                                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                                        <div class="trx-container">
                                            <div class="product-list">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding">
                                                    <div class="corp-account">
                                                        <div class="pull-left col-xs-6 col-sm-5 col-md-4 col-lg-4 content-accounts flLeft clearPadding">
                                                            <div class="scroll-item-icon-corpGroups">
                                                                <span class="img-icon-corporate-groups-accounts"></span>
                                                            </div>
                                                            <div class="corpGroupsAccountDetails">
                                                                <h4 class="accounts-name">
                                                                    <asp:Literal ID="litAccountName" runat="server"></asp:Literal></h4>
                                                                <p class="accountNumber marginTop10 noMarginLeft">
                                                                    <asp:Literal ID="litAccountNumber" runat="server"></asp:Literal>
                                                                </p>
                                                            </div>
                                                        </div>
                                                        <div class="pull-left  col-md-3 col-lg-3 favorit-first_v2">
                                                            <p class="accounts-panel-p">
                                                                <asp:Literal ID="litAccountingBalance" Text="<%$FrontEndResources:TRX00131,litAvailableBalance%>" runat="server"></asp:Literal>
                                                            </p>
                                                            <h3 class="favorit-center accounts-panel-h field-tooltip" data-toggle="tooltip" data-placement="top" id="hBalance" runat="server">
                                                                <asp:Literal ID="litAccountingBalanceValue" runat="server"></asp:Literal>
                                                                <asp:Label ID="litAccountingBalanceValueCurrency" CssClass="CurrencyValue" runat="server"></asp:Label>
                                                            </h3>
                                                        </div>
                                                        <div class="pull-left  col-md-3 col-lg-3 favorit-first_v2">
                                                            <p class="accounts-panel-p">
                                                                <asp:Literal ID="litAvailableBalance" Text="<%$FrontEndResources:TRX00131,litAvailableBalance%>" runat="server"></asp:Literal>
                                                            </p>
                                                            <h3 class="favorit-center accounts-panel-h field-tooltip" data-toggle="tooltip" data-placement="top" id="h1" runat="server">
                                                                <asp:Literal ID="litAvailableBalanceValue" runat="server"></asp:Literal>
                                                                <asp:Label ID="litAvailableBalanceValueCurrency" CssClass="CurrencyValue" runat="server"></asp:Label>
                                                            </h3>
                                                        </div>
                                                        <div class="col-md-2 col-lg-2 content-accounts account-details" style="text-align: right; padding-top: 8px; position: relative; padding-right: 20px;">
                                                            <asp:LinkButton NavigateUrl="#" ID="aOpenTableMovsCorporateGroups" runat="server" CssClass="statements-expand-icon" OnClick="aOpenTableMovsCorporateGroups_Click" OnClientClick="showHideTable_custom.call(this,event,'CG');"></asp:LinkButton>
                                                            <asp:LinkButton NavigateUrl="#" ToolTip="<%$FrontEndResources:TRX00105,litAccountDataLink%>" ID="aOpenDetail" runat="server" CssClass="accountExpandicon"></asp:LinkButton>
                                                        </div>
                                                        <div class="clearBoth"></div>
                                                        <div id="accountData" runat="server" class="last-statements-table hidden">
                                                            <asp:UpdatePanel runat="server" ID="updPanel" UpdateMode="Conditional">
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="aOpenTableMovsCorporateGroups" EventName="Click" />
                                                                </Triggers>
                                                                <ContentTemplate>
                                                                    <div class="col-lg-12 clearPadding">
                                                                        <div class="metro inner-table">
                                                                            <it:GridViewControl ID="grdDataCorporateGroups" runat="server" AutoGenerateColumns="false" CssClass="table table_v2 table-resp-to1199" IsResponsive="true" AllowPag="false"
                                                                                GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" RecordCounterComplementarText="<%$FrontEndResources:DATALIST,gridDataecordCounterComplementarText %>"
                                                                                class="noPaddingBottom">
                                                                                <Columns>
                                                                                </Columns>
                                                                            </it:GridViewControl>
                                                                            <div id="grdDataCorporateGroupsEmpty" class="grid-novalues marginBottom15 marginLeft15" visible="false" runat="server">
                                                                                <div id="divProductCorporateGroupsSelectionInfo" class="login-info-bottom-text" runat="server">
                                                                                    <asp:Label ID="lblCorporateGroupsEmptyGrid" runat="server"></asp:Label>
                                                                                    <div class="login-info-bottom-text-icon"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearBoth"></div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </ItemTemplate>
        </asp:Repeater>
    </it:FlowInnerContainer>

    <it:FlowInnerContainer ID="flwAssociatedAccounts" Title="<%$FrontEndResources:TRX00131,ACTitleContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro " runat="server">
        <asp:PlaceHolder ID="phWidgets" runat="server" Visible="false"></asp:PlaceHolder>
    </it:FlowInnerContainer>


    <div class="fullWidth lineSeparator dispBlock" />

    <div id="containerAssociateAccounts">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max listItemContainerLarge">
            <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 content-body fullWidth">
                <a runat="server" id="btnAddAccount" class="buttonAddAccount" title="<%$FrontEndResources:TRX00131,AddAccount %>">
                    <div id="AddAccounts" class="divAddAccounts">
                        <div class="AddAccountsInfo">
                            <img id="imgAddAccounts" src="<%$ebFile:~/Content/currenttheme/images/associate_accounts/add_account.png%>" alt="" runat="server" class="imgAddAccount" />
                            <asp:Literal ID="litAddAccount" Text="<%$FrontEndResources:TRX00131,AddAccount %>" runat="server"></asp:Literal>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <div class="clearBoth"></div>
    <asp:Button ID="btnHdnRemoveAccount" Style="display: none;" runat="server" />

    <asp:Button ID="btnRemoveConsent" Style="display: none;" runat="server" OnClick="btnRemoveConsent_Click" />
    <asp:HiddenField ID="hdnRemoveConsentList" runat="server" />
    <asp:HiddenField ID="hdnBankId" runat="server" />
    <asp:HiddenField ID="hdnRemoveAccounts" runat="server" />
    <asp:HiddenField ID="hdnBankName" runat="server" />

    <script type="text/javascript">

        var IDs = new Array;
        var IDsGroup = new Array;

        function showHideTable_custom(event) {
            var id = $(this).data('id');
            var table = $('.last-statements-table[data-id=' + id + ']');

            $(".last-statements-table").slideUp('fast'); //Hidding tables
            var x = $('[id*=aOpenTable]');
            $('[id*=aOpenTable]').removeClass().addClass("statements-expand-icon");

            $('a[id*=aOpenTable_], a[id*=aOpenTableMovsCorporateGroups_]').each(function( i ) { $(this)[0].title = top.eBankit.Presentation.GetResource("ExpandAccountInfo"); });

            if (table.length > 0 && !table.is(':visible')) {

                $('a[id*=aOpenTable_], a[id*=aOpenTableMovsCorporateGroups_]').each(function( i ) { $(this)[0].title = top.eBankit.Presentation.GetResource("CollapseAccountInfo"); });

                table.slideDown('fast');
                table.removeClass('hidden');
                $('a[data-id=' + id + ']').toggleClass("statements-expand-icon statements-collapse-icon");
                if (!include(IDs, id)) {
                    IDs.push(id);
                    return true;
                }
            }
            
            event.preventDefault();
            IDs.push(id);

            return false;
        }

        function showHideGroups_custom(event) {
            var id = $(this).data('id');
            var index = $(this).data('index');
            if (parseInt(index) > 0) {
                if (!include(IDsGroup, id)) {
                    IDsGroup.push(id);
                    return true;
                }
                event.preventDefault();
                IDsGroup.push(id);

                return false;
            } else {
                event.preventDefault();
                IDsGroup.push(id);
                return false;
            }
        }

        function RemoveExternalAccount(lstConsent, bankId, bankName, lstAccounts) {
            $('input[id$=<%=hdnRemoveConsentList.ClientID%>]').val(lstConsent);
            $('input[id$=<%=hdnBankId.ClientID%>]').val(bankId);
            $('input[id$=<%=hdnBankName.ClientID%>]').val(bankName);
            $('input[id$=<%=hdnRemoveAccounts.ClientID%>]').val(lstAccounts);
            $('input[id$=<%=btnRemoveConsent.ClientID%>]').click();
        }

        function include(arr, obj) {
            return (arr.indexOf(obj) != -1);
        }


        $(document).ready(function () {
            $('img[id$=imgAddAccounts]').attr('alt', 'alt_text');
            $('a[id*=aOpenTable_], a[id*=aOpenTableMovsCorporateGroups_]').each(function( i ) { $(this)[0].title = top.eBankit.Presentation.GetResource("ExpandAccountInfo"); });
            CreateTooltip();
            HidePaginationTag();
            SelectedFirstGroup();
        });



        EndPageRequest = function () {
            CreateTooltip();
            HidePaginationTag();
        }

        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndPageRequest);

        CreateTooltip = function () {
            $(".accounts-panel-h").tooltip({
                html: true,
            });
        };

        HidePaginationTag = function () {
            var elements = document.getElementsByClassName("pagination");
            while (elements.length > 0) {
                elements[0].parentNode.removeChild(elements[0]);
            }
        };

        function SelectedFirstGroup() {
            if ($(".CorporateGroups").find(".CorporateGroupDetail").length > 0) {
                $($(".CorporateGroups").find(".CorporateGroupDetail")[0]).show();
                $($(".CorporateGroups")[0]).addClass('toggle-selected highlight');
                $($(".CorporateGroups").find(".CorporateGroupDetail")[0]).addClass('toggle-arrow-open');
                $(".toggle-arrow-open").attr('title', '<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX00131", "Colapse") %>')

            }
        }

        GoToAccountDetail = function (number) {
            eBankit.Presentation.SetBlockPageCommon();
            $('body').block();
            eBankit.document.location.href = eBankit.Presentation.ResolveUrl('~/Security/Transactions/Transactions.aspx?trxid=TRX00106<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&acc=' + number);
        }

        GoToCorporateGroupsAccountDetail = function (number, group) {
            eBankit.Presentation.SetBlockPageCommon();
            $('body').block();
            eBankit.document.location.href = eBankit.Presentation.ResolveUrl('~/Security/Transactions/Transactions.aspx?trxid=TRX00106<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&acc=' + number + '&group=' + group);
        }

        GoToExternalAccountDetail = function (number) {
            eBankit.Presentation.SetBlockPageCommon();
            $('body').block();
            eBankit.document.location.href = eBankit.Presentation.ResolveUrl('~/Security/Transactions/Transactions.aspx?trxid=TRX02102<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&acc=' + number);
        }

        RemoveAccount = function (account) {
            eBankit.Presentation.SetBlockPageCommon();
            $('body').block();
            var hdnPendOperSelected = $('[id$=hdnPendOperSelected]');
            hdnPendOperSelected.val(operId);
            var btnRemoveAccount = $('#<%= btnHdnRemoveAccount.ClientID %>');
            btnRemoveAccount.click();
        }
    </script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00105-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
