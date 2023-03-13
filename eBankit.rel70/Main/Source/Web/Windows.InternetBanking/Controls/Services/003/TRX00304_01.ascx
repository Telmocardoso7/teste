<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00304_01.ascx.cs" Inherits="TRX00304_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div id="divTransaction" class="transaction-content" runat="server">
    <div class="metro">
        <div id="divAccountsNotFound" runat="server" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 panel-top" visible="false">
            <section class="content-message metro">
                <div id="MainContent_TransactionMainContent_divMessage" class="alert alert-info fade in">
                    <div class="div-icon-info"><i class="icon-info"></i></div>
                    <h4 class="alert-heading">
                        <asp:Literal ID="litAccountsNotFound" runat="server" Text="<%$FrontEndResources:TRX00203,litAccountsNotFound %>" /></h4>
                    <div class="clearBoth"></div>
                </div>
            </section>
            <div class="clearBoth"></div>
        </div>
    </div>

    <div class="clearBoth"></div>

    <asp:Repeater ID="rptProducts" runat="server" OnItemDataBound="rptProducts_ItemDataBound">
        <ItemTemplate>

            <div class="constPoupancaContainer">
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max lineContainer">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 content-body">
                        <section>
                            <div class="col-lg-12 col-left no-padding">
                                <span>
                                    <div class="trx-container">

                                        <div class="col-xs-12 no-padding">

                                            <div class="desktop-only tablet-only col-xs-12 col-sm-3 col-md-3 col-lg-3 no-padding col-container-center fullHeight">
                                                <img id="Img" src="<%$ebFile:~/Content/currenttheme/images/credit_card.png%>" aria-label="" class="img-responsive img-products" runat="server" alt="credit card"/>
                                            </div>

                                            <div class="col-xs-8 col-sm-8 col-md-6 col-lg-6 productexpand">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 no-padding detailContainer">
                                                    <h3>
                                                        <asp:Literal ID="litProductTitle" runat="server"></asp:Literal></h3>
                                                    <div class="productDescriptionContainer">
                                                        <asp:Literal ID="litProductDescription" runat="server"></asp:Literal>
                                                    </div>
                                                </div>

                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-container-center desktop-only clearPadding" style="height: 25%; margin-top: 10px; position: relative;">
                                                    <div id="divMoreInformation" runat="server" class="MoreInfoText">
                                                            <asp:Literal ID="litMoreInfo" Text="<%$FrontEndResources:TRX00304,MoreInformation %>" runat="server" />
                                                    </div>
                                                </div>

                                                <div class="clearBoth"></div>
                                            </div>
                                            <div class="desktop-only col-xs-12 col-sm-3 col-md-3 col-lg-3 text-right col-container-center clearPadding fullHeight" style="float: right;">
                                                <a id="btnSelectProduct" class="btn btn-primary" style="margin-top: 55px;  height: 40px;font-size: 1.2rem;padding: 11px 30px !important;font-family: 'Gotham Light';width: 207px;" runat="server">
                                                    <asp:Literal ID="litContinue" Text="<%$FrontEndResources:TRX00304,Adhere %>" runat="server"></asp:Literal>
                                                </a>
                                            </div>
                                            <div class="tablet-only phone-only col-xs-1 col-sm-1 col-md-3 col-lg-3 text-right clearPadding fullHeight" style="float: right;">
                                                <div id="divMoreInformationTablet" runat="server" class="divMoreInformationTablet"></div>
                                            </div>
                                            <div class="clearBoth"></div>
                                        </div>

                                    </div>
                                </span>
                            </div>
                        </section>
                    </div>
                </div>
                <div class="clearBoth"></div>
                <div id="collapseMoreInformation" runat="server" class="panel-collapse collapse moreinfo">
                    <div class="moreInfoDetailContainer">
                        <div class="panel-body col-lg-8 col-max">
                            <div class="moreInfoDetailInfoContainer transaction-content-text">
                                <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
                                    <ContentTemplate>
                                        <asp:Panel ID="pnControls" CssClass="clearPadding" runat="server">
                                            <asp:Literal ID="litProductDetails" runat="server"></asp:Literal>
                                        </asp:Panel>
                                        <div id="productData" runat="server" class="tableWrapper table-responsive noarrow" style="padding: 10px 0px; border: none">
                                            <div class="col-lg-12 clearPadding">
                                                <div class="metro inner-table">
                                                    <it:GridViewControl ID="grdData" runat="server" AutoGenerateColumns="false" CssClass="table" IsResponsive="true" AllowPag="false"
                                                        GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" RecordCounterComplementarText="<%$FrontEndResources:DATALIST,gridDataecordCounterComplementarText %>" OnRowDataBound="grdData_RowDataBound"
                                                        Style="padding-bottom: 0px;">
                                                        <Columns>
                                                            <asp:TemplateField HeaderStyle-CssClass="center col-xs-3" ItemStyle-CssClass="link" HeaderText="<%$FrontEndResources:TRX00304,litDays%>">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblDaysFrom" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderStyle-CssClass="center col-xs-6" ItemStyle-CssClass="link" HeaderText="<%$FrontEndResources:TRX00304,litAmount%>">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblAmountFrom" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderStyle-CssClass="center col-xs-3" ItemStyle-CssClass="link" HeaderText="<%$FrontEndResources:TRX00304,litRate%>">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblRate" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </it:GridViewControl>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearBoth"></div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                                    <ContentTemplate>
                                        <asp:Panel ID="Panel1" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" runat="server">
                                            <it:FlowInnerContainer ID="flwFiles" CustomCssClass="col-max bs-reduced bs-head-metro-orange bs-reduced-transaction" Title="<%$FrontEndResources:TRX00304,PreContractualInformation%>" runat="server">
                                                <div>

                                                    <div class="btn-ebankit-info-inner">
                                                        <asp:Literal ID="litSearchInfo" Text="<%$FrontEndResources:TRX00304,InfoPreContratual %>" runat="server"></asp:Literal>
                                                    </div>

                                                    <div class="clearBoth" style="margin-top: 10px"></div>
                                                    <button id="btProductGeneralConditions" type="button" class="metro btn btn-ebankit-pdf" runat="server">
                                                        <span class="text-responsive-1">
                                                            <asp:Literal ID="litFileGeneralConditions" Text="<%$FrontEndResources:TRX00304,litFileGeneralConditions%>" runat="server"></asp:Literal></span>
                                                    </button>
                                                    <div class="clearBoth"></div>
                                                    <button id="btSheetInformation" type="button" class="metro btn btn-ebankit-pdf" runat="server">
                                                        <span class="text-responsive-1">
                                                            <asp:Literal ID="litFileSheetInformation" Text="<%$FrontEndResources:TRX00308,SheetInformation%>" runat="server"></asp:Literal></span>
                                                    </button>
                                                </div>
                                            </it:FlowInnerContainer>
                                        </asp:Panel>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            </div>

                            <div class="tablet-only phone-only buttonConstruirContainer">
                                <a id="btnSelectProductTablet" class="btn btn-primary" style="margin-top: 55px;  height: 40px;font-size: 1.2rem;padding: 11px 30px !important;font-family: 'Gotham Light';width: 100%;" runat="server">
                                    <asp:Literal ID="litContinueTablet" Text="<%$FrontEndResources:TRX00304,Adhere %>" runat="server"></asp:Literal>
                                </a>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="clearBoth"></div>
        </ItemTemplate>
    </asp:Repeater>

    <div style="display: block; width: 100%; border-top: 3px solid #EEE;">
            <div class="col-lg-2 col-md-1 visible-lg visible-md col-max" style="height: 80px; padding: 0px;"></div>
    </div>
    <div class="clearBoth"></div>

    <iframe name="iframeControlDocument" id="iframeControlDocument" src="" height="0" width="0" style="border: 0px;" role="presentation" aria-label="iframeControlDocument"></iframe>

    <script type="text/javascript">

    var $moreInfos = $(".moreinfo");
    var $labels = $(".MoreInfoText");
    

    ExpandMoreInformation = function (object, productId) {
        var $moreInfo = $('.moreinfo[data-id=' + productId + ']'); //Get the element with the info
        var $label = $(object).find(".MoreInfoText"); //Get the current icon
        var destinationPadding = parseInt($moreInfo.parent().children('.lineContainer').css('padding-top')) + 20;

        $moreInfos.each(function () {
            destinationPadding = parseInt($(this).parent().children('.lineContainer').css('padding-top')) + 20;
            $(this).parent().children('.lineContainer').animate({
                paddingBottom: destinationPadding + 'px'
            }, 'fast');
        });

        $moreInfos.not($moreInfo).stop(true, true).slideUp(); // toggle others

        if ($moreInfo.css('display') == 'none') {
            destinationPadding = 0;
        }


        if (destinationPadding == 0) {
            $moreInfo.parent().children('.lineContainer').animate({paddingBottom: destinationPadding + 'px'}, 'fast',function () {
                $moreInfo.stop(true, true).slideToggle('fast', function () {//toggle slide


                    if (object.innerText == top.eBankit.Presentation.GetResource("LessInfo") || $(object).hasClass("opened")) {
                        if (!$(object).hasClass("divMoreInformationTablet")) {
                            object.innerText = top.eBankit.Presentation.GetResource("MoreInfo");
                        }

                        $(".opened").removeClass("opened");
                    } else {
                        if (!$(object).hasClass("divMoreInformationTablet")) {
                            object.innerText = top.eBankit.Presentation.GetResource("LessInfo");
                            $(".opened").html(top.eBankit.Presentation.GetResource("MoreInfo"));
                        }

                        $(".opened").removeClass("opened");
                        $(object).addClass("opened");
                    }

                });
            });
        } else {
            $moreInfo.stop(true, true).slideToggle('fast', function () {//toggle slide


                if (object.innerText == top.eBankit.Presentation.GetResource("LessInfo") || $(object).hasClass("opened")) {
                    if (!$(object).hasClass("divMoreInformationTablet")) {
                        object.innerText = top.eBankit.Presentation.GetResource("MoreInfo");
                    }

                    $(".opened").removeClass("opened");
                } else {
                    if (!$(object).hasClass("divMoreInformationTablet")) {
                        object.innerText = top.eBankit.Presentation.GetResource("LessInfo");
                        $(".opened").html(top.eBankit.Presentation.GetResource("MoreInfo"));
                    }

                    $(".opened").removeClass("opened");
                    $(object).addClass("opened");
                }

            });

            $moreInfo.parent().children('.lineContainer').animate({
                paddingBottom: destinationPadding + 'px'
            }, 'fast');
        }
    };

    OpenGeneralConditionsDoc = function (productId) {
        document.getElementById("iframeControlDocument").src = '/Document.aspx?prdId=' + productId;
    }

    OpenSheetInformationDoc = function (productId) {
        document.getElementById("iframeControlDocument").src = '/Document.aspx?prdId=' + productId;
    }

    GoToConstitute = function (productId) {
        eBankit.Presentation.SetBlockPageCommon();
        $('body').block();
        eBankit.document.location.href = '/Security/Transactions/Transactions.aspx?trxid=TRX00308<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>&prdId=' + productId;
    }

</script>

    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00304-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />

</div>
