<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LandingCorpLastOperationsControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.LandingCorpLastOperationsControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("_LandingCorpLastOperationsControl.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />

<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts">
    <asp:Label ID="lblLastOperationsTitle" CssClass="dashboardSliderTitle LastTransAlignLeft" Text="<%$FrontEndResources:Custom,PanelLastTransactions%>" runat="server"></asp:Label>
    <a id="aLastOperations" runat="server">
        <asp:Label ID="lblViewMore" CssClass="dashboardSliderTitle LastTransViewMore" Text="<%$FrontEndResources:Custom,ViewMore%>" runat="server"></asp:Label>
    </a>
</div>
<div class="clearBoth"></div>
<asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
    <ContentTemplate>
        <div id="scrollContainer" class="scrollContainerAccountsCorp" runat="server">
            <div id="scroolContentCorporate" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max metro content-accounts overflowHidden">
                <asp:Repeater ID="rptLastOperations" runat="server" OnItemDataBound="rptLastOperations_ItemDataBound">
                    <ItemTemplate>
                        <div id="divPendingOperation" class="contentBoxCorporate box-blue" runat="server">
                            <a id="aLastOper" href="javascript:void(0)" runat="server" class="corpLastOper">
                                <div class="scroll-item-top">
                                    <h4 class="LastTransAlwaysVisible">
                                        <asp:Literal ID="litDescription" runat="server"></asp:Literal>
                                    </h4>
                                </div>
                                <div class="clearBoth"></div>
                                <div id="divBalance" class="scroll-item-value neutral" runat="server">
                                    <h3 class="LastTransDate">
                                        <asp:Literal ID="litDate" runat="server"></asp:Literal>
                                    </h3>
                                    <h3 class="LastTransBalance">
                                        <asp:Literal ID="litAmount" runat="server"></asp:Literal>
                                    </h3>
                                    <h3 class="LastTransCurrency">
                                        <asp:Literal ID="litCurrency" runat="server"></asp:Literal>
                                    </h3>
                                </div>
                            </a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="clearBoth"></div>
    </ContentTemplate>
</asp:UpdatePanel>
