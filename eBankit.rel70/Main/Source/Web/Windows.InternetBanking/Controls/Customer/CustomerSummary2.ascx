<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomerSummary2.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.CustomerSummary2" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max no-padding">
    <div class="col-xs-12 clearPadding">
        <div>
            <asp:Repeater ID="rptProducts" runat="server" OnItemDataBound="Products_ItemDataBound">
                <HeaderTemplate>
                    <div id="productsTabContent" class="tab-content panel-content">
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="tab-pane fade" id='curreny<%# Eval("Currency") %>'>
                        <div class="col-xs-12 clearPadding">
                            <div class="metro col-xs-12 col-max text-center position-total">
                                <a id="IntegratedPositionLink" runat="server" class="dashboardSliderTitle">
                                    <asp:Literal ID="litTotalAmount" Text="<%$FrontEndResources:Client,TotalValue%>" runat="server"></asp:Literal>
                                </a>
                                <span id="totalAmount" class="position-value" runat="server">
                                    <asp:Literal ID="LitAmount" runat="server"></asp:Literal>
                                </span>
                                <span class="position-curr">
                                    <asp:Literal ID="LitCurrency" runat="server"></asp:Literal>
                                </span>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 text-center position-chart position-assets desktop-only clearPadding paddingBottom22">
                                <h4 class="text-bold text-bottom-line customer-summary-title-chart">
                                    <asp:Literal ID="Literal2" Text="<%$FrontEndResources:Client,TotalAssetsLbl%>" runat="server"></asp:Literal>
                                    <span class="percentage">
                                        <asp:Literal ID="litPercentageAssets" runat="server"></asp:Literal>
                                    </span>
                                </h4>
                                <span id="spanAssets" runat="server">
                                    <asp:Literal ID="Literal21" runat="server"></asp:Literal>
                                </span>
                                <span class="position-curr">
                                    <asp:Literal ID="Literal22" runat="server"></asp:Literal>
                                </span>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 tablet-center">
                                <div id="customerSummary"></div>
                            </div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 text-center position-chart position-assets tablet-only phone-only ClearPadding paddingBottom22">
                                <h4 class="text-bold text-bottom-line customer-summary-title-chart">
                                    <asp:Literal ID="Literal1" Text="<%$FrontEndResources:Client,TotalAssetsLbl%>" runat="server"></asp:Literal>
                                    <span class="percentage">
                                        <asp:Literal ID="litPercentageAssetsTablet" runat="server"></asp:Literal></span>
                                </h4>
                                <span class="position-value positive">
                                    <asp:Literal ID="Literal5" runat="server"></asp:Literal>
                                </span>
                                <span class="position-curr">
                                    <asp:Literal ID="Literal6" runat="server"></asp:Literal>
                                </span>
                            </div>
                            <div class="tablet-only phone-only clearBoth"></div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-center tablet-only phone-only clearPadding paddingBottom22">
                                <asp:Repeater ID="rptProductsLegendAssetsTablet" runat="server" OnItemDataBound="rptProductsLegend_ItemDataBound">
                                    <HeaderTemplate>
                                        <div class="metro alignCenter">
                                            <div class="dashboardIntegratedPosition flLeft colMax">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <div id="lblLegendContainer" class="col-xs-12 col-sm-6 col-md-3 col-lg-3 flRight lblLegendContainer" runat="server">
                                            <div>
                                                <asp:Label ID="lblLegendSerieColor" CssClass="label label-default label-empty fullWidth" runat="server"></asp:Label>
                                            </div>
                                            <div>
                                                <asp:Label ID="lblLegendSerie" CssClass="label label-transparent label-legend-left" runat="server"></asp:Label>
                                                <asp:Label ID="lblLegendSerieValue" CssClass="label label-transparent label-legend-dash" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                            </div>
                                        </div>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                            <div class="tablet-only phone-only clearBoth"></div>
                            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 text-center position-chart position-liabilities clearPadding paddingBottom22">
                                <h4 class="text-bold text-bottom-line customer-summary-title-chart">
                                    <asp:Literal ID="Literal3" Text="<%$FrontEndResources:Client,TotalLiabilitiesLbl%>" runat="server"></asp:Literal>
                                    <span class="percentage">
                                        <asp:Literal ID="litPercentageLiabilites" runat="server"></asp:Literal>
                                    </span>
                                </h4>
                                <span class="position-value negative">
                                    <asp:Literal ID="Literal31" runat="server"></asp:Literal>
                                </span>
                                <span class="position-curr">
                                    <asp:Literal ID="Literal32" runat="server"></asp:Literal>
                                </span>
                            </div>
                            <div class="clearBoth"></div>
                            <div class="tablet-only phone-only">
                                <asp:Repeater ID="rptProductsLegendLiabilitiesTablet" runat="server" OnItemDataBound="rptProductsLegend_ItemDataBound">
                                    <HeaderTemplate>
                                        <div class="metro alignCenter">
                                            <div class="dashboardIntegratedPosition flRight">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <div id="lblLegendContainer" class="col-xs-12 col-sm-6 col-md-3 col-lg-3 flLeft lblLegendContainer" runat="server">
                                            <div>
                                                <asp:Label ID="lblLegendSerieColor" CssClass="label label-default label-empty fullWidth" runat="server"></asp:Label>
                                            </div>
                                            <div>
                                                <asp:Label ID="lblLegendSerie" CssClass="label label-transparent label-legend-left" runat="server"></asp:Label>
                                                <asp:Label ID="lblLegendSerieValue" CssClass="label label-transparent label-legend-dash" runat="server"></asp:Label>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                            </div>
                                        </div>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                        <div class="col-xs-12 desktop-only clearPadding">
                            <asp:Repeater ID="rptProductsLegendAssets" runat="server" OnItemDataBound="rptProductsLegend_ItemDataBound">
                                <HeaderTemplate>
                                    <div class="metro alignCenter">
                                        <div class="dashboardIntegratedPosition flLeft">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div id="lblLegendContainer" class="col-xs-12 col-sm-6 col-md-3 col-lg-3 flRight lblLegendContainer" runat="server">
                                        <div>
                                            <asp:Label ID="lblLegendSerieColor" CssClass="label label-default label-empty fullWidth" runat="server"></asp:Label>
                                        </div>
                                        <div>
                                            <asp:Label ID="lblLegendSerie" CssClass="label label-transparent label-legend-left" runat="server"></asp:Label>
                                            <asp:Label ID="lblLegendSerieValue" CssClass="label label-transparent label-legend-dash" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <FooterTemplate>
                                        </div>
                                    </div>
                                </FooterTemplate>
                            </asp:Repeater>
                            <asp:Repeater ID="rptProductsLegendLiabilities" runat="server" OnItemDataBound="rptProductsLegend_ItemDataBound">
                                <HeaderTemplate>
                                    <div class="metro alignCenter">
                                        <div class="dashboardIntegratedPosition flRight">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div id="lblLegendContainer" class="col-xs-12 col-sm-6 col-md-3 col-lg-3 flLeft lblLegendContainer" runat="server">
                                        <div>
                                            <asp:Label ID="lblLegendSerieColor" CssClass="label label-default label-empty fullWidth" runat="server"></asp:Label>
                                        </div>
                                        <div>
                                            <asp:Label ID="lblLegendSerie" CssClass="label label-transparent label-legend-left" runat="server"></asp:Label>
                                            <asp:Label ID="lblLegendSerieValue" CssClass="label label-transparent label-legend-dash" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <FooterTemplate>
                                        </div>
                                    </div>
                                </FooterTemplate>
                            </asp:Repeater>
                            <asp:Repeater ID="rptProductsEmpty" runat="server" OnItemDataBound="rptProductsLegend_ItemDataBound">
                                <HeaderTemplate>
                                    <div class="metro alignCenter">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div id="lblLegendContainer" class="col-xs-12 col-sm-6 col-md-3 col-lg-3 legend-container">
                                        <div>
                                            <asp:Label ID="lblLegendSerieColor" CssClass="label label-default label-empty fullWidth" runat="server"></asp:Label>
                                        </div>
                                        <div>
                                            <asp:Label ID="lblLegendSerie" CssClass="label label-transparent label-legend-left" runat="server"></asp:Label>
                                            <asp:Label ID="lblLegendSerieValue" CssClass="label label-transparent label-legend-dash" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </div>
                                </FooterTemplate>
                            </asp:Repeater>
                        </div>
                        <div class="clearBoth"></div>
                        <div class="clearBoth"></div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    </div>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
    <div class="clearBoth"></div>
</div>
<asp:HiddenField ID="hdnCategoriesData" runat="server" />
<script type="text/javascript">
    /*************************************************
     ************ List of chart colors ***************
     *************************************************/
    var colors = {
        '<%= (int)eBankit.Business.Entities.Banking.PrositionType.TotalAssets %>': "#6A952F",
        '<%= (int)eBankit.Business.Entities.Banking.PrositionType.TotalLiabilities %>': "#5F0F17",
        '<%= (int)eBankit.Business.Entities.Banking.PrositionType.FinancingCreditAccount %>': "#BE1E2D",
        '<%= (int)eBankit.Business.Entities.Banking.PrositionType.EscrowAccount %>': "#F3CF34",
        '<%= (int)eBankit.Business.Entities.Banking.PrositionType.CreditCards %>': "#EA9603",
        '<%= (int)eBankit.Business.Entities.Banking.PrositionType.CurrentAccount %>': "#8DC63F",
        '<%= (int)eBankit.Business.Entities.Banking.PrositionType.SavingAccounts %>': "#68B4BD",
        '<%= (int)eBankit.Business.Entities.Banking.PrositionType.Unkwown %>': "#CBCBCB"
    };
</script>
<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("customer-summary.js".ResolveJsUrl("ebankitControls/customerSummary"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
