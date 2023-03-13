<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FavoritsWithoutBeneficiariesControl.ascx.cs" Inherits="FavoritsWithoutBeneficiariesControl" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div id="contentFavorit" runat="server" class="metro noprint col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max favorit-top-container">
    <h5 class="single-head" style="margin-top: 20px;">
        <asp:Literal ID="littitle" runat="server" Text="<%$FrontEndResources:FavoritControl,lblFavoritTitle%>"></asp:Literal></h5>
    <div id="favoritcontent" class="panel" style="border: none; margin-top: -5px; box-shadow: none; visibility: hidden;">
        <div id="benefTabContent" class="tab-content " style="border: 0; margin-left: 0px; padding: 0px 0px; background-color: transparent; margin-bottom: 20px;">
            <div class="tab-pane-benefs" id="favorit">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <div class="metro bx-wrapper-container bx-wrapper-container-selector" id="flwContainerDetailFavorits" runat="server">
                            <asp:Repeater ID="rptFavorits" runat="server" EnableViewState="true" OnItemDataBound="rptFavorits_ItemDataBound">
                                <HeaderTemplate>
                                    <div class="slickSliderFavorits_FWBC" id="favSlider_FWBC">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div id="aFavOper" runat="server"  onkeydown="eBankit.Presentation.FavoritsWithoutBeneficiariesControl.KeydownHandler(this, event);" onkeyup="eBankit.Presentation.FavoritsWithoutBeneficiariesControl.KeyupHandler(this, event);">
                                        <div id="divFavOper" runat="server" class="panel-item">
                                            <div class="panel-image">
                                                <img id="imgFavorit" src="<%$ebFile:~/Content/currenttheme/images/benef_1.png%>" class="img-thumbnail img-circle img-circle-selector imgFavSelector" alt="" runat="server" />
                                                <img id="imgSharedFav" src="<%$ebFile:~/Content/currenttheme/images/icon/action/corporate/action-shared.png%>" alt="" runat="server" class="imgShareIconAbove shareOnFavouritTransactionSelector"/>
                                            </div>
                                            <div class="panel-text">
                                                <h4>
                                                    <asp:Literal ID="litName" runat="server"></asp:Literal></h4>
                                                <p>
                                                    <asp:Literal ID="litAmount" runat="server"></asp:Literal>
                                                </p>
                                            </div>
                                        </div>                                        
                                    </div>
                                </ItemTemplate>
                                <FooterTemplate>
                                    </div>
                                </FooterTemplate>
                            </asp:Repeater>
                           
                        </div>
                         <div class="clearBoth"></div>
                        <div id="flwFavoritsEmpty" class="metro panel-content favorit-empty clearPadding" visible="false" runat="server">
                            <p>
                                <asp:Literal ID="litFavoritEmptyMsg" Text='<%$FrontEndResources:Favorits,EmptyMessage %>' runat="server"></asp:Literal>
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
<asp:HiddenField ID="hdnBeneficiarySelectedIndex" Value="" runat="server" />
<asp:HiddenField ID="hdnFavoritSelectedIndex" Value="" runat="server" />
<asp:HiddenField ID="_hidSelectedBeneficiary" runat="server" />
<asp:HiddenField ID="_hidSelectedFavorit" runat="server" />
<asp:HiddenField ID="_hidFavoritArray" runat="server" />
<asp:HiddenField ID="hdnAlreadyBenef" runat="server" />

<asp:HiddenField ID="hdnBeneficiaryAccountType" runat="server" />

<asp:HiddenField ID="hdnSelectedPanel" Value="" runat="server" />
<asp:HiddenField ID="hdnHasNotifyEmail" runat="server" />
<asp:HiddenField ID="hdnHasNotifyPhone" runat="server" />

<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("favorit-selector-slick-1.0.js".ResolveJsUrl("ebankitControls"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>

<script type="text/javascript">
    var hdnSelectedPanel = $("#<%=hdnSelectedPanel.ClientID %>");
    var hdnAlreadyBenef = $("#<%=hdnAlreadyBenef.ClientID %>");
    var AutoPostBack_f = '<%=AutoPostBack %>';
    var hdnBeneficiarySelectedIndex = $("#<%=hdnBeneficiarySelectedIndex.ClientID %>"); var _hidSelectedBeneficiary = $("#<%=_hidSelectedBeneficiary.ClientID %>");

    var _hidFavoritArray = $("#<%=_hidFavoritArray.ClientID %>"); var _hidSelectedFavorit = $("#<%=_hidSelectedFavorit.ClientID %>");
    var hdnFavoritSelectedIndex = $("#<%=hdnFavoritSelectedIndex.ClientID %>"); var btnFavoritSelectedChanged = "<%=btnFavoritSelectedChanged.UniqueID %>";

    var hdnBeneficiaryAccountType = $("#<%=hdnBeneficiaryAccountType.ClientID %>");
    var hdnHasNotifyEmail = $("#<%=hdnHasNotifyEmail.ClientID %>");
    var hdnHasNotifyPhone = $("#<%=hdnHasNotifyPhone.ClientID %>");

    
    var chooseFavorit = '<%=eBankit.Common.Globalization.Translate.GetTransactionString("Favorit","ChooseTitle") %>';

    eBankit.Presentation.FavoritsWithoutBeneficiariesControl = {}

    eBankit.Presentation.FavoritsWithoutBeneficiariesControl.KeydownHandler = function (elem, event) {
        if (event.keyCode === 32) {
            event.preventDefault();
        }
        else if (event.keyCode === 13) {
            event.preventDefault();
            $(elem).click();
        }
    }

    eBankit.Presentation.FavoritsWithoutBeneficiariesControl.KeyupHandler = function (elem, event) {
        if (event.keyCode === 32) {
            event.preventDefault();
            $(elem).click();
        }
    }

    changeIcon = function (type) {
        if (type == ('favorit'))
            imgFavorite1.attr("src", "<%=eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("ic_filter_favorite_selected.png"),eBankit.Common.Sites.Utils.CacheVersionKey.Image) %>");
    };
    
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        $("img[id*='imgFavorit']").each(function () {
            if ($(this).attr("alt") === undefined)
                $(this).attr("alt", "");
        });
        FavoritSelectorSlick.LoadSlick();
    });

    $(document).ready(function () {
        $("img[id*='imgFavorit']").each(function () {
            if ($(this).attr("alt") === undefined)
                $(this).attr("alt", "");
        });
        FavoritSelectorSlick.LoadSlick();
    });


</script>
<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("beneficiary-1.0.js".ResolveJsUrl("Services"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
