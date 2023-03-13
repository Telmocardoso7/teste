<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00163_01.ascx.cs" Inherits="TRX00163_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server">
    <div class="panel-favorit popup" style="border: 0;">
        <div class="col-xs-12 ch-header-container">
            <div class="col-max bs-reduced bs-head-metro bs-popup">
                <div class="img-operation-div">
                    <span class="img-operation-span"></span>
                    <img id="imgOperationType" src="<%$ebFile:~/Content/currenttheme/images/benef_1.png%>" alt="" class="img-operation" runat="server" />
                </div>
                <div class="operation-type ">
                    <asp:Literal ID="litOperationType" runat="server"></asp:Literal>
                </div>
               <div>
                    <asp:Literal ID="litOperationValue" runat="server"></asp:Literal>
                </div>
                <div>
                    <asp:Literal ID="litOperationStatus" runat="server"></asp:Literal>
                </div>
               
            </div>
        </div>

                <div class="col-xs-12 division-line"></div>

          <asp:Panel ID="pnControls" CssClass="col-xs-12 ch-label-container" runat="server">
            <div class="clearBoth"></div>
        </asp:Panel>
        <div class="clearBoth"></div>
        <div class="proof-inner proof-operations-details">
            <asp:PlaceHolder ID="phProofInner" runat="server"></asp:PlaceHolder>
        </div>

        <div class="inprint" style="margin-top: 20px;">
            <asp:Label ID="lblOperationID" runat="server"></asp:Label>
            <asp:Label ID="lblPrintDate" Style="display: block; margin-top: 10px;" runat="server"></asp:Label>
        </div>
    </div>
    <div class="clearBoth"></div>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00163-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
