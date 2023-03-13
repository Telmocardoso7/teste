 <%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX02201_01.ascx.cs" Inherits="TRX02201_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div id="divContent" runat="server" class="transaction-content">
    <div class="grayContainer bottomBorderInfoTopMessage">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
            <asp:Label ID="lbListDescription" Text="<%$FrontEndResources:TRX02201,InformativeMessage %>" CssClass="infoTopMessage" runat="server"></asp:Label>
        </div>
    </div>
    <div class="panel panel-detail">
        <div>
            <div id="divSearchCriteria" runat="server">
                <div class="metro" style="margin-left: 0px;">
                    <div class="panel" data-role="panel" id="divFilter" style="border: none; margin-bottom: 0px;">
                        <asp:UpdatePanel runat="server" ID="updatePanel1" UpdateMode="Always">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSearch" />
                            </Triggers>
                            <ContentTemplate>
                                <div class="listHeader">
                                    <div class="col-lg-8 col-max panel-header panel-header-3">
                                        <asp:Literal ID="litSearchInfo" runat="server"></asp:Literal>
                                        <div class="img-search-panel">
                                            <div id="plSearchToggle" class="panel-search-toggle" tabindex="0" style="margin-top: -14px; height: 50px; width: 60px; background: url(/Content/Themes/ebankIT/images/products/ico_search_transactions.png) no-repeat scroll center top transparent;" alt="search" ></div>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div class="col-lg-8 col-max panel-content panel-search" style="background-color: rgb(247, 246, 246);">
                            <asp:HiddenField runat="server" ID="displayFormat"></asp:HiddenField>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style="margin-bottom: 10px">
                                <it:DatePickerTextBoxRangeMetroControl_v3 ID="dpFromToSent" Label="<%$FrontEndResources:DATALIST,FromSent%>" LabelTo="<%$FrontEndResources:DATALIST,ToSent%>" runat="server" ValidationRequiredMessage="<%$FrontEndResources:DATALIST,RequiredDateMessage%>" CssClass="field field_v2 field-full" ToolTip="<%$FrontEndResources:DATALIST,FromSent%>" ToolTipTo="<%$FrontEndResources:DATALIST,ToSent%>" />
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style="margin-bottom: 10px">
                                <div class="field field_v2 field-full">
                                    <div class="label-wrapper">
                                        <asp:Label runat="server" Text="<%$FrontEndResources:TRX02201,Channel%>" ToolTip="<%$FrontEndResources:TRX02201,Channel%>" class="leftField-label"></asp:Label>
                                    </div>
                                    <div class="centerField-wrapper">
                                        <div>
                                            <select runat="server" name="ddlChannel" id="ddlChannel" class="multiselectbox" multiple="true" style="width: 100%" tabindex="-1" aria-hidden="true"></select>
                                        </div>
                                    </div>
                                    <div class="clearBoth"></div>
                                </div>
                            </div>
                            <div class="clearBoth"></div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 margin-bottom" style="margin-bottom: 10px">
                                <div class="field field_v2 field-full">
                                    <div class="label-wrapper">
                                        <asp:Label runat="server" Text="<%$FrontEndResources:TRX02201,AccontNumber%>" ToolTip="<%$FrontEndResources:TRX02201,AccontNumber%>" class="leftField-label"></asp:Label>
                                    </div>
                                    <div class="centerField-wrapper">
                                        <div>
                                            <select runat="server" name="ddlAccountNumber" id="ddlAccountNumber" class="multiselectbox" multiple="true" style="width: 100%" tabindex="-1" aria-hidden="true"></select>
                                        </div>
                                    </div>
                                    <div class="clearBoth"></div>
                                </div>
                            </div>
                            <div class="clearBoth"></div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                                <asp:Button ID="btnSearch" CssClass="btn btn-primary btn-margin btn-search-filter" Text="<%$FrontEndResources:TRX02201,btnSearch %>" runat="server" OnClick="btnSearch_Click" />
                                <asp:HiddenField ID="hdnisSearch" runat="server" />
                            </div>
                            <div class="clearBoth"></div>
                        </div>
                    </div>
                </div>
                <div class="clearBoth"></div>
            </div>
        </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
        <div class="transaction-content">
            <asp:UpdatePanel runat="server" ID="updatePanelOperations" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSearch" />
                </Triggers>
                <ContentTemplate>
                    <div class="table-grid-border">
                        <it:FlowContainerDetail ID="flwData" CssClass="panel panel-detail borderOperations" runat="server">
                            <div class="col-lg-12 clearPadding overflowHidden">
                                <div class="metro">
                                    <div id="gridContainer" class="gridContainer desktop-only tablet-only phone-only" runat="server">
                                        <it:GridViewControl ID="gvNotifications" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 inside-table" EmptyDataText="<%$FrontEndResources:DATALIST,NoNotificationsInfo%>"
                                            GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" RecordCounterComplementarText="<%$FrontEndResources:TRX02201,gridDataecordCounterComplementarText %>" OnRowDataBound="gvNotifications_RowDataBound">
                                            <Columns>
                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important visible-md visible-lg visible-sm" ItemStyle-Width="56px">
                                                    <ItemTemplate>
                                                        <div runat="server" id="divImgType" class="img-table img-circlev2 img-circle"></div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important visible-md visible-lg visible-sm" ItemStyle-Width="70px" HeaderText="<%$GenericFrontEndResources:Channel%>">
                                                    <ItemTemplate>
                                                        <p>
                                                            <asp:Label ID="lblDateHour" runat="server" CssClass="labelDate" /></p>
                                                        <asp:Label ID="lblChannel" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData visible-md visible-lg visible-sm padding8Important" ItemStyle-Width="180px" HeaderText="<%$GenericFrontEndResources:AccountNumber%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAccount" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData visible-md visible-lg visible-sm padding8Important" HeaderText="<%$GenericFrontEndResources:Message%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMessage" runat="server" CssClass="message" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </it:GridViewControl>
                                        </div>
                                </div>
                            </div>
                            <%--<asp:Button ID="btnSort" CssClass="hidden" runat="server" />--%>
                            <asp:HiddenField ID="hdnSortExpression" runat="server" />
                        </it:FlowContainerDetail>
                    </div>
                    <div class="proof-inner">
                        <asp:PlaceHolder ID="phProofInner" Visible="false" runat="server"></asp:PlaceHolder>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <iframe id="iframeControlProof" src="/ProofPage.aspx" height="0" width="0" style="border: 0px;" title="iframeControlProof" tabindex="-1"></iframe>
        </div>
    </div>

    <script type="text/javascript">
        var idg = '<%=this.CurrentContext.SessionGUID %>';
        var interactionid = '<%=this.CurrentContext.InteractionContext.Interaction.InteractionId %>';
        var currencySymbol = '<%=InternetBankingSettings.Currency.CurrencySymbol%>';
        var numberGroupSeparator = '<%=InternetBankingSettings.Currency.NumberGroupSeparator%>';
        var numberDecimalSeparator = '<%=InternetBankingSettings.Currency.NumberDecimalSeparator%>';
        var isSearch = $("#<%=hdnisSearch.ClientID %>");
    </script>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/Services/Transactions/TRX02201-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX02201-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("bootstrap-multiselect.js".ResolveJsUrl(),eBankit.Common.Sites.Utils.CacheVersionKey.JScript)%>"></script>


    <script type="text/javascript">
        $(document).ready(function () {
            $(".btnSearch").on("click", function (e) {
                if ($("#aspnetForm").valid()) {
                    $(".panel-search").slideUp();
                } else {
                    e.preventDefault();
                }
            });
        });

        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(StartMultiselect);
        prm.add_pageLoaded(StartMultiselect);
        prm.add_pageLoaded(Recheck);

        function StartMultiselect() {

            var groups = {};
            $("select option[OptionGroup]").each(function () {
                groups[$.trim($(this).attr("OptionGroup"))] = true;
            });
            $.each(groups, function (c) {
                if ($("select option[OptionGroup='" + c + "']").parent('optgroup').length == 0) {
                    $("select option[OptionGroup='" + c + "']").wrapAll('<optgroup label="' + c + '">');
                    //$(c).addClass("group-name");
                }
            });

            $('.multiselectbox').each(function (elem) {
                $(this).multiselect({
                    buttonText: function (options, select) {
                        if (this.disabledText.length > 0
                            && (select.prop('disabled') || (options.length == 0 && this.disableIfEmpty))) {

                            return this.disabledText;
                        }
                        else if (options.length === 0) {
                            return this.nonSelectedText;
                        }
                        else if (this.allSelectedText
                            && options.length === $('option', $(select)).length
                            && $('option', $(select)).length !== 1
                            && this.multiple) {

                            if (this.selectAllNumber) {
                                return this.allSelectedText;
                            }
                            else {
                                return this.allSelectedText;
                            }
                        }
                        else if (this.numberDisplayed != 0 && options.length > this.numberDisplayed) {
                            return this.nSelectedText;
                        }
                        else {
                            var selected = '';
                            var delimiter = this.delimiterText;

                            options.each(function () {
                                var label = ($(this).attr('label') !== undefined) ? $(this).attr('label') : $(this).text();
                                selected += label + delimiter;
                            });

                            return selected.substr(0, selected.length - this.delimiterText.length);
                        }
                    },
                    enableFiltering: true,
                    filterBehavior: 'both',
                    enableCaseInsensitiveFiltering: true,
                    numberDisplayed: 1,
                    buttonWidth: '100%',
                    includeFilterClearBtn: false,
                    includeSelectAllOption: true,
                    includeSelectAllIfMoreThan: 1,
                    multiple: true,
                    selectAllText: "<%=eBankit.Common.Globalization.Translate.GetTransactionString("Search1701", "SelectAll").Replace("\"","&quot;") %>",
                    nonSelectedText: "<%=eBankit.Common.Globalization.Translate.GetTransactionString("Search1701", "Search").Replace("\"","&quot;") %>",
                    allSelectedText: "<%=eBankit.Common.Globalization.Translate.GetTransactionString("Search1701", "All").Replace("\"","&quot;") %>",
                    filterPlaceholder: "<%=eBankit.Common.Globalization.Translate.GetTransactionString("Search1701", "Search").Replace("\"","&quot;") %>",
                    nSelectedText: "<%=eBankit.Common.Globalization.Translate.GetTransactionString("Search1701", "Multiple").Replace("\"","&quot;") %>",
                    templates: {
                        button: '<button type="button" class="multiselect dropdown-toggle expandButton" data-toggle="dropdown"><span class="multiselect-selected-text"></span></button>',
                        filter: '<li class="multiselect-item multiselect-filter"><div class="input-group"><input  class="form-control multiselect-search" type="text" tabindex="0"/></div></li>',
                        li: '<li class="multiselect-option"><a class="multiselect-item multiselect-value" tabindex="0"><div class="cbcontainer cbcontainerUser"><input type="checkbox" class="singlecheck" /><div class="checkmark chekmarkuser"></div><label></label></div></a></li>',
                        ul: '<ul class="multiselect-container dropdown-menu scroll" style="position:relative" ></ul>',
                    }

                });
                //if ($(this).siblings('.btn-group').find('.scroll').length == 0) {
                //    $(this).siblings('.btn-group').find('.dropdown-menu').children().wrapAll("<li class='scroll'><ul></ul></li>");
                //}

                if ($(this).siblings('.btn-group').find('.divSelect').length == 0) {
                    $(this).siblings('.btn-group').find('.dropdown-menu').append('<li class="multiselect-container dropdown-menu" style="position:relative; margin-top:0px"><div class="multiselect-option"><div class="pull-left divSelect"><a class="btn btn-default btn-select" tabindex="1"><%=eBankit.Common.Globalization.Translate.GetTransactionString("Search1701", "select").Replace("\"","&quot;") %></a></div></div></li>');
                    $(this).siblings('.btn-group').find('.dropdown-menu').wrapAll('<div class="multiselect-container dropdown-menu"></div>');
                }


            });

            $(".multiselect-all").each(function () {
                $(this).attr("aria-label", " ");
            });

            $(".singlecheck").each(function () {
                $(this).attr("aria-label", $(this).val());
            });

            $('.multiselect-group').each(function () {
                $(this).addClass('active');
                var $groups = $(this).find('a');
                if (!$groups.hasClass('multiselect-item')) {
                    $groups.addClass('multiselect-item multiselect-value');
                    $groups.prepend('<input type="checkbox" class="groupcheck" checked><div class="checkmark checkmarkgroup"></div>');
                    $groups.children().wrapAll('<div class="cbcontainer cbcontainerUser"></div>');
                }
            });

            $(".selectusers").on("click keypress", function () {
                $(".btn-group").click()
            });

            $('.chekmarkuser').unbind();
            $('.chekmarkuser').on("click keypress", function () {
                var checkboxes = $(this).siblings('input[type="checkbox"]');
                var li = $(this).parents().eq(2);
                var cb = $(this).siblings('.checkbox').children('input[type="checkbox"]');
                $(cb).trigger("click");
                if (li.hasClass("active"))
                    checkboxes.prop("checked", true);
                else
                    checkboxes.prop("checked", false);
                VerifyAll($(li).parent());
                VerifyGroup($(li).prevAll('.multiselect-group').eq(0));
            });

            $(".btn-select").on("click keyup", function (e) {
                if (e.type === "keyup") {
                    if (e.keyCode === 13)
                        $(".btn-group").click();
                }
                else
                    $(".btn-group").click();
            });

            $('.multiselect-option').on("change", function () {
                var li = $(this).parents().eq(2);
                VerifyAll($(li).parent());
                VerifyGroup($(this).prevAll('.multiselect-group').eq(0));
            });

            $('.multiselect-group').on("change", function () {
                $(this).find('.checkmarkgroup').click();
            });

            $('.multiselect-all').unbind("change");

            $('.multiselect-all').on("click keypress change", function () {
                var groups = $(this).parents().eq(1).siblings('.multiselect-group');
                $.each(groups, function () {
                    VerifyGroup($(this));
                });
            });

            $('.checkmarkgroup').unbind();
            $('.checkmarkgroup').on("click keypress", function () {
                var li = $(this).parents().eq(2);
                var $group = $(li).nextUntil("li.multiselect-group")
                    .not('.multiselect-filter-hidden')
                    .not('.disabled');
                li.toggleClass('active');
                var selected = $(li).hasClass('active');
                var $inputs = $group.find('.singlecheck');

                $.each($inputs, function () {
                    if (!$(this).is(":checked") && selected) {
                        $(this).siblings('.checkmark').click();
                    }
                    else if ($(this).is(":checked") && !selected) {
                        $(this).siblings('.checkmark').click();
                    }

                });

                VerifyAll($(li).parent());
                VerifyGroup($(li));
            });

            var groups = $('.multiselect-group');
            $.each(groups, function () {
                VerifyGroup($(this));
            });
        };

        function Recheck() {
            $(document).ready(
                $('.dropdown-menu').find('li').each(function () {
                    if ($(this).hasClass("active")) {
                        var cmark = $(this).find('.singlecheck');
                        $(cmark).prop("checked", true);
                        VerifyAll($(this).parent());
                    }
                }));
        }

        function VerifyAll(parent) {
            var cb = $(parent).find('.singlecheck');
            var cbCount = $(parent).find('.singlecheck:checkbox:checked').length;
            var cbAll = parent.find(".multiselect-all");
            if (cb.length == cbCount + 1 && !$(cb).first().prop("checked") && cbAll.length != 0)
                $(cb).first().click();
        }

        function VerifyGroup(group) {
            var cbCount = $(group).nextUntil("li.multiselect-group").not('.divider').not('.divSelect');
            var totalCount = $(group).nextUntil("li.multiselect-group").filter('.active');
            var checkboxes = $(group).find('input[type="checkbox"]');
            if (cbCount.length == 0 || cbCount.length < totalCount.length) {
                if ($(group).hasClass("active")) {
                    checkboxes.prop("checked", true);
                    $(group).addClass("active");
                }
                else {
                    checkboxes.prop("checked", false);
                    $(group).removeClass("active");
                }
            }
            else if (cbCount.length == totalCount.length) {
                checkboxes.prop("checked", true);
                $(group).addClass("active");
            }
            else {
                checkboxes.prop("checked", false);
                $(group).removeClass("active");
            }
        }
    </script>
</div>

