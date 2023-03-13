<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00402_01.ascx.cs" Inherits="TRX00402_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divTransaction" class="transaction-content" runat="server">
    <div id="divSearchCriteria" runat="server">
        <asp:Panel runat="server" CssClass="panel searchCriteria collapsed" data-role="panel" ID="divFilter" Style="margin-bottom: 0px; border: none; background-color: rgb(247, 246, 246);">
            <div class="panel panel-detail noBottomMargin" id="Div1">
                <div>
                    <div id="div2">
                        <div class="metro" style="margin-left: 0px;">
                            <div class="panel" data-role="panel" id="divTesteaver" style="border: none; margin-bottom: 0px;">
                                <div class="listHeader">
                                    <div class="col-lg-8 col-max panel-header panel-header-3 bgOverride  " style="padding: 0px 14px !important; background-color: rgb(25,146,173); height: 50px;" id="Div4" onclick="$('.panel-search').slideToggle();">
                                        <asp:Label ID="litSearchTitle" runat="server" CssClass="TitleSearchLabel" Text="<%$FrontEndResources:TRX00402,TitleSearchDataContainer %>" />
                                        <div style="display: inline">
                                            <div id="Div3" runat="server" class="searchableHeader">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="clearBoth"></div>
                    </div>
                </div>
            </div>
            <asp:Panel CssClass="col-lg-8 col-max panel-content panel-search panelSearchStyle" Style="background-color: rgb(247, 246, 246); display: none; padding: 10px" runat="server" ID="searchCriteriaOptions">
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                    <it:DropDownListControl_v2 ID="ddlCurrency" runat="server" Label="<%$FrontEndResources:TRX00402,ddlCurrency%>" CssClass="field field_v2 field-full input-control text marginBottom" />
                    <it:DropDownListControl_v2 ID="ddlCotationType" runat="server" Label="<%$FrontEndResources:TRX00402,ddlCotationType%>" CssClass="field field_v2 field-full input-control text marginBottom" />
                </div>
                <div class="clearBoth phoneOnly"></div>
                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                    <it:DropDownListControl_v2 ID="ddlCotationCurrency" runat="server" Label="<%$FrontEndResources:TRX00402,ddlCotationCurrency%>" CssClass="field field_v2 field-full input-control text marginBottom" />
                    <it:DatePickerTextBoxMetroControl_v3 ID="dtDateExchange" IsRequired="false" runat="server" BreakLine="false" Label="<%$FrontEndResources:TRX00402,dtDate%>" ValidationMinDateMessage="<%$FrontEndResources:TRX00402,dtExpirationDateValidationMinDateMessage %>" Width="85%" CssClass="field field_v2 field-full input-control text dateControl" />
                </div>
                <div class="clearBoth phoneOnly"></div>
                <div class="search-panel-btn col-xs-12 col-sm-12 col-md-6 col-lg-6">
                    <asp:Button ID="btnSearch" CssClass="btn btn-primary btn-margin btn-search-datalist" Text="<%$FrontEndResources:TRX00402,btnRefresh %>" runat="server" OnClick="btnRefresh_Click" />
                    <asp:HiddenField ID="hfSearchClick" Value="0" runat="server" />
                </div>

                <div class="clearBoth"></div>
            </asp:Panel>
        </asp:Panel>
    </div>
    <div class="col-lg-8 col-max consultaCambios clearPadding">
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <div class="table-grid-border marginTop15">
                    <it:FlowContainerDetail ID="flwSearch" CssClass="panel panel-detail" runat="server">
                        <div class="col-lg-12" style="padding-left: 0px; padding-right: 0px;">
                            <div class="metro">
                                <it:GridViewControl ID="GridViewControl1" runat="server" OnRowDataBound="GridRow_DataBound" AutoGenerateColumns="false" CssClass="table hovered noarrow pointedRow" IsResponsive="true" AllowPag="false" EmptyDataText="<%$FrontEndResources:TRX00402158,NoExchanges%>"
                                    GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00402,lblCountry%>" ItemStyle-VerticalAlign="Middle" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important">
                                            <ItemTemplate>
                                                <div id="curImage" runat="server" class="curFlag" style='<%# DataBinder.Eval(Container.DataItem, "Currency", "background-image: url("+eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("flags/{0}.png"),Utils.CacheVersionKey.Image)+");") %>'>
                                                    <div>
                                                        <asp:Label ID="lblCountry" CssClass="PersonalizedLblCountry" runat="server"></asp:Label>
                                                    </div>
                                                    <div>
                                                        <%# DataBinder.Eval(Container.DataItem, "Country") %>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00402,lblCurrency%>" ItemStyle-VerticalAlign="Bottom" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important visible-md visible-lg visible-sm">

                                            <ItemTemplate>

                                                <asp:Label ID="lblCurrency" runat="server"><%# DataBinder.Eval(Container.DataItem, "Currency") %></asp:Label>

                                            </ItemTemplate>

                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00402,lblCurerncyDescription%>" ItemStyle-VerticalAlign="Middle" ItemStyle-Width="35%" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important visible-md visible-lg visible-sm">
                                            <ItemTemplate>

                                                <span style="max-width: 100%" id="lblCurerncyDescription" runat="server"><%# DataBinder.Eval(Container.DataItem, "CurrencyDescription") %></span>

                                            </ItemTemplate>

                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00402,lblBuy%>" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important">

                                            <ItemTemplate>
                                                <div id="lblBuyContainer" runat="server" class="hasBlueLabelPhone">
                                                    <asp:Label ID="lblBuy" runat="server"><%# DataBinder.Eval(Container.DataItem, "ExchangeBuy", "{0:0.000}") %></asp:Label>
                                                </div>
                                            </ItemTemplate>

                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00402,lblSell%>" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important">

                                            <ItemTemplate>
                                                <div id="lblSellContainer" runat="server" class="hasBlueLabelPhone">
                                                    <asp:Label ID="lblSell" runat="server"><%# DataBinder.Eval(Container.DataItem, "ExchangeSell", "{0:0.000}") %></asp:Label>
                                                </div>
                                            </ItemTemplate>

                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Data" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important">
                                            <ItemTemplate>
                                                <div runat="server" class="hasBlueLabelPhone">
                                                    <asp:Label runat="server"><%# DataBinder.Eval(Container.DataItem, "Date", "{0:"+eBankit.Common.Providers.EbankitSettingProvider.GetCurrentCulture().DateFormat+"}") %></asp:Label>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-Width="30px" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important visible-md visible-lg visible-sm">

                                            <ItemTemplate>

                                                <a id="exchangePointer" runat="server" class="exchangePointer metro icon-circle" aria-label="exchangePointer" href='<%# DataBinder.Eval(Container.DataItem, "Currency", "Transactions.aspx?trxid=TRX00403" + System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() + "&cur={0}") %>'>
                                                    <i id="collapseForgetPwdIcon" class="curSimulationArrowStyle"></i>
                                                </a>

                                            </ItemTemplate>

                                        </asp:TemplateField>

                                    </Columns>
                                </it:GridViewControl>

                                <it:GridViewControl ID="gvHistory" Visible=" false" OnRowDataBound="GridRow_DataBound" runat="server" AutoGenerateColumns="false" CssClass="table hovered noarrow" IsResponsive="true" AllowPag="false"
                                    GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false">
                                    <Columns>
                                        <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00402,lblDate%>" ItemStyle-VerticalAlign="Middle" ItemStyle-Width="25%" HeaderStyle-Width="25%" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important">
                                            <ItemTemplate>
                                                <asp:Label ID="lblDate" runat="server"><%# DataBinder.Eval(Container.DataItem, "Date", "{0:d}") %></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00402,lblHour%>" ItemStyle-VerticalAlign="Middle" ItemStyle-Width="25%" HeaderStyle-Width="25%" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important visible-md visible-lg visible-sm">
                                            <ItemTemplate>
                                                <asp:Label ID="lblHour" runat="server"><%# DataBinder.Eval(Container.DataItem, "Hour") %></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00402,lblBuy%>" ItemStyle-Width="25%" HeaderStyle-Width="25%" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important">
                                            <ItemTemplate>
                                                <div id="lblBuyContainer" runat="server" class="hasBlueLabelPhone">
                                                    <asp:Label ID="lblBuy" runat="server"><%# DataBinder.Eval(Container.DataItem, "ExchangeBuy", "{0:0.000}") %></asp:Label>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00402,lblSell%>" ItemStyle-Width="25%" HeaderStyle-Width="25%" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important">
                                            <ItemTemplate>
                                                <div id="lblSellContainer" runat="server" class="hasBlueLabelPhone">
                                                    <asp:Label ID="lblSell" runat="server"><%# DataBinder.Eval(Container.DataItem, "ExchangeSell", "{0:0.000}") %></asp:Label>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <asp:TemplateField ItemStyle-Width="30px" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important visible-md visible-lg visible-sm">

                                            <ItemTemplate>

                                                <a id="exchangePointer" runat="server" class="exchangePointer metro icon-circle" aria-label="exchangePointer" href='<%# DataBinder.Eval(Container.DataItem, "Currency", "Transactions.aspx?trxid=TRX00403" + System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() + "&cur={0}") %>'>
                                                    <i id="collapseForgetPwdIcon" class="curSimulationArrowStyle"></i>
                                                </a>

                                            </ItemTemplate>

                                        </asp:TemplateField>

                                    </Columns>
                                </it:GridViewControl>
                            </div>
                        </div>
                        <div class="clearBoth"></div>
                    </it:FlowContainerDetail>
                </div>
                <div class="proof-inner">
                    <asp:PlaceHolder ID="phProofInner" runat="server"></asp:PlaceHolder>
                </div>
                <div class="clearBoth"></div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00402-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>

<script type="text/javascript">

    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        $(".searchCriteria").panel();
        $("#Div1").on("click", function () {
            var v = $("#searchOpen").val();
            $("#searchOpen").val(Math.abs(v - 1));
        });
    });

    $(document).ready(function () {
        $("#Div1").on("click", function () {
            var v = $("#searchOpen").val();
            $("#searchOpen").val(Math.abs(v - 1));
        });

        var $calendPickerDateName1 = $calendPickerDate1.attr("name");

        var $params = { debug: false, rules: {}, messages: {}, success: function (label) { label.addClass("valid"); } };
        $params['rules'][$calendPickerDateName1] = { "ValidateDateFormat": true };

        $params['messages'][$calendPickerDateName1] = {
            ValidateDateFormat: function () { return top.eBankit.Presentation.GetResource("dtDataTransferenciaPermErroMsg"); }
        };
        var validator = $("#aspnetForm").validate($params);
    });
</script>
