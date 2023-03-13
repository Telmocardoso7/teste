<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00171_01.ascx.cs" Inherits="TRX00171_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Panel ID="pnControls" CssClass="clearPadding" runat="server">
    <div class="metro" style="margin-left: 0px; padding-top: 25px;">
        <asp:Panel runat="server" CssClass="panel searchCriteria collapsed" data-role="panel" ID="divFilter" Style="margin-bottom: 0px; border: none; background-color: rgb(247, 246, 246);">
            <div class="panel panel-detail noBottomMargin" id="flwSearch">
                <div>
                    <div id="divSearchCriteria">
                        <div class="metro" style="margin-left: 0px;">
                            <div class="panel" data-role="panel" id="divTesteaver" style="border: none; margin-bottom: 0px;">
                                <div class="listHeader">
                                    <div class="col-lg-8 col-max panel-header panel-header-3" runat="server" id="pnSearchHeader" onclick="$('.panel-search').slideToggle();"></div>
                                </div>
                            </div>
                        </div>
                        <div class="clearBoth"></div>
                    </div>
                </div>
            </div>
            <asp:Panel CssClass="col-lg-8 col-max panel-content panel-search panelSearchStyle paddingTop" Style="background-color: rgb(247, 246, 246); display: none;" runat="server" ID="searchCriteriaOptions">
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                    <it:DropDownListControl_v2 ID="ddlPaymentType" IsRequired="false" Label="<%$FrontEndResources:TRX00171,ddlPaymentType%>" runat="server" CssClass="field field_v2 field-full" />
                    <it:DropDownListControl_v2 ID="ddlScheduleStatus" IsRequired="false" Label="<%$FrontEndResources:TRX00171,ddlScheduleStatus%>" runat="server" CssClass="field field_v2 field-full paddingTop" />
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                    <it:DropDownListControl_v2 ID="ddlRecurrenceType" IsRequired="false" Label="<%$FrontEndResources:TRX00171,ddlRecurrenceType%>" runat="server" CssClass="field field_v2 field-full" />
                    <it:DatePickerTextBoxRangeMetroControl_v3 ID="dtSearchDate" IsRequired="false" runat="server" LabelTo="<%$FrontEndResources:DATALIST,To%>" Label="<%$FrontEndResources:TRX00171,searchFrom%>" CssClass="field field_v2 field-full paddingTop"/>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 paddingTopButtonList">
                    <asp:Button ID="btnSearch" CssClass="btn btn-primary btn-margin btn-search-datalist" Text="<%$FrontEndResources:TRX00171,btnSearch%>" runat="server" OnClick="btnRefresh_Click" />
                    <asp:HiddenField ID="hfSearchClick" Value="0" runat="server" />
                </div>
                <div class="clearBoth"></div>
            </asp:Panel>
        </asp:Panel>
        <asp:HiddenField ID="searchOpen" ClientIDMode="Static" runat="server" Value="0" />
    </div>
    <div class="col-lg-8 col-max">
        <asp:UpdatePanel ID="upScheduledPayments" runat="server" UpdateMode="Always">
            <ContentTemplate>
                <it:FlowInnerContainer ID="flwData1" runat="server" CustomCssClass="col-max col-max panel panel-detail borderOperations">
                    <div class="col-lg-12 clearPadding overflowHidden">
                        <div class="metro">
                            <it:GridViewControl ID="gvScheduledPayments" AllowPag="true" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table table-resp-to1199 inside-table noarrow"
                                GridLines="None" AllowsTopAnchor="true" EmptyDataText="<%$FrontEndResources:DATALIST,NoOperationsInfo%>" EnableRowClicks="false" OnRowDataBound="gvScheduledPayments_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00171,Entity%>" HeaderStyle-Width="25%" ItemStyle-Width="25%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEntity" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00171,PaymentDate%>" HeaderStyle-CssClass="right" HeaderStyle-Width="15%" ItemStyle-CssClass="right" ItemStyle-Width="15%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPaymentDate" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00171,EndDate%>" HeaderStyle-CssClass="right" HeaderStyle-Width="15%" ItemStyle-CssClass="right" ItemStyle-Width="15%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEndDate" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
									<asp:TemplateField HeaderText="<%$FrontEndResources:TRX00171,PaymentType%>">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPaymentType" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00171,Value%>" HeaderStyle-CssClass="right" HeaderStyle-Width="15%" ItemStyle-CssClass="right" ItemStyle-Width="15%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblValue" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00171,Currency%>"  HeaderStyle-Width="10%"  ItemStyle-Width="10%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCurrency" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00171,Frequency%>" HeaderStyle-Width="20%" ItemStyle-Width="20%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFrequency" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="right" ItemStyle-CssClass="padding8Important" HeaderStyle-Width="5%" ItemStyle-Width="5%">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="delteHF" runat="server" />
                                            <i class="icon-zoom-in" id="iconDelete" runat="server"></i>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="right" ItemStyle-CssClass="padding8Important" HeaderStyle-Width="5%" ItemStyle-Width="5%">
                                        <ItemTemplate>
                                            <i class="magnifierGlassListing smallIcon" style="height: 40px; display: block; background-position: center center; background-size: 30px !important;" id="iconDetail" runat="server"></i>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </it:GridViewControl>
                        </div>
                    </div>
                    <asp:Button ID="btnSort" CssClass="hidden" runat="server" />
                    <asp:HiddenField ID="hdnSortExpression" runat="server" />
                    <asp:HiddenField ID="hField" runat="server" />
                    <asp:Label ID="hdLabel" CssClass="hidden" runat="server"></asp:Label>
                </it:FlowInnerContainer>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00171-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00171-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>
</div>
