<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LandingAccountsControls.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.LandingAccountsControls" %>

<div id="divAccountContainer" runat="server" class="metro landingAccountContainer widgets-container">
    <div class="col-lg-8 col-max">
        <div class="clearBoth"></div>

        <div id="divAccount" runat="server">
            <div class="LandingAccountDetail">
                <div class="landingAccountDescription">
                    <asp:Label ID="lblAccountName" runat="server"></asp:Label>
                    <asp:Label ID="lblAccountNumber" runat="server"></asp:Label>
                </div>

                <div class="clearBoth"></div>

                <div id="divBalanceAv" class="landingAccountBalance positive" runat="server">
                    <asp:Label ID="lblBalanceValue" runat="server"></asp:Label>
                    <asp:Label ID="lblCurrency" runat="server"></asp:Label>
                </div>
            </div>

            <div id="operationsShortcut" class="tabLandingAccount" runat="server">
                <ul>
                    <asp:Repeater ID="rptOperations" runat="server" OnItemDataBound="rptOperations_ItemDataBound">
                        <ItemTemplate>
                            <li>
                                <asp:LinkButton ID="liOperation" href="javascript:void(0);" runat="server"></asp:LinkButton>
                            </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </div>

            <div id="activateAccountShortcut" class="tabActivateAccount" runat="server">
                <div class="accountShortcut-container">
                    <div>
                        <div class="account-image-container">
                            <img id="imgFundAccount" class="img-warning"
                                src="<%=eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("icon/ico_warning.png"),eBankit.Common.Sites.Utils.CacheVersionKey.Image) %>" />
                        </div>

                        <div class="account-text-container">
                            <h4>
                                <asp:Label ID="lblShortcutTitle" Text="<%$FrontEndResources:LandingAccount,lblShortcutTitle%>" runat="server"></asp:Label>
                            </h4>

                            <asp:Label ID="lblShortcutText" Text="<%$FrontEndResources:LandingAccount,lblShortcutText%>" runat="server"></asp:Label>
                        </div>
                    </div>

                    <div class="account-btn-container">
                        <asp:LinkButton ID="btnAccountDetails" Text="<%$FrontEndResources:LandingAccount,btnAccountDetails%>" href="#" CssClass="btn btn-dashboard" runat="server" />
                    </div>
                </div>
            </div>
        </div>

        <div class="clearBoth"></div>
    </div>
</div>

<script type="text/javascript">
    GoToAccountTrx = function (trx, acc) {
        eBankit.Presentation.SetBlockPageCommon();
        $('body').block();
        eBankit.document.location.href = '/Security/Transactions/Transactions.aspx?trxid=' + trx + '&acc=' + acc;
    }
</script>
