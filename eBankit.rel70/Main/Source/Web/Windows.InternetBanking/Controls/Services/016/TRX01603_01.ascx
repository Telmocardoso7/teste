<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01603_01.ascx.cs" Inherits="TRX01603_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <asp:Panel ID="pnControls" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" runat="server">
        <it:FlowInnerContainer ID="flwContainer" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" Title="<%$FrontEndResources:TRX01603,File%>" runat="server">
            <div>
                <it:FlowLabel_v3 ID="lblDate" Label="<%$FrontEndResources:TRX01603,Date%>" runat="server" />
                <it:FlowLabel_v3 ID="lblName" Label="<%$FrontEndResources:TRX01603,Name%>" runat="server" />
                <it:FlowLabel_v3 ID="lblValue" Label="<%$FrontEndResources:TRX01603,Value%>" runat="server" />
                <it:FlowLabel_v3 ID="lblState" Label="<%$FrontEndResources:TRX01603,State%>" runat="server" />
            </div>
        </it:FlowInnerContainer>
        <div class="clearBoth"></div>
        <it:FlowInnerContainer ID="flwPaymentsList" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" Title="<%$FrontEndResources:TRX01603,PaymentsList%>" runat="server">
            <div class="col-lg-12 clearPadding overflowHidden">
                <div class="metro">
                    <div id="gridContainer" runat="server">
                        <it:GridViewControl ID="gridPayments" runat="server" OnRowDataBound="gridPaymentsRowDataBound" AutoGenerateColumns="false" CssClass="table hovered noarrow pointedRow" IsResponsive="true" AllowPag="false"
                            GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false">
                            <Columns>
                                <asp:TemplateField HeaderStyle-Width="25%" HeaderText="<%$FrontEndResources:TRX01603,Name%>" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important">
                                    <ItemTemplate>
                                        <asp:Label ID="labelName" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-Width="25%" HeaderText="<%$FrontEndResources:TRX01603,Account%>" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important">
                                    <ItemTemplate>
                                        <asp:Label ID="labelAccount" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-Width="25%" HeaderText="<%$FrontEndResources:TRX01603,Value%>" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important">
                                    <ItemTemplate>
                                        <asp:Label ID="labelValue" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-Width="25%" HeaderText="<%$FrontEndResources:TRX01603,State%>" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important">
                                    <ItemTemplate>
                                        <asp:Label ID="labelState" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <asp:Literal ID="Literal11" runat="server" Text="<%$FrontEndResources:TRX01603,NoPayments%>"></asp:Literal>
                            </EmptyDataTemplate>
                        </it:GridViewControl>
                    </div>
                </div>
            </div>
            <asp:Button ID="btnSort" CssClass="hidden" runat="server" />
        </it:FlowInnerContainer>
        <div class="clearBoth"></div>
        <div class="trs_buttons col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro transp">
            <div class="trs_buttons">
                <asp:HyperLink ID="aBack" CssClass="btn btn-default" runat="server"><span>&nbsp;</span><asp:Literal Text="<%$GenericFrontEndResources:back%>" runat="server"></asp:Literal></asp:HyperLink>
            </div>
        </div>
    </asp:Panel>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01603-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01603-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />

</div>
