<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00512_20.ascx.cs" Inherits="TRX00512_20" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <div class="proof-inner">
        <asp:PlaceHolder ID="phProofInner" runat="server"></asp:PlaceHolder>
    </div>
    <asp:Panel ID="pnControls" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" runat="server">
        <div class="clearBoth"></div>
    </asp:Panel>
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding">
        <div class="clearBoth"></div>
       <it:CreditSimulationGraphData ID="graphSimulation" runat="server"></it:CreditSimulationGraphData>
    </div>
    <asp:Panel ID="pnlOppeningAccount" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" runat="server">
        <div class="clearBoth"></div>
    </asp:Panel>
    <asp:Panel ID="pnlFirstTransfer" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" Style="padding-bottom: 30px;" runat="server">
        <div class="clearBoth"></div>
    </asp:Panel>

    <div class="col-lg-8 col-max clearPadding">
        <div class="table-grid-border">
            <it:FlowContainerDetail ID="flwData" CssClass="panel panel-detail borderOperations" runat="server">
                <div class="col-lg-12 clearPadding overflowHidden">
                    <div class="metro">
                        <it:GridViewControl ID="gvSalariesAgenda" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table table-resp-to1199 inside-table noarrow"
                            GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="gvOperations_RowDataBound">
                            <Columns>
                                <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00511,RecordType%>" ItemStyle-CssClass="paddingTop13Important paddingBottom13Important paddingLeft8Important paddingRight8Important" HeaderStyle-Width="35%" ItemStyle-Width="35%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRecordType" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00512,RecordNumber%>" ItemStyle-CssClass="paddingTop13Important paddingBottom13Important paddingLeft8Important paddingRight8Important" HeaderStyle-Width="15%" ItemStyle-Width="15%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblInstallment" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00512,PaymentValue%>" ItemStyle-CssClass="paddingTop13Important paddingBottom13Important paddingLeft8Important paddingRight8Important right" HeaderStyle-CssClass="right" HeaderStyle-Width="15%" ItemStyle-Width="15%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPaymentValue" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00512,InterestValue%>" ItemStyle-CssClass="paddingTop13Important paddingBottom13Important paddingLeft8Important paddingRight8Important right" HeaderStyle-CssClass="right" HeaderStyle-Width="15%" ItemStyle-Width="15%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblInterestValue" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00511,DebtValue%>" ItemStyle-CssClass="paddingTop13Important paddingBottom13Important paddingLeft8Important paddingRight8Important right" HeaderStyle-CssClass="right" HeaderStyle-Width="16%" ItemStyle-Width="15%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDebtValue" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00511,PaymentDate%>" ItemStyle-CssClass="paddingTop13Important paddingBottom13Important paddingLeft8Important paddingRight8Important" HeaderStyle-CssClass="right" HeaderStyle-Width="15%" ItemStyle-Width="10%">
                                    <ItemTemplate>
                                        <asp:Label ID="lblPaymentDate" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-CssClass="right">
                                    <ItemTemplate>
                                        <i class="curLoanSimulationArrowStyle" id="iconDetail" runat="server"></i>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </it:GridViewControl>
                        <div class="col-lg-8 col-max">
                            <it:Pager ID="pager" runat="server" PageSize="10" VisiblePages="10" PagerType="NumericPages" OnPageChanged="ClickPageChanged" />
                        </div>
                    </div>
                </div>
                <asp:Button ID="btnSort" CssClass="hidden" runat="server" />
                <asp:HiddenField ID="hdnSortExpression" runat="server" />
            </it:FlowContainerDetail>
        </div>
    </div>

    <div class="inprint" style="margin-top: 20px;">
        <asp:Label ID="lblOperationID" runat="server"></asp:Label>
        <asp:Label ID="lblPrintDate" Style="display: block; margin-top: 10px;" runat="server"></asp:Label>
    </div>
    <div class="clearBoth"></div>

    <asp:HiddenField ID="hdnFavoritImageId" runat="server" />
    <asp:HiddenField ID="hdnFavoritBenef" runat="server" />

    <div class="clearBoth paddingTop20 paddingBottom20"></div>

    <div id="ImgPanel" class="fullWidth noFloatOfHidden landingAccountContainer clearPadding paddingTop20 paddingBottom20">
        <div class="info-bottom-text col-lg-8 col-max">
            <asp:Label ID="lblWarning" Text="<%$FrontEndResources:TRX00512,Warning%>" runat="server"></asp:Label>
        </div>
    </div>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00512-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
