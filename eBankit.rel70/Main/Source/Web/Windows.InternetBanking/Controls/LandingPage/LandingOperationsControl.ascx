<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LandingOperationsControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.LandingOperationsControl" %>


<asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
    <ContentTemplate>
        <it:FlowContainerDetail ID="pnFavorits" CssClass="panel panel-detail metro header-small panel-detail-noborder" Title="<%$FrontEndResources:Custom,PanelOperations%>" runat="server">
            <asp:Repeater ID="rptFavorits" runat="server" EnableViewState="true" OnItemDataBound="rptFavorits_ItemDataBound">
                <HeaderTemplate>
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="panel-detail-item panel-landing">
                        <a id="aFavOper" href="javascript:void(0)" class="list-group-item list-group-item-inner" runat="server">
                            <img id="imgFavorit" src="<%$ebFile:~/Content/currenttheme/images/benef_1.png%>" alt="" runat="server" />
                            <h6>
                                <asp:Literal ID="litCurrency" runat="server"></asp:Literal></h6>
                            <h5>
                                <asp:Literal ID="litAmount" runat="server"></asp:Literal></h5>
                        </a>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                </FooterTemplate>
            </asp:Repeater>
            <div class="metro panel-content" id="pnEmpty" runat="server">
                <p><asp:Literal ID="litEmptyBenefs" Text='<%$FrontEndResources:Custom,EmptyFavorits %>' runat="server"></asp:Literal></p>
            </div>
            <div class="clearBoth"></div>
        </it:FlowContainerDetail>
    </ContentTemplate>
</asp:UpdatePanel>
