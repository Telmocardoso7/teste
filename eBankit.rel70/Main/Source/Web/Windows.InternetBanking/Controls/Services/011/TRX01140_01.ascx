
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01140_01.ascx.cs" Inherits="TRX01140_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <div class="panel panel-detail">
        <div id="divSearchCriteria" runat="server">
            <div class="metro" style="margin-left: 0px;">
                <div class="panel" data-role="panel" id="divFilter" style="border: none; margin-bottom: 0px; background-color: rgb(247, 246, 246);">
                    <div class="listHeader">
                        <div class="col-lg-8 col-max panel-header panel-header-3" tabindex="0" onclick="$('.panel-search').slideToggle();" onkeypress="$('.panel-search').slideToggle();">
                            <asp:Literal ID="litSearchInfo" Text="<%$FrontEndResources:TRX01140,SearchInfo %>" runat="server"></asp:Literal>
                            <div class="img-search-panel">
                                <img id="searchTransactions" src="<%$ebFile:~/Content/currenttheme/images/products/ico_search_transactions.png%>" style="margin-top: -14px;" runat="server" alt="<%$FrontEndResources:TRX01140,btnSearch%>" />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 col-max panel-content panel-search" style="background-color: rgb(247, 246, 246);">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <it:DatePickerTextBoxRangeMetroControl_v3 ID="datepicker" Label="<%$FrontEndResources:DATALIST,From%>" LabelTo="<%$FrontEndResources:DATALIST,To%>" runat="server" CssClass="field field_v2 metro" />
                        </div>
                        <div class="clearBoth" style="padding-top: 15px"></div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                            <asp:Button ID="btnSearch" CssClass="btn btn-primary btn-margin btn-search-filter btn-search-datalist"  runat="server" OnClick="btnSearch_Click" Text="<%$FrontEndResources:TRX01140,btnSearch%>" />
                        </div>
                        <div class="clearBoth"></div>
                    </div>
                </div>
            </div>
            <div class="clearBoth"></div>
        </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
        <div id="div1" runat="server" class="transaction-content">
            <asp:UpdatePanel runat="server" ID="updatePanelOperations">
                <ContentTemplate>
                    <div class="table-grid-border">
                        <it:FlowContainerDetail ID="flwData" CssClass="panel panel-detail" runat="server">
                            <div class="col-lg-12 clearPadding overflowHidden">
                                <div class="metro">
                                    <div id="gridContainer" runat="server">
                                        


                                        <it:GridViewControl ID="gridAllAccesses" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow" EmptyDataText="<%$FrontEndResources:TRX01140,NoResults%>"
                                            GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="gridAllAccessesRowDataBound">
                                            <Columns>
                                                <asp:TemplateField ItemStyle-CssClass="gridTextAlign" HeaderStyle-CssClass="visible-md visible-lg visible-sm" HeaderText="<%$FrontEndResources:TRX01140,LoginDate%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLoginDate" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-CssClass="gridTextAlign" HeaderStyle-CssClass="visible-md visible-lg visible-sm" HeaderText="<%$FrontEndResources:TRX01140,IP%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblIP" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-CssClass="gridTextAlign" HeaderStyle-CssClass="visible-md visible-lg visible-sm" HeaderText="<%$FrontEndResources:TRX01140,Latitude%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLatitude" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-CssClass="gridTextAlign" HeaderStyle-CssClass="visible-md visible-lg visible-sm" HeaderText="<%$FrontEndResources:TRX01140,Longitude%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblLongitude" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField ItemStyle-CssClass="gridTextAlign" HeaderStyle-CssClass="visible-md visible-lg visible-sm" HeaderText="<%$FrontEndResources:TRX01140,City%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCity" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                 <asp:TemplateField ItemStyle-CssClass="gridTextAlign" HeaderStyle-CssClass="visible-md visible-lg visible-sm" HeaderText="<%$FrontEndResources:TRX01140,Country%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCountry" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </it:GridViewControl>

                                        <div class="col-lg-8 col-max">
                                            <it:Pager ID="pager" runat="server" PageSize="10" VisiblePages="10" PagerType="NumericPages" OnPageChanged="ClickPageChanged" />
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                            <asp:Button ID="btnSort" CssClass="hidden" runat="server" />
                        </it:FlowContainerDetail>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01140-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
        </div>
    </div>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01140-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
