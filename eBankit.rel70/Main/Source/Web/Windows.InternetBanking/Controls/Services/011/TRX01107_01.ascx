<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01107_01.ascx.cs" Inherits="TRX01107_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <div class="grayContainer bottomBorderInfoTopMessage">
        <div class="metro info-bottom-text col-lg-8 col-max heavyMargin" style="text-align: left !important">
            <asp:Label runat="server" Text="<%$FrontEndResources:TRX01107,ChangeOmnichannelCodeMessage %>" CssClass="infoTopMessage"></asp:Label>
        </div>
    </div>
    <it:FlowInnerContainer ID="FlowInnerContainer1" Title="<%$FrontEndResources:TRX01107,flwContractData %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
        <div>
            <it:FlowLabel_v3 ID="flwContract" Label="<%$FrontEndResources:TRX01107,lblContract %>" runat="server" />
        </div>
    </it:FlowInnerContainer>

    <it:FlowInnerContainer ID="flwData1" Title="<%$FrontEndResources:TRX01107,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
        <div>

            <asp:HiddenField EnableViewState="true" ID="hdnCurrentLoginAlias" runat="server" />
            <it:FlowLabel_v3 ID="flwcurrentCode" Label="<%$FrontEndResources:TRX01107,currentUsername%>" runat="server" />
            <it:FlowLabel_v3 ID="flwcurrentAlternativeCodeAlias" Label="<%$FrontEndResources:TRX01107,currentAlternativeCodeAlias%>" runat="server" />
            <asp:UpdatePanel ID="udpAvailableUserName" UpdateMode="Always" runat="server">
                <ContentTemplate>
                    <div class="textbox-available">
                        <span id="spnUserNameActive" class="not-available-icon hidden" runat="server">
                            <asp:Literal ID="txtUserNameActive" Text="no" runat="server"></asp:Literal></span>

                        <it:TextBoxControl_v2 ID="txtnewCodeAlias" IsRequired="true" Label="<%$FrontEndResources:TRX01107,txtnewCodeAlias%>" runat="server" />
                        <input type="hidden" runat="server" id="regexPattern" />
                        <input type="hidden" runat="server" id="isInBlackList" />
                        <asp:Button ID="btnVerifyUserName" runat="server" CssClass="hidden" OnClick="btnVerifyUserName_Click" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </it:FlowInnerContainer>

   
    <div class="clearBoth"></div>

    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/Services/Transactions/TRX01107-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>   
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01107-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>


