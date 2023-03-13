<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="CustomPage.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Security.Transactions.CustomPage" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="TransactionFeaturedContent">
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("bootstrap.editable.css".ResolveThirdPartyCssUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("jquery.editable.js".ResolveJsUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>

    <section class="featured col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max noPadding">
        <div class="bs-reduced metro">
            <div class="fullWidth spacer10"></div>
            <hgroup class="title">
                <h3 class="head head-top">
                    <asp:Literal ID="lbPageTitle" Text="<%$FrontEndResources:Custom,Title%>" runat="server"></asp:Literal>
                </h3>
                <h3><%: SubTitle %></h3>
            </hgroup>
            <div class="clearBoth"></div>
        </div>
    </section>
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="TransactionMainContent">
    <asp:PlaceHolder ID="phHeader" runat="server"></asp:PlaceHolder>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <div class="message-custom-page">
                <input onchange="changePhotoSessiion();" style="display: none" type="image" id="inputHiddenImg" runat="server" />
                <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:PlaceHolder ID="phSelector" runat="server"></asp:PlaceHolder>
    <asp:UpdatePanel ID="upCustomerImage" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div id="ImgPanel" class="fullWidth noFloatOfHidden landingAccountContainer clearPadding paddingTop20 paddingBottom20 bottomBorderInfoTopMessage" runat="server">
                <div class="info-bottom-text col-lg-8 col-max">
                    <ul id="customPageLi" class="nav nav-tabs nav-favsCustom customPageTabPers panel-user-top" runat="server">
                        <li id="imageLi" class="hidden-panel paddingRight5">
                            <a href="#image" data-toggle="tab" onclick="changePhoto(1)" class="imageLi visibilityHidden"></a>
                        </li>
                        <li id="favoritLi" class="hidden-panel paddingRight5">
                            <a href="#favorits" data-toggle="tab" onclick="changePhoto(2)" class="favoritLi visibilityHidden"></a>
                        </li>
                        <li id="accountLi" class="hidden-panel paddingRight5">
                            <a href="#customProducts" data-toggle="tab" onclick="changePhoto(4)" class="accountLi visibilityHidden"></a>
                        </li>
                        <li id="Li2" class="paddingRight12 flLeft">
                            <img id="imgTop" enableviewstate="false" src="<%$ebFile:~/Content/currenttheme/images/user-icon.png%>" alt="" class="img-user img-thumbnail img-circle img-user-left" runat="server" />
                        </li>
                        <li id="Li1" class="flLeft percWidth70">
                            <div class="panel-user-data transparentBg clearPadding paddintTop40 paddingRight20 paddingLeft10">
                                <h5 class="overflowEllipsis welcomeMessage">
                                    <asp:Literal ID="litClientNameTop" runat="server"></asp:Literal></h5>
                                <p class="pull-bottom field-col-3 overflowEllipsis lastAcess">
                                    <asp:Label ID="lblLastAccessTop" Text="" runat="server" class="visibilityHidden"></asp:Label>
                                </p>
                            </div>
                        </li>
                    </ul>
                    <div class="clearBoth"></div>
                    <div>
                        <asp:Label ID="lbListDescription" Text="<%$FrontEndResources:TRX00802,PreviewImageDescription %>" CssClass="infoTopMessage" runat="server"></asp:Label>
                    </div>
                </div>
            </div>

            <div class="clearBoth"></div>

            <div class="col-xs-12 col-sm-10 content-body fullWidth">
                <section>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-left clearPadding">
                        <div id="myTabContent" class="tab-content" runat="server">
                            <div runat="server" class="tab-pane" id="image">
                                <div class="metro info-bottom-text marginTop15 marginBottom15"></div>
                                <div id="photoPanel" class="photoPanel" draggable="true" ondragstart="OnDragStart" ondrop="OnDrop" runat="server">
                                    <asp:Label ID="btnSelectFile" Text="" ToolTip="<%$FrontEndResources:CustomPage,UploadNewPicture %>" AssociatedControlID="ucAttachUploader" CssClass="photoUploadPreviewContainer" runat="server">
                                        <img id="imgUser" enableviewstate="false" alt="<%$FrontEndResources:CustomPage,UploadNewPicture %>" src="<%$ebFile:~/Content/currenttheme/images/profile_picture.png%>" class="percMarginTop7 percMarginBottom7" onclick="OpenDialog()" runat="server" />
                                    </asp:Label>
                                    <asp:HiddenField ID="imgUserHidden" runat="server" />
                                </div>
                                <div class="hidden-panel">
                                    <asp:FileUpload ID="ucAttachUploader" EnableViewState="false" CssClass="rpt-btnimg-add" runat="server" ClientIDMode="Predictable" />
                                    <asp:HiddenField ID="hiddenField" EnableViewState="false" runat="server" />
                                    <asp:Button ID="invisibleBtnShowError" EnableViewState="false" runat="server" OnClick="btnShowErrorMessage" />
                                </div>

                                <div class="imgEditCenter-wrapper hidden-panel">
                                    <div class="metro info-bottom-text marginLeft15 noMarginTop">
                                        <asp:Label ID="lblBottomInfo" Text="<%$FrontEndResources:TRX00802,PreviewImageDescription %>" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-xs-12 field_v2 fileUp-container">
                                        <div id="txtFileURL" class="centerField-wrapper fullWidth noPaddingRight">
                                            <div class="centerField-margins marginRight125">
                                                <it:TextBoxControl_v2 ID="txtFileInput" CssClass="field field-block" ShowLabel="false" Enabled="false" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearBoth"></div>
                            </div>

                            <div class="clearBoth"></div>
                            <%-- Favorits Container --%>
                            <div runat="server" class="favorits-panel tab-pane metro sortable-list ui-sortable" id="favorits">
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 paddingTop10 paddingLeft10 paddingBottom10 paddingRight10">
                                    <div class="metro login-info-bottom autoHeight"></div>
                                    <div class="clearBoth"></div>
                                </div>

                                <div class="lineContainer noBorder desktop-only tablet-only autoHeight paddingTop11 paddingBottom11" id="divFavoritsHeader" runat="server">
                                    <div class="listItemContainer col-lg-8 col-max noPadding">
                                        <section>
                                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 content-accounts noPadding desktop-only tablet-only clearPadding">
                                                <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 content-accounts paddingHardTopBottom noPaddingLeftRight">
                                                    <h3 class="accountNumber account-edit noBorderMargin fontSize17">
                                                        <asp:Literal ID="litFavHeader" Text="<%$FrontEndResources:Custom,Favorite%>" runat="server"></asp:Literal>
                                                    </h3>
                                                </div>

                                                <div class="accountNumber col-xs-3 col-sm-3 col-md-3 col-lg-3s col-principal paddingHardTopBottom alignCenter visible-lg visible-md">
                                                    <asp:Literal ID="litTypeHeader" Text="<%$FrontEndResources:Custom,FavoriteType%>" runat="server"></asp:Literal>
                                                </div>

                                                <div class="accountNumber col-xs-4 col-sm-3 col-md-4 col-lg-4 col-principal paddingHardTopBottom noPaddingLeftRight alignCenter">
                                                    <div class="accountNumber col-xs-3 col-sm-3 col-md-3 col-lg-3 noPaddingLeftRight alignCenter">
                                                        <asp:Literal ID="litEditHeader" Text="<%$FrontEndResources:Custom,EditFavorite%>" runat="server"></asp:Literal>
                                                    </div>

                                                    <div class="accountNumber col-xs-3 col-sm-3 col-md-3 col-lg-3 noPaddingLeftRight alignCenter">
                                                        <asp:Literal ID="litUseFav" Text="<%$FrontEndResources:Custom,UseFavorite%>" runat="server"></asp:Literal>
                                                    </div>

                                                    <div class="accountNumber col-xs-3 col-sm-3 col-md-3 col-lg-3 noPaddingLeftRight alignRight">
                                                        <asp:Literal ID="litShareHeader" Text="<%$FrontEndResources:Custom,ShareFavouritHeader%>" runat="server"></asp:Literal>
                                                    </div>

                                                    <div class="accountNumber col-xs-3 col-sm-3 col-md-3 col-lg-3 noPaddingLeftRight alignRight">
                                                        <asp:Literal ID="litVisivelHeader" Text="<%$FrontEndResources:Custom,VisibleAccount%>" runat="server"></asp:Literal>
                                                    </div>

                                                </div>

                                                <div class="accountNumber col-xs-1 col-sm-1 col-md-1 col-lg-1 paddingHardTopBottom noMargin  alignCenter">
                                                    <asp:Literal ID="litDeleteFav" Text="<%$FrontEndResources:Custom,DeleteFavorite%>" runat="server"></asp:Literal>
                                                </div>
                                                <div class="accountNumber col-xs-1 col-sm-1 col-md-1 col-lg-1 paddingHardTopBottom alignRight">
                                                    <asp:Literal ID="litOrderFav" Text="<%$FrontEndResources:Custom,Order%>" runat="server"></asp:Literal>
                                                </div>
                                                <div class="clearBoth"></div>
                                            </div>
                                        </section>
                                    </div>
                                </div>

                                <asp:Repeater ID="rptFavorits" runat="server" EnableViewState="true" OnItemDataBound="rptFavorits_ItemDataBound">
                                    <HeaderTemplate>
                                        <ul id="ulSortableFavs">
                                    </HeaderTemplate>
                                    <ItemTemplate>

                                        <li id="liFavorit" runat="server">
                                            <div class="lineContainer">
                                                <div class="listItemContainer col-lg-8 col-max paddingHardTopBottom noPaddingLeftRight">
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 noPadding clearPadding">
                                                        <div class="col-xs-12 col-sm-6 col-md-3 col-lg-3 noPaddingLeft">
                                                            <div class="landingAccountDescription noMargin marginRight10">
                                                                <img enableviewstate="false" id="imgFavorit" src="<%$ebFile:~/Content/currenttheme/images/operations/unknown.png%>" alt="" class="img-thumbnail img-circle width50 negMarginLeft2 imgFavOperation" runat="server" />
                                                                <img id="imgSharedFav" src="<%$ebFile:~/Content/currenttheme/images/icon/action/corporate/action-shared.png%>" alt="" runat="server" class="imgShareIconAbove"/>
                                                            </div>
                                                            <div class="custom-favorit-first negMarginTop5">
                                                                <h3 class="text-responsive-1 paddingBottom3">
                                                                    <asp:Literal ID="litName" Text="manuel" runat="server"></asp:Literal>
                                                                </h3>
                                                                <p class="accountName favoritSharedOwnerName">
                                                                    <asp:Literal ID="litOwnerName" Text="Username of the owner" runat="server"></asp:Literal>
                                                                </p>

                                                            </div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 visible-lg visible-md">
                                                            <div class="favorit-first negMarginTop5">
                                                                <h3 class="favorit-center accountName favouritTypeName paddingBottom2">
                                                                    <asp:Literal ID="litTypeValue" runat="server"></asp:Literal>
                                                                </h3>
                                                                <p class="accountName favoritSharedOwnerName">
                                                                    <asp:Literal ID="litAmount" runat="server"></asp:Literal>
                                                                </p>
                                                            </div>

                                                        </div>
                                                        <div class="col-xs-8 col-sm-3 col-md-4 col-lg-4 clearPadding alignCenter">
                                                            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 clearPadding alignCenter" runat="server" id="divBtnEditFav">
                                                                <a id="btnEdit" href="#" runat="server" class="btnCustomPage">
                                                                    <%--<img id="img2" class="customImgEditFavorite" alt="<%$FrontEndResources:Custom,EditFavorite%>" runat="server" />--%>
                                                                    <div enableviewstate="false" id="img2" runat="server" class="customImgEditFavorite">
                                                                    </div>
                                                                </a>
                                                            </div>

                                                            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 clearPadding alignCenter" runat="server" id="deivBtnDetailFav">
                                                                <a id="btnFavDetail" href="#" runat="server" class="btnCustomPage">
                                                                    <div enableviewstate="false" id="imgDetailFav" runat="server" class="customImgDetailFavorite">
                                                                    </div>
                                                                </a>
                                                            </div>

                                                            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 clearPadding alignCenter">
                                                                <a id="btnUser" href="#" runat="server" class="btnCustomPage">
                                                                    <%--<img id="img3" class="customImgUserFavorite" alt="<%$FrontEndResources:Custom,UseFavorite%>" runat="server" />--%>
                                                                    <div enableviewstate="false" id="img3" runat="server">
                                                                    </div>
                                                                </a>
                                                            </div>
                                                            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 operationitemShare clearPadding" id="divSharedColumn" runat="server">
                                                                <label class="onoffswitch pull-right marginTop15">
                                                                    <input id="cbkShareFav" runat="server" type="checkbox" class="onoffswitch-checkbox" value="1" />
                                                                    <asp:Label ID="lblShareDescription" runat="server" class="onoffswitch-label">
                                                                        <span class="onoffswitch-inner"></span>
                                                                        <span class="onoffswitch-switch"></span>
                                                                        <span class="check marginRight10 hidden-panel"></span>
                                                                        <div class="onoffswitch-divOn"></div>
                                                                        <div class="onoffswitch-divOff"></div>
                                                                    </asp:Label>
                                                                </label>
                                                            </div>
                                                            

                                                            <%-- End use favorit --%>
                                                            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 operationitem clearPadding">
                                                                <label class="onoffswitch pull-right marginTop15">
                                                                    <input id="ckbModule" runat="server" type="checkbox" class="onoffswitch-checkbox" value="1" />
                                                                    <asp:Label ID="lblDescription" runat="server" class="onoffswitch-label">
                                                                        <span class="onoffswitch-inner"></span>
                                                                        <span class="onoffswitch-switch"></span>
                                                                        <span class="check marginRight10 hidden-panel"></span>
                                                                        <div class="onoffswitch-divOn"></div>
                                                                        <div class="onoffswitch-divOff"></div>
                                                                    </asp:Label>
                                                                </label>
                                                            </div>
                                                        </div>
                                                        <div class="accountNumber col-xs-3 col-sm-1 col-md-1 col-lg-1 alignCenter noMargin ">
                                                            <a id="btnRemove" href="#" runat="server" class="btnCustomPage">
                                                                <%--<img enableviewstate="false" id="img1" class="customImgRemoveFavorite" runat="server" />--%>
                                                                <div enableviewstate="false" id="img1" runat="server" class="customImgRemoveFavorite">
                                                                </div>
                                                            </a>
                                                        </div>
                                                        <div class="col-xs-3 col-sm-1 col-md-1 col-lg-1 desktop-only tablet-only alignRight">
                                                            <span class="tableChangePositionButton"></span>
                                                        </div>
                                                        <div class="clearBoth"></div>
                                                    </div>
                                                </div>
                                                <div class="clearBoth"></div>
                                            </div>
                                        </li>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul>
                                        <div class="clearBoth"></div>
                                    </FooterTemplate>
                                </asp:Repeater>
                            </div>
                            <!--End Favorits Container -->
                            <div class="clearBoth"></div>
                            <!-- DIV PRODUCTS -->
                            <div id="customProducts" class="custom-accounts-panel" runat="server">
                                <input type="hidden" id="inputNameToEditHidden" value='<%= hdnProductToEditName.ClientID%>' />
                                <input type="hidden" id="inputNumberToEditHidden" value='<%= hdnProductToEditNumber.ClientID%>' />
                                <div runat="server" id="headerSuccessMessage">
                                    <section class="grayContainer content-message metro">
                                        <div class="col-lg-8 col-max">
                                            <div id="MainContent_TransactionMainContent_divMessage" class="alert alert-success fade in">
                                                <div class="div-icon-success_v3">
                                                    <i class="icon-checkmark"></i>
                                                </div>
                                                <h3 class="alert-heading">
                                                    <asp:Label runat="server" ID="lbSuccessAlert" Text="<%$FrontEndResources:CustomiseProducts,SuccessMessage %>" />
                                                </h3>

                                            </div>
                                        </div>
                                    </section>
                                </div>
                                <div class="headerContainer">
                                    <div class="info-bottom-text col-lg-8 col-max heavyMargin">
                                        <asp:Label ID="lbAccountSubtitle" Text="<%$FrontEndResources:CustomiseProducts,CustomiseProductsInfoMessage %>" CssClass="infoTopCustomProductsMessage" runat="server"></asp:Label>
                                    </div>
                                </div>



                                <div class="productsSearchContainer">
                                    <div class="metro info-bottom-text col-lg-8 col-max heavyMargin">
                                        <div class="lblDivCustomProductsCounterMsg">
                                            <asp:Label ID="lblCustomiseProductsMessageCounter" Text="<%$FrontEndResources:CustomiseProducts,CustomiseProductsInfoCounter %>" runat="server"></asp:Label>
                                        </div>
                                        <div class="searchInputDiv">
                                            <asp:TextBox ID="inputSearchProducts" runat="server"></asp:TextBox>
                                            <asp:LinkButton ID="searchIcon" runat="server" OnClick="searchIcon_Click" CssClass="searchIcon" OnClientClick="return ValidateSearch(this);return false;"><i class="icon icon-ok"></i></asp:LinkButton>

                                        </div>
                                        <div class="pull-right">
                                            <asp:DropDownList ID="ddlSortProducts" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlSortProducts_SelectedIndexChanged"></asp:DropDownList>

                                        </div>
                                    </div>

                                </div>

                                <!-- EMPTY CONTAINER -->

                                <div id="ProductsEmptyContainer" runat="server" visible="false" class="custom-products-empty-container">
                                    <div class="text-center col-xs-12 empty-icon"></div>
                                    <div class="col-xs-12 text-center empty-message">
                                        <asp:Literal ID="litCustomProductsEmptyMessage" runat="server"></asp:Literal>
                                    </div>

                                </div>

                                <!-- EMPTY SEARCH CONTAINER -->
                                <div id="ProductsSearchResultContainer" runat="server" visible="false" class="custom-products-empty-container">
                                    <div class="col-xs-12 text-center empty-message empty-search-message">
                                        <asp:Literal ID="litCustomProductsSearchEmptyMessage" Text="<%$FrontEndResources:CustomiseProducts,CustomiseProductsSearchEmptyresults%>" runat="server"></asp:Literal>
                                    </div>
                                </div>

                                <!-- DIV ACCOUNTS -->
                                <div id="divAccounts" class="custom-accounts-panel col-lg-8 col-max" runat="server">



                                    <div class="clearBoth marginBottom10"></div>

                                    <asp:Repeater ID="rptAccounts" runat="server" OnItemDataBound="rptAccounts_ItemDataBound">
                                        <HeaderTemplate>
                                            <div class=" tab-pane metro sortable-list ui-sortable">
                                                <div class="lineContainer noBorder">
                                                    <div class="listItemContainer col-lg-8 col-max noPadding">
                                                        <section>
                                                            <div class="desktop-only tablet-only col-xs-12 col-sm-12 col-md-12 col-lg-12 content-accounts noPadding">
                                                                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 content-accounts paddingHardTopBottom noPaddingLeftRight">

                                                                    <asp:Literal ID="litProductHeader" Text="<%$FrontEndResources:CustomiseProducts,CustomiseProductsAccountsHeader%>" runat="server"></asp:Literal>

                                                                </div>
                                                                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 content-accounts paddingHardTopBottom noPaddingLeftRight">
                                                                </div>
                                                                <div class="accountNumber col-xs-2 col-sm-2 col-md-2 col-lg-2 col-principal paddingHardTopBottom noPaddingLeftRight alignCenter">
                                                                    <asp:Literal ID="litPrincipalHeader" Text="<%$FrontEndResources:Custom,MainAccount%>" runat="server"></asp:Literal>
                                                                </div>
                                                                <div class="accountNumber col-xs-3 col-sm-3 col-md-3 col-lg-3  paddingHardTopBottom noPaddingLeftRight alignCenter">
                                                                    <asp:Literal ID="litVisivelHeader" Text="<%$FrontEndResources:Custom,VisibleAccount%>" runat="server"></asp:Literal>
                                                                </div>
                                                                <div class="accountNumber col-xs-1 col-sm-1 col-md-1 col-lg-1 paddingHardTopBottom noPaddingLeftRight alignCenter" id="changePositionBtnHeader">
                                                                    <asp:Literal ID="litOrderAcc" Text="<%$FrontEndResources:Custom,Order%>" runat="server"></asp:Literal>
                                                                </div>

                                                                <div class="clearBoth"></div>
                                                            </div>
                                                        </section>
                                                    </div>
                                                </div>

                                                <ul id="accountName">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <li>
                                                <div class="lineContainer">
                                                    <div class="listItemContainer col-lg-8 col-max paddingHardTopBottom noPaddingLeftRight">
                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 noPadding divRow" id="divRow" runat="server" style="height: 94px; display: flex; align-items: center;">
                                                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 noPadding">
                                                                <div class="productCustomisationName">
                                                                    <asp:Literal ID="LitAccountNickname" runat="server"></asp:Literal>
                                                                </div>
                                                                <div class="productCustomisationNumber">
                                                                    <asp:Literal ID="litAccountName" runat="server"></asp:Literal>
                                                                </div>
                                                                <div class="productCustomisationNumber">
                                                                    <asp:Literal ID="litAccountNumber" runat="server"></asp:Literal>
                                                                </div>

                                                            </div>
                                                            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 noPadding">
                                                                <div class="btnEditProduct">
                                                                    <div enableviewstate="false" id="btnEditProduct" runat="server" class="customEditProductImage" tabindex="0" onclick="openEditRow(this)" onkeydown="openEditRowKeyPress(this)" onkeypress="openEditRowKeyPress(this)"></div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 alignCenter marginTop20" id="divMainAccount" runat="server">
                                                                <a href="#" class="img-principal" enableviewstate="false" id="imgPrincipal" alt="" runat="server" />
                                                            </div>
                                                            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 noPadding">


                                                                <div id="visibleAccountContrainer" runat="server" class="hasLabelPhone col-xs-12 col-sm-3 col-md-3 col-lg-2 operationitemaccount noPaddingLeftRight" style="width: 60%; margin: 0 auto;">
                                                                    <label class="onoffswitch accountNumber">
                                                                        <input id="ckbAccount" runat="server" type="checkbox" class="onoffswitch-checkbox" value="1" />
                                                                        <asp:Label ID="lblDescription" runat="server" class="onoffswitch-label">
                                                                        <span class="onoffswitch-inner"></span>
                                                                        <span class="onoffswitch-switch"></span>
                                                                        <span class="check marginRightHard"></span>
                                                                        <div class="onoffswitch-divOn"></div>
                                                                        <div class="onoffswitch-divOff"></div>
                                                                        </asp:Label>
                                                                    </label>
                                                                </div>

                                                            </div>
                                                            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 noPaddingLeftRight alignCenter desktop-only tablet-only orderdiv" id="changePositionBtnData" runat="server">
                                                                <span class="tableChangePositionButton" tabindex="0" id="tableChangePositionButton" runat="server"></span>
                                                            </div>
                                                            <div class="clearBoth"></div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 singleEditRow" id="divRowEdit" runat="server" style="background-color: rgba(239, 123, 48, 0.2); height: 94px; display: none;">
                                                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 noPadding">
                                                                <div class="editInputDiv">
                                                                    <input type="text" id="inputEditProductName" runat="server" />
                                                                    <span class="clearIcon" tabindex="0" alt=""></span>
                                                                    <asp:HiddenField ID="hdnProductNameEdit" runat="server" />
                                                                    <asp:HiddenField ID="hdnProductNumberEdit" runat="server" />
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 noPadding">
                                                                <div class="editProductSingleButtons">
                                                                    <div class="btn btn-default btnSingleCancel" id="btnSingleCancel" runat="server" tabindex="0"></div>

                                                                    <it:LinkButtonControl ID="btnSingleSave" runat="server" Text="<%$FrontEndResources:Custom,btnSave%>" Enabled="true" CssClass="btn btn-action" ActionType="None" CustomOnClientClick="saveSingleEdit(this)" OnClick="btnSingleSaveAccounts_Click"></it:LinkButtonControl>
                                                                </div>
                                                            </div>


                                                            <div class="clearBoth"></div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="clearBoth"></div>
                                            </li>
                                        </ItemTemplate>

                                        <FooterTemplate>
                                            </ul>
                                        </div>
                                        <div class="clearBoth"></div>
                                        </FooterTemplate>
                                    </asp:Repeater>


                                </div>

                                <!-- OTHER PRODUCTS -->
                                <div id="divOtherProducts" class="custom-accounts-panel col-lg-8 col-max" runat="server">



                                    <div class="clearBoth marginBottom10"></div>
                                    <asp:Repeater ID="rptOtherProducts" runat="server" OnItemDataBound="rptOtherProducts_ItemDataBound">
                                        <HeaderTemplate>
                                            <div class=" tab-pane metro sortable-list ui-sortable">
                                                <div class="lineContainer noBorder">
                                                    <div class="listItemContainer col-lg-8 col-max noPadding">
                                                        <section>
                                                            <div class="desktop-only tablet-only col-xs-12 col-sm-12 col-md-12 col-lg-12 content-accounts noPadding">
                                                                <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 content-accounts paddingHardTopBottom noPaddingLeftRight">

                                                                    <asp:Literal ID="litProductHeader" Text="<%$FrontEndResources:Custom,Account%>" runat="server"></asp:Literal>

                                                                </div>
                                                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 content-accounts paddingHardTopBottom noPaddingLeftRight">
                                                                </div>
                                                                <div class="accountNumber col-xs-3 col-sm-3 col-md-3 col-lg-3 paddingHardTopBottom noPaddingLeftRight alignCenter">
                                                                    <asp:Literal ID="litVisivelHeader" Text="<%$FrontEndResources:Custom,VisibleAccount%>" runat="server"></asp:Literal>
                                                                </div>
                                                                <div class="accountNumber col-xs-2 col-sm-2 col-md-2 col-lg-2 paddingHardTopBottom noPaddingLeftRight alignCenter">
                                                                    <asp:Literal ID="litOrderAcc" Text="<%$FrontEndResources:Custom,Order%>" runat="server"></asp:Literal>
                                                                </div>

                                                                <div class="clearBoth"></div>
                                                            </div>
                                                        </section>
                                                    </div>
                                                </div>

                                                <ul id="accountName">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <li>
                                                <div class="lineContainer">
                                                    <div class="listItemContainer col-lg-8 col-max paddingHardTopBottom noPaddingLeftRight">
                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 noPadding" id="divRow" runat="server" style="height: 94px; display: flex; align-items: center;">
                                                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4 noPadding">
                                                                <div class="productCustomisationName">
                                                                    <asp:Literal ID="litProductNickname" runat="server"></asp:Literal>
                                                                </div>
                                                                <div class="productCustomisationNumber">
                                                                    <asp:Literal ID="litProductName" runat="server"></asp:Literal>
                                                                </div>
                                                                <div class="productCustomisationNumber">
                                                                    <asp:Literal ID="litProductNumber" runat="server"></asp:Literal>
                                                                </div>

                                                            </div>
                                                            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 noPadding">
                                                                <div class="btnEditProduct">
                                                                    <div enableviewstate="false" id="btnEditProduct" runat="server" class="customEditProductImage" tabindex="0" onclick="openEditRow(this)" onkeypress="openEditRowKeyPress(this)" onkeydown="openEditRowKeyPress(this)"></div>
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 noPadding">


                                                                <div id="visibleAccountContrainer" runat="server" class="hasLabelPhone col-xs-12 col-sm-3 col-md-3 col-lg-2 operationitemaccount noPaddingLeftRight" style="width: 60%; margin: 0 auto;">
                                                                    <label class="onoffswitch accountNumber">
                                                                        <input id="ckbAccount" runat="server" type="checkbox" class="onoffswitch-checkbox" value="1" />
                                                                        <asp:Label ID="lblDescription" runat="server" class="onoffswitch-label">
                                                                        <span class="onoffswitch-inner"></span>
                                                                        <span class="onoffswitch-switch"></span>
                                                                        <span class="check marginRightHard"></span>
                                                                        <div class="onoffswitch-divOn"></div>
                                                                        <div class="onoffswitch-divOff"></div>
                                                                        </asp:Label>
                                                                    </label>
                                                                </div>

                                                            </div>
                                                            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 noPaddingLeftRight alignCenter desktop-only tablet-only orderdiv" id="changePositionBtnData" runat="server">
                                                                <span class="tableChangePositionButton" id="tableChangePositionButton" tabindex="0" runat="server"></span>
                                                            </div>
                                                            <div class="clearBoth"></div>
                                                        </div>
                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 singleEditRow" id="divRowEdit" runat="server" style="background-color: rgba(239, 123, 48, 0.2); height: 94px; display: none;">
                                                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 noPadding">
                                                                <div class="editInputDiv">
                                                                    <input type="text" id="inputEditProductName" runat="server" />
                                                                    <span tabindex="0" class="clearIcon"></span>
                                                                    <asp:HiddenField ID="hdnProductNameEdit" runat="server" />
                                                                    <asp:HiddenField ID="hdnProductNumberEdit" runat="server" />
                                                                </div>
                                                            </div>
                                                            <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 noPadding">
                                                                <div class="editProductSingleButtons">
                                                                    <div class="btn btn-default btnSingleCancel" id="btnSingleCancel" runat="server" tabindex="0"></div>

                                                                    <it:LinkButtonControl ID="btnSingleSave" runat="server" Text="<%$FrontEndResources:Custom,btnSave%>" Enabled="true" ActionType="None" CssClass="btn btn-action" CustomOnClientClick="saveSingleEdit(this)" OnClick="btnSingleSaveOtherProducts_Click"></it:LinkButtonControl>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div class="clearBoth"></div>
                                            </li>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </ul>
                                        </div>
                                        <div class="clearBoth"></div>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                            <div class="clearBoth"></div>
                            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max noPadding" id="divSave" runat="server">
                                <it:FlowCommandsContainer ID="fcSaveImage" runat="server">
                                    <RightButtons>
                                        <it:LinkButtonControl ID="btnBack" runat="server" Text="<%$FrontEndResources:Custom,btnBack%>" Enabled="true" ActionType="Back" CustomCssClass="btn-default" OnClick="btnBack_Click"></it:LinkButtonControl>
                                        <it:LinkButtonControl ID="btnSave" runat="server" Text="<%$FrontEndResources:Custom,btnSave%>" Enabled="true" CssClass="btn btn-action" ActionType="None" OnClick="btnSave_Click" OnClientClick="var func = eBankit.Presentation.Custom.GetOperations();resetNumberSingleEditions();return func;"></it:LinkButtonControl>
                                    </RightButtons>
                                </it:FlowCommandsContainer>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
            <asp:HiddenField ID="hdnDdlValueSelected" runat="server" />
            <asp:HiddenField ID="hdnAccounts" runat="server" />


        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnUploadFileValidate" />
        </Triggers>

    </asp:UpdatePanel>
    <asp:Button ID="btnUploadFileValidate" CssClass="hidden-panel" runat="server" />
    <asp:HiddenField ID="hdnSelectedItems" runat="server" />
    <asp:HiddenField ID="hdnUnSelectedItems" runat="server" />
    <asp:HiddenField ID="hdnSelectedModules" runat="server" />
    <asp:HiddenField ID="hdnSelectedBenefs" runat="server" />
    <asp:HiddenField ID="hdnUnSelectedBenefs" runat="server" />
    <asp:HiddenField ID="hdnSelectedAccounts" runat="server" />
    <asp:HiddenField ID="hdnUnSelectedAccounts" runat="server" />
    <asp:HiddenField ID="hdnSelectedTab" runat="server" />
    <asp:HiddenField ID="hdnDefaultAccount" runat="server" />
    <asp:HiddenField ID="hdnAccountToChange" runat="server" />
    <asp:HiddenField ID="hdnNewName" runat="server" />
    <asp:HiddenField ID="hdnGroupToChange" runat="server" />
    <asp:HiddenField ID="hdnAccountsOrder" runat="server" />
    <asp:HiddenField ID="hdnBeneficiariesOrder" runat="server" />
    <asp:HiddenField ID="hdnFavoritsOrder" runat="server" />
    <asp:HiddenField ID="hdnBeneficiaryId" runat="server" />
    <asp:HiddenField ID="hdnBeneficiaryType" runat="server" />
    <asp:HiddenField ID="hdnFavoritId" runat="server" />
    <asp:HiddenField ID="hdnFavoritType" runat="server" />
    <asp:HiddenField ID="hdnProductToEditName" runat="server" />
    <asp:HiddenField ID="hdnProductToEditNumber" runat="server" />
    <asp:HiddenField ID="hdnIsVirtualEntity" runat="server" />
    <asp:HiddenField ID="hdnDebitCardsOrder" runat="server" />
    <asp:HiddenField ID="hdnCrebitCardsOrder" runat="server" />
    <asp:HiddenField ID="hdnPrePaidCardsOrder" runat="server" />
    <asp:HiddenField ID="hdnTermDepositsOrder" runat="server" />
    <asp:HiddenField ID="hdnLoansOrder" runat="server" />
    <asp:HiddenField ID ="hdnSharedFav" runat="server" />




    <asp:Button ID="btnGotoEdit" CssClass="hidden-panel" runat="server" />
    <asp:Button ID="btnDelete" CssClass="hidden-panel" runat="server" />
    <asp:Button ID="btnGotoFavoritEdit" CssClass="hidden-panel" runat="server" />    
    <asp:Button ID="btnFavoritDelete" CssClass="hidden-panel" runat="server" />
    <asp:Button ID="btnSavePreferences" CssClass="hidden-panel" runat="server" />

    <asp:Button ID="btnGotoUse" CssClass="hidden-panel" runat="server" />
    <script type="text/javascript">



        var hdnIsVirtualEntity = $("#<%=hdnIsVirtualEntity.ClientID %>");
        var btnUploadFileValidate = "<%=btnUploadFileValidate.UniqueID %>";
        var hiddenField = $("#<%=hiddenField.ClientID %>");
        var ucAttachUploader = $("#<%=ucAttachUploader.ClientID %>");
        var hdnSelectedItems = $("#<%=hdnSelectedItems.ClientID %>");
        var hdnUnSelectedItems = $("#<%=hdnUnSelectedItems.ClientID %>");
        var hdnSelectedModules = $("#<%=hdnSelectedModules.ClientID %>");
        var hdnSelectedBenefs = $("#<%=hdnSelectedBenefs.ClientID %>");
        var hdnUnSelectedBenefs = $("#<%=hdnUnSelectedBenefs.ClientID %>");
        var hdnSelectedAccounts = $("#<%=hdnSelectedAccounts.ClientID %>");
        var hdnUnSelectedAccounts = $("#<%=hdnUnSelectedAccounts.ClientID %>");
        var hdnSelectedTab = $("#<%=hdnSelectedTab.ClientID %>");
        var hdnAccountToChange = $("#<%=hdnAccountToChange.ClientID %>");
        var hdnNewName = $("#<%=hdnNewName.ClientID %>");
        var hdnGroupToChange = $("#<%=hdnGroupToChange.ClientID %>");
        var hdnAccounts = $("#<%=hdnAccounts.ClientID %>");
        var hdnAccountsOrder = $("#<%=hdnAccountsOrder.ClientID %>");
        var hdnDebitCardsOrder = $("#<%=hdnDebitCardsOrder.ClientID %>");
        var hdnCrebitCardsOrder = $("#<%=hdnCrebitCardsOrder.ClientID %>");
        var hdnPrePaidCardsOrder = $("#<%=hdnPrePaidCardsOrder.ClientID %>");
        var hdnTermDepositsOrder = $("#<%=hdnTermDepositsOrder.ClientID %>");
        var hdnLoansOrder = $("#<%=hdnLoansOrder.ClientID %>");;
        var hdnBeneficiariesOrder = $("#<%=hdnBeneficiariesOrder.ClientID %>");
        var hdnFavoritsOrder = $("#<%=hdnFavoritsOrder.ClientID %>");
        var hdnDefaultAccount = $("#<%=hdnDefaultAccount.ClientID %>");
        var btnGotoFavoritEdit = "<%=btnGotoFavoritEdit.UniqueID %>";
        var hdnBeneficiaryId = $("#<%=hdnBeneficiaryId.ClientID %>");
        var hdnFavoritId = $("#<%=hdnFavoritId.ClientID %>");
        var hdnFavoritType = $("#<%=hdnFavoritType.ClientID %>");
        var hdnBeneficiaryType = $("#<%=hdnBeneficiaryType.ClientID %>");
        var btnGotoEditId = "<%=btnGotoEdit.UniqueID %>";    
        var btnDeleteId = "<%=btnDelete.UniqueID %>";
        var btnFavoritDeleteId = "<%=btnFavoritDelete.UniqueID %>";
        var btnSavePreferences = "<%=btnSavePreferences.UniqueID %>";
        var ulClass = $("#<%=customPageLi.ClientID %>");
        var hdnProductToEditName = $("#<%=hdnProductToEditName.ClientID %>");
        var hdnProductToEditNumber = $("#<%=hdnProductToEditNumber.ClientID %>");
        var hdnDdlValueSelected = $("#<%=hdnDdlValueSelected.ClientID %>");
        var hdnSharedFav = $("#<%=hdnSharedFav.ClientID %>");
        if (hdnIsVirtualEntity.val() === "false") {
            Sys.Application.add_load(allowSortable);
            Sys.Application.add_load(keyboarSortable);
        } else {
            $("#ulSortableFavs").sortable({
                containment: 'parent',
                //placeholder: "ui-state-highlight",
                start: function (event, ui) {
                    $(this).addClass("sortable-list-sel");
                },
                stop: function (e, ui) {
                    var items = new Array();
                    $(this).removeClass("sortable-list-sel");
                    $.map($(this).find('li'), function (el) {
                        //items.push($(el).index() + ':' + $("#" + el.id).attr("accountNumber"));
                        items.push($("#" + el.id).attr("favoritId"));
                    });
                    hdnFavoritsOrder.val(items.join(";"));
                }
            });
            $("#ulSortableFavs").disableSelection();
        }

        function keyboarSortable() {
            $("ul#accountName .tableChangePositionButton").keydown(function (e) {

                if (e.keyCode == 40) { /* Focus Down */
                    $(this).parent().parent().parent().parent().parent().insertAfter($(this).parent().parent().parent().parent().parent().next());


                } else if (e.keyCode == 38) { /* Focus Up */
                    $(this).parent().parent().parent().parent().parent().insertBefore($(this).parent().parent().parent().parent().parent().prev());

                }

                $(this).focus();
            });
        };


        METRO_AUTO_REINIT = true;


        function allowSortable() {

            $('a[id^="accountName_"]').each(

                function (index) {
                    var group = $(this).find('p').text().trim();
                    var name = $(this).text().replace(group, '').trim();
                    $(this).editable({
                        url: '/post',
                        type: 'account',
                        title: top.eBankit.Presentation.GetResource("AccountNameTitle"),
                        value: {
                            name: name
                        }
                        ,
                        validate: function (value) {
                            //var pattern = /^[a-zA-Z0-9 \(\)-]*$/;
                            //if ($.trim(value.name).length==0 || !pattern.test($.trim(value.name))) {
                            if ($.trim(value.name).length == 0) {
                                return top.eBankit.Presentation.GetResource("InvalidAccountName");
                            }
                        }
                    })
                }
            );

            $("#accountName").sortable({
                containment: 'parent',
                //placeholder: "ui-state-highlight",
                start: function (event, ui) {
                    $(this).addClass("sortable-list-sel");
                },
                stop: function (e, ui) {
                    var items = new Array();
                    $(this).removeClass("sortable-list-sel");

                    $.map($(this).find('li .onoffswitch.accountNumber input[type=checkbox]'), function (el) {
                        items.push(el.value);
                        //items.push($(el).index() + ':' + $("#" + el.id).attr("accountNumber"));
                        //items.push($("#" + el.id).attr("accountNumber"));
                    });
                    hdnDebitCardsOrder.val('');
                    hdnCrebitCardsOrder.val('');
                    hdnPrePaidCardsOrder.val('');
                    hdnTermDepositsOrder.val('');
                    hdnLoansOrder.val('');
                    //ProductTypeEnum - CURRENTACCOUNT->18;  DEBITCARD->3;  CREDITCARD->2; PREPAIDCARD->19;  TERMDEPOSIT->17;  LOAN->12
                    switch ($("#<%=ddlSortProducts.ClientID %>").val()) {
                        case "18"://CurrentAccount
                            hdnAccountsOrder.val(items.join(";"));
                            break;
                        case "3"://DebitCard
                            hdnDebitCardsOrder.val(items.join(";"));
                            break;
                        case "2"://CreditCard
                            hdnCrebitCardsOrder.val(items.join(";"));
                            break;
                        case "19": //PrePaidCard
                            hdnPrePaidCardsOrder.val(items.join(";"));
                            break;
                        case "17":
                        case "1"://TermDeposit/savingAccount
                            hdnTermDepositsOrder.val(items.join(";"));
                            break;
                        case "12"://Loan
                            hdnLoansOrder.val(items.join(";"));
                            break;
                    }

                }
            });
            $("#accountName").disableSelection();

            $("#ulSortableBenefs").sortable({
                containment: 'parent',
                //placeholder: "ui-state-highlight",
                start: function (event, ui) {
                    $(this).addClass("sortable-list-sel");
                },
                stop: function (e, ui) {
                    var items = new Array();
                    $(this).removeClass("sortable-list-sel");
                    $.map($(this).find('li'), function (el) {
                        //items.push($(el).index() + ':' + $("#" + el.id).attr("accountNumber"));
                        items.push($("#" + el.id).attr("beneficiaryId"));
                    });
                    hdnBeneficiariesOrder.val(items.join(";"));
                }
            });
            $("#ulSortableBenefs").disableSelection();

            $("#ulSortableFavs").sortable({
                containment: 'parent',
                //placeholder: "ui-state-highlight",
                start: function (event, ui) {
                    $(this).addClass("sortable-list-sel");
                },
                stop: function (e, ui) {
                    var items = new Array();
                    $(this).removeClass("sortable-list-sel");
                    $.map($(this).find('li'), function (el) {
                        //items.push($(el).index() + ':' + $("#" + el.id).attr("accountNumber"));
                        items.push($("#" + el.id).attr("favoritId"));
                    });
                    hdnFavoritsOrder.val(items.join(";"));
                }
            });
            $("#ulSortableFavs").disableSelection();




        };

        function uploadPicture() {
            $('input[type=file]').change(function () {
                var rowcheck = 0;
                /// Load the input into an jquery object
                var $inputFile = $(this);
                /// Set label value using control's index attribute
                var row = $inputFile.attr("index");

                var nameFile = $inputFile.val().split('\\').reverse()[0];

                hiddenField.val(nameFile);
                if (validateSize($inputFile)) {
                    setTimeout('__doPostBack(btnUploadFileValidate, \'\')', '');
                } else {
                    document.getElementById('<%=invisibleBtnShowError.ClientID%>').click();
                }
            });
        };

        function OpenDialog() {
            if (navigator && (navigator.userAgent.toLowerCase()).indexOf("msie") > -1 || navigator && (navigator.userAgent.toLowerCase()).indexOf(".net") > -1) {
                ucAttachUploader.click();
            }
        }

        function ChangeDefaultAccount(id, number) {
            hdnDefaultAccount.val(number);
            $(".img-principal").each(function () {
                $(this).removeClass("mainAccountImgSelected");
                $(this).removeClass("mainAccountImg");
                $(this).addClass("mainAccountImg");
                $(this).attr('title', top.eBankit.Presentation.GetResource("CustomiseProductsMainAccountNotSelectedTooltip"));
            });

            $("#" + id).removeClass("mainAccountImg");
            $("#" + id).addClass("mainAccountImgSelected");

            var checkboxes = document.getElementsByClassName('onoffswitch-checkbox');
            for (var i = 0; i < checkboxes.length; ++i) {
                if (number == checkboxes[i].value) {
                    checkboxes[i].checked = true;
                    $("#" + id).attr('title', top.eBankit.Presentation.GetResource("CustomiseProductsMainAccountSelectedTooltip"));
                }
            }
        }

        function VerifyOnlyAvailable(value) {

            var checkboxes = document.getElementsByClassName('onoffswitch-checkbox');
            var nAvailable = 0;

            for (var i = 0; i < checkboxes.length; ++i) {
                if (checkboxes[i].checked)
                    nAvailable++;
            }

            for (var i = 0; i < checkboxes.length; ++i) {
                if (hdnIsVirtualEntity.val() == 'false') {
                    if (hdnDefaultAccount.val() == checkboxes[i].value)
                        checkboxes[i].checked = true;
                    if (value == checkboxes[i].value && nAvailable == 0 && hdnDdlValueSelected == '18')
                        checkboxes[i].checked = true;

                }
            }
        }

        function pageLoadRefresh() {
            uploadPicture();
            var tab = eBankit.Presentation.QueryString("tab");
            if (tab != null) {
                hdnSelectedTab.val(tab);
            };
            if (hdnIsVirtualEntity.val() === "false") {
                allowSortable();
            }

            if (tab.toUpperCase() == "IMAGE")
                changePhotoSessiion();
        };

        $(document).ready(function () {
            pageLoadRefresh();
        })

        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(pageLoadRefresh);

        function changePhoto(id) {

        }

        GoToUseFavorit = function (id, favoritType) {
            hdnFavoritId.val(id);
            hdnFavoritType.val(favoritType);
            __doPostBack(btnGotoUseId, '');
        }

        function validateSize(input) {
            if (input[0]) {
                if (input[0].files[0].size < 4194304) {
                    return true;
                }
                else {
                    return false;
                }
            }
        };

        function changePhotoSessiion() {
            setTimeout(function () {
                if ($("#inputHiddenImg").attr("src") != "") {
                    $(".img-profile.img-circle").first().attr("src", $("#inputHiddenImg").attr("src"))
                }
                changePhotoSessiion();
            }, 1000);
        };

        // focus save button after upload
        if ($("img[id$='imgUser']").length > 0) {
            var imgSRC = $("img[id$='imgUser']")[0].src;
            if (imgSRC.indexOf("/images/profile_picture.png") == -1 && $("a[id$='btnSave']").is(':visible')) $("a[id$='btnSave']").focus();
        }
        // remove scroll with space key inside container and trigger click 
        $("div[id$='photoPanel'] label").keypress(function (e) {
            if (e.keyCode == 32) {
                e.preventDefault();
                e.currentTarget.click();
            }
        });
        // add tabindex to label - upload picture dialog
        $("div[id$='photoPanel'] label").attr('tabindex', '0');
        var numberSingleEdition = 0;
        function openEditRow(elem) {
            if (numberSingleEdition == 0) {
                var divRowID = $(elem).parent().parent().parent().attr('id');
                $('#' + divRowID).parent().removeClass('paddingHardTopBottom');
                $('#' + divRowID).parent().removeClass('listItemContainer');
                $('#' + divRowID).hide();
                var divRowEdit = $('#' + divRowID).siblings()[0];
                var divRowditID = $(divRowEdit).attr('id');

                $('#' + divRowditID).show();
                numberSingleEdition++;
                var clearIcon = $('#' + divRowditID).find('.clearIcon')[0];
                $(clearIcon).attr('aria-label', top.eBankit.Presentation.GetResource("ClearIconCustomise"));
                $(clearIcon).click(function () {
                    var inputText = $(clearIcon).prev()[0];
                    inputText.value = '';
                });

                $(clearIcon).keypress(function () {
                    if (event.keyCode == 32) {
                        event.preventDefault();
                    } else {
                        var inputText = $(clearIcon).prev()[0];
                        inputText.value = '';
                    }
                });
            } else {
                return false;
            }
        }
        function openEditRowKeyPress(elem) {
            if (event.keyCode == "13") {
                openEditRow(elem);
            }
            if (event.keyCode == "32") {
                return false;
                event.preventDefault();
            }

        }

        function resetNumberSingleEditions() {
            numberSingleEdition = 0;
        }

        function closeEditRow(elem) {
            var divRowEditID = $(elem).parent().parent().parent().attr('id');
            $('#' + divRowEditID).hide();
            numberSingleEdition--;
            var divRow = $('#' + divRowEditID).siblings()[0];
            var divRowID = $(divRow).attr('id');
            $('#' + divRowID).show();
            $('#' + divRowID).parent().addClass('paddingHardTopBottom');
            $('#' + divRowID).parent().addClass('listItemContainer');
            var hdnProductName = $(elem).parent().parent().prev().find('input[type ="hidden"]')[0];
            var txtBoxEdit = $(elem).parent().parent().prev().find('input[type ="text"]');

            if ($(txtBoxEdit).val().length < 1) {
                $(txtBoxEdit).val(hdnProductName.value);
            }

        }
        function closeEditRowKeyPress(elem) {
            if (event.keyCode == "13") {
                closeEditRow(elem);
            }
            if (event.keyCode == "32") {
                event.preventDefault();
            }
        }

        function saveSingleEdit(elem) {
            var hdnProductNameEdit = $(elem).parent().parent().prev().find('input[type ="hidden"]')[0];
            var hdnProductNumberEdit = $(elem).parent().parent().prev().find('input[type ="hidden"]')[1];
            var txtBoxEdit = $(elem).parent().parent().prev().find('input[type ="text"]');
            if ($(txtBoxEdit).val().length > 0) {
                hdnProductNameEdit.value = $(txtBoxEdit).val();
            }
            hdnProductToEditName.value = hdnProductNameEdit.value;
            hdnProductToEditNumber.value = hdnProductNumberEdit.value;

            if (hdnProductToEditName.value.length > 0 && hdnProductToEditNumber.value.length > 0 && $(txtBoxEdit).val().length > 0) {
                var inputNameToEditHidden = document.getElementById('inputNameToEditHidden');
                var inputNumberToEditHidden = document.getElementById('inputNumberToEditHidden');
                $("#" + inputNameToEditHidden.value).val(hdnProductNameEdit.value);
                $("#" + inputNumberToEditHidden.value).val(hdnProductNumberEdit.value);
                numberSingleEdition = 0;
                return true;
            }
            else {

                return false;
            }
        }

        function ValidateSearch(elem) {


            var inputText = $(elem).siblings().attr('id');
            var inputValue = $('#' + inputText).val();

            if (inputValue.length < 3 && inputValue.length > 0) {

                return false;

            } else {

                return true;
            }
        }

    </script>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("custom-1.0.js".ResolveJsUrl("Services"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
</asp:Content>

