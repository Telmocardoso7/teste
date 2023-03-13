<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00804_01.ascx.cs" Inherits="TRX00804_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <div style="margin: 0px auto; float: none; padding: 0px; width: 1000px">
        <asp:Repeater ID="rptFavorits" runat="server" EnableViewState="true" OnItemDataBound="rptFavorits_ItemDataBound">
            <HeaderTemplate>
            </HeaderTemplate>
            <ItemTemplate>
                <div id="Div1" class="panel-benef fullWidth" style="height: auto;" runat="server">
                    <div class="col-xs-12 col-sm-5 col-md-4 col-lg-4">
                        <div style="float: left; width: auto; margin-right: 10px;">
                            <img id="imgFavorit" src="<%$ebFile:~/content/currenttheme/images/benef_1.png%>" alt="" class="img-thumbnail img-circle" style="width: 52px; height: 52px; margin-left: -2px;" runat="server" />
                        </div>
                        <div class="favorit-first" style="padding-top: 2px;">
                            <h3 class="text-responsive-1-4" style="margin-bottom: 0px; padding-bottom: 3px;">
                                <asp:Literal ID="litName" Text='<%#Eval("Name")%>' runat="server"></asp:Literal></h3>
                            <p class="text-responsive-1">
                                <asp:Literal ID="litAmount" runat="server"></asp:Literal>
                            </p>
                        </div>
                    </div>
                    <div class="col-xs-3 col-sm-6 col-md-3 col-lg-3 visible-lg visible-md" style="padding-top: 2px;">

                        <p class="text-responsive-1-4" style="color: #666; margin-bottom: 0px; padding-bottom: 3px;">
                            <asp:Literal ID="litFavoritType" Text="<%$FrontEndResources:TRX00804,litFavoritType%>" runat="server"></asp:Literal>
                        </p>
                        <h3 class="favorit-center text-responsive-1-4" style="padding-bottom: 2px;">
                            <asp:Literal ID="litTypeValue" runat="server"></asp:Literal>
                        </h3>
                    </div>

                    <div class="col-xs-5 col-sm-3 col-md-2 col-lg-2 benef-optns" style="padding: 10px 0px 0px 0px;">
                        <a id="btnUser" href="#" runat="server">
                            <img id="img2" src="<%$ebFile:~/content/currenttheme/images/operations/ico_favorite_use.png%>" alt="" runat="server" /></a>
                        <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                            <a id="btnEdit" href="#" runat="server">
                                <img id="img1" src="<%$ebFile:~/content/currenttheme/images/icon/ico_edit.png%>" alt="" runat="server" /></a>
                        </div>
                    </div>
                    <div class="col-xs-5 col-sm-3 col-md-2 col-lg-2 user-benef" style="padding-left: 0px; padding-top: 10px; text-align: right;">
                        <a id="btnRemove" href="#" style="display: inline-block;" runat="server">
                            <img id="img3" src="<%$ebFile:~/content/currenttheme/images/messages/ico_delete.png%>" alt="" runat="server" /></a>
                    </div>
                    <div class="clearBoth"></div>
                </div>
            </ItemTemplate>
            <FooterTemplate>
            </FooterTemplate>
        </asp:Repeater>

        <div class="clearBoth"></div>
    </div>
    <div class="metro">
        <div id="divWarningMessage" runat="server" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 panel-top" visible="false">
            <section class="content-message metro">
                <div id="MainContent_TransactionMainContent_divMessage" class="alert alert-info_v2 fade in">
                    <div class="div-icon-info_v2"><i class="icon-warning"></i></div>
                    <h4 class="alert-heading" style="padding-top: 25px;">
                        <asp:Literal ID="litTitleWarning" runat="server" Text="<%$FrontEndResources:TRX00804,NoResultsMessage%>" /></h4>
                    <div class="clearBoth"></div>
                </div>
            </section>
            <div class="clearBoth"></div>
        </div>
    </div>
    <div class="trs_buttons">
        <div class="trs_buttons-action col-lg-8 col-max">
            <asp:Button ID="btnBack" CssClass="btn btn-default" Style="margin-top: 10px; margin-right: 0px;" Text="<%$FrontEndResources:TRX00804,btnBack %>" runat="server" OnClick="btnBack_Click" />
        </div>
    </div>

    <asp:HiddenField ID="hdnFavoritId" runat="server" />
    <asp:Button ID="btnDelete" CssClass="hidden" runat="server" />
    <asp:Button ID="btnGotoFavoritEdit" CssClass="hidden" runat="server" />
    <asp:Button ID="btnGotoUse" CssClass="hidden" runat="server" />

    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00804-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>

<script type="text/javascript">


    $(document).ready(function () {
        //

    });

    GoToUseFavorit = function (id) {
        hdnFavoritId.val(id);
        __doPostBack(btnGotoUseId, '');
    }

    DeleteFavorit = function (id) {
        hdnFavoritId.val(id);
        __doPostBack(btnDeleteId, '');
    }

    GoToFavoritDetail = function (id) {
        hdnFavoritId.val(id);
        __doPostBack(btnGotoFavoritEdit, '');
    }
</script>
