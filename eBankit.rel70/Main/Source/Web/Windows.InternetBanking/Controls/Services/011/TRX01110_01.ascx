<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01110_01.ascx.cs" Inherits="TRX01110_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divTransaction" runat="server" class="transaction-content">
    <div class="panel panel-detail">
        <div id="divSearchCriteria" runat="server">
            <div class="metro" style="margin-left: 0;">
                <div class="panel" data-role="panel" id="divFilter" style="border: none; margin-bottom: 0; background-color: rgb(247, 246, 246);">
                    <div class="listHeader">
                        <div class="col-lg-8 col-max panel-header panel-header-3" onclick="$('.panel-search').slideToggle();">
                            <asp:Literal ID="litSearchInfo" Text="<%$FrontEndResources:TRX01110,SearchInfo %>" runat="server"></asp:Literal>
                            <div class="img-search-panel">
                                <img src="<%$ebFile:~/Content/currenttheme/images/products/ico_search_transactions.png%>" style="margin-top: -12px;" runat="server" alt="search" />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 col-max panel-content panel-search" style="background-color: rgb(247, 246, 246);">
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                            <it:DropDownListControl_v2 ID="ddlTransaction" Width="100%" Label="<%$FrontEndResources:TRX01110,TransactionType%>" CssClass="field field_v2 field-full" runat="server" />
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                            <it:DropDownListControl_v2 ID="ddlLimitType" Width="100%" Label="<%$FrontEndResources:TRX01110,LimitType%>" CssClass="field field_v2 field-full" runat="server" />
                        </div>
                        <div class="clearBoth" style="padding-top: 15px"></div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                            <asp:Button ID="btnSearch" CssClass="btn btn-primary btn-margin btn-search-filter" OnClientClick="return FilterSearch();" runat="server" OnClick="btnSearch_Click" Text="<%$FrontEndResources:TRX01110,btnSearch%>" />
                        </div>
                        <div class="clearBoth"></div>
                    </div>
                </div>
            </div>
            <div class="clearBoth"></div>
        </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
        <div id="divContent" runat="server" class="transaction-content">
            <asp:UpdatePanel runat="server" ID="updatePanelOperations">
                <ContentTemplate>
                    <div class="table-grid-border">
                        <it:FlowContainerDetail ID="flwData" CssClass="panel panel-detail" runat="server">
                            <div class="col-lg-12 clearPadding overflowHidden">
                                <div class="metro">
                                    <div id="gridContainer" runat="server">
                                        <it:GridViewControl ID="gridAllLimits" runat="server" OnRowDataBound="gridAllLimitsRowDataBound" AutoGenerateColumns="false" CssClass="table hovered noarrow pointedRow" IsResponsive="true" AllowPag="false"
                                            GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowCommand="gridAllLimitsRowCommand">
                                            <Columns>
                                                <asp:TemplateField HeaderStyle-Width="20%" HeaderText="<%$FrontEndResources:TRX01110,TransactionType%>" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important">
                                                    <ItemTemplate>
                                                        <asp:Label ID="labelTransactionDescription" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-Width="14%" HeaderText="<%$FrontEndResources:TRX01110,Limit%>" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important">
                                                    <ItemTemplate>
                                                        <asp:Label ID="labelLimit" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderStyle-Width="14%" DataField="TimeUnitDescription" HeaderText="<%$FrontEndResources:TRX01110,TimeUnitDescription%>" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important" />
                                                <asp:BoundField HeaderStyle-Width="20%" DataField="AssetImpactTypeDescription" HeaderText="<%$FrontEndResources:TRX01110,LimitType%>" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important" />
                                                <asp:TemplateField HeaderStyle-Width="10%" HeaderText="<%$FrontEndResources:TRX01110,Combination%>" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important">
                                                    <ItemTemplate>
                                                        <asp:Label ID="labelCombination" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderStyle-Width="10%" DataField="LimitChannelDescription" HeaderText="<%$FrontEndResources:TRX01111,ddlChannel%>" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important" />
                                                <asp:TemplateField HeaderStyle-CssClass="right" ItemStyle-CssClass="padding8Important" HeaderStyle-Width="5%" ItemStyle-Width="5%">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lDeleteLimit" runat="server" OnClientClick="if(!confirmEnrollment(this)) return false;" CommandName="DeleteLimit" CommandArgument='<%# Eval("LimitId") + ";" + Eval("SubLimitId") %>'>
                                                            <asp:Image ID="imgDeleteLimit" ImageUrl="<%$ebFile:~/Content/currenttheme/images/icon/ico_delete_small.png%>" runat="server" />
                                                        </asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="right" ItemStyle-CssClass="padding8Important" HeaderStyle-Width="5%" ItemStyle-Width="5%">
                                                    <ItemTemplate>
                                                        <a id="btnEdit" runat="server">
                                                            <img id="imgEdit" src="<%$ebFile:~/Content/currenttheme/images/icon/ico_edit.png%>" runat="server" width="30" height="30" /></a>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <asp:Literal ID="Literal11" runat="server" Text="<%$FrontEndResources:TRX01110,NoResults%>"></asp:Literal>
                                            </EmptyDataTemplate>
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
                    <div class="clearBoth"></div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="clearBoth"></div>
            <div id="divCombinationNoLimits" runat="server" class="metro" style="margin-left: 0; padding-top: 80px">
                <div class="panel" data-role="panel" id="divCombinationsPanel" style="border: none; margin-bottom: 0; background-color: rgb(247, 246, 246);">
                    <div class="listHeader">
                        <div class="col-lg-8 col-max panel-header panel-header-3" onclick="$('.panel-search').slideToggle();">
                            <asp:Literal ID="Literal1" Text="<%$FrontEndResources:TRX01110,Combinacoes %>" runat="server"></asp:Literal>
                        </div>
                    </div>
                </div>
            </div>

            <asp:UpdatePanel runat="server" ID="updatePanelCombinations">
                <ContentTemplate>
                    <div class="table-grid-border">
                        <it:FlowContainerDetail ID="FlowContainerDetailCombinations" CssClass="panel panel-detail" runat="server">
                            <div class="col-lg-12 clearPadding overflowHidden">
                                <div class="metro">
                                    <div id="DivCombinations" runat="server">
                                        <it:GridViewControl ID="GridViewControlCombinations" runat="server" OnRowDataBound="gridCombinationsRowDataBound" AutoGenerateColumns="false" CssClass="table hovered noarrow pointedRow" IsResponsive="true" AllowPag="false"
                                            GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false">
                                            <Columns>
                                                <asp:TemplateField HeaderStyle-Width="30%" HeaderText="<%$FrontEndResources:TRX01110,TransactionType%>" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important">
                                                    <ItemTemplate>
                                                        <asp:Label ID="labelTransactionDescription" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-Width="15%" HeaderText="<%$FrontEndResources:TRX01110,Combination%>" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important">
                                                    <ItemTemplate>
                                                        <asp:Label ID="labelCombinationLimits" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <asp:Literal ID="LiteralCombinations" runat="server" Text="<%$FrontEndResources:TRX01110,NoResults%>"></asp:Literal>
                                            </EmptyDataTemplate>
                                        </it:GridViewControl>
                                        <div class="col-lg-8 col-max">
                                            <it:Pager ID="pagerCombinations" runat="server" PageSize="10" VisiblePages="10" PagerType="NumericPages" OnPageChanged="ClickPageCombinationsChanged" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <asp:Button ID="Button1" CssClass="hidden" runat="server" />
                        </it:FlowContainerDetail>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

            <div class="clearBoth"></div>
            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max noPadding" id="divSave" runat="server">
                <it:FlowCommandsContainer ID="fcSaveImage" runat="server">
                    <RightButtons>
                        <a id="btnRequestNew" class="btn btn-primary" style="margin-top: 55px; height: 40px; font-size: 1.2rem; padding: 11px 30px !important; font-family: 'Gotham Light'; width: 207px;" onclick="AddNewLimit()" runat="server">
                            <asp:Literal ID="litContinue" Text="<%$FrontEndResources:TRX01110,AddNew%>" runat="server"></asp:Literal>
                        </a>
                    </RightButtons>
                </it:FlowCommandsContainer>
            </div>
            <script type="text/javascript">
                var projId = "<%=ConfigurationManager.AppSettings["projectId"].ToString() %>";
            </script>
            <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01110-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
            <script type="text/javascript">
            function confirmEnrollment(currentLimit) {
                top.confirmEnrollmentHandler = function () {
                    eval(currentLimit.href);
                }
                itcore_ui.ShowTopPopupConfirm("<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX01110", "PopupConfirmation").Replace("\"","&quot;") %>", '<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX01110", "TitleConfirm") %>', 'top.confirmEnrollmentHandler();');
            }
        </script>
        </div>
    </div>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01110-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
