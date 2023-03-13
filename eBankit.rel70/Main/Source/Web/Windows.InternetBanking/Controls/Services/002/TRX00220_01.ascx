<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00220_01.ascx.cs" Inherits="TRX00220_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server">
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
    <asp:Repeater ID="rptProducts" runat="server" OnItemDataBound="rptProducts_ItemDataBound">
        <ItemTemplate>
            <div class="constPoupancaContainer">
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max lineContainer">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 content-body">
                        <section>
                            <div class="col-lg-12 col-left no-padding">
                                <span>
                                    <div class="trx-container">
                                        <div class="col-xs-12 no-padding">
                                            <div class="desktop-only tablet-only col-xs-12 col-sm-3 col-md-3 col-lg-3 no-padding col-container-center fullHeight">
                                                <img id="Img" src="<%$ebFile:~/Content/currenttheme/images/credit_card.png%>" alt="credit card" class="img-responsive img-products" runat="server" />
                                            </div>
                                            <div class="col-xs-8 col-sm-8 col-md-6 col-lg-6 productexpand">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 no-padding detailContainer">
                                                    <h3>
                                                        <asp:Literal ID="litProductTitle" runat="server"></asp:Literal></h3>
                                                    <div class="productDescriptionContainer">
                                                        <asp:Literal ID="litProductDescription" runat="server"></asp:Literal>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-container-center desktop-only clearPadding " style="height: 25%; margin-top: 10px; position: relative;">
                                                    <div id="divMoreInformation" runat="server" class="MoreInfoText" tabindex="0">
                                                        <asp:Literal ID="litMoreInfo" Text="<%$FrontEndResources:TRX00304,MoreInformation %>" runat="server"  />
                                                    </div>
                                                </div>
                                                <div class="clearBoth"></div>
                                            </div>
                                            <div class="desktop-only col-xs-12 col-sm-3 col-md-3 col-lg-3 text-right col-container-center clearPadding fullHeight" style="float: right;">
                                                <a id="btnSelectProduct" class="btn btn-primary" style="margin-top: 55px; height: 40px; font-size: 1.2rem; padding: 11px 30px !important; font-family: 'Gotham Light'; width: 207px;" runat="server">
                                                    <asp:Literal ID="litContinue" Text="<%$FrontEndResources:TRX00220,Adhere%>" runat="server"></asp:Literal>
                                                </a>
                                            </div>
                                            <div class="tablet-only phone-only col-xs-1 col-sm-1 col-md-3 col-lg-3 text-right clearPadding fullHeight" style="float: right;">
                                                <div id="divMoreInformationTablet" runat="server" class="divMoreInformationTablet"></div>
                                            </div>
                                            <div class="clearBoth"></div>
                                        </div>

                                    </div>
                                </span>
                            </div>
                        </section>
                    </div>
                </div>
                <div class="clearBoth"></div>
                <div id="collapseMoreInformation" runat="server" class="panel-collapse collapse moreinfo">
                    <div class="moreInfoDetailContainer">
                        <div class="panel-body col-lg-8 col-max">
                            <div class="moreInfoDetailInfoContainer">
                                <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
                                    <ContentTemplate>
                                        <asp:Panel ID="pnControls" CssClass="clearPadding" runat="server">
                                            <asp:Literal ID="litProductDetails" runat="server"></asp:Literal>
                                        </asp:Panel>
                                        <div id="productData" runat="server" class="tableWrapper table-responsive noarrow" style="padding: 10px 0px; border: none">
                                            <div class="col-lg-12 clearPadding">
                                                <div class="metro inner-table">
                                                    <it:GridViewControl ID="grdData" runat="server" AutoGenerateColumns="false" CssClass="table" IsResponsive="true" AllowPag="false"
                                                        GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" RecordCounterComplementarText="<%$FrontEndResources:DATALIST,gridDataecordCounterComplementarText %>" OnRowDataBound="grdData_RowDataBound"
                                                        Style="padding-bottom: 0px;">
                                                        <Columns>
                                                            <asp:TemplateField HeaderStyle-CssClass="center col-xs-3" ItemStyle-CssClass="link" HeaderText="<%$FrontEndResources:TRX00304,litDays%>">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDaysFrom" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderStyle-CssClass="center col-xs-6" ItemStyle-CssClass="link" HeaderText="<%$FrontEndResources:TRX00304,litAmount%>">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAmountFrom" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderStyle-CssClass="center col-xs-3" ItemStyle-CssClass="link" HeaderText="<%$FrontEndResources:TRX00304,litRate%>">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblRate" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </it:GridViewControl>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearBoth"></div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>
                            <div class="tablet-only phone-only buttonConstruirContainer">
                                <a id="btnSelectProductTablet" class="btn btn-primary" style="margin-top: 55px; height: 40px; font-size: 1.2rem; padding: 11px 30px !important; font-family: 'Gotham Light'; width: 100%;" runat="server">
                                    <asp:Literal ID="litContinueTablet" Text="<%$FrontEndResources:TRX00304,Adhere %>" runat="server"></asp:Literal>
                                </a>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="clearBoth"></div>
        </ItemTemplate>
    </asp:Repeater>
    <div style="display: block; width: 100%; border-top: 3px solid #EEE;">
        <div class="col-lg-2 col-md-1 visible-lg visible-md col-max" style="height: 80px; padding: 0px;"></div>
    </div>
    <div class="clearBoth"></div>
    <script type="text/javascript">
        var projId = "<%=ConfigurationManager.AppSettings["projectId"].ToString() %>";
    </script>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("/Scripts/Services/Transactions/trx00220-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00220-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
