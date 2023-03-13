<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CardControlUpdate.ascx.cs" Inherits="CardControlUpdate" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("metro.min.js".ResolveJsUrl("metro"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max scroll-item-top"><h4><asp:Literal ID="litTitle" Text="<%$FrontEndResources:Card,SelectTitle %>" runat="server"></asp:Literal></h4></div>
<div class="scrollContainerAccounts">
    <div id="scroolContent" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts" style="overflow: hidden; visibility:hidden;">

        <%--<asp:UpdatePanel ID="flwContainerCards" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSelectedCardChanged" />
            </Triggers>
            <ContentTemplate>--%>
        <div id="flwContainerAccounts" runat="server">
            <ul class="bxslider">
                <asp:Repeater ID="rptCreditCards" runat="server" OnItemDataBound="rptCreditCards_ItemDataBound">
                    <ItemTemplate>
                        <li>
                            <div id="divCard" class="contentBox box-blue" runat="server">
                                <div class="scroll-item-top card-control-panel accountNameOverflow">
                                    <h4>
                                        <asp:Literal ID="litCardName" runat="server"></asp:Literal></h4>
                                    <h5>
                                        <asp:Literal ID="litCardNumber" runat="server"></asp:Literal></h5>
                                </div>

                                <div class="clearBoth"></div>
                                <div id="divBalance" class="scroll-item-value positive" runat="server">
                                    <h5>
                                        <asp:Literal ID="litBalanceTitle" Text="<%$FrontEndResources:Card,BalanceTitle %>" runat="server"></asp:Literal></h5>
                                    <h3>
                                        <asp:Literal ID="litBalanceValue" runat="server"></asp:Literal>
                                        &nbsp;<asp:Literal ID="litCurrency" runat="server"></asp:Literal></h3>
                                </div>
                                <div id="divCardType" class="scroll-item-value positive" runat="server">
                                    <h5>
                                        <asp:Literal ID="litCardTypeTitle" Text="<%$FrontEndResources:Account,CardProduct %>" runat="server"></asp:Literal></h5>
                                    <h4>
                                        <asp:Literal ID="litCardType" runat="server"></asp:Literal></h4>
                                </div>

                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>

                <asp:HiddenField ID="hdnCardsArray" runat="server" />
                <asp:HiddenField ID="hdnSelectedCardId" runat="server" />
                <asp:HiddenField ID="hdnSelectedCard" runat="server" />
                <asp:HiddenField ID="hdnSelectedCurrentAccount" runat="server" />
                <asp:HiddenField ID="hdnSelectedCurrentAccountMessages" runat="server" />
                <asp:HiddenField ID="hdnScrollContentLenght" runat="server" />
            </ul>
        </div>
        <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>
</div>
<div class="clearBoth"></div>

<asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Always" runat="server">
    <ContentTemplate>
        <it:TabSelectorControl
            id="TabSelector"
            ControlName="CardControl"
            visible="false"
            runat="server"
            titleOperations="<%$FrontEndResources:TRX00202,titleOperations%>"
            titleFavorits="<%$FrontEndResources:TRX00202,titleFavorits%>" />

    </ContentTemplate>
</asp:UpdatePanel>

<asp:Button ID="btnSelectedCardChanged" runat="server" CausesValidation="false" CssClass="hidden" />
<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("/scripts/ebankitControls/product-selector-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>
<script type="text/javascript">

    eBankit.Presentation.AccountsControl = {}
    eBankit.Presentation.AccountsControl.AccClk = function (accountId) {

        $("#benefsTabContent #operations").hide();
        $("#benefsTabContent #favorit").hide();
        $(".col-transaction").show();


        //
        var hdnSelectedAccount = $("#<%=hdnSelectedCardId.ClientID %>");
        var btnSelectedAccountChangedID = "<%=btnSelectedCardChanged.UniqueID %>";
        hdnSelectedAccount.val(accountId);
        __doPostBack(btnSelectedAccountChangedID, '');
    }

    eBankit.Presentation.AccountsControl.ShowScroll = function () {
        //
    }

    $(document).ready(function () {
        ProductSelector.LoadSlider(false);
        if ($(".div-icon-info_v2").length > 0) {
            $(".controlsShowHide").hide();                      
            $(".scrollContainerAccounts").hide();             
            $("#backgrounderLeft").css("background-color", "transparent");
            $("#backgrounderRight").css("background-color", "transparent");
        }
    });

    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        ProductSelector.LoadSlider(false);
    });

</script>
