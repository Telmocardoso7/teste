<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="ProductList.aspx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.ProductList" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="TransactionFeaturedContent">
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("accountOpening.css".ResolveModuleCssUrl(true), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</asp:Content>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="TransactionMainContent">
    <asp:HiddenField ID="MasterConsentId" runat="server" />
    <asp:HiddenField ID="MasterConsentIsMandatory" runat="server" />
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro">
        <h3 class="head head-top">
            <asp:Literal ID="ltrProductListTitle" runat="server" Text="<%$FrontEndResources:AccountOpening,ProductListTitle %>"></asp:Literal>
        </h3>
        <div>
            <span>
                <asp:Literal ID="ltrProductListDescription" runat="server" Text="<%$FrontEndResources:AccountOpening,ProductListDescription %>"></asp:Literal></span>
        </div>
    </div>
    <div class="validate-delegates-warning">
        <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
    </div>
    <asp:Panel runat="server" ID="ProductListBodyContent">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max accountOpening-content">
            <div id="consentContainer" runat="server" visible="false">
                <it:genericconsentcontrol id="accountOpeningConsentId" runat="server"></it:genericconsentcontrol>
            </div>
            <div id="productList" runat="server" visible="false" style="margin-top:40px;">
                <asp:Repeater ID="rptProducts" runat="server" OnItemDataBound="rptProducts_ItemDataBound">
                    <ItemTemplate>
                        <div id="productItem" class="col-xs-12 no-padding product-item-container product-with-actions" runat="server">
                            <div class="overlay-product"></div>
                            <div class="col-xs-12 clearPadding product-list-item">
                                <div class="col-xs-12 product-item-content">
                                    <h3 class="col-xs-12 col-sm-8">
                                        <asp:Literal ID="ltrProductTitle" Text="<%$FrontEndResources:AccountOpening,ProductListPlaceholderTitle%>" runat="server"></asp:Literal></h3>
                                    <span class="col-xs-12 col-sm-8">
                                        <asp:Literal ID="ltrProductDescription" Text="<%$FrontEndResources:AccountOpening,ProductListPlaceholderDescription%>" runat="server"></asp:Literal></span>
                                    <div class="col-xs-12 product-conditions-link">
                                        <asp:HyperLink ID="linkProductConditions" runat="server" Text="<%$FrontEndResources:AccountOpening,ProductConditionsLink %>" Target="_blank" rel="noopener noreferrer"></asp:HyperLink>
                                    </div>
                                    <div class="col-xs-12 col-sm-4 btn-more">
                                        <asp:Button ID="btnMore" CssClass="btn btn-default btn-see-more" Text="<%$FrontEndResources:AccountOpening,ShowMoreBtn %>" UseSubmitBehavior="false" runat="server" OnClientClick="return false;" />
                                    </div>
                                    <div class="col-xs-12 col-sm-4 btn-open">
                                        <asp:HyperLink ID="btnOpen" Text="<%$FrontEndResources:AccountOpening,SelectProductBtn %>" UseSubmitBehavior="false" runat="server" />
                                    </div>
                                    
                                </div>
                            </div>
                            <div id="contentSeeMore" class="col-xs-12 more-info collapsed-content" runat="server">
                                <span>
                                    <asp:Literal ID="ltrPlaceholderSeeMore" Text="<%$FrontEndResources:AccountOpening,ProductListPlaceholderContentSeeMore%>" runat="server"></asp:Literal></span>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("AccountOpening/product-list.js".ResolveModuleJsUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
        <script type="text/javascript">
        eBankit.productList.ConfirmTitle = '<%=eBankit.Common.Globalization.Translate.GetJSTransactionString("AccountOpening","ProcessExistsTitle").Replace(System.Environment.NewLine, "<br>") %>';
        eBankit.productList.ConfirmMsg = '<%=eBankit.Common.Globalization.Translate.GetJSTransactionString("AccountOpening","ProcessExistsDescription").Replace(System.Environment.NewLine, "<br>") %>';
        eBankit.productList.ConfirmButton = '<%=eBankit.Common.Globalization.Translate.GetJSTransactionString("AccountOpening","ProcessExistsConfirmButton") %>';
        eBankit.productList.CancelButton = '<%=eBankit.Common.Globalization.Translate.GetJSTransactionString("AccountOpening","ProcessExistsCancelButton") %>';
        eBankit.productList.ShowMoreBtn = '<%=eBankit.Common.Globalization.Translate.GetJSTransactionString("AccountOpening","ShowMoreBtn") %>';
        eBankit.productList.ShowLessBtn = '<%=eBankit.Common.Globalization.Translate.GetJSTransactionString("AccountOpening","ShowLessBtn") %>';
        </script>
    </asp:Panel>
</asp:Content>




