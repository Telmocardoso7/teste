<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="HeaderTopV2.ascx.cs" Inherits="HeaderTopV2" %>

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
<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max clearPadding head-v2">
    <div class="col-xs-9 col-sm-6 col-md-4 col-lg-4 clearPadding head-v2-user">
        <div class="col-xs-1 col-sm-2 col-md-2 col-lg-2 clearPadding">
            <img id="imgTop" src="<%$ebFile:~/Content/currenttheme/images/user-icon.png%>" alt="" class="img-user-v2 img-thumbnail img-circle img-user-left" runat="server" />
        </div>
        <div class="panel-user-data col-xs-11 col-sm-10 col-md-10 col-lg-10 clearPadding">
            <h5 class="overflowEllipsis welcomeMessage"><asp:Literal ID="litClientNameTop" runat="server"></asp:Literal></h5>
        </div>
        <div class="clearBoth"></div>
    </div>
    <div class="col-xs-6 col-sm-6 col-md-4 col-lg-3 clearPadding head-var">
        <div class="mail-box col-lg-3 col-md-2 clearPadding hidden-xs hidden-sm">
            <div class="box-header">
                <asp:LinkButton ID="lkbMessages" runat="server" CssClass="image-container" OnClick="lkbMessages_Click">
                    <div class="mail">
                        <asp:Label ID="lblMessagesNumber" CssClass="badge" Text="4" runat="server"></asp:Label>
                    </div>
                </asp:LinkButton>
            </div>
        </div>
        <div class="text-center text-small noprint langSelector marginTablet col-lg-9 col-md-10 clearPadding">
            <asp:Repeater ID="rptVariations" OnItemDataBound="rptVariations_ItemDataBound" runat="server">
                <HeaderTemplate>
                </HeaderTemplate>
                <ItemTemplate>
                    <a id="aVariation" class="a-primary" href="#" onclick="eBankit.Presentation.ChangeLanguage('en');return false;" runat="server"></a>
                    <span id="spanSeparator" class="line-separator" runat="server"></span>
                </ItemTemplate>
            </asp:Repeater>
             <div class="clearBoth"></div>
        </div>
        <div class="clearBoth"></div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-4 col-lg-5 clearPadding">
        <div class="brandlogo metro" onclick="eBankit.Presentation.HomePage();">
            <img class="logo img-responsive" src="<%=   eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("header/ico_logo_header.png"),eBankit.Common.Sites.Utils.CacheVersionKey.Image) %>" alt="" />
            <img class="logo-print hidden" src="<%=     eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("header/ATLDirecto.png"),eBankit.Common.Sites.Utils.CacheVersionKey.Image) %>" alt="" />
        </div>
    </div>
    <div class="clearBoth"></div>
    <it:LoginControl ID="lgnUser" runat="server" />
</div>
