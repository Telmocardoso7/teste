<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TransactionMenus.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.TransactionMenus" %>

<script type="text/javascript">
    Cufon.replace('ul.oe_menu_b div a', { hover: true });
    Cufon.replace('h1,h2,.oe_heading');
</script>
<div class="noprint mnuContainer">
    <div class="navbar navbar-default navbar-eb-middle topZindex">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-responsive-collapse" onkeyup="if(event.keyCode === 13)$(this).click();" role="presentation" title="MENU">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <%-- <a class="navbar-brand navbar-brand-first metro" href="#" runat="server" id="linkNavDashboard"><i class="icon-dashboard"></i></a>--%>
        </div>
        <div class="navbar-collapse collapse navbar-responsive-collapse no-transition">
            <asp:Repeater ID="rptMenusAlternative" runat="server" OnItemDataBound="rptMenusAlternative_ItemDataBound">
                <HeaderTemplate>
                    <ul class="nav navbar-nav">
                </HeaderTemplate>
                <ItemTemplate>
                    <li id="liMenuItem" runat="server">
                        <a class="selanchor" href="#" id="lnkMenuParent" runat="server" tabindex="0"><%# Eval("MenuName") %><b id="bMenuParent" class="caret" runat="server"></b></a>
                        <ul class="dropdown-menu dropdown-menu-b">
                            <asp:Repeater ID="rptMenusItemsAlternative" OnItemDataBound="rptMenusItemsAlternative_ItemDataBound" runat="server">
                                <HeaderTemplate>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <li id="liSubMenuItem" class="dropdown-header" runat="server">
                                        <span><%# Eval("MenuName") %></span>
                                    </li>
                                    <asp:Repeater ID="rptMenusSubItemsAlternative" OnItemDataBound="rptMenusSubItemsAlternative_ItemDataBound" runat="server">
                                        <ItemTemplate>
                                            <li><a id="hrfLink" href="#" runat="server" tabindex="0"><%# Eval("MenuName") %></a></li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ItemTemplate>
                                <FooterTemplate>
                                </FooterTemplate>
                            </asp:Repeater>
                        </ul>

                    </li>
                </ItemTemplate>
                <FooterTemplate>
                    <li class="menu-dropdown-header-link">
                        <it:LoginControlCollapse ID="loginControl" runat="server" />

                    </li>
                    <a runat="server" onfocus="Close_MenuAlternative();" tabindex="0" aria-hidden="true"></a>
                    </ul>         
               
                </FooterTemplate>
            </asp:Repeater>
        </div>

        <!-- /.nav-collapse -->
    </div>
    <!-- /.navbar -->

    <div class="oe_wrapper_b col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <asp:Repeater ID="rptMenus" runat="server" OnItemDataBound="rptMenus_ItemDataBound">
            <HeaderTemplate>
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max clearPadding stPosition">
                    <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 clearPadding stPosition" id="topmenu">
                        <ul id="oe_menu_b" class="oe_menu_b nav-pills nav-justified noFocus top-menu">
            </HeaderTemplate>
            <ItemTemplate>
                <li id="liMenuParent" runat="server" class="oe_menu_parent">
                    <a id="lnkMenuParent" href="#" class="lnkMenuParent selanchor bottom flLeft" runat="server">
                        <asp:Label ID="litMnuItem" runat="server">TOP</asp:Label><span id="spnTopItem" runat="server"></span></a>
                    <div id="divMnItem" runat="server" class="oe_options col-xs-12 col-sm-12 col-md-12 col-lg-12 col-centered ">

                        <div class="oe_options_list col-xs-12 fullWidth" id="divOptions" runat="server">
                            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                                <div class="oe_options_list menuitem" id="div1" runat="server">
                                    <div>
                                        <asp:Repeater ID="rptMenusItems" OnItemDataBound="rptMenusItems_ItemDataBound" runat="server">
                                            <HeaderTemplate>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <ul>
                                                    <li id="liSubMenuItem" class="oe_heading" runat="server">
                                                        <span>
                                                            <asp:Literal ID="litMnuSubItemGroup" runat="server"></asp:Literal></span>
                                                        <span id="spnItem" runat="server"></span></li>
                                                    <asp:Repeater ID="rptMenusSubItems" OnItemDataBound="rptMenusSubItems_ItemDataBound" runat="server">
                                                        <ItemTemplate>
                                                            <li class="item-option-menu">
                                                                <a id="hrfLink" href="#" runat="server" tabindex="0">
                                                                    <span class="item-legend">
                                                                        <asp:Literal ID="litMnuSubItem" runat="server"></asp:Literal>
                                                                    </span>
                                                                    <span id="spnStatus" runat="server"></span>
                                                                </a>
                                                            </li>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </ul>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <div class="clearBoth"></div>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </div>
                                    <div class="clearBoth"></div>
                                </div>
                                <div id="divContent" class="oe_options_content metro flRight mgLeftMinusFull" runat="server">
                                    <img id="imgContent" src="<%$ebFile:~/content/currenttheme/images/login/call_girl.png %>" class="img-thumbnail" alt="" runat="server" />
                                    <div class="oe_options_content_text">
                                        <div>
                                            <asp:Literal ID="litContentDescirption" runat="server"></asp:Literal>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearBoth"></div>
                            </div>
                            <div class="col-lg-2 col-md-1 visible-lg visible-md col-max"></div>
                        </div>
                        <div class="clearBoth"></div>
                    </div>
                </li>
            </ItemTemplate>
            <FooterTemplate>
                <li class="oe_menu_search" mnudiv="searchContainer">
                    <a href="javascript:void(0);" id="searchContainerLink" tabindex="0"
                        aria-label="<asp:Literal ID='litSearch' runat='server' Text='<%$FrontEndResources:Menu,Search %>'></asp:Literal>"></a>
                    <div class="oe_options col-xs-12 col-sm-12 col-md-12 col-lg-12 col-centered" id="searchContainer" mnudiv="searchContainer">
                        <div class="oe_options_list col-xs-12 fullWidth clearPadding paddingTop22 paddingBottom22">
                            <div class="col-lg-2 col-md-1 visible-lg visible-md col-max"></div>
                            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max clearPadding">
                                <div id="FeaturedMenu_transactionMenus_rptMenus_div1_1" class="oe_options_list menuitem flRight">
                                    <div>
                                        <input type="text" id="search" class="searchinput" runat="server" value="" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <a runat="server" onfocus="Close_Menu();" tabindex="-1" aria-hidden="true"></a>
                    </div>
                </li>
                </ul><div class="clearBoth"></div>
                </div>
                </div>
           
            </FooterTemplate>
        </asp:Repeater>
    </div>
</div>
<style>
    .ui-autocomplete-category {
        font-weight: bold;
        padding: .2em .4em;
        margin: .8em 0 .2em;
        line-height: 1.5;
    }
</style>
<!-- The JavaScript -->
<script type="text/javascript">
    $(document).ready(function () {
        $("a[id*='lnkMenuParent']").on("keyup", function (event) {
            switch (event.keyCode) {
                case 9: //TAB
                    $(".lnkMenuParent").each(function () {
                        var options = $(this).parent().find(".oe_options");
                        if (options.is(":visible")) {
                            $(options).css("display", "");
                        }
                    });
                    var search = $("#searchContainerLink").parent().find(".oe_options");
                    if (search.is(":visible")) {
                        $(search).css("display", "");
                    }
                    break;
                case 13: //enter
                    $(this).parent().find(".oe_options").css("display", "block");
                    break;
                case 32: //space
                    $(this).parent().find(".oe_options").css("display", "block");
                    break;
                default:
                    break;
            }
        });


        $("#searchContainerLink").on("keyup", function (event) {
            switch (event.keyCode) {
                case 9: //TAB
                    $(".lnkMenuParent").each(function () {
                        var options = $(this).parent().find(".oe_options");
                        if (options.is(":visible")) {
                            $(options).css("display", "");
                        }
                    });
                    break;
                case 13: //enter
                    $(this).parent().find(".oe_options").css("display", "block");
                    break;
                case 32: //space
                    $(this).parent().find(".oe_options").css("display", "block");
                    break;
                default:
                    break;
            }
        });

        $(".oe_menu_b.nav-justified > li").on("mouseover", function () {
            $(this).find(".oe_options").show();
        });
        $(".oe_menu_b.nav-justified > li").on("mouseout", function () {
            $(this).find(".oe_options").hide();
        });
        $("a[id*='hrfLink']").on("keypress", function (e) {
            if (e.keyCode == 13) {
                $(this).click();
            }
        });

    });

    function Close_Menu() {
        var search = $("#searchContainerLink").parent().find(".oe_options");
        if (search.is(":visible")) {
            $(search).css("display", "");
        }
    }
    function Close_MenuAlternative() {
        var button = $("button[class='navbar-toggle collapsed']");
        button.click();
    }

    $.widget("custom.catcomplete", $.ui.autocomplete, {
        _create: function () {
            this._super();
            this.widget().menu("option", "items", "> :not(.ui-autocomplete-category)");
        },
        _renderMenu: function (ul, items) {
            var that = this,
                currentCategory = "";

            if (that.term.length > 1) {
                $.each(items, function (index, item) {
                    var li;

                    if (item.desc != currentCategory) {
                        ul.append("<li class='ui-autocomplete-category'>" + item.desc + "</li>");
                        currentCategory = item.desc;
                        //ul.append("<li class='ui-autocomplete-category'>" + item.category + "</li>");
                        //currentCategory = item.category;
                    }
                    li = that._renderItemData(ul, item);
                });
            }
        },
        _renderItem: function (ul, item) {
            if (item.onc != undefined) {
                return $("<li>")
                    .append($("<a>").text(item.label).attr("onclick", item.onc))
                    .appendTo(ul);
            }
            else {
                return $("<li>")
                    .append($("<a>").text(item.label))
                    .appendTo(ul);
            }
        }
    });

    $(function () {
        var menu_lista = [];
        // menu-no-visible
        var $nomes = $(".menuitem div > ul > .oe_heading:not(.menu-no-visible)");
        $nomes.each(function () {
            var pai = $(this).parent();
            var texto = $(this).text();

            $(pai).find(" > .item-option-menu > a:not(.menu-no-visible) span.item-legend").each(function () {
                menu_lista.push({
                    value: $(this).text().trim(),
                    desc: texto,
                    onc: $(this).parent().attr('onclick')
                });
            });
        });

        $(".searchinput").catcomplete({
            delay: 0,
            source: menu_lista,
            appendTo: "#searchContainer"
        });

        $(".searchinput").keypress(function (e) {
            if (e.keyCode == '13') {
                e.preventDefault();
            }
        });
    });

    function SelectMenuOption(parentId) {
        var anc = $("#" + parentId);
        $(".selanchor").each(function () {
            $(this).removeClass("img-selected");
            $(this).children(".menu_header").removeAttr("aria-current");
        });

        if (anc) {
            anc.addClass("img-selected");
            anc.children(".menu_header").attr("aria-current", "page");
        }
    }
</script>
