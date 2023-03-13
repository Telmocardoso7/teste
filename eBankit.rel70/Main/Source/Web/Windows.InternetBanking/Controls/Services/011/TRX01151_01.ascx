<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01151_01.ascx.cs" Inherits="TRX01151_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <asp:UpdatePanel ID="updContent" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <it:FlowInnerContainer ID="flwData1" Title="<%$FrontEndResources:TRX01150,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <div>
                    <div class="info-bottom-text info-inner">
                        <asp:Label ID="lblWarning" Text="<%$FrontEndResources:TRX01150,Warning%>" runat="server"></asp:Label>
                    </div>
                    <asp:Repeater ID="rptQuestions" runat="server" OnItemDataBound="rptQuestions_ItemDataBound">
                        <ItemTemplate>
                            <it:DropDownListControl_v2 ID="ddlQuestion" IsRequired="true" Label="<%$FrontEndResources:TRX01150,ddlQuestion%>" runat="server" />
                            <it:TextBoxControl_v2 ID="txtAnswer" IsRequired="true" TextMode="Password" Label="<%$FrontEndResources:TRX01150,txtAnswer%>" runat="server" />                   
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </it:FlowInnerContainer>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01151-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01151-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>

