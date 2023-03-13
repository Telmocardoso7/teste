<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SideMenu.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.SideMenu" %>

<div class="metro metro_sidebar">
    <script type="text/javascript">
        $(function () {
            $('.drop').click(function () {
                $(this).find('i').toggleClass('icon-arrow-down-5 icon-arrow-up-5');
            });
            $('#dropAccess').click(function () {
                $(this).find('i').toggleClass('icon-arrow-down-3 icon-arrow-up-3');
            });
        });
    </script>
    <div class="metro">
        <nav class="sidebar light">
            <ul>
                <li>
                    <a id="TitleDirectAcess" class="dropdown-toggle drop" href="#"><asp:Literal ID="litDirectAccess" Text="<%$FrontEndResources:SideMenu,DirectAccess %>" runat="server"></asp:Literal><span><i id="BallIcon" class="icon-arrow-down-5"></i></span></a>
                    <ul class="DirectAcess" data-role="dropdown">
                        <li><a href="/Security/Transactions/Transactions.aspx?trxid=TRX00116<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>"><asp:Literal ID="litSideMenu1" Text="<%$FrontEndResources:SideMenu,UtilityPayment %>" runat="server"></asp:Literal></a></li>
                        <li><a href="/Security/Transactions/Transactions.aspx?trxid=TRX00101<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>"><asp:Literal ID="litSideMenu2" Text="<%$FrontEndResources:SideMenu,Statements %>" runat="server"></asp:Literal></a></li>
                        <li><a href="/Security/Transactions/Transactions.aspx?trxid=TRX00121<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>"><asp:Literal ID="litSideMenu3" Text="<%$FrontEndResources:SideMenu,NacionalTransfer %>" runat="server"></asp:Literal></a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>

    <asp:Repeater ID="rptMenus" runat="server" OnItemDataBound="rptMenus_ItemDataBound">
        <HeaderTemplate>
            <nav class="sidebar light">
                <ul class="MenuLevel1">
        </HeaderTemplate>
        <ItemTemplate>
            <li><a id="aMenuGroup" class="selsideanchor" href="#" runat="server"><i class="icon-arrow-down-5"></i></a>
                <asp:Repeater ID="rptMenusItems" OnItemDataBound="rptMenusItems_ItemDataBound" runat="server">
                    <HeaderTemplate>
                        <ul class="MenuLevel2" data-role="dropdown">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li><a href="#" class="selsideanchor" id="aSubMenuGroup" runat="server"><i class="icon-arrow-down-5"></i></a>
                            <asp:Repeater ID="rptMenusSubItems" OnItemDataBound="rptMenusSubItems_ItemDataBound" runat="server">
                                <HeaderTemplate>
                                    <ul class="MenuLevel3" data-role="dropdown">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <li><a href="#" id="aSubMenuItem" runat="server"></a></li>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </ul>
                                </FooterTemplate>
                            </asp:Repeater>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                        </ul>
                    </FooterTemplate>
                </asp:Repeater>
            </li>
        </ItemTemplate>
        <FooterTemplate>
            </ul>
            </nav>  
        </FooterTemplate>
    </asp:Repeater>
</div>
<script type="text/javascript">
    function SelectSideMenuOption(parentId) {
        var anc = $("#" + parentId);
        $(".selsideanchor").each(function () {
            $(this).removeClass("item-m-selected");
        });

        if (anc) {
            anc.addClass("item-m-selected");
        }
    }
</script>
