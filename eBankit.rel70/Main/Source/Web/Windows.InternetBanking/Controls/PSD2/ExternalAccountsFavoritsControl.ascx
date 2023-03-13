<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ExternalAccountsFavoritsControl.ascx.cs" Inherits="ExternalAccountsFavoritsControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div class="col-lg-8 col-max">
    <div class="metro noprint" style="padding-left: 15px;">
        <div class="panel" style="border: none; padding-top: 10px; box-shadow: none;">
            <ul class="nav nav-tabs nav-tabs-selectors" style="border: 0; display: none; padding-left: 0px; margin-left: 0px;">
                <li id="liOperations" onclick="eBankit.Presentation.Beneficiary.ChangeTabTitle_v2('operations');" runat="server"><a href="#operations" onclick="changeIcon('operations');" style="border-top-right-radius: 4px; border-bottom-right-radius: 4px;" data-toggle="tab">
                    <img id="imgOperations1" src="<%$ebFile:~/content/currenttheme/images/ic_all_operations.png%>" style="" alt="" runat="server" /></a></li>
                <li id="liFavorits" onclick="eBankit.Presentation.Beneficiary.ChangeTabTitle_v3('favorit');" runat="server"><a href="#favorit" onclick="changeIcon('favorit');" class="benefteste" style="border-top-left-radius: 4px; border-bottom-left-radius: 4px;" data-toggle="tab">
                    <img id="imgFavorite1" src="<%$ebFile:~/content/currenttheme/images/ic_filter_favorite.png%>" style="" alt="" runat="server" /></a></li>
            </ul>

            <div id="benefsTabContent" class="tab-content panel-content" style="border: 0; margin-left: 0px; padding: 0px 0px; background-color: #fff; margin-bottom: 20px;">
                <div id="operations" class="favoritList">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
                        <ContentTemplate>
                            <div class="metro bx-wrapper-container bx-wrapper-container-selector" id="flwContainerDetailOperations" runat="server">
                                <asp:Repeater ID="rptOperations" runat="server" EnableViewState="true" OnItemDataBound="rptOperations_ItemDataBound">
                                    <HeaderTemplate>
                                        <div class="bx-wrapper-container-selector-separator"></div>
                                        <ul class="bxsliderFavorits">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li>
                                            <div id="aOper" class="panel-item" runat="server" tabindex="0" role="link">
                                                <div class="panel-image">
                                                    <img id="imgOperation" src="<%$ebFile:~/content/currenttheme/images/benef_1.png%>" class="img-circle" alt="Operations" runat="server" />
                                                </div>
                                                <div class="panel-text">
                                                    <p>
                                                        <span>
                                                            <asp:Literal ID="litName" runat="server"></asp:Literal>
                                                        </span>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="clearBoth"></div>
                                        </li>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul>
                                   
                                    </FooterTemplate>
                                </asp:Repeater>
                                <div class="clearBoth"></div>
                            </div>
                            <div id="flwReuseEmpty" class="metro panel-content" style="height: 65px;" runat="server">
                                <p>
                                    <asp:Literal ID="litReuseEmpty" Text='<%$FrontEndResources:Reuse,EmptyMessage %>' runat="server"></asp:Literal>
                                </p>
                            </div>
                            <asp:Button ID="btnOperationSelectedChanged" runat="server" CssClass="hiddenImportant" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div id="favorit" class="favoritList">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                        <ContentTemplate>
                            <div id="flwFavoritsEmpty" class="metro panel-content" style="height: 65px;" runat="server">
                                <p>
                                    <asp:Literal ID="Literal1" Text='<%$FrontEndResources:Favorits,EmptyMessageExternalAccounts %>' runat="server"></asp:Literal>
                                </p>
                            </div>
                            <asp:Button ID="btnFavoritSelectedChanged" runat="server" CssClass="hiddenImportant" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
            <div class="clearBoth"></div>
        </div>
    </div>
</div>

<asp:HiddenField ID="hdnOperationSelectedIndex" Value="" runat="server" />
<asp:HiddenField ID="_hidSelectedOperation" runat="server" />
<asp:HiddenField ID="_hidOperationArray" runat="server" />

<asp:HiddenField ID="hdnSelectedPanel" Value="" runat="server" />
<script type="text/javascript">
    var hdnSelectedPanel = $("#<%=hdnSelectedPanel.ClientID %>");

    var _hidOperationArray = $("#<%=_hidOperationArray.ClientID %>"); var _hidSelectedOperation = $("#<%=_hidSelectedOperation.ClientID %>");
    var hdnOperationSelectedIndex = $("#<%=hdnOperationSelectedIndex.ClientID %>"); var btnOperationSelectedChanged = "<%=btnOperationSelectedChanged.UniqueID %>";

    var chooseFavorit = '<%=eBankit.Common.Globalization.Translate.GetTransactionString("Favorit","ChooseTitle") %>';
    var chooseOperation = '<%=eBankit.Common.Globalization.Translate.GetTransactionString("Function","ChooseTitle") %>';

    var liFavorits = $("#<%=liFavorits.ClientID %>");
    var liOperations = $("#<%=liOperations.ClientID %>");

    var imgFavorite1 = $("#<%=imgFavorite1.ClientID %>");
    var imgOperations1 = $("#<%=imgOperations1.ClientID %>");
    var projId = "<%=ConfigurationManager.AppSettings["projectId"].ToString() %>";

    changeIcon = function (type) {

        if (type == ('operations')) {
            imgFavorite1.attr("src", "<%=eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("ic_filter_favorite.png"),eBankit.Common.Sites.Utils.CacheVersionKey.Image) %>");
            imgOperations1.attr("src", "<%=eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("ic_all_operations_selected.png"),eBankit.Common.Sites.Utils.CacheVersionKey.Image) %>");
        } else if (type == ('favorit')) {
            imgFavorite1.attr("src", "<%= eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("ic_filter_favorite_selected.png"),eBankit.Common.Sites.Utils.CacheVersionKey.Image) %>");
            imgOperations1.attr("src", "<%=eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("ic_all_operations.png"),eBankit.Common.Sites.Utils.CacheVersionKey.Image) %>");
        } else if (type == ('all')) {
            imgFavorite1.attr("src", "<%= eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("ic_filter_favorite.png"),eBankit.Common.Sites.Utils.CacheVersionKey.Image) %>");
            imgOperations1.attr("src", "<%=eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("ic_all_operations.png"),eBankit.Common.Sites.Utils.CacheVersionKey.Image) %>");
        }
    };

</script>
<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("beneficiary-1.0.js".ResolveJsUrl("Services"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>

