<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00131_01.ascx.cs" Inherits="TRX00131_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">


    <it:FlowInnerContainer ID="flwCurrentAccounts" Title="<%$FrontEndResources:TRX00131,CATitleContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro " runat="server">
        <div class="productListHead productListContainer">
        </div>
        <asp:Repeater ID="rptCurrentAccounts" runat="server" OnItemDataBound="rptCurrentAccounts_ItemDataBound">
            <ItemTemplate>
                <div class="lineSeparator fullWidth">
                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max listItemContainerLarge">
                        <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 content-body fullWidth">
                            <section>
                                <div class="col-lg-12 col-left clearPadding">
                                    <span>
                                        <div class="trx-container">
                                            <div class="product-list">
                                                <span id="icoFavoriteAccount" class="icon-star-accounts" visible="false" runat="server" />
                                    </span>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding">
                                        <div class=" account">
                                            <asp:HiddenField ID="hidAccountNumber" runat="server" />
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
                                                <h4 class="accounts-panel-p textAlignLeft">
                                                    <asp:Literal ID="litBalance" Text="<%$FrontEndResources:TRX00105,litBalance%>" runat="server"></asp:Literal>
                                                </h4>
                                                <p class="favorit-center accounts-panel-h field-tooltip textAlignLeft" data-toggle="tooltip" data-placement="top" id="hBalance" runat="server">
                                                    <asp:Literal ID="litBalanceValue" runat="server"></asp:Literal>

                                                    <asp:Label ID="litBalanceValueCurrency" CssClass="CurrencyValue" runat="server"></asp:Label>
                                                </p>

                                            </div>
                                            <div class="pull-left col-xs-6 col-sm-6 col-md-3 col-lg-3 favorit-first_v2">
                                                <h4 class="accounts-panel-p">
                                                    <asp:Literal ID="litAvailableBalance" Text="<%$FrontEndResources:TRX00105,litAvailableBalance%>" runat="server"></asp:Literal>
                                                </h4>
                                                <p class="favorit-center accounts-panel-h field-tooltip" data-toggle="tooltip" data-placement="top" id="hAvailableBalance" runat="server">
                                                    <asp:Literal ID="litAvailableBalanceValue" runat="server"></asp:Literal>

                                                    <asp:Label ID="litAvailableBalanceValueCurrency" CssClass="CurrencyValue" runat="server"></asp:Label>
                                                </p>
                                            </div>
                                            <div class="col-md-2 col-lg-2 content-accounts account-details" style="text-align: right; padding-top: 8px; position: relative;">
                                                <asp:LinkButton NavigateUrl="#" ID="aOpenTable" runat="server" CssClass="statements-expand-icon" OnClick="btnCAOpenTable_Click" OnClientClick="showHideTable_custom.call(this,event,'CA');"></asp:LinkButton>
                                                <asp:LinkButton NavigateUrl="#" ID="aOpenDetail" runat="server" CssClass="accountExpandicon">
                                                </asp:LinkButton>
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
                        </div><div class="clearBoth"></div>
            </ItemTemplate>
        </asp:Repeater>
    </it:FlowInnerContainer>

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
                        <asp:Image runat="server" ID="imgSharedGroup" Visible="true" ImageUrl="~/Content/Themes/ebankIT/images/icon/action/corporate/action-shared.png" CssClass="CorporateGroupDetail sharedIcon" ToolTip="<%$FrontEndResources:TRX00131,sharedIconTooltip%>"/>
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
                                                        <div class="col-md-2 col-lg-2 content-accounts account-details" style="text-align: right; padding-top: 8px; position: relative;">
                                                            <asp:LinkButton NavigateUrl="#" ID="aOpenTableMovsCorporateGroups" runat="server" CssClass="statements-expand-icon" OnClick="aOpenTableMovsCorporateGroups_Click" OnClientClick="showHideTable_custom.call(this,event,'CG');"></asp:LinkButton>
                                                            <asp:LinkButton NavigateUrl="#" ID="aOpenDetail" runat="server" CssClass="accountExpandicon"></asp:LinkButton>
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


    <it:FlowInnerContainer ID="flwCreditCards" Title="<%$FrontEndResources:TRX00131,CardsTitleContainer %>" CustomCssClass="bs-reduced bs-head-metro col-max" runat="server">
        <div class="productListHead productListContainer"></div>
        <asp:Repeater ID="rptCreditCards" runat="server" OnItemDataBound="rptCreditCards_ItemDataBound">
            <ItemTemplate>
                <div style="display: block; width: 100%; border-top: 3px solid #EEE;">
                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max listItemContainer clearPadding" style="padding: 45px 0px;">
                        <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 content-body fullWidth">
                            <section>
                                <div class="col-lg-12 col-left clearPadding">
                                    <span>
                                        <div class="trx-container">
                                            <div class="product-list">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding: 0;">
                                                    <div class=" account">
                                                        <asp:HiddenField ID="hidCCCardNumberCC" runat="server" />
                                                        <div class="pull-left col-xs-6 col-sm-6 col-md-4 col-lg-4 content-accounts flLeft clearPadding">
                                                            <div class="scroll-item-icon" style="margin-top: 0px; margin-bottom: 2px; border-bottom: 0;">
                                                                <span class="img-icon-cards" id="imgIconCard" runat="server"></span>
                                                            </div>
                                                            <h4 class="accounts-name">
                                                                <asp:Literal ID="litCCCardName" runat="server"></asp:Literal></h4>
                                                            <p class="accountNumber" style="margin-left: 0px;">
                                                                <asp:Literal ID="litCCCardNumber" runat="server"></asp:Literal>
                                                            </p>
                                                        </div>
                                                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 favorit-first_v2" style="margin-top: 4px;">
                                                            <h4 class="accounts-panel-p">
                                                                <asp:Literal ID="litCCUsedBalance" Text="<%$FrontEndResources:TRX00203,litLimitTitle%>" runat="server"></asp:Literal>
                                                            </h4>
                                                            <p class="favorit-center accounts-panel-h" id="hCCUsedBalanceCC" runat="server">
                                                                <asp:Literal ID="litCCUsedBalanceValue" runat="server"></asp:Literal>
                                                                <asp:Label ID="litCCUsedBalanceValueCurrency" CssClass="CurrencyValue" runat="server"></asp:Label>
                                                            </p>
                                                        </div>
                                                        <div class="hidden-xs hidden-sm col-md-3 col-lg-3 favorit-first_v2" style="margin-top: 4px;">
                                                            <h4 class="accounts-panel-p">
                                                                <asp:Literal ID="litCCBalance" Text="<%$FrontEndResources:TRX00203,litBalance%>" runat="server"></asp:Literal>
                                                            </h4>
                                                            <p class="favorit-center accounts-panel-h" id="hCCBalanceCC" runat="server">
                                                                <asp:Literal ID="litCCBalanceValue" runat="server"></asp:Literal>
                                                                <asp:Label ID="litCCBalanceValueCurrency" CssClass="CurrencyValue" runat="server"></asp:Label>
                                                            </p>
                                                        </div>
                                                        <div class="col-md-2 col-lg-2 content-accounts account-details" style="text-align: right; padding-top: 8px;">
                                                            <asp:LinkButton NavigateUrl="#" ID="btnCAOpenTableCC" runat="server" CssClass="statements-expand-icon" OnClick="btnCAOpenTableCC_Click" OnClientClick="showHideTable_custom.call(this,event,'CC')"></asp:LinkButton>
                                                            <asp:LinkButton NavigateUrl="#" ID="aCCCardDetailCC" runat="server" CssClass="accountExpandicon"></asp:LinkButton>
                                                        </div>
                                                        <div class="clearBoth"></div>
                                                        <div id="cardCCDataCC" runat="server" class="last-statements-table hidden">
                                                            <asp:UpdatePanel runat="server" ID="updCCPanelCC" UpdateMode="Conditional">
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="btnCAOpenTableCC" EventName="Click" />
                                                                </Triggers>
                                                                <ContentTemplate>
                                                                    <div class="col-lg-12 clearPadding">
                                                                        <div class="metro inner-table">
                                                                            <it:GridViewControl ID="grdCCDataCC" runat="server" AutoGenerateColumns="false" CssClass="table table_v2 table-resp-to1199" IsResponsive="true" AllowPag="false"
                                                                                GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" RecordCounterComplementarText="<%$FrontEndResources:DATALIST,gridDataecordCounterComplementarText %>"
                                                                                class="noPaddingBottom">
                                                                                <Columns>
                                                                                </Columns>
                                                                            </it:GridViewControl>
                                                                            <div id="grdCCDataEmptyCC" class="grid-novalues marginBottom15 marginLeft15" visible="false" runat="server">
                                                                                <div id="divProductSelectionInfoCC" class="login-info-bottom-text" runat="server">
                                                                                    <asp:Label ID="grdDataEmptyCC" runat="server"></asp:Label>
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
    </it:FlowInnerContainer>


    <it:FlowInnerContainer ID="flwDebitCards" Title="<%$FrontEndResources:TRX00131,CardsDDTitleContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro " runat="server">
        <div class="productListHead productListContainer"></div>
        <asp:Repeater ID="rptDebitCards" runat="server" OnItemDataBound="rptDebitCards_ItemDataBound">
            <ItemTemplate>
                <div style="display: block; width: 100%; border-top: 3px solid #EEE;">
                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max listItemContainer clearPadding" style="padding: 45px 0px;">
                        <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 content-body fullWidth">
                            <section>
                                <div class="col-lg-12 col-left clearPadding">
                                    <span>
                                        <div class="trx-container">
                                            <div class="product-list">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding: 0;">
                                                    <div class=" account">
                                                        <asp:HiddenField ID="hidCCCardNumberDD" runat="server" />
                                                        <div class="pull-left col-xs-6 col-sm-6 col-md-4 col-lg-4 content-accounts flLeft clearPadding">
                                                            <div class="scroll-item-icon" style="margin-top: 0px; margin-bottom: 2px; border-bottom: 0;">
                                                                <span class="img-icon-cards img-icon-cards-deb"></span>
                                                            </div>
                                                            <h4 class="accounts-name">
                                                                <asp:Literal ID="litCCCardNameDD" runat="server"></asp:Literal></h4>
                                                            <p class="accountNumber" style="margin-left: 0px;">
                                                                <asp:Literal ID="litCCCardNumberDD" runat="server"></asp:Literal>
                                                            </p>
                                                        </div>
                                                        <div class="hidden-xs hidden-sm col-md-3 col-lg-3 favorit-first_v2" style="margin-top: 4px;">
                                                            <h4 class="accounts-panel-p">
                                                                <asp:Literal ID="litDCAvailableBalanceAOADD" Text="<%$FrontEndResources:TRX00203,lblAssociatedCurrentAccount%>" runat="server"></asp:Literal>
                                                            </h4>
                                                            <p class="favorit-center accounts-panel-h" id="hCCPaymentDateDD" runat="server">
                                                                <asp:Literal ID="litCCPaymentDateValueDD" runat="server"></asp:Literal>
                                                            </p>
                                                        </div>
                                                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 favorit-first_v2" style="margin-top: 4px;">
                                                            <h4 class="accounts-panel-p">
                                                                <asp:Literal ID="litCCUsedBalanceDD" Text="<%$FrontEndResources:TRX00131,litBalance2%>" runat="server"></asp:Literal>
                                                            </h4>
                                                            <p class="favorit-center accounts-panel-h" id="hCCUsedBalanceDD" runat="server">
                                                                <asp:Literal ID="litCCUsedBalanceValueDD" runat="server"></asp:Literal>
                                                                <asp:Label ID="litCCUsedBalanceValueCurrencyDD" CssClass="CurrencyValue" runat="server"></asp:Label>
                                                            </p>
                                                        </div>
                                                        <div class="col-md-2 col-lg-2 content-accounts account-details" style="text-align: right; padding-top: 8px; position: relative;">
                                                            <asp:LinkButton NavigateUrl="#" ID="btnCAOpenTableDD" runat="server" CssClass="statements-expand-icon" OnClick="btnCAOpenTableDD_Click" OnClientClick="showHideTable_custom.call(this,event,'DC')"></asp:LinkButton>
                                                            <asp:LinkButton NavigateUrl="#" ID="aCCCardDetailDD" runat="server" CssClass="accountExpandicon"></asp:LinkButton>

                                                        </div>
                                                        <div class="clearBoth"></div>
                                                        <div id="cardCCDataDD" runat="server" class="last-statements-table hidden">
                                                            <asp:UpdatePanel runat="server" ID="updCCPanelDD" UpdateMode="Conditional">
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="btnCAOpenTableDD" EventName="Click" />
                                                                </Triggers>
                                                                <ContentTemplate>
                                                                    <div class="col-lg-12 clearPadding">
                                                                        <div class="metro inner-table">
                                                                            <it:GridViewControl ID="grdCCDataDD" runat="server" AutoGenerateColumns="false" CssClass="table table_v2 table-resp-to1199" IsResponsive="true" AllowPag="false"
                                                                                GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" RecordCounterComplementarText="<%$FrontEndResources:DATALIST,gridDataecordCounterComplementarText %>"
                                                                                class="noPaddingBottom">
                                                                                <Columns>
                                                                                </Columns>
                                                                            </it:GridViewControl>
                                                                            <div id="grdCCDataEmptyDD" class="grid-novalues marginBottom15 marginLeft15" visible="false" runat="server">
                                                                                <div id="divProductSelectionInfoDD" class="login-info-bottom-text" runat="server">
                                                                                    <asp:Label ID="grdDataEmptyDD" runat="server"></asp:Label>
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
    </it:FlowInnerContainer>

    <it:FlowInnerContainer ID="flwPrepaidCards" Title="<%$FrontEndResources:TRX00131,PrepaydCardsTitleContainer %>" CustomCssClass="bs-reduced bs-head-metro col-max" runat="server">
        <div class="productListHead productListContainer"></div>
        <asp:Repeater ID="rptPrepaidCards" runat="server" OnItemDataBound="rptPrepaidCards_ItemDataBound">
            <ItemTemplate>
                <div style="display: block; width: 100%; border-top: 3px solid #EEE;">
                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max listItemContainer clearPadding" style="padding: 45px 0px;">
                        <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 content-body fullWidth">
                            <section>
                                <div class="col-lg-12 col-left clearPadding">
                                    <span>
                                        <div class="trx-container">
                                            <div class="product-list">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding: 0;">
                                                    <div class=" account">
                                                        <asp:HiddenField ID="hidCCCardNumberCPP" runat="server" />
                                                        <div class="pull-left col-xs-6 col-sm-6 col-md-4 col-lg-4 content-accounts flLeft clearPadding">
                                                            <div class="scroll-item-icon" style="margin-top: 0px; margin-bottom: 2px; border-bottom: 0;">
                                                                <span class="img-icon-prepayd"></span>
                                                            </div>
                                                            <h4 class="accounts-name">
                                                                <asp:Literal ID="litCCCardName" runat="server"></asp:Literal></h4>
                                                            <p class="accountNumber" style="margin-left: 0px;">
                                                                <asp:Literal ID="litCCCardNumber" runat="server"></asp:Literal>
                                                            </p>
                                                        </div>
                                                        <div class="hidden-xs hidden-sm col-md-3 col-lg-3 favorit-first_v2" style="margin-top: 4px;">
                                                            <h4 class="accounts-panel-p">
                                                                <asp:Literal ID="litDCAvailableBalanceAOA" Text="<%$FrontEndResources:TRX00203,lblCardAccountAssociated%>" runat="server"></asp:Literal>
                                                            </h4>
                                                            <p class="favorit-center accounts-panel-h" id="hCCPaymentDateCC" runat="server">
                                                                <asp:Literal ID="litCCPaymentDateValue" runat="server"></asp:Literal>
                                                            </p>
                                                        </div>
                                                        <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 favorit-first_v2" style="margin-top: 4px;">
                                                            <h4 class="accounts-panel-p">
                                                                <asp:Literal ID="litCCUsedBalance" Text="<%$FrontEndResources:TRX00203,litBalance2%>" runat="server"></asp:Literal>
                                                            </h4>
                                                            <p class="favorit-center accounts-panel-h" id="hCCUsedBalanceCC" runat="server">
                                                                <asp:Literal ID="litLimitValue" runat="server"></asp:Literal>
                                                                <asp:Label ID="litLimitValueCurrency" CssClass="CurrencyValue" runat="server"></asp:Label>

                                                            </p>
                                                        </div>
                                                        <div class="col-md-2 col-lg-2 content-accounts account-details" style="text-align: right; padding-top: 8px; position: relative;">
                                                            <asp:LinkButton NavigateUrl="#" ID="btnCAOpenTableCPP" runat="server" CssClass="statements-expand-icon" OnClick="btnCAOpenTableCPP_Click" OnClientClick="showHideTable.call(this,event,'CC')"></asp:LinkButton>
                                                            <asp:LinkButton NavigateUrl="#" ID="aCCOpenTableCPP" runat="server" CssClass="accountExpandicon"></asp:LinkButton>
                                                        </div>
                                                        <div class="clearBoth"></div>
                                                        <div id="cardCCDataCPP" runat="server" class="tableWrapper_v4 hidden">
                                                            <asp:UpdatePanel runat="server" ID="updCCPanelCPP" UpdateMode="Conditional">
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="btnCAOpenTableCPP" EventName="Click" />
                                                                </Triggers>
                                                                <ContentTemplate>
                                                                    <div class="col-lg-12 clearPadding">
                                                                        <div class="metro inner-table">
                                                                            <it:GridViewControl ID="grdCCDataCPP" runat="server" AutoGenerateColumns="false" CssClass="table table-resp-to1199" IsResponsive="true" AllowPag="false"
                                                                                GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" RecordCounterComplementarText="<%$FrontEndResources:DATALIST,gridDataecordCounterComplementarText %>"
                                                                                class="noPaddingBottom">
                                                                                <Columns>
                                                                                </Columns>
                                                                            </it:GridViewControl>
                                                                            <div id="grdCCDataEmptyCPP" class="grid-novalues" style="margin-bottom: 15px; margin-left: 15px;" visible="false" runat="server">
                                                                                <div id="divProductSelectionInfo_v4" class="login-info-bottom-text" runat="server">
                                                                                    <asp:Label ID="lblCCEmptyGridCPP" runat="server"></asp:Label>
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
    </it:FlowInnerContainer>

    <it:FlowInnerContainer ID="flwSavingAccounts" Title="<%$FrontEndResources:TRX00131,SATitleContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro " runat="server">
        <div class="productListHead productListContainer"></div>
        <asp:Repeater ID="rptSavingAccounts" runat="server" OnItemDataBound="rptSavingAccounts_ItemDataBound">
            <ItemTemplate>
                <div class="lineSeparator fullWidth">
                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max listItemContainer paddingTop45 paddingBottom45 noPaddingLeft">
                        <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 content-body fullWidth">
                            <section>
                                <div class="col-lg-12 col-left clearPadding">
                                    <span>
                                        <div class="trx-container">
                                            <div class="product-list">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding">
                                                    <div class=" account">
                                                        <asp:HiddenField ID="hidAccountNumber" runat="server" />
                                                        <%--<div class="listItemOpenButton">
                                                            <span id="btnOpenTable" runat="server" class="btn btn-account-listing-toggle accountExpandicon"></span>
                                                        </div>--%>
                                                        <div class="pull-left col-xs-6 col-sm-6 col-md-4 col-lg-4 content-accounts flLeft clearPadding">
                                                            <div class="scroll-item-icon">
                                                                <span class="img-icon-savings"></span>
                                                            </div>

                                                            <h4 class="accounts-name">
                                                                <asp:Literal ID="litAccountName" runat="server"></asp:Literal></h4>
                                                            <p class="accountNumber marginTop10 noMarginLeft">
                                                                <asp:Literal ID="litAccountNumber" runat="server"></asp:Literal>
                                                            </p>
                                                        </div>
                                                        <div class="pull-left hidden-xs col-sm-6 col-md-3 col-lg-3 favorit-first_v2">
                                                            <h4 class="accounts-panel-p">
                                                                <asp:Literal ID="litValueTitle" Text="<%$FrontEndResources:TRX00303,litBalanceTitle%>" runat="server"></asp:Literal>
                                                            </h4>
                                                            <p class="favorit-center accounts-panel-h field-tooltip" data-toggle="tooltip" data-placement="top" id="hAvailableBalance" runat="server">
                                                                <asp:Literal ID="litValue" runat="server"></asp:Literal>

                                                                <asp:Label ID="litValueCurrency" CssClass="CurrencyValue" runat="server"></asp:Label>
                                                            </p>
                                                        </div>
                                                        <div class="pull-left col-xs-6 col-sm-6 col-md-3 col-lg-3 favorit-first_v2 content-accounts">
                                                            <h4 class="accounts-panel-p">
                                                                <asp:Literal ID="litExpDate" Text="<%$FrontEndResources:TRX00131,litExpDate%>" runat="server"></asp:Literal>
                                                            </h4>
                                                            <p class="favorit-center accounts-panel-h neutral" id="hSAExpDate" runat="server">
                                                                <asp:Literal ID="litExpDateValue" runat="server"></asp:Literal>
                                                            </p>
                                                        </div>

                                                        <div class="pull-left hidden-xs hidden-sm col-md-2 col-lg-2 content-accounts account-details" style="text-align: right; padding-top: 8px; padding-right: 15px; position: relative;">
                                                            <asp:LinkButton NavigateUrl="#" ID="aOpenSATable" runat="server" CssClass="statements-expand-icon" OnClick="btnSAOpenTable_Click" OnClientClick="showHideTable_custom.call(this,event,'SA')"></asp:LinkButton>
                                                            <asp:LinkButton NavigateUrl="#" ID="aOpenDetail" runat="server" CssClass="accountExpandicon"></asp:LinkButton>

                                                        </div>
                                                        <div class="clearBoth"></div>
                                                        <div id="accountData" runat="server" class="last-statements-table hidden">
                                                            <asp:UpdatePanel runat="server" ID="updSAPanel" UpdateMode="Conditional">
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="aOpenSATable" EventName="Click" />
                                                                </Triggers>
                                                                <ContentTemplate>
                                                                    <div class="col-lg-12 clearPadding">
                                                                        <div class="metro inner-table">
                                                                            <it:GridViewControl ID="grdSAData" runat="server" AutoGenerateColumns="false" CssClass="table table_v2 table-resp-to1199" IsResponsive="true" AllowPag="false"
                                                                                GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" RecordCounterComplementarText="<%$FrontEndResources:DATALIST,gridDataecordCounterComplementarText %>"
                                                                                class="noPaddingBottom">
                                                                                <Columns>
                                                                                </Columns>
                                                                            </it:GridViewControl>
                                                                            <div id="grdSADataEmpty" class="grid-novalues marginBottom15 marginLeft15" visible="false" runat="server">
                                                                                <div id="divSAProductSelectionInfo" class="login-info-bottom-text" runat="server">
                                                                                    <asp:Label ID="lblSAEmptyGrid" runat="server"></asp:Label>
                                                                                    <div class="login-info-bottom-text-icon"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding noMarginTop">
                                                            <div>
                                                                <div class="content-accounts">
                                                                    <div class="scroll-item-icon noMargin negMarginTop2 marginRight10 flLeft">
                                                                        <span class="metro marginBottom no-info-img"><i id="icoFavoriteAccount" class="icon-star-4" visible="false" runat="server"></i></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="clearBoth"></div>
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
    </it:FlowInnerContainer>


    <it:FlowInnerContainer ID="flwCreditAccounts" Title="<%$FrontEndResources:TRX00131,LATitleContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro " runat="server">
        <div class="productListHead productListContainer"></div>
        <asp:Repeater ID="rptCreditAccounts" runat="server" OnItemDataBound="rptCreditAccounts_ItemDataBound">
            <ItemTemplate>
                <div class="containerWrapper">
                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max listItemContainerLarge">
                        <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 content-body fullWidth">
                            <section>
                                <div class="col-lg-12 col-left clearPadding">
                                    <span>
                                        <div class="trx-container">
                                            <div class="product-list">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding">

                                                    <div class=" account">
                                                        <asp:HiddenField ID="hidCreditAccountNumber" runat="server" />
                                                        <div class="pull-left col-xs-6 col-sm-6 col-md-4 col-lg-4 content-accounts flLeft clearPadding">
                                                            <div class="scroll-item-icon">
                                                                <span class="img-icon-loan"></span>
                                                            </div>
                                                            <h4 class="accounts-name">
                                                                <asp:Literal ID="litAccountName" runat="server"></asp:Literal></h4>
                                                            <p class="accountNumber marginTop10 noMarginLeft">
                                                                <asp:Literal ID="litAccountNumber" runat="server"></asp:Literal>
                                                            </p>
                                                        </div>
                                                        <div class="pull-left hidden-xs hidden-sm col-md-3 col-lg-3 favorit-first_v2">
                                                            <h4 class="accounts-panel-p textAlignLeft">
                                                                <asp:Literal ID="litAvailableBalance" Text="<%$FrontEndResources:TRX00131,litExpDate%>" runat="server"></asp:Literal>
                                                            </h4>
                                                            <p class="favorit-center accounts-panel-h field-tooltip" data-toggle="tooltip" data-placement="top" id="hAvailableBalance" runat="server">
                                                                <asp:Literal ID="litNextPaymentDate" runat="server"></asp:Literal>
                                                            </p>
                                                        </div>
                                                        <div class="pull-left col-xs-6 col-sm-6 col-md-3 col-lg-3 favorit-first_v2">
                                                            <h4 class="accounts-panel-p">
                                                                <asp:Literal ID="litBalance" Text="<%$FrontEndResources:TRX00501,RemainingBalanceTitle%>" runat="server"></asp:Literal>
                                                            </h4>
                                                            <p class="favorit-center accounts-panel-h field-tooltip" data-toggle="tooltip" data-placement="top" id="hBalance" runat="server">
                                                                <asp:Literal ID="litRemainingBalance" runat="server"></asp:Literal>
                                                                <asp:Label ID="litAvailableBalanceValueCurrency" CssClass="CurrencyValue" runat="server"></asp:Label>
                                                            </p>
                                                        </div>
                                                        <div class="pull-left hidden-xs hidden-sm col-md-2 col-lg-2 account-details" style="text-align: right; padding-top: 8px; padding-right: 15px; position: relative;">
                                                            <asp:LinkButton NavigateUrl="#" ID="aOpenDetail" runat="server" CssClass="accountExpandicon"></asp:LinkButton>
                                                        </div>
                                                        <div class="clearBoth"></div>
                                                        <div class="nav-bottons col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding: 0px 0px; margin-top: 0px; display: none;">
                                                            <div class="box-grey">
                                                                <div class="content-accounts">
                                                                    <div class="scroll-item-icon" style="border-bottom-left-radius: 5px; border-top-left-radius: 0px; margin-top: -1px; margin-left: 0px; margin-right: 10px; border-bottom: 0; float: left">
                                                                        <span class="img-icon-accounts metro" style="margin-bottom: 6px; background-image: none !important;"><i id="icoFavoriteAccount" class="icon-star-4" visible="false" runat="server"></i></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <ul class="nav nav-pills pull-right links hidden">
                                                                <li>
                                                                    <span id="aAccountDetail" style="padding: 15px 30px 15px 15px; color: rgb(163, 0, 51)" runat="server">
                                                                        <asp:Literal ID="litAccountDetail" Text="<%$FrontEndResources:TRX00501,AccountLoanDetail %>" runat="server"></asp:Literal>
                                                                    </span>
                                                                </li>
                                                            </ul>
                                                            <div class="clearBoth"></div>
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
    </it:FlowInnerContainer>


    <it:FlowInnerContainer ID="flwLeasingAccounts" Title="<%$FrontEndResources:TRX00131,FinTitleContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro " runat="server">
        <div class="productListHead productListContainer"></div>
        <asp:Repeater ID="rptLeasingAccounts" runat="server" OnItemDataBound="rptLeasingAccounts_ItemDataBound">
            <ItemTemplate>
                <div class="containerWrapper">
                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max listItemContainerLarge">
                        <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 content-body fullWidth">
                            <section>
                                <div class="col-lg-12 col-left clearPadding">
                                    <span>
                                        <div class="trx-container">
                                            <div class="product-list">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding">


                                                    <div class=" account">
                                                        <asp:HiddenField ID="hidLeasingAccountNumber" runat="server" />
                                                        <div id="leasingAccounts" class="hidden">
                                                            <button id="btnLeasingOpenTable" runat="server" class="btn btn-DarkRed accountExpandicon" onserverclick="btnLeasingOpenTable_Click" onclick="if(showHideTableLoan.call(this,event))" style="color: white; border: 3px solid #EAEAEA;">
                                                                <i class="glyphicon glyphicon-arrow-down"></i>
                                                            </button>
                                                        </div>
                                                        <asp:LinkButton NavigateUrl="#" ID="aLeasingOpenTable" runat="server" CssClass="accountExpand " OnClick="aLeasingOpenTable_Click" OnClientClick="showHideTableLoan.call(this, event)">
                                                            <div>
                                                                <span id="btnOpenTable" runat="server" class="btn btn-account-listing-toggle accountExpandicon"></span>
                                                            </div>
                                                            <div class="col-xs-8 col-sm-8 col-md-7 col-lg-5 content-accounts col-xxs clearPadding">
                                                                <div class="scroll-item-icon">
                                                                    <span class="img-icon-loan"></span>
                                                                </div>
                                                                <h4 class="accounts-name">
                                                                    <asp:Literal ID="litLAAccountName" runat="server"></asp:Literal>
                                                                </h4>
                                                                <p class="accountNumber">
                                                                    <asp:Literal ID="litLAAccountNumber" runat="server"></asp:Literal>
                                                                </p>
                                                            </div>
                                                            <div class="pull-left col-xs-12 col-sm-6 col-md-3 col-lg-3 favorit-first_v2 col-sm-noBorder col-sm-noPaddingLeft sm-hidden saldoContabilistico">
                                                                <h4 class="accounts-panel-p">
                                                                    <asp:Literal ID="litAvailableBalance" Text="<%$FrontEndResources:TRX00131,litEndDate%>" runat="server"></asp:Literal>
                                                                </h4>
                                                                <p class="favorit-center accounts-panel-h neutral" id="hAvailableBalance" runat="server">
                                                                    <asp:Literal ID="litNextPaymentDate" runat="server"></asp:Literal>
                                                                </p>
                                                            </div>
                                                            <div class="pull-left col-xs-12 col-sm-6 col-md-3 col-lg-3 _v2 favorit-first_v2 col-xxs content-accounts saldoDisponivel">
                                                                <h4 class="accounts-panel-p">
                                                                    <asp:Literal ID="litBalance" Text="<%$FrontEndResources:TRX00501,RemainingBalanceTitle%>" runat="server"></asp:Literal>
                                                                </h4>
                                                                <p class="favorit-center accounts-panel-h" id="hBalance" runat="server">
                                                                    <asp:Literal ID="litRemainingBalance" runat="server"></asp:Literal>
                                                                    <asp:Label ID="litAvailableBalanceValueCurrency" CssClass="CurrencyValue" runat="server"></asp:Label>
                                                                </p>
                                                            </div>
                                                            <div class="clearBoth"></div>
                                                        </asp:LinkButton>
                                                        <div class="clearBoth"></div>
                                                        <div id="accountLeasingData" runat="server" class="tableWrapper_v5 hidden">
                                                            <asp:UpdatePanel runat="server" ID="updCreditPanel" UpdateMode="Conditional">
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="btnLeasingOpenTable" EventName="ServerClick" />
                                                                    <asp:AsyncPostBackTrigger ControlID="aLeasingOpenTable" EventName="Click" />
                                                                </Triggers>
                                                                <ContentTemplate>
                                                                    <div class="col-lg-12 clearPadding overflowHidden">
                                                                        <div class="metro inner-table">
                                                                            <it:GridViewControl ID="grdLeasingData" runat="server" AutoGenerateColumns="false" CssClass="table table_v2 table-resp-to1199" IsResponsive="true" AllowPag="false"
                                                                                GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" RecordCounterComplementarText="<%$FrontEndResources:DATALIST,gridDataecordCounterComplementarText %>"
                                                                                Style="padding-bottom: 0px;">
                                                                                <Columns>
                                                                                </Columns>
                                                                            </it:GridViewControl>
                                                                            <div id="grdLeasingDataEmpty" class="grid-novalues" style="margin-bottom: 15px; margin-left: 15px;" visible="false" runat="server">
                                                                                <div id="divProductSelectionInfoLeasing" class="login-info-bottom-text" runat="server">
                                                                                    <asp:Label ID="lblLeasingEmptyGrid" runat="server"></asp:Label>
                                                                                    <div class="login-info-bottom-text-icon"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                        <div class="nav-bottonsv2 col-xs-12 col-sm-12 col-md-12 col-lg-12 hidden">
                                                            <div class="box-grey">
                                                                <div class="content-accounts">
                                                                    <div class="scroll-item-icon nMarginLeft15">
                                                                        <span class="img-icon-loan metro"><i id="icoFavoriteAccount" class="icon-star-4" visible="false" runat="server"></i></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <ul class="nav nav-pills pull-right links">
                                                                <li>
                                                                    <span id="aLAPaymentPlan" style="padding: 15px 30px 15px 15px; color: rgb(163, 0, 51)" runat="server">
                                                                        <asp:Literal ID="litLAPaymentPlan" Text="<%$FrontEndResources:TRX00131,PaymentPlan %>" runat="server"></asp:Literal>
                                                                    </span>
                                                                </li>
                                                                <li>
                                                                    <span id="aLAAccountDetail" style="padding: 15px 30px 15px 15px; color: rgb(163, 0, 51)" runat="server">
                                                                        <asp:Literal ID="litLAAccountDetail" Text="<%$FrontEndResources:TRX00131,AccountLeasingDetail %>" runat="server"></asp:Literal>
                                                                    </span>
                                                                </li>
                                                            </ul>
                                                            <div class="clearBoth"></div>
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
    </it:FlowInnerContainer>


    <it:FlowInnerContainer ID="flwCollateralizedAccounts" Title="<%$FrontEndResources:TRX00131,CollTitleContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro " runat="server">
        <div class="productListHead productListContainer"></div>
        <asp:Repeater ID="rptCollateralizedAccounts" runat="server" OnItemDataBound="rptCollateralizedAccounts_ItemDataBound">
            <ItemTemplate>
                <div class="containerWrapper">
                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max listItemContainerLarge">
                        <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 content-body fullWidth">
                            <section>
                                <div class="col-lg-12 col-left clearPadding">
                                    <span>
                                        <div class="trx-container">
                                            <div class="product-list">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding">

                                                    <div class=" account">
                                                        <asp:HiddenField ID="hidCollateralizedAccountNumber" runat="server" />
                                                        <div id="collateralizedAccounts" class="hidden">
                                                            <button id="btnCollateralizedOpenTable" runat="server" class="btn btn-DarkRed accountExpandicon" onserverclick="btnCollateralizedOpenTable_Click" onclick="if(showHideTableLoan.call(this,event))" style="color: white; border: 3px solid #EAEAEA;">
                                                                <i class="glyphicon glyphicon-arrow-down"></i>
                                                            </button>
                                                        </div>
                                                        <asp:LinkButton NavigateUrl="#" ID="aCollateralizedOpenTable" runat="server" CssClass="accountExpand " OnClick="aCollateralizedOpenTable_Click" OnClientClick="showHideTableLoan.call(this, event)">
                                                            <div>
                                                                <span id="btnOpenTable" runat="server" class="btn btn-account-listing-toggle accountExpandicon"></span>
                                                            </div>
                                                            <div class="col-xs-8 col-sm-8 col-md-7 col-lg-5 content-accounts col-xxs clearPadding">
                                                                <div class="scroll-item-icon">
                                                                    <span class="img-icon-loan"></span>
                                                                </div>
                                                                <h4 class="accounts-name">
                                                                    <asp:Literal ID="litLAAccountName" runat="server"></asp:Literal>
                                                                </h4>
                                                                <p class="accountNumber">
                                                                    <asp:Literal ID="litLAAccountNumber" runat="server"></asp:Literal>
                                                                </p>
                                                            </div>
                                                            <div class="pull-left col-xs-12 col-sm-6 col-md-3 col-lg-3 favorit-first_v2 col-sm-noBorder col-sm-noPaddingLeft sm-hidden saldoContabilistico">
                                                                <h4 class="accounts-panel-p">
                                                                    <asp:Literal ID="litBalance" Text="<%$FrontEndResources:TRX00501,RemainingBalanceTitle%>" runat="server"></asp:Literal>
                                                                </h4>
                                                                <p class="favorit-center accounts-panel-h" id="hBalance" runat="server">
                                                                    <asp:Literal ID="litRemainingBalance" runat="server"></asp:Literal>
                                                                    <asp:Label ID="litAvailableBalanceValueCurrency" CssClass="CurrencyValue" runat="server"></asp:Label>
                                                                </p>
                                                            </div>
                                                            <div class="pull-left col-xs-12 col-sm-6 col-md-3 col-lg-3 _v2 favorit-first_v2 col-xxs content-accounts saldoDisponivel">
                                                                <h4 class="accounts-panel-p">
                                                                    <asp:Literal ID="litAvailableBalance" Text="<%$FrontEndResources:TRX00131,litExpDate%>" runat="server"></asp:Literal>
                                                                </h4>
                                                                <p class="favorit-center accounts-panel-h neutral" id="hAvailableBalance" runat="server">
                                                                    <asp:Literal ID="litNextPaymentDate" runat="server"></asp:Literal>
                                                                </p>
                                                            </div>
                                                            <div class="clearBoth"></div>
                                                        </asp:LinkButton>
                                                        <div class="clearBoth"></div>
                                                        <div id="accountCollateralizedData" runat="server" class="tableWrapper_v5 hidden">
                                                            <asp:UpdatePanel runat="server" ID="updCollateralizedPanel" UpdateMode="Conditional">
                                                                <Triggers>
                                                                    <asp:AsyncPostBackTrigger ControlID="btnCollateralizedOpenTable" EventName="ServerClick" />
                                                                    <asp:AsyncPostBackTrigger ControlID="aCollateralizedOpenTable" EventName="Click" />
                                                                </Triggers>
                                                                <ContentTemplate>
                                                                    <div class="col-lg-12 clearPadding overflowHidden">
                                                                        <div class="metro inner-table">
                                                                            <it:GridViewControl ID="grdCollateralizedData" runat="server" AutoGenerateColumns="false" CssClass="table table_v2 table-resp-to1199" IsResponsive="true" AllowPag="false"
                                                                                GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" RecordCounterComplementarText="<%$FrontEndResources:DATALIST,gridDataecordCounterComplementarText %>"
                                                                                Style="padding-bottom: 0px;">
                                                                                <Columns>
                                                                                </Columns>
                                                                            </it:GridViewControl>
                                                                            <div id="grdCollateralizedDataEmpty" class="grid-novalues" style="margin-bottom: 15px; margin-left: 15px;" visible="false" runat="server">
                                                                                <div id="divProductSelectionInfoCollateralized" class="login-info-bottom-text" runat="server">
                                                                                    <asp:Label ID="lblCollateralizedEmptyGrid" runat="server"></asp:Label>
                                                                                    <div class="login-info-bottom-text-icon"></div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                        </div>
                                                        <div class="nav-bottonsv2 col-xs-12 col-sm-12 col-md-12 col-lg-12 hidden">
                                                            <div class="box-grey">
                                                                <div class="content-accounts">
                                                                    <div class="scroll-item-icon nMarginLeft15">
                                                                        <span class="img-icon-loan metro"><i id="icoFavoriteAccount" class="icon-star-4" visible="false" runat="server"></i></span>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <ul class="nav nav-pills pull-right links">
                                                                <li>
                                                                    <span id="aLAPaymentPlan" style="padding: 15px 30px 15px 15px; color: rgb(163, 0, 51)" runat="server">
                                                                        <asp:Literal ID="litLAPaymentPlan" Text="<%$FrontEndResources:TRX00131,PaymentPlan %>" runat="server"></asp:Literal>
                                                                    </span>
                                                                </li>
                                                                <li>
                                                                    <span id="aLAAccountDetail" style="padding: 15px 30px 15px 15px; color: rgb(163, 0, 51)" runat="server">
                                                                        <asp:Literal ID="litLAAccountDetail" Text="<%$FrontEndResources:TRX00131,AccountCollateralizedDetail %>" runat="server"></asp:Literal>
                                                                    </span>
                                                                </li>
                                                            </ul>
                                                            <div class="clearBoth"></div>
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
    </it:FlowInnerContainer>



    <it:FlowInnerContainer ID="flwAssociatedAccounts" Title="<%$FrontEndResources:TRX00131,ACTitleContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro " runat="server">
        <asp:PlaceHolder ID="phWidgets2" runat="server" Visible="false"></asp:PlaceHolder>
    </it:FlowInnerContainer>
    <div id="containerAssociateAccounts">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max listItemContainerLarge">
            <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 content-body fullWidth">
                <a runat="server" id="btnAddAccount" class="buttonAddAccount" title="<%$FrontEndResources:TRX00131,AddAccount %>">
                    <div id="AddAccounts" class="divAddAccounts">
                        <div class="AddAccountsInfo">
                            <img id="imgAddAccounts" src="<%$ebFile:~/Content/currenttheme/images/associate_accounts/add_account.png%>" alt="<%$FrontEndResources:TRX00131,AddAccount %>" runat="server" class="imgAddAccount" />
                            <asp:Literal ID="litAddAccount" Text="<%$FrontEndResources:TRX00131,AddAccount %>" runat="server"></asp:Literal>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
    <div class="clearBoth"></div>
    <asp:Button ID="btnRemoveConsent" Style="display: none;" runat="server" OnClick="btnRemoveConsent_Click" />
    <asp:HiddenField ID="hdnRemoveConsentList" runat="server" />
    <asp:HiddenField ID="hdnBankId" runat="server" />
    <asp:HiddenField ID="hdnBankName" runat="server" />
    <asp:HiddenField ID="hdnRemoveAccounts" runat="server" />
    <script type="text/javascript">       
        var IDs = new Array;
        var IDsGroup = new Array;
        var openTableRs = "<%=eBankit.Common.Globalization.Translate.GetTransactionString("JS","ExpandAccountInfo") %>";
        var closeTableRs = "<%=eBankit.Common.Globalization.Translate.GetTransactionString("JS","CollapseAccountInfo") %>";

        function showHideTable_custom(event, productType) {
            var id = $(this).data('id');
            var table = $('.last-statements-table[data-id=' + id + ']');

            $(".last-statements-table").slideUp('fast'); //Hidding tables

            if ($('[id*=aOpenTable]').length > 0)
                $('[id*=aOpenTable]').removeClass().addClass("statements-expand-icon");
            if ($('[id*=aOpenSATable]').length > 0)
                $('[id*=aOpenSATable]').removeClass().addClass("statements-expand-icon");
            if ($('[id*=btnCAOpenTableDD]').length > 0)
                $('[id*=btnCAOpenTableDD]').removeClass().addClass("statements-expand-icon");
            if ($('[id*=btnCAOpenTableCC]').length > 0)
                $('[id*=btnCAOpenTableCC]').removeClass().addClass("statements-expand-icon");
            if ($('[id*=aOpenTableMovsCorporateGroups]').length > 0)
                $('[id*=aOpenTableMovsCorporateGroups]').removeClass().addClass("statements-expand-icon");

            $('a.statements-expand-icon').each(function () {
                $(this).removeAttr("title");
                $(this).attr("title", openTableRs);
            });

            if (table.length > 0 && !table.is(':visible')) {
                table.slideDown('fast');
                table.removeClass('hidden');
                $('a[data-id=' + id + ']').toggleClass("statements-expand-icon statements-collapse-icon");
                $('a[data-id=' + id + ']').removeAttr("title");
                $('a[data-id=' + id + ']').attr("title", closeTableRs);
                if (!include(IDs, id)) {
                    IDs.push(id);
                    return true;
                }
            }
            $('a[data-id=' + id + ']').removeAttr("title");
            $('a[data-id=' + id + ']').attr("title", openTableRs);

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

        function showHideTableDD(event) {
            var id = $(this).data('id');
            var table = $('.tableWrapper_v3[data-id=' + id + ']');

            $(".tableWrapper_v3").slideUp('fast'); //Hidding tables
            $('button').find("i").removeClass().addClass("glyphicon glyphicon-arrow-down");
            //$('.accountWrapper').removeClass("accountActive");

            if (table.length > 0 && !table.is(':visible')) {
                table.slideDown('fast');
                //$(this).closest($('.accountWrapper')).addClass("accountActive");
                $('button[data-id=' + id + ']').find("i").toggleClass("glyphicon-arrow-down glyphicon-arrow-up");
                if (!include(IDs, id)) {
                    IDs.push(id);
                    return true;
                }
            }

            event.preventDefault();
            IDs.push(id);

            return false;
        }

        function showHideTableCC(event) {
            var id = $(this).data('id');
            var table = $('.tableWrapper_v4[data-id=' + id + ']');

            $(".tableWrapper_v4").slideUp('fast'); //Hidding tables
            $('button').find("i").removeClass().addClass("glyphicon glyphicon-arrow-down");
            //$('.accountWrapper').removeClass("accountActive");

            if (table.length > 0 && !table.is(':visible')) {
                table.slideDown('fast');
                //$(this).closest($('.accountWrapper')).addClass("accountActive");
                $('button[data-id=' + id + ']').find("i").toggleClass("glyphicon-arrow-down glyphicon-arrow-up");
                if (!include(IDs, id)) {
                    IDs.push(id);
                    return true;
                }
            }

            event.preventDefault();
            IDs.push(id);

            return false;
        }

        function showHideTableLoan(event) {
            var id = $(this).data('id');
            var table = $('.tableWrapper_v5[data-id=' + id + ']');

            $(".tableWrapper_v5").slideUp('fast'); //Hidding tables
            $('button').find("i").removeClass().addClass("glyphicon glyphicon-arrow-down");

            if (table.length > 0 && !table.is(':visible')) {
                table.slideDown('fast');
                $('button[data-id=' + id + ']').find("i").toggleClass("glyphicon-arrow-down glyphicon-arrow-up");
                if (!include(IDs, id)) {
                    IDs.push(id);
                    return true;
                }
            }

            event.preventDefault();
            IDs.push(id);

            return false;
        }

        function include(arr, obj) {
            return (arr.indexOf(obj) != -1);
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

        GoToDebitCardDetails = function (number) {
            eBankit.Presentation.SetBlockPageCommon();
            $('body').block();
            eBankit.document.location.href = eBankit.Presentation.ResolveUrl('~/Security/Transactions/Transactions.aspx?trxid=TRX00213<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&card=' + number);
        }

        GoToCreditCardDetails = function (number) {
            eBankit.Presentation.SetBlockPageCommon();
            $('body').block();
            eBankit.document.location.href = eBankit.Presentation.ResolveUrl('~/Security/Transactions/Transactions.aspx?trxid=TRX00202<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&card=' + number);
        }

        GoToCardStatement = function (number) {
            eBankit.Presentation.SetBlockPageCommon();
            $('body').block();
            eBankit.document.location.href = eBankit.Presentation.ResolveUrl('~/Security/Transactions/Transactions.aspx?trxid=TRX00201<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&card=' + number);
        }

        GoCAToNIB = function (number) {
            eBankit.Presentation.SetBlockPageCommon();
            $('body').block();
            eBankit.document.location.href = eBankit.Presentation.ResolveUrl('~/Security/Transactions/Transactions.aspx?trxid=TRX00107<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&acc=' + number);
        }

        GoToCAAccountStatements = function (number) {
            eBankit.Presentation.SetBlockPageCommon();
            $('body').block();
            eBankit.document.location.href = eBankit.Presentation.ResolveUrl('~/Security/Transactions/Transactions.aspx?trxid=TRX00101<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&acc=' + number);
        }

        GoToCCCardDetail = function (number) {
            eBankit.Presentation.SetBlockPageCommon();
            $('body').block();
            eBankit.document.location.href = eBankit.Presentation.ResolveUrl('~/Security/Transactions/Transactions.aspx?trxid=TRX00202<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&card=' + number);
        }

        GoToCPPCardDetail = function (number) {
            eBankit.Presentation.SetBlockPageCommon();
            $('body').block();
            eBankit.document.location.href = eBankit.Presentation.ResolveUrl('~/Security/Transactions/Transactions.aspx?trxid=TRX00219<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&card=' + number);
        }

        GoToSAAccountDetail = function (number) {
            eBankit.Presentation.SetBlockPageCommon();
            $('body').block();
            eBankit.document.location.href = eBankit.Presentation.ResolveUrl('~/Security/Transactions/Transactions.aspx?trxid=TRX00301<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&acc=' + number);
        }

        GoToSAAccountReinforcement = function (number) {
            eBankit.Presentation.SetBlockPageCommon();
            $('body').block();
            eBankit.document.location.href = eBankit.Presentation.ResolveUrl('~/Security/Transactions/Transactions.aspx?trxid=TRX00306<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&acc=' + number);
        }

        GoToSAAccountSettlement = function (number) {
            eBankit.Presentation.SetBlockPageCommon();
            $('body').block();
            eBankit.document.location.href = eBankit.Presentation.ResolveUrl('~/Security/Transactions/Transactions.aspx?trxid=TRX00309<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&acc=' + number);
        }

        GoToCreditAccountDetail = function (number) {
            eBankit.Presentation.SetBlockPageCommon();
            $('body').block();
            eBankit.document.location.href = eBankit.Presentation.ResolveUrl('~/Security/Transactions/Transactions.aspx?trxid=TRX00502<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&acc=' + number);
        }

        GoToExternalAccountDetail = function (number) {
            eBankit.Presentation.SetBlockPageCommon();
            $('body').block();
            eBankit.document.location.href = eBankit.Presentation.ResolveUrl('~/Security/Transactions/Transactions.aspx?trxid=TRX02102<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&acc=' + number);
        }

        GoToLeasingAccountDetail = function (number) {
            eBankit.Presentation.SetBlockPageCommon();
            $('body').block();
            eBankit.document.location.href = eBankit.Presentation.ResolveUrl('~/Security/Transactions/Transactions.aspx?trxid=TRX00506<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&acc=' + number);
        }

        GoToCollateralizedAccountDetail = function (number) {
            eBankit.Presentation.SetBlockPageCommon();
            $('body').block();
            eBankit.document.location.href = eBankit.Presentation.ResolveUrl('~/Security/Transactions/Transactions.aspx?trxid=TRX00507<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&acc=' + number);
        }

        GoToLAPaymentPlan = function (number) {
            eBankit.Presentation.SetBlockPageCommon();
            $('body').block();
            eBankit.document.location.href = eBankit.Presentation.ResolveUrl('~/Security/Transactions/Transactions.aspx?trxid=TRX00504<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&acc=' + number);
        }


        $(document).ready(function () {
            CreateTooltip();
            SelectedFirstGroup();
            //$("[data-widget-assoc-id]").each(function (index) {
            //    eBankit.Presentation.Dashboard.loadControlAssoc($(this));
            //});

            Accessibility();
        });

        Accessibility = function () {
            if ($('img[id*=BankImage_]').length > 0) $('img[id*=BankImage_]').attr('alt', '');
        };

        EndPageRequest = function () {
            CreateTooltip();
        }

        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndPageRequest);

        CreateTooltip = function () {
            $(".accounts-panel-h").tooltip({
                html: true,
            });
        };

        function SelectedFirstGroup() {
            if ($(".CorporateGroups").find(".CorporateGroupDetail").length > 0) {
                $($(".CorporateGroups").find(".CorporateGroupDetail")[0]).show();
                $($(".CorporateGroups")[0]).addClass('toggle-selected highlight');
                $($(".CorporateGroups").find(".CorporateGroupDetail")[0]).addClass('toggle-arrow-open');
                $(".toggle-arrow-open").attr('title','<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX00131", "Colapse") %>')
            }
        }

    </script>

    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00131-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
