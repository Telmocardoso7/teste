<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginCampaignControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.LoginCampaignControl" %>

<it:FlowContainerDetail ID="flwMessagesContainer" CssClass="panel panel-detail panel-message metro header-small panel-campaigns" runat="server">
    <asp:Repeater ID="repeaterIndicators" runat="server">
        <HeaderTemplate>
            <div id="carousel-generic" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
        </HeaderTemplate>
        <ItemTemplate>
            <li data-target="#carousel-generic" data-slide-to="<%# DataBinder.Eval(Container, "ItemIndex") %>" class="<%# ((int)DataBinder.Eval(Container, "ItemIndex")==0) ? "active" : string.Empty  %>"></li>
        </ItemTemplate>
        <FooterTemplate>
            </ol>
        </FooterTemplate>
    </asp:Repeater>
    <!-- Wrapper for slides -->
    <asp:Repeater ID="repeaterItems" runat="server" OnItemDataBound="repeaterItems_ItemDataBound">
        <HeaderTemplate>
            <div class="carousel-inner" id='cItem'>
        </HeaderTemplate>
        <ItemTemplate>
            <asp:Literal ID="literal1" runat="server"></asp:Literal>
        </ItemTemplate>
        <FooterTemplate>
            </div></div>
        </FooterTemplate>
    </asp:Repeater>

    <div class="clearBoth"></div>
</it:FlowContainerDetail>
<script type="text/javascript">
    $(document).ready(function () {
        $("#carousel-generic").carousel();
    });

</script>

