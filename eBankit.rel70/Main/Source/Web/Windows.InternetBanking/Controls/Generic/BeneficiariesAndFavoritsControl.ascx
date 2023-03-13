<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BeneficiariesAndFavoritsControl.ascx.cs" Inherits="BeneficiariesAndFavoritsControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div class="metro noprint">
    <div class="panel" style="border: none; padding-top: 10px; box-shadow: none;">
        <%--<div id="pnCommand" class="panel-arrow" runat="server" onclick="eBankit.Presentation.Beneficiary.CloseTabOptionV4(false);changeIcon('all');">
            <i id="iconArrow" class="icon-arrow-up"></i>
        </div>--%>
        <%------------------------------------------------%>
        <ul class="nav nav-tabs nav-tabs-selectors" style="border: 0; display: inline-block;padding-left:0px;">
        <li id="liFavorits" onclick="eBankit.Presentation.Beneficiary.ChangeTabTitle_v3('favorit');" runat="server"><a href="#favorit" onclick="changeIcon('favorit');" class="benefteste" style="border-top-right-radius: 4px; border-bottom-right-radius: 4px;" data-toggle="tab">
            <img id="imgFavorite1" src="<%$ebFile:~/content/currenttheme/images/ic_filter_favorite.png%>" style="" alt="" runat="server" />
            <%--<asp:Literal ID="litFavoritTab" Text="<%$FrontEndResources:Beneficiary,FavoritTab %>" runat="server"></asp:Literal>--%></a></li>
        <li id="liBeneficiaries" onclick="eBankit.Presentation.Beneficiary.ChangeTabTitle_v3('benef');" runat="server"><a href="#benef" onclick="changeIcon('benef');" style="border-top-left-radius: 4px; border-bottom-left-radius: 4px;" data-toggle="tab">
            <img id="imgBeneficiary1" src="<%$ebFile:~currenttheme/images/ic_filter_beneficiary.png%>" style="" alt="" runat="server" /></a></li>

        <%--<asp:Literal ID="litBeneficiariesTab" Text="<%$FrontEndResources:Beneficiary,BenefTab %>" runat="server"></asp:Literal>--%>
    </ul>
        <%------------------------------------------------%>

        <div id="benefsTabContent" class="tab-content panel-content" style="border: 0; margin-left:0px; padding: 0px 0px; background-color: #fff; margin-bottom: 20px;">
            <div class="tab-pane fade tab-pane-favs" id="benef">
                <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <div class="metro bx-wrapper-container bx-wrapper-container-selector" id="flwBeneficiaries" runat="server">
                            <asp:Repeater ID="rptBeneficiaries" runat="server" EnableViewState="true" OnItemDataBound="rptBeneficiaries_ItemDataBound">
                                <HeaderTemplate>
                                    <ul class="bxsliderBeneficiaries">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <li style="height: 71px; width: 260px  !important;">
                                        <div id="aBenef" class="panel-item" runat="server">
                                            <div class="panel-image">
                                                <img id="imgBeneficiary1" src="<%$ebFile:~currenttheme/images/default-benef.jpg%>" class="img-thumbnail img-circle img-circle-selector" style="width: 50px; height: 50px;" alt="" runat="server" />
                                            </div>
                                            <div class="panel-text">
                                                <h4>
                                                    <asp:Literal ID="litName" runat="server"></asp:Literal></h4>
                                                <p>
                                                    <asp:Literal ID="litSubTitle" runat="server"></asp:Literal>
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
                        <div id="flwBeneficiariesEmpty" class="metro panel-content" style="height:65px;" runat="server">
                            <p>
                                <asp:Literal ID="litEmptyBenefs" Text='<%$FrontEndResources:Beneficiary,EmptyMessage %>' runat="server"></asp:Literal>
                            </p>
                        </div>
                        <asp:Button ID="btnFavoritSelectedChanged" runat="server" CssClass="hidden" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="tab-pane fade tab-pane-benefs" id="favorit">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <div class="metro bx-wrapper-container bx-wrapper-container-selector" id="flwContainerDetailFavorits" runat="server">
                            <asp:Repeater ID="rptFavorits" runat="server" EnableViewState="true" OnItemDataBound="rptFavorits_ItemDataBound">
                                <HeaderTemplate>
                                    <ul class="bxsliderFavorits">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <li style="height: 71px; width: 260px !important;">
                                        <div id="aFavOper" class="panel-item" runat="server">
                                            <div class="panel-image">
                                                <img id="imgFavorit" src="<%$ebFile:~/content/currenttheme/images/benef_1.png%>" class="img-thumbnail img-circle img-circle-selector" style="width: 50px; height: 50px;" alt="" runat="server" />
                                            </div>
                                            <div class="panel-text">
                                                <h4>
                                                    <asp:Literal ID="litName" runat="server"></asp:Literal></h4>
                                                <p>
                                                    <asp:Literal ID="litAmount" runat="server"></asp:Literal>
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
                        <div id="flwFavoritsEmpty" class="metro panel-content" style="height:65px;" runat="server">
                            <p>
                                <asp:Literal ID="Literal1" Text='<%$FrontEndResources:Favorits,EmptyMessage %>' runat="server"></asp:Literal>
                            </p>
                        </div>
                        <asp:Button ID="btnBeneficiarySelectedChanged" runat="server" CssClass="hidden" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="clearBoth"></div>
    </div>
</div>

<asp:HiddenField ID="hdnBeneficiarySelectedIndex" Value="" runat="server" />
<asp:HiddenField ID="_hidSelectedBeneficiary" runat="server" />
<asp:HiddenField ID="_hidBeneficiaryArray" runat="server" />

<asp:HiddenField ID="hdnFavoritSelectedIndex" Value="" runat="server" />
<asp:HiddenField ID="_hidSelectedFavorit" runat="server" />
<asp:HiddenField ID="_hidFavoritArray" runat="server" />

<asp:HiddenField ID="hdnBeneficiaryAccountType" runat="server" />

<asp:HiddenField ID="hdnSelectedPanel" Value="" runat="server" />
<asp:HiddenField ID="hdnHasNotifyEmail" runat="server" />
<asp:HiddenField ID="hdnHasNotifyPhone" runat="server" />

<script type="text/javascript">
    var _hidBeneficiaryArray = $("#<%=_hidBeneficiaryArray.ClientID %>"); var _hidSelectedBeneficiary = $("#<%=_hidSelectedBeneficiary.ClientID %>"); var hdnSelectedPanel = $("#<%=hdnSelectedPanel.ClientID %>");
    var hdnBeneficiarySelectedIndex = $("#<%=hdnBeneficiarySelectedIndex.ClientID %>"); var btnBeneficiarySelectedChanged = "<%=btnBeneficiarySelectedChanged.UniqueID %>"; var AutoPostBack_f = '<%=AutoPostBack %>';

    var _hidFavoritArray = $("#<%=_hidFavoritArray.ClientID %>"); var _hidSelectedFavorit = $("#<%=_hidSelectedFavorit.ClientID %>");
    var hdnFavoritSelectedIndex = $("#<%=hdnFavoritSelectedIndex.ClientID %>"); var btnFavoritSelectedChanged = "<%=btnFavoritSelectedChanged.UniqueID %>";

    var hdnBeneficiaryAccountType = $("#<%=hdnBeneficiaryAccountType.ClientID %>");
    var hdnHasNotifyEmail = $("#<%=hdnHasNotifyEmail.ClientID %>");
    var hdnHasNotifyPhone = $("#<%=hdnHasNotifyPhone.ClientID %>");
    var projId= "<%=ConfigurationManager.AppSettings["projectId"].ToString() %>";

    var chooseFavorit = '<%=eBankit.Common.Globalization.Translate.GetTransactionString("Favorit","ChooseTitle") %>';
    var chooseBeneficiary = '<%=eBankit.Common.Globalization.Translate.GetTransactionString("Beneficiary","ChooseTitle") %>';

    var liBeneficiaries = $("#<%=liBeneficiaries.ClientID %>");
    var liFavorits = $("#<%=liFavorits.ClientID %>");

    var imgFavorite1 = $("#<%=imgFavorite1.ClientID %>");
    var imgBeneficiary1 = $("#<%=imgBeneficiary1.ClientID %>");

    changeIcon = function (type) {

        if (type == ('benef')) {
            imgFavorite1.attr("src", "<%=eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("ic_filter_favorite.png"),eBankit.Common.Sites.Utils.CacheVersionKey.Image)%>");
            imgBeneficiary1.attr("src", "<%=eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("ic_filter_beneficiary_selected.png"),eBankit.Common.Sites.Utils.CacheVersionKey.Image)%>");
        } else if (type == ('favorit')) {
            imgFavorite1.attr("src", "<%=eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("ic_filter_favorite_selected.png"),eBankit.Common.Sites.Utils.CacheVersionKey.Image)%>");
            imgBeneficiary1.attr("src", "<%=eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("ic_filter_beneficiary.png"),eBankit.Common.Sites.Utils.CacheVersionKey.Image)%>");
        }
    };

    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        InitSlides();
    });

    $(document).ready(function () {
        InitSlides();
    });

    InitSlides = function () {
        $('.bxsliderFavorits').bxSlider({
            minSlides: 1,
            maxSlides: 5,
            slideWidth: 260,
            infiniteLoop: false,
            hideControlOnEnd: true,
            slideMargin: 0
        });

        $('.bxsliderBeneficiaries').bxSlider({
            minSlides: 1,
            maxSlides: 5,
            slideWidth: 260,
            infiniteLoop: false,
            hideControlOnEnd: true,
            slideMargin: 0
        });
    }
</script>
<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("beneficiary-1.0.js".ResolveJsUrl("Services"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>

