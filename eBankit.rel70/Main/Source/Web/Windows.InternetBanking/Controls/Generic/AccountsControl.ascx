<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AccountsControl.ascx.cs" Inherits="AccountsControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("metro.min.js".ResolveJsUrl("metro"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
<div class="clearBoth"></div>
<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max scroll-item-top"><h4><asp:Literal ID="litTitle" Text="<%$FrontEndResources:Account,SelectTitle %>" runat="server"></asp:Literal></h4></div>
<div id="scrollContainer" class="scrollContainerAccounts" runat="server">
    <div id="scroolContent" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts overflowHidden" style="visibility:hidden;">
        <asp:UpdatePanel ID="flwContainerAccounts" UpdateMode="Always" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSelectedAccountChanged" />
            </Triggers>
            <ContentTemplate>
                <div class="slickSlider">
                    <asp:Repeater ID="rptCurrentAccounts" runat="server" OnItemDataBound="rptCurrentAccounts_ItemDataBound">
                        <ItemTemplate>
                            <div id="divAccountType" tabindex="0" role="button" onkeydown="eBankit.Presentation.AccountsControl.AccountTypeKeydownHandler(this, event);" onkeyup="eBankit.Presentation.AccountsControl.AccountTypeKeyupHandler(this, event);" runat="server">
                                <div id="accountSlide" runat="server" class="contentBox box-red">
                                    <span id="icoFavoriteAccount" class="icon-star-selector" visible="false" runat="server"></span>
                                <div class="scroll-item-top accountNameOverflow">
                                    <h4>
                                        <asp:Literal ID="litAccountName" runat="server"></asp:Literal></h4>
                                    <h5 class="numAcc">
                                        <asp:Literal ID="litAccountNumber" runat="server"></asp:Literal></h5>
                                </div>
                                <div class="clearBoth"></div>
                                <div id="divBalance" class="scroll-item-value positive hidden" runat="server">
                                    <h5>
                                        <asp:Literal ID="litBalanceTitle" Text="<%$FrontEndResources:Account,BalanceTitle %>" runat="server"></asp:Literal>
                                    </h5>
                                    <h3>
                                        <asp:Literal ID="litBalanceValue" runat="server"></asp:Literal>
                                    </h3>
                                    <div class="formatCurrency">
                                        <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                                    </div>
                                </div>
                            </div>
                                </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
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
        hdnSelectedAccount.val(accountId).show();
        __doPostBack(btnSelectedAccountChangedID, '');
    }

    eBankit.Presentation.AccountsControl.ShowScroll = function () {
        //
    }

    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        ProductSelectorSlick.LoadSlick();
    });

    $(document).ready(function () {
        ProductSelectorSlick.LoadSlick();
        if ($(".div-icon-info_v2").length > 0 && $(".scrollContainerAccounts .slickSlider div").length == 1) {
            $(".scrollContainerAccounts").hide();
            $(".controlsShowHide").hide();
        }
    });

    eBankit.Presentation.AccountsControl.AccountTypeKeydownHandler = function (elem, event) {
        if (event.keyCode === 32) {
            event.preventDefault();
        }
        else if (event.keyCode === 13) {
            event.preventDefault();
            $(elem).click();
        }
    }

    eBankit.Presentation.AccountsControl.AccountTypeKeyupHandler = function (elem, event) {
        if (event.keyCode === 32) {
            event.preventDefault();
            $(elem).click();
        }
    }

</script>
