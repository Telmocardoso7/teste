<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01104_01.ascx.cs" Inherits="TRX01104_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <it:FlowInnerContainer ID="flwPhoneData" Title="<%$FrontEndResources:TRX01104,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
        <div>
            <it:FlowLabel_v2 ID="flwOldContract" Label="<%$FrontEndResources:TRX01104,lblContract %>" runat="server" />
            <it:NumberTextBoxControl_v2 ID="txtNewPhone" IsRequired="true" RegexExpression="/^\+*[1-9]{1}[0-9]{7,11}$|^$/" IsNumber="false" Label="<%$FrontEndResources:TRX01104,txtNewPhone%>" runat="server" />
        </div>
    </it:FlowInnerContainer>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01104-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
