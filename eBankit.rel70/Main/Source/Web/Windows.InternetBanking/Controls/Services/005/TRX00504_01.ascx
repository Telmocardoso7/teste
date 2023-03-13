<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00504_01.ascx.cs" Inherits="TRX00504_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divTransaction" class="transaction-content" runat="server">
    <it:DataListControl ID="dataListUser"
        ResourceKey="Statements"
        SortingData="false"
        MethodName="GetLoanPaymentPlanTransactions"
        ItemClassName="CoreLoanPaymentItem"
        ItemClassNamespace="eBankit.Business.Entities.Banking.Loans"
        ItemClassDll="eBankit.Business.Entities.Banking"
        CssClass="table-resp-to1199 noarrow"
        runat="server" />

    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00504-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>