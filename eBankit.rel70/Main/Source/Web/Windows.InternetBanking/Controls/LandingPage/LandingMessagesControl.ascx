<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LandingMessagesControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.LandingMessagesControl" %>

<asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
    <ContentTemplate>
        <it:FlowContainerDetail ID="flwMessagesContainer" CssClass="panel panel-detail panel-message metro header-small" Title="<%$FrontEndResources:Custom,PanelMessages%>" runat="server">
            <div class="fullWidth" style="background-color: transparent; margin-bottom: 0px;">
                <asp:Repeater ID="rptMessages" runat="server" EnableViewState="true" OnItemDataBound="rptMessages_ItemDataBound">
                    <HeaderTemplate>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="tile-content">
                            <a id="aMessage" href="javascript:void(0)" class="list-group-item col-lg-12 list-group-item-inner list-group-item-hover" runat="server">
                                <div id="divMessage" class="list-group-item-text list-group-item-arrow" style="padding-left: 0px !important; min-height: 50px;" runat="server">
                                    <div class="list-group-item-des" style="float: left; width: 88%;">
                                        <h6><asp:Literal ID="litDescription" runat="server"></asp:Literal></h6>
                                        <p class="list-group-item-message"><asp:Literal ID="litMessage" runat="server"></asp:Literal></p>
                                    </div>
                                    <div class="list-group-item-date" style="padding-top: 5px; width: 10%;float: left;">
                                        <h6><asp:Literal ID="litData" runat="server"></asp:Literal></h6>
                                        <h6><asp:Literal ID="litData2" runat="server"></asp:Literal></h6>
                                    </div>
                                    <div class="clearBoth"></div>
                                </div>
                            </a>
                        </div>
                    </ItemTemplate>
                    <FooterTemplate>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </it:FlowContainerDetail>
    </ContentTemplate>
</asp:UpdatePanel>


