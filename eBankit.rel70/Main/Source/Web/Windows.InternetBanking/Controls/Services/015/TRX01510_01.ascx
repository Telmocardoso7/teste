<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01510_01.ascx.cs" Inherits="TRX01510_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<%@ Register TagPrefix="st" TagName="ListInsurance" Src="/Controls/Generic/DataListInsuranceControl.ascx" %>
<div id="divContent" runat="server" class="transaction-content">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
        <div class="transaction-content">
            <asp:UpdatePanel runat="server" ID="updatePanelOperations" UpdateMode="Always">
                <ContentTemplate>
                     <st:ListInsurance ID="ListInsurance" runat="server" />
                    <div style="background-color:white; height:50px; width:200%; margin-left:-30%;"></div>
                         <st:ListInsurance ID="ListInsurance2" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01510-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>

