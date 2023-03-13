<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01905_01.ascx.cs" Inherits="TRX01905_01" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<%@ Import Namespace="eBankit.Common" %>
<%@ Import Namespace="eBankit.Common.Extensions" %>

<div id="divContent" runat="server" class="transaction-content">

    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01905-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("KYC.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />

    <section class="section-warning content-message metro">
        <div class="stPosition col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max clearPadding">
            <div id="MainContent_TransactionMainContent_divMessage" class="alert alert-warning_v2 fade in widthInherit">
                <h4 class="alert-heading div-warning_v2">
                    <asp:Label runat="server" ID="divGroup" Text='<%$FrontEndResources:transactionCart,checkoutExplanationMessage%>' />
                </h4>
                <div class="clearBoth"></div>
            </div>
        </div>
    </section>
    <input type="hidden" id="OldContractId" runat="server" />
    <div class="clearBoth"></div>
    <section class="costumer-contract-details">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro bs-reduced-transaction  transp">
            <h3 class="head">
                <asp:Literal ID="Literal1" Text="<%$FrontEndResources:TRX01905158,SubTitleConfirm%>" runat="server"></asp:Literal>
            </h3>
            <div class="field break    " style="width: auto">
                <div class="field break    " style="width: auto">
                    <span id="MainContent_TransactionMainContent_txpTransactions_ctl01_ctl01_ctl01_lbLeft" title="Country" class="metro label-left ">
                        <span id="MainContent_TransactionMainContent_txpTransactions_ctl01_ctl01_ctl01_lbLeftSpan">
                            <asp:Literal ID="Literal2" Text="<%$FrontEndResources:KYC,Country%>" runat="server"></asp:Literal>
                        </span>
                    </span>
                    <span class="label-right ">
                        <asp:Literal ID="Country" runat="server"></asp:Literal>
                    </span>
                    <div style="clear: both;">
                    </div>
                </div>
                <div class="field break    " style="width: auto">
                    <span id="MainContent_TransactionMainContent_txpTransactions_ctl01_ctl01_ctl02_lbLeft" title="PostCode" class="metro label-left ">
                        <span id="MainContent_TransactionMainContent_txpTransactions_ctl01_ctl01_ctl02_lbLeftSpan">
                            <asp:Literal ID="Literal3" Text="<%$FrontEndResources:KYC,PostCode%>" runat="server"></asp:Literal>
                        </span>
                    </span>
                    <span class="label-right ">
                        <asp:Literal ID="PostCode" runat="server"></asp:Literal>
                    </span>
                    <div style="clear: both;">
                    </div>
                </div>
                <div class="field break    " style="width: auto">
                    <span id="MainContent_TransactionMainContent_txpTransactions_ctl01_ctl01_ctl03_lbLeft" title="AddressLine1" class="metro label-left ">
                        <span id="MainContent_TransactionMainContent_txpTransactions_ctl01_ctl01_ctl03_lbLeftSpan">
                            <asp:Literal ID="Literal4" Text="<%$FrontEndResources:KYC,AddressLine1%>" runat="server"></asp:Literal>
                        </span>
                    </span>
                    <span class="label-right ">
                        <asp:Literal ID="AddressLine1" runat="server"></asp:Literal>
                    </span>
                    <div style="clear: both;"></div>
                </div>
                <div class="field break    " style="width: auto">
                    <span id="MainContent_TransactionMainContent_txpTransactions_ctl01_ctl01_ctl04_lbLeft" title="AddressLine2" class="metro label-left ">
                        <span id="MainContent_TransactionMainContent_txpTransactions_ctl01_ctl01_ctl04_lbLeftSpan">
                            <asp:Literal ID="Literal5" Text="<%$FrontEndResources:KYC,AddressLine2%>" runat="server"></asp:Literal>
                        </span>
                    </span>
                    <span class="label-right ">
                        <asp:Literal ID="AddressLine2" runat="server"></asp:Literal>
                    </span>
                    <div style="clear: both;"></div>
                </div>
                <div class="field break    " style="width: auto">
                    <span id="MainContent_TransactionMainContent_txpTransactions_ctl01_ctl01_ctl04_lbLeft" title="City" class="metro label-left ">
                        <span id="MainContent_TransactionMainContent_txpTransactions_ctl01_ctl01_ctl04_lbLeftSpan">
                            <asp:Literal ID="test" Text="<%$FrontEndResources:KYC,City%>" runat="server"></asp:Literal>
                        </span>
                    </span>
                    <span class="label-right ">
                        <asp:Literal ID="City" runat="server"></asp:Literal>
                    </span>
                    <div style="clear: both;"></div>
                </div>

                <div class="field break    " style="width: auto">
                    <span id="MainContent_TransactionMainContent_txpTransactions_ctl01_ctl01_ctl04_lbLeft" title="Phone" class="metro label-left ">
                        <span id="MainContent_TransactionMainContent_txpTransactions_ctl01_ctl01_ctl04_lbLeftSpan">
                            <asp:Literal ID="Literal6" Text="<%$FrontEndResources:KYC,Phone%>" runat="server"></asp:Literal>
                        </span>
                    </span>
                    <span class="label-right ">
                        <asp:Literal ID="Phone" runat="server"></asp:Literal>
                    </span>
                    <div style="clear: both;"></div>
                </div>

                <div class="field break    " style="width: auto">
                    <span id="MainContent_TransactionMainContent_txpTransactions_ctl01_ctl01_ctl04_lbLeft" title="Email" class="metro label-left ">
                        <span id="MainContent_TransactionMainContent_txpTransactions_ctl01_ctl01_ctl04_lbLeftSpan">
                            <asp:Literal ID="Literal8" Text="<%$FrontEndResources:KYC,Email%>" runat="server"></asp:Literal>
                        </span>
                    </span>
                    <span class="label-right ">
                        <asp:Literal ID="Email" runat="server"></asp:Literal>
                    </span>
                    <div style="clear: both;"></div>
                </div>
                <div id="hasExtendedProperties" visible="false" runat="server">
                    <asp:Repeater ID="rptExtendedProperties" runat="server" OnItemDataBound="rptExtendedProperties_ItemDataBound">
                        <ItemTemplate>
                            <div class="field break    " style="width: auto">
                                <span id="MainContent_TransactionMainContent_txpTransactions_ctl01_ctl01_ctl04_lbLeft" title="Email" class="metro label-left ">
                                    <span id="MainContent_TransactionMainContent_txpTransactions_ctl01_ctl01_ctl04_lbLeftSpan">
                                        <asp:Literal ID="txtExtendedPropertyId" runat="server"></asp:Literal>
                                    </span>
                                </span>
                                <span class="label-right ">
                                    <asp:Literal ID="txtExtendedPropertyValue" runat="server"></asp:Literal>
                                </span>
                                <div style="clear: both;"></div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
        <div>
        </div>

    </section>

    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/Services/Transactions/TRX01905-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
</div>
