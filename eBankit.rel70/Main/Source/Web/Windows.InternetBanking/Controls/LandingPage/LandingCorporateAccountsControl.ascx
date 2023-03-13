<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LandingCorporateAccountsControl.ascx.cs" Inherits="LandingCorporateAccountsControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("_LandingCorporateAccountsControl.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("metro.min.js".ResolveJsUrl("metro"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>

<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts">
    <asp:Label ID="lblLastOperationsTitle" CssClass="dashboardSliderTitle CorpMainAccAlignLeft" Text="<%$FrontEndResources:Custom,PanelMainAccounts%>" runat="server"></asp:Label>
    <a id="aCorpAccounts" runat="server">
        <asp:Label ID="lblViewMore" CssClass="dashboardSliderTitle CorpMainAccViewMore" Text="<%$FrontEndResources:Custom,ViewMore%>" runat="server"></asp:Label>
    </a>
</div>
<div class="clearBoth"></div>
<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro   transp transaction-content">
    <div id="divNoAccountsMessage" class="alert alert-warning_v2 fade in widthInherit" role="alert" aria-atomic="true" runat="server">
   
    </div>
</div>
<asp:UpdatePanel ID="flwContainerAccounts" UpdateMode="Always" runat="server">
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btnSelectedAccountChanged" />
    </Triggers>
    <ContentTemplate>     
        <div id="scrollContainer" class="scrollContainerCorpMainAcc" runat="server">
            <div id="scroolContentCorpMainAcc" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts overflowHidden">
                <asp:Repeater ID="rptCurrentAccounts" runat="server" OnItemDataBound="rptCurrentAccounts_ItemDataBound">
                    <ItemTemplate>
                        <div id="divAccountType" class="contentBoxCorpMainAcc box-red" runat="server" tabindex="0">
                            <span id="icoFavoriteAccount" class="icon-star-selector CorpSmallIcon" visible="false" runat="server"></span>
                            <div class="scroll-item-top">
                                <h4 class="CorpMainAccAlwaysVisible">
                                    <asp:Literal ID="litAccountName" runat="server"></asp:Literal></h4>
                                <h5 class="numAcc CorpMainAccNumber">
                                    <asp:Literal ID="litAccountNumber" runat="server"></asp:Literal></h5>
                            </div>
                            <div class="formatCurrency CorpMainAccFormatCurrency">
                                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                            </div>
                            <div class="clearBoth"></div>
                            <div id="divBalance" class="scroll-item-value positive hidden" runat="server">
                                <h3 class="CorpMainAccBalance">
                                    <asp:Literal ID="litBalanceValue" runat="server"></asp:Literal>
                                </h3>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:HiddenField ID="hdnSelectedAccountId" runat="server" />
                <asp:HiddenField ID="hdnSelectedGroupId" runat="server" />
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
<div class="clearBoth"></div>
<asp:Button ID="btnSelectedAccountChanged" runat="server" CausesValidation="false" CssClass="hidden" />

<script type="text/javascript">
    eBankit.Presentation.AccountsControl = {}
    eBankit.Presentation.AccountsControl.AccClk = function (accountId) {
        var hdnSelectedAccount = $("#<%=hdnSelectedAccountId.ClientID %>");
        var btnSelectedAccountChangedID = "<%=btnSelectedAccountChanged.UniqueID %>";
        hdnSelectedAccount.val(accountId).show();
        __doPostBack(btnSelectedAccountChangedID, '');
    }
</script>
