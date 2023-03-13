<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AccountsControlUpdateVE.ascx.cs" Inherits="AccountsControlUpdateVE" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("_AccountsControlUpdateVE.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
<link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("ebankit-multiselect.css".ResolveCssUrl(""), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />

<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("metro.min.js".ResolveJsUrl("metro"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts overflowHidden">
    <div class="LblAccount">
        <asp:Literal ID="litLblAccount" Text="<%$FrontEndResources:CorporateGroups,lblAccount %>" runat="server"></asp:Literal>
    </div>
    <div class="CorpSearchText" style="float: right;">
        <asp:TextBox ID="txtSearchText" CssClass="txtSearchText" runat="server"></asp:TextBox>
        <span class="searchIcon" tabindex="0" role="button" onkeyup="if(event.keyCode === 13)$(this).click();"
            title="<asp:Literal ID='litSearchIcon' runat='server' Text='<%$FrontEndResources:AccountsControl,Search %>'></asp:Literal>"></span>
        <asp:Button ID="btnSearchText" runat="server" OnClick="btnSearchText_Click" Style="display: none"  usesubmitbehavior="false" AutoPostBack="true"/>
    </div>
</div>
<div class="clearBoth"></div>
<asp:UpdatePanel ID="flwContainerAccounts" UpdateMode="Always" runat="server">
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btnSelectedAccountChanged" />
        <asp:AsyncPostBackTrigger ControlID="btnSelectedOtherAccountChanged" />
        <asp:AsyncPostBackTrigger ControlID="btnSearchText" EventName="Click"/>
    </Triggers>
    <ContentTemplate>
        <div id="scrollContainer" class="scrollContainerAccountsCorpGroup" runat="server">
            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts overflowHidden CorpComboBox">
                <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 selectedLBGroup">
                    <asp:Literal ID="lblSelectedGroup" Text="<%$FrontEndResources:CorporateGroups,lblSelectedGroup %>" runat="server"></asp:Literal>
                </div>
                <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 selectedGroup">
                    <asp:DropDownList ID="ddlCorporateGroups" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCorporateGroups_SelectedIndexChanged" CssClass="ddlCorpGroups" />
                </div>
                <div class="clearBoth"></div>
            </div>
            <div id="AccountsSelectorMainDiv" runat="server">
                <div id="scroolContent" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts overflowHidden" style="margin-top: 20px;"  runat="server" ClientIDMode="Static">
                    <div class="slickSlider">
                        <asp:Repeater ID="rptCorporateGroupAccounts" runat="server" OnItemDataBound="rptCorporateGroupAccounts_ItemDataBound">
                            <ItemTemplate>
                                <div id="divAccountType" runat="server" tabindex="0" role="button" onkeydown="eBankit.Presentation.AccountsControl.AccountTypeKeydownHandler(this, event);" onkeyup="eBankit.Presentation.AccountsControl.AccountTypeKeyupHandler(this, event);">
                                    <div id="accountSlide" runat="server" class="contentBoxCorporate box-red">
                                        <div class="scroll-item-top accountNameOverflow">
                                            <h4 class="CorpAlwaysVisible">
                                                <asp:Literal ID="litAccountName" runat="server"></asp:Literal></h4>
                                            <h5 class="numAcc CorpAccNumber">
                                                <asp:Literal ID="litAccountNumber" runat="server"></asp:Literal></h5>
                                        </div>
                                        <div class="clearBoth"></div>
                                        <div id="divBalance" class="scroll-item-value positive hidden" style="display: flex" runat="server">
                                            <h3 class="CorpAccBalance">
                                                <asp:Literal ID="litBalanceValue" runat="server"></asp:Literal>
                                            </h3>
                                            <div class="CorpFormatCurrency">
                                                <asp:Literal ID="litCurrency" runat="server"></asp:Literal>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <asp:HiddenField ID="hdnAllAccountsArray" runat="server" />
                    <asp:HiddenField ID="hdnAccountsArray" runat="server" />
                    <asp:HiddenField ID="hdnSelectedAccountId" runat="server" />
                    <asp:HiddenField ID="hdnSelectedAccount" runat="server" />
                    <asp:HiddenField ID="hdnSelectedCurrentAccount" runat="server" />
                    <asp:HiddenField ID="hdnSelectedCurrentAccountMessages" runat="server" />
                    <asp:HiddenField ID="hdnScrollContentLenght" runat="server" />
                    <asp:HiddenField ID="hdnCount" runat="server" />
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro   transp transaction-content" style="padding-bottom: 20px;">
                <div id="divNoAccountsMessage" class="alert alert-warning_v2 fade in widthInherit" role="alert" aria-atomic="true" runat="server">
                </div>
            </div>
            <div id="divOthersGroup" runat="server">
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts CorpComboBox">
                    <asp:Literal ID="lblOthersGroup" Text="<%$FrontEndResources:CorporateGroups,lblOthersGroup %>" runat="server"></asp:Literal>
                </div>

                <div id="scroolContentCorporateOthersAccounts" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts overflowHidden OthersAccountsShow">
                    <div style="display: inline-block; position: relative; left: -5px;">
                        <asp:Repeater ID="rptCorporateGroupOthersAccounts" runat="server" OnItemDataBound="rptCorporateGroupOthersAccounts_ItemDataBound">
                            <ItemTemplate>
                                <div id="divAccountType" class="contentBoxCorporateOthersAccounts box-red" runat="server" tabindex="0" role="button" onkeydown="eBankit.Presentation.AccountsControl.AccountTypeKeydownHandler(this, event);" onkeyup="eBankit.Presentation.AccountsControl.AccountTypeKeyupHandler(this, event);">
                                    <div class="scroll-item-top accountNameOverflow">
                                        <h4 class="CorpAccGroupName">
                                            <asp:Literal ID="litAccountGroupName" runat="server"></asp:Literal></h4>
                                        <h5 class="CorpAccName">
                                            <asp:Literal ID="litAccountName" runat="server"></asp:Literal></h5>
                                        <h3 class="CorpAccBalance">
                                            <asp:Literal ID="litAccountNumber" runat="server"></asp:Literal>
                                        </h3>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Always" runat="server">
    <ContentTemplate>
        <asp:HiddenField ID="displayTransactionContent" runat="server" />
    </ContentTemplate>
</asp:UpdatePanel>
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
    <ContentTemplate>
        <asp:PlaceHolder ID="phMessageTransactionControl" runat="server"></asp:PlaceHolder>
    </ContentTemplate>
</asp:UpdatePanel>
<div class="clearBoth"></div>
<div class="clearBoth"></div>

<asp:Button ID="btnSelectedAccountChanged" runat="server" CausesValidation="false" CssClass="hidden" />
<asp:HiddenField ID="hdnSelectedOtherAccount" runat="server" />
<asp:HiddenField ID="hdnSelectedOtherGroup" runat="server" />
<asp:Button ID="btnSelectedOtherAccountChanged" runat="server" CausesValidation="false" CssClass="hidden" />

<script type="text/javascript">
    eBankit.Presentation.AccountsControl = {}
    eBankit.Presentation.AccountsControl.AccClk = function (accountId) {

        $("#benefsTabContent #operations").hide();
        $("#benefsTabContent #favorit").hide();
        $(".col-transaction").show();

        var searchLabel = "<%=eBankit.Common.Globalization.Translate.GetTransactionString("AccountsControl","Search") %>";
        //
        var hdnSelectedAccount = $("#<%=hdnSelectedAccountId.ClientID %>");
        var btnSelectedAccountChangedID = "<%=btnSelectedAccountChanged.UniqueID %>";

        var txtSearchText = $('#<%=txtSearchText.ClientID%>');
        if (txtSearchText.val().length > 0) {
            var clearIcon = $('.CorpSearchText').find('.clearIcon');
            $(clearIcon).removeClass("clearIcon");
            $(clearIcon).addClass("searchIcon");
            $(clearIcon).attr("title", searchLabel);
            txtSearchText.val('');
        }

        hdnSelectedAccount.val(accountId).show();
        __doPostBack(btnSelectedAccountChangedID, '');
    }
    eBankit.Presentation.AccountsControl.AccountTypeKeydownHandler = function (elem, event) {
        if (event.keyCode === 32) {
            event.preventDefault();
        }
        else if (event.keyCode === 13) {
            event.preventDefault();
            $(elem).click();
        }
    }

    eBankit.Presentation.AccountsControl.AccountTypeKeyupHandler = function (elem, event) {
        if (event.keyCode === 32) {
            event.preventDefault();
            $(elem).click();
        }
    }
    function SelectedOtherAccount(accountId, groupId) {
        var hdnSelectedOtherAccount = $("#<%=hdnSelectedOtherAccount.ClientID %>");
        var hdnSelectedOtherGroup = $("#<%=hdnSelectedOtherGroup.ClientID %>");
        var btnSelectedOtherAccountChanged = "<%=btnSelectedOtherAccountChanged.UniqueID %>";
        var hdnSelectedAccount = $("#<%=hdnSelectedAccountId.ClientID %>");

        hdnSelectedOtherAccount.val(accountId).show();
        hdnSelectedOtherGroup.val(groupId).show();
        hdnSelectedAccount.val(accountId).show();
        __doPostBack(btnSelectedOtherAccountChanged, '');
    }

    function hiddenBtnClick() {
        var btnHiddenSearch = $('#<%= btnSearchText.ClientID %>');
        if (btnHiddenSearch != null && (txtSearchText.val().length == 0 || txtSearchText.val().length >= 3)) {
            $(".panel-search").slideToggle();
            btnHiddenSearch.click();
        }
    }
    var txtSearchText = $('#<%=txtSearchText.ClientID%>');

    txtSearchText.on("input", function (e) {

        if (window.event) {
            if ($(this).data("lastval") != $(this).val()) {
                $(this).data("lastval", $(this).val());

                var searchLabel = "<%=eBankit.Common.Globalization.Translate.GetTransactionString("AccountsControl","Search") %>";
                var clearLabel = "<%=eBankit.Common.Globalization.Translate.GetTransactionString("AccountsControl","ClearSearch") %>";

                hiddenBtnClick();
                if (txtSearchText.val().length == 0) {
                    var clearIcon = $('.CorpSearchText').find('.clearIcon');
                    $(clearIcon).removeClass("clearIcon");
                    $(clearIcon).addClass("searchIcon");
                    $(clearIcon).attr("title", searchLabel);
                }
                else {
                    var clearIcon = $('.CorpSearchText').find('.searchIcon');
                    $(clearIcon).removeClass("searchIcon");
                    $(clearIcon).addClass("clearIcon");
                    $(clearIcon).attr("title", clearLabel);
                }

            }
        }
    });
    function CleanSearchBox(elem) {
        $(elem).val('');
    }

    $(document).ready(function () {
        var searchIcon = $('.CorpSearchText').find('.searchIcon');
        var inputText = $(searchIcon).prev()[0];
        var searchLabel = "<%=eBankit.Common.Globalization.Translate.GetTransactionString("AccountsControl","Search") %>";
        var clearIcon = $('.CorpSearchText').find('.searchIcon');
        $(searchIcon).click(function () {
            if ($(inputText).val().length > 0) {
                inputText.value = '';
                $(searchIcon).removeClass("clearIcon");
                $(searchIcon).addClass("searchIcon");
                $(clearIcon).attr("title", searchLabel);
            }
            hiddenBtnClick();
        });

        ProductSelectorSlick.LoadSlick();
        if ($(".div-icon-info_v2").length > 0 && $(".scrollContainerAccounts .slickSlider div").length == 1) {
            $(".scrollContainerAccounts").hide();
            $(".controlsShowHide").hide();
        }

        Multiselect();

    });

    function Multiselect() {
        $(".ddlCorpGroups").multiselect({
            enableFiltering: false,
            numberDisplayed: 50,
            buttonWidth: '85%',
            includeFilterClearBtn: false,
            includeSelectAllOption: false,
            includeSelectAllIfMoreThan: 100,
            nonSelectedText: "<%=eBankit.Common.Globalization.Translate.GetTransactionString("CorpGroupAccountDdl", "AccounSearchPlaceHolder").Replace("\"","&quot;") %>",
            filterPlaceholder: "<%=eBankit.Common.Globalization.Translate.GetTransactionString("CorpGroupAccountDdl", "AccounSearchPlaceHolder").Replace("\"","&quot;") %>",
            disableIfEmpty: true,
            customNoResultsLi: '<li class="customNoResults"><%=eBankit.Common.Globalization.Translate.GetTransactionString("CorpGroupAccount", "NoAccountsFound").Replace("\"","&quot;") %></li>',
            templates: {
                button: '<button type="button" id="expandButtonGrp" class="multiselect dropdown-toggle" data-toggle="dropdown" title="cenas"><span class="multiselect-selected-text corpGroupText">cenas</span></button>',
                li: '<li class="multiselect-option"><a class="multiselect-item multiselect-value" tabindex="0"><div class="cbcontainer cbcontainerCorpGroup"><input type="checkbox" class="singlecheck" /><label></label></div></a><li class="multiselect-item divider"></li></li>',
                ul: '<ul class="multiselect-container dropdown-menu accountGroups" style=" width:100%; max-height: 450px;overflow-y: scroll;" id="dropdownMenu"></ul>'
            },
            onChange: function (option, checked, select) {
                eBankit.Presentation.RemoveValidateMsg($('#expandButtonGrp'));
                $('#expandButton_error').remove();
            }

        });
    };

    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        ProductSelectorSlick.LoadSlick();
    });

</script>

<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("/scripts/ebankitControls/product-selector-slick-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>
<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("accounts-control-update-ve.js".ResolveJsUrl("ebankitControls"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("bootstrap-multiselect.js".ResolveJsUrl(),eBankit.Common.Sites.Utils.CacheVersionKey.JScript)%>"></script>
