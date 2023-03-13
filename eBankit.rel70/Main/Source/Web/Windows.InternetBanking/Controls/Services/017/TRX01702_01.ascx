<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01702_01.ascx.cs" Inherits="TRX01702_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <asp:Panel ID="pnControls" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" runat="server">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
            <div class="transaction-content" id="trxMyTickets">
                <asp:UpdatePanel runat="server" ID="updatePanelOperations">
                    <ContentTemplate>
                        <div class="table-grid-border">
                            <it:FlowContainerDetail ID="flwData" CssClass="panel panel-detail borderOperations" runat="server">
                                <div class="col-lg-12 clearPadding overflowHidden">
                                    <div class="metro">
                                        <div id="gridContainer" style="display: block; overflow: hidden;" runat="server">
                                            <it:GridViewControl ID="gvTickets" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 inside-table" EmptyDataText="<%$FrontEndResources:TRX01702,NoTickets%>"
                                                GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="gvTickets_RowDataBound" AllowPag="false">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="<%$FrontEndResources:TRX01702,ProcessId%>" HeaderStyle-Width="10%" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblProcessId" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="<%$FrontEndResources:TRX01702,Title%>" HeaderStyle-Width="50%" ItemStyle-Width="50%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblTitle" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="<%$FrontEndResources:TRX01702,State%>" HeaderStyle-Width="15%" ItemStyle-Width="15%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblState" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="<%$FrontEndResources:TRX01702,CreationDate%>" HeaderStyle-Width="15%" ItemStyle-Width="15%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCreationDate" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="<%$FrontEndResources:TRX01702,Hour%>" HeaderStyle-Width="10%" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblCreationHour" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-CssClass="right" ItemStyle-CssClass="padding8Important" HeaderStyle-Width="5%" ItemStyle-Width="5%">
                                                        <ItemTemplate>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </it:GridViewControl>
                                            <div class="col-lg-8 col-max">
                                                <it:Pager ID="pager" runat="server" PageSize="10" PagerType="NumericPages" OnPageChanged="pager_PageChanged" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <asp:Button ID="btnSort" CssClass="hidden" runat="server" />
                            </it:FlowContainerDetail>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </asp:Panel>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01702-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01702-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
