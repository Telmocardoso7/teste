<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoansControl.ascx.cs" Inherits="LoansControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("metro.min.js".ResolveJsUrl("metro"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max scroll-item-top"><h4><asp:Literal ID="litTitle" Text="<%$FrontEndResources:Loan,SelectTitle %>" runat="server"></asp:Literal></h4></div>
<div class="scrollContainerAccounts">
        <div id="scroolContent" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts" style="overflow: hidden; visibility:hidden;">

        <asp:UpdatePanel ID="flwContainerAccounts" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSelectedAccountChanged" />
            </Triggers>
            <ContentTemplate>
                <div runat="server">
                    <ul class="bxslider">
                        <asp:Repeater ID="rptLoanAccounts" runat="server" OnItemDataBound="rptLoanAccounts_ItemDataBound">
                            <ItemTemplate>
                                <li>
                                    <div id="divAccountType" class="contentBox box-green elem-hide" runat="server">
                                        <div class="scroll-item-top accountNameOverflow"  style="float: left; color: #94805E">
                                            <h4>
                                                <asp:Literal ID="litAccountName" runat="server"></asp:Literal></h4>
                                            <h5>
                                                <asp:Literal ID="litAccountNumber" runat="server"></asp:Literal></h5>
                                        </div>
                                        <div class="clearBoth"></div>
                                        <div id="divTotalDebt" class="scroll-item-value negative" runat="server">
                                            <h5>
                                                <asp:Literal ID="litTotalDebtTitle" Text="<%$FrontEndResources:Account,litTotalDebtTitle %>" runat="server"></asp:Literal></h5>
                                            <h3>
                                                <asp:Literal ID="litTotalDebtValue" runat="server"></asp:Literal>
                                                <asp:Literal ID="litCurrency" runat="server"></asp:Literal></h3>
                                        </div>
                                        <div id="divEndDate" class="scroll-item-value neutral" runat="server">
                                            <h5>
                                                <asp:Literal ID="litLoanEndDateTitle" Text="<%$FrontEndResources:Account,litLoanEndDateTitle %>" runat="server"></asp:Literal></h5>
                                            <h3>
                                                <asp:Literal ID="litLoanEndDateValue" runat="server"></asp:Literal></h3>
                                        </div>
                                    </div>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>

                    <asp:HiddenField ID="hdnAccountsArray" runat="server" />
                    <asp:HiddenField ID="hdnSelectedAccountId" runat="server" />
                    <asp:HiddenField ID="hdnSelectedAccount" runat="server" />
                    <asp:HiddenField ID="hdnSelectedLoanAccount" runat="server" />
                    <asp:HiddenField ID="hdnSelectedLoanAccountMessages" runat="server" />
                    <asp:HiddenField ID="hdnCountLoans" runat="server" />
                    <asp:HiddenField ID="hdnScrollContentLenght" runat="server" />

                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
</div>
<div class="clearBoth"></div>

<asp:Button ID="btnSelectedAccountChanged" runat="server" CausesValidation="false" CssClass="hidden" />
<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("/scripts/ebankitControls/product-selector-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>
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

    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        ProductSelector.LoadSlider(false);
    });

    $(document).ready(function () {
        ProductSelector.LoadSlider(false);

        if ($(".div-icon-info_v2").length > 0) {
            $(".controlsShowHide").hide();
            $("#backgrounderLeft").css("background-color", "transparent");
            $("#backgrounderRight").css("background-color", "transparent");
        }
    });
</script>
