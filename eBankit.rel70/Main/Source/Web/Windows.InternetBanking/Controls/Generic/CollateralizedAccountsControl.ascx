<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CollateralizedAccountsControl.ascx.cs" Inherits="CollateralizedAccountsControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("metro.min.js".ResolveJsUrl("metro"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
<div class="scrollContainerAccounts">
    <div id="scroolContent" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts overflowHidden" style="visibility:hidden;">
        <asp:UpdatePanel ID="flwContainerAccounts" UpdateMode="Always" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSelectedAccountChanged" />
            </Triggers>
            <ContentTemplate>
                <ul class="bxslider">
                    <asp:Repeater ID="rptCurrentAccounts" runat="server" OnItemDataBound="rptCurrentAccounts_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <div id="divAccountType" class="contentBox box-red" runat="server">
                                    <div class="scroll-item-icon">
                                        <span class="img-icon-accounts"></span>
                                    </div>
                                    <div class="scroll-item-top accountNameOverflow">
                                        <h4>
                                            <asp:Literal ID="litAccountName" runat="server"></asp:Literal></h4>
                                        <h5 class="numAcc">
                                            <asp:Literal ID="litAccountNumber" runat="server"></asp:Literal></h5>
                                    </div>
                                    <div class="clearBoth"></div>

<%--                                    <div class="scroll-item-noicon">
                                        <div id="spanFav" runat="server" class="img-icon-nobackgroundaccounts">

                                            <div id="divSelectedAccount2" runat="server" visible="false" class="noPaddingLeft">
                                                <div class="arrow-corner paddingTop5">
                                                    <i class="icon-star-4"></i>
                                                </div>
                                            </div>
                                        </div>
                                    </div>--%>
                                    <%--////////////////--%>
                                    <div id="divMaturityDate" class="scroll-item-value neutral" runat="server" style="float: left; display: none;">
                                        <h5>
                                            <asp:Literal ID="litNextInterestDateTitle" Text="<%$FrontEndResources:CreditAccount,NextInterestDate %>" runat="server"></asp:Literal></h5>
                                        <h3>
                                            <asp:Literal ID="litNextInterestDate" runat="server"></asp:Literal></h3>
                                    </div>
                                    <div id="divBalance" class="scroll-item-value positive" runat="server">
                                        <h3 class="valueFormat" style="margin-left: 5px">
                                            <h3>
                                                <asp:Literal ID="litRemainingBalanceValue" runat="server"></asp:Literal></h3>
                                            <div class="formatCurrency">
                                                <asp:Literal ID="litCurrency" runat="server"></asp:Literal>
                                            </div>
                                        </h3>
                                        <h5 class="balanceTitle">
                                            <asp:Literal ID="litRemainingBalanceTitle" Text="<%$FrontEndResources:CreditAccount,RemainingBalanceTitle %>" runat="server"></asp:Literal>
                                        </h5>
                                    </div>
                                </div>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
                <asp:HiddenField ID="hdnAccountsArray" runat="server" />
                <asp:HiddenField ID="hdnSelectedAccountId" runat="server" />
                <asp:HiddenField ID="hdnSelectedAccount" runat="server" />
                <asp:HiddenField ID="hdnSelectedCurrentAccount" runat="server" />
                <asp:HiddenField ID="hdnSelectedCurrentAccountMessages" runat="server" />
                <asp:HiddenField ID="hdnScrollContentLenght" runat="server" />
                <asp:HiddenField ID="hdnCount" runat="server" />

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>
<div class="clearBoth"></div>

<asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Always" runat="server">
    <ContentTemplate>
        <it:TabSelectorControl
            ID="TabSelectorCollateralized"
            ControlName="CollateralizedAccountsControl"
            Visible="false"
            runat="server"
            titleOperations="<%$FrontEndResources:TRX00510,titleOperations%>"
            titleFavorits="<%$FrontEndResources:TRX00510,titleFavorits%>" />
    </ContentTemplate>
</asp:UpdatePanel>

<asp:Button ID="btnSelectedAccountChanged" runat="server" CausesValidation="false" CssClass="hidden" />
<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("/scripts/ebankitControls/product-selector-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>
<script type="text/javascript">

    eBankit.Presentation.AccountsControl = {}
    eBankit.Presentation.AccountsControl.AccClk = function (accountId) {

        $("#benefsTabContent #operations").hide();
        $("#benefsTabContent #favorit").hide();
        $(".col-transaction").show();

        //
        var hdnSelectedAccount = $("#<%=hdnSelectedAccountId.ClientID %>");
        var btnSelectedAccountChangedID = "<%=btnSelectedAccountChanged.UniqueID %>";
        hdnSelectedAccount.val(accountId).show();
        __doPostBack(btnSelectedAccountChangedID, '');
    }

    eBankit.Presentation.AccountsControl.ShowScroll = function () {
        //
    }

    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        ProductSelector.LoadSlider(false);
    });

    $(document).ready(function () {
        ProductSelector.LoadSlider(false);

        if ($(".div-icon-info_v2").length > 0 && $(".scrollContainerAccounts .bxslider li").length <= 1) {
            $(".scrollContainerAccounts").hide();
            $(".controlsShowHide").hide();
        }
    });
</script>