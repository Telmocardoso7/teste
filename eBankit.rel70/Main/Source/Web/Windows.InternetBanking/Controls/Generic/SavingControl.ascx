<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SavingControl.ascx.cs" Inherits="SavingControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("metro.min.js".ResolveJsUrl("metro"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max scroll-item-top">
    <h4>
        <asp:Literal ID="litTitle" Text="<%$FrontEndResources:Saving,SelectTitle %>" runat="server"></asp:Literal></h4>
</div>
<div class="scrollContainerAccounts">
    <div id="scroolContent" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts">

        <asp:UpdatePanel ID="flwContainerAccounts" UpdateMode="Always" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSelectedAccountChanged" />
            </Triggers>
            <ContentTemplate>
                <div>
                    <div class="slickSlider">
                        <asp:Repeater ID="rptSavingAccounts" runat="server" OnItemDataBound="rptSavingAccounts_ItemDataBound">
                            <ItemTemplate>
                                <div id="divAccountType" runat="server" onkeydown="eBankit.Presentation.AccountsControl.SavingKeydownHandler(this, event);" onkeyup="eBankit.Presentation.AccountsControl.SavingKeyupHandler(this, event);">
                                    <div id="liAccountType" class="contentBox box-red" runat="server">
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

                                        <div id="divBalance" class="scroll-item-value positive" runat="server">
                                            <h3 class="valueFormat" style="margin-left: 5px">
                                                <h3>
                                                    <asp:Literal ID="litBalanceValue" runat="server"></asp:Literal>

                                                </h3>
                                                <div class="formatCurrency" style="margin-top: 2px;">
                                                    <asp:Literal ID="litCurrency" runat="server"></asp:Literal>
                                                </div>
                                            </h3>
                                            <h5 class="balanceTitle">
                                                <asp:Literal ID="litBalanceTitle" Text="<%$FrontEndResources:Account,AmountBalanceTitle %>" runat="server"></asp:Literal>
                                            </h5>
                                        </div>
                                        <div id="divInterestRate" style="display: none" class="scroll-item-value positive" runat="server">
                                            <h5>
                                                <asp:Literal ID="litInterestRateTitle" Text="<%$FrontEndResources:Account,InterestRateTitle %>" runat="server"></asp:Literal></h5>
                                            <h3>
                                                <asp:Literal ID="litInterestRateValue" runat="server"></asp:Literal></h3>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                    <asp:HiddenField ID="hdnAccountsArray" runat="server" />
                    <asp:HiddenField ID="hdnSelectedAccountId" runat="server" />
                    <asp:HiddenField ID="hdnSelectedAccount" runat="server" />
                    <asp:HiddenField ID="hdnSelectedSavingAccount" runat="server" />
                    <asp:HiddenField ID="hdnSelectedSavingAccountMessages" runat="server" />

                    <asp:HiddenField ID="hdnScrollContentLenght" runat="server" />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</div>
<div class="clearBoth"></div>

<asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Always" runat="server">
    <ContentTemplate>
        <it:TabSelectorControl
            ID="TabSelector"
            ControlName="SavingControl"
            Visible="false"
            runat="server"
            titleOperations="<%$FrontEndResources:TRX00301,titleOperations%>"
            titleFavorits="<%$FrontEndResources:TRX00301,titleFavorits%>" />
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

        var hdnSelectedAccount = $("#<%=hdnSelectedAccountId.ClientID %>");
        var btnSelectedAccountChangedID = "<%=btnSelectedAccountChanged.UniqueID %>";
        hdnSelectedAccount.val(accountId);
        __doPostBack(btnSelectedAccountChangedID, '');
    }

    eBankit.Presentation.AccountsControl.ShowScroll = function () {
        //
    }

    eBankit.Presentation.AccountsControl.SavingKeydownHandler = function (elem, event) {
        if (event.keyCode === 32) {
            event.preventDefault();
        }
        else if (event.keyCode === 13) {
            event.preventDefault();
            $(elem).click();
        }
    }

    eBankit.Presentation.AccountsControl.SavingKeyupHandler = function (elem, event) {
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
