<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01120_01.ascx.cs" Inherits="TRX01120_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01120-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    <div class="grayContainer bottomBorderInfoTopMessage">
        <div class="metro info-bottom-text col-lg-8 col-max heavyMargin" style="text-align: left !important">
            <asp:Label runat="server" Text="<%$FrontEndResources:TRX01120,DevicesManagementMessage %>" CssClass="infoTopMessage"></asp:Label>
        </div>
    </div>
    <div class="panel panel-detail">
        <div id="divSearchCriteria" runat="server">
            <div class="metro" style="margin-left: 0px;">
                <div class="panel" data-role="panel" id="divFilter" style="border: none; margin-bottom: 0px; background-color: rgb(247, 246, 246);">
                    <div class="listHeader">
                        <div class="col-lg-8 col-max panel-header panel-header-3" onclick="$('.panel-search').slideToggle();" tabindex="0">
                            <asp:Literal ID="litSearchInfo" runat="server"></asp:Literal>
                            <div class="img-search-panel">
                                <img src="<%$ebFile:~/Content/currenttheme/images/products/ico_search_transactions.png%>" id="imgSearch" style="margin-top: -14px;" runat="server" alt="search" />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 col-max panel-content panel-search" style="background-color: rgb(247, 246, 246);">
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                            <it:DatePickerTextBoxRangeMetroControl_v3 ID="datepicker" Label="<%$FrontEndResources:DATALIST,DevicesManagementFrom%>" LabelTo="<%$FrontEndResources:DATALIST,DevicesManagementTo%>" runat="server" CssClass="field field_v2 metro" />
                        </div>
                        <div class="clearBoth" style="padding-top: 15px"></div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                            <asp:Button ID="btnSearch" CssClass="btn btn-primary btn-margin btn-search-filter btn-search-datalist" runat="server" OnClick="btnSearch_Click" Text="<%$FrontEndResources:TRX01120,btnSearch%>" />
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
                                        <it:GridViewControl ID="gridAllDevices" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow" EmptyDataText="<%$FrontEndResources:TRX01120,NoResults%>"
                                            GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="gridAllDevicesRowDataBound" OnRowCommand="gridAllDevicesRowCommand">
                                            <Columns>
                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important visible-md visible-lg visible-sm" HeaderText="<%$FrontEndResources:TRX01120,DeviceOS%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDeviceOS" runat="server" />
                                                        <br />
                                                        <asp:Label ID="lblThisDevice" CssClass="position-value positive" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important visible-md visible-lg visible-sm" HeaderText="<%$FrontEndResources:TRX01120,DeviceApplication%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDeviceApplication" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important visible-md visible-lg visible-sm" HeaderText="<%$FrontEndResources:TRX01120,DeviceModel%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDeviceModel" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important visible-md visible-lg visible-sm" HeaderText="<%$FrontEndResources:TRX01120,CreationDate%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCreationDate" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important visible-md visible-lg visible-sm" HeaderText="<%$FrontEndResources:TRX01120,Status%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblStatusDescription" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <ItemTemplate>
                                                        <div class="gridRowMenu element place-right" style="position: relative;" id="divOptionsPlus" runat="server">
                                                            <asp:LinkButton ID="lkbLockCredential" runat="server" CssClass="lkbLockCredential" CommandName="LockCredential" CommandArgument='<%#  Eval("AccessCodeId") %>'>
                                                                <p>
                                                                    <asp:Image ID="imgLockCredential" runat="server" ToolTip="<%$FrontEndResources:TRX00610,Lock%>" CssClass="labelLock" />
                                                                </p>
                                                            </asp:LinkButton>
                                                            <asp:LinkButton ID="lkbUnLockCredential" runat="server" CommandName="UnLockCredential" CommandArgument='<%#  Eval("AccessCodeId") %>'>
                                                                <p>
                                                                    <asp:Image ID="imgUnlockCredential" runat="server" ToolTip="<%$FrontEndResources:TRX00610,Unlock%>" CssClass="labelUnLock" />
                                                                </p>
                                                            </asp:LinkButton>
                                                        </div>
                                                        </div>
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
            <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01120-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
        </div>
    </div>

</div>
