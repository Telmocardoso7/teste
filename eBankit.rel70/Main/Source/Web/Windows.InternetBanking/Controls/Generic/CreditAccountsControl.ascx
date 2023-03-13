<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CreditAccountsControl.ascx.cs" Inherits="CreditAccountsControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("metro.min.js".ResolveJsUrl("metro"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max scroll-item-top">
    <h4>
        <asp:Literal ID="litTitle" Text="<%$FrontEndResources:Loan,SelectTitle %>" runat="server"></asp:Literal></h4>
</div>
<div class="scrollContainerAccounts">
    <div id="scroolContent" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts" style="visibility: hidden;">
        <asp:UpdatePanel ID="flwContainerAccounts" UpdateMode="Always" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSelectedAccountChanged" />
            </Triggers>
            <ContentTemplate>
                <div class="slickSlider">
                    <asp:Repeater ID="rptCreditAccounts" runat="server" OnItemDataBound="rptCreditAccounts_ItemDataBound">
                        <ItemTemplate>
                            <div id="divAccountType" runat="server" onkeydown="eBankit.Presentation.AccountsControl.CreditAccountKeydownHandler(this, event);" onkeyup="eBankit.Presentation.AccountsControl.CreditAccountKeyupHandler(this, event);">
                                <div id="liAccountType" class="contentBox box-grey" runat="server">
                                    <div class="scroll-item-top accountNameOverflow">
                                        <h4>
                                            <asp:Literal ID="litAccountName" runat="server"></asp:Literal></h4>
                                        <h5>
                                            <asp:Literal ID="litAccountNumber" runat="server"></asp:Literal></h5>
                                    </div>
                                    <div class="clearBoth"></div>
                                    <div class="scroll-item-noicon">
                                        <span class="img-icon-nobackgroundaccounts"></span>
                                    </div>

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
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

                <asp:HiddenField ID="hdnAccountsArray" runat="server" />
                <asp:HiddenField ID="hdnSelectedAccountId" runat="server" />
                <asp:HiddenField ID="hdnSelectedAccount" runat="server" />
                <asp:HiddenField ID="hdnSelectedCreditAccount" runat="server" />
                <asp:HiddenField ID="hdnSelectedCreditAccountMessages" runat="server" />
                <asp:HiddenField ID="hdnScrollContentLenght" runat="server" />
                <asp:HiddenField ID="hdnCountCreditAccounts" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>
<div class="clearBoth"></div>

<asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Always" runat="server">
    <ContentTemplate>
        <it:TabSelectorControl
            id="TabSelector"
            ControlName="CreditAccountsControl"
            visible="false"
            runat="server"
            titleOperations="<%$FrontEndResources:TRX00503,titleOperations%>"
            titleFavorits="<%$FrontEndResources:TRX00503,titleFavorits%>" />
    </ContentTemplate>
</asp:UpdatePanel>

<asp:Button ID="btnSelectedAccountChanged" runat="server" CausesValidation="false" CssClass="hidden" />
<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("/scripts/ebankitControls/product-selector-slick-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>
<script type="text/javascript">

    eBankit.Presentation.AccountsControl = {}
    eBankit.Presentation.AccountsControl.AccClk = function (accountId) {

        $("#benefsTabContent #operations").hide();
        $("#benefsTabContent #favorit").hide();
        $(".col-transaction").show();


        //
        var hdnSelectedAccount = $("#<%=hdnSelectedAccountId.ClientID %>");
        var btnSelectedAccountChangedID = "<%=btnSelectedAccountChanged.UniqueID %>";
        hdnSelectedAccount.val(accountId);
        __doPostBack(btnSelectedAccountChangedID, '');
    }

    eBankit.Presentation.AccountsControl.ShowScroll = function () {
        //
    }

    eBankit.Presentation.AccountsControl.CreditAccountKeydownHandler = function (elem, event) {
        if (event.keyCode === 32) {
            event.preventDefault();
        }
        else if (event.keyCode === 13) {
            event.preventDefault();
            $(elem).click();
        }
    }

    eBankit.Presentation.AccountsControl.CreditAccountKeyupHandler = function (elem, event) {
        if (event.keyCode === 32) {
            event.preventDefault();
            $(elem).click();
        }
    }


    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        ProductSelectorSlick.LoadSlick();
    });

    $(document).ready(function () {
        ProductSelectorSlick.LoadSlick();

        if ($(".div-icon-info_v2").length > 0) {
            $(".scrollContainerAccounts").hide();
            $(".tabSelectorBackground").hide();
        }
    });

</script>
