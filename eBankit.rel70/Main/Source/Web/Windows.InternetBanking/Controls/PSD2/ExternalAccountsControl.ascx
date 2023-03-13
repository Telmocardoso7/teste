<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExternalAccountsControl.ascx.cs" Inherits="ExternalAccountsControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("metro.min.js".ResolveJsUrl("metro"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
<div class="clearBoth"></div>
<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max scroll-item-top">
    <h4>
        <asp:Literal ID="litTitle" Text="<%$FrontEndResources:Account,SelectTitle %>" runat="server"></asp:Literal></h4>
</div>
<div id="scrollContainer" class="scrollContainerAccounts" runat="server">
    <div id="scroolContent" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts overflowHidden" style="visibility: visible;">
        <asp:UpdatePanel ID="flwContainerAccounts" UpdateMode="Always" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="btnSelectedAccountChanged" />
            </Triggers>
            <ContentTemplate>
                <ul class="bxslider" style="visibility:hidden">
                    <asp:Repeater ID="rptExternalAccounts" runat="server" OnItemDataBound="rptExternalAccounts_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <div id="divAccountType" class="contentBox box-red" runat="server">
                                    <div class="divExternalAccountsLogo">
                                        <asp:Image runat="server" ID="imgBankLoho" CssClass="bankLogo" role="none"></asp:Image>
                                    </div>
                                    <div class="divExternalAccountsText">
                                        <div id="divExtAccountsText" class="scroll-item-top accountNameOverflow" runat="server">
                                            <h4 style="display: block;">
                                                <asp:Literal ID="litAccountName" runat="server"></asp:Literal></h4>
                                            <h5 class="numAcc">
                                                <asp:Literal ID="litAccountNumber" runat="server"></asp:Literal></h5>
                                        </div>

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
                                    <div class="clearBoth"></div>
                                </div>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
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
            id="TabSelector"
            ControlName="ExternalAccountControl"
            visible="false"
            runat="server"
            titleOperations="<%$FrontEndResources:TRX00106,titleOperations%>"
            titleFavorits="<%$FrontEndResources:TRX00106,titleFavorits%>" />
    </ContentTemplate>
</asp:UpdatePanel>
<div id="divHiddenTabSelector" class="tab_hidden" runat="server"></div>

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
        hdnSelectedAccount.val(accountId).show();
        __doPostBack(btnSelectedAccountChangedID, '');
    }

    eBankit.Presentation.AccountsControl.ShowScroll = function () {
        //
    }

    var prm = Sys.WebForms.PageRequestManager.getInstance();

    prm.add_endRequest(function () {
        ProductSelector.LoadSlider(false);
        $('.bxslider').css("visibility", "visible");
    });

    $(document).ready(function () {
        ProductSelector.LoadSlider(false);
        $('.bxslider').css("visibility", "visible");
        if ($(".div-icon-info_v2").length > 0 && $(".scrollContainerAccounts .bxslider li").length == 1) {
            $(".scrollContainerAccounts").hide();
            $(".controlsShowHide").hide();
        }
    });
    
</script>

<style>
    .divExternalAccountsLogo {
        display: inline-block;
        margin-top: -10px;
        left: 0;
        float: right;
    }

    .divExternalAccountsText {
        float: left;
        white-space: nowrap;
        width: 185px;
        overflow: hidden;
        text-overflow: clip;
    }

    .bankLogo {
        width: 40px !important;
        height: 40px !important;
    }

    .scroll-item-top h4 {
        margin-top: 4px !important;
    }
    .accountNameOverflow {
        width: 170px;
        max-width: 170px;
    }
</style>
