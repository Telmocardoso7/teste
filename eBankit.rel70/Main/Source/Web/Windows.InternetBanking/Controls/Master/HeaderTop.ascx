<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HeaderTop.ascx.cs" Inherits="HeaderTop" %>

<style type="text/css">
    /* Header control */
    .version {
        display: inline-block;
        position: absolute;
        margin-top: 20px;
        font-size: 1.1rem;
        cursor: pointer;
    }
    /* -----------------------------------------------------*/
</style>

<div class="logoContainer col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max clearPadding">
    <div class="brandlogo metro col-xs-3 col-sm-2" onclick="eBankit.Presentation.HomePage();" onkeypress="eBankit.Presentation.HomePage();" tabindex="0" title="<asp:Literal runat='server' Text='<%$FrontEndResources:Header,ebkLogoHomepage%>' />">
        <img id="imgLogo" runat="server" class="logo img-responsive imgLogo" alt="" />
        <img class="logo-print hidden" src="<%=eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("header/ATLDirecto.png"),eBankit.Common.Sites.Utils.CacheVersionKey.Image)%>" alt="" />
    </div>
    <div id="divVersion" class="version col-xs-1" runat="server">
        <asp:Label ID="lblVersion" Text="v 1.9" runat="server"></asp:Label>
    </div>
    <div class="header-right">
        <asp:PlaceHolder ID="phProfileControl" runat="server"></asp:PlaceHolder>

        <div id="divCartCount" class="cart-counter" runat="server" visible="false">
            <asp:LinkButton ID="lkbCart" runat="server" CssClass="image-container" OnClick="lkbCart_Click">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="cart-top-header"></div>
                        <div class="cart">

                            <asp:Label ID="lblCartCount" CssClass="badge" Text="0" runat="server" aria-hidden="true"></asp:Label>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:LinkButton>
        </div>

        <div class="text-center text-small noprint langSelector marginTablet">
            <asp:Repeater ID="rptVariations" OnItemDataBound="rptVariations_ItemDataBound" runat="server">
                <HeaderTemplate>
                </HeaderTemplate>
                <ItemTemplate>
                    <a id="aVariation" class="a-primary" href="#" onclick="eBankit.Presentation.ChangeLanguage('en');return false;" runat="server"></a>
                    <span id="spanSeparator" class="line-separator" runat="server"></span>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <it:LoginControl ID="lgnUser" runat="server" />
    </div>
</div>

<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/ebankitControls/selectProfile/widget.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("a[id*='lkbCart']").attr("aria-labelledby", "<%=lblCartCount.ClientID%>");
    });
    $("a[id*='lkbCart']").on("focus", function () {
        var elem = $(".profile-selector-container");
        elem.find(".profile-selector").removeClass("active");
        elem.find(".profile-search > .search-container").hide();

    });
    $("div.brandlogo").on("focus", function () {
        var elem = $(".profile-selector-container");
        elem.find(".profile-selector").removeClass("active");
        elem.find(".profile-search > .search-container").hide();

    });
</script>
