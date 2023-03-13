<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00701_01.ascx.cs" Inherits="TRX00701_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div id="divContent" runat="server" class="transaction-content">
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00701-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />

    <div class="panel panel-detail">
        <div>
            <div id="divSearchCriteria" runat="server">
                <div class="metro" style="margin-left: 0px;">
                    <div class="panel" data-role="panel" id="divFilter" style="border: none; margin-bottom: 0px;">
                        <asp:UpdatePanel runat="server" ID="updatePanel1">
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnSearch" />
                            </Triggers>
                            <ContentTemplate>
                                <div class="listHeader">
                                    <div class="col-lg-8 col-max panel-header panel-header-3">
                                        <asp:Literal ID="litSearchInfo" runat="server"></asp:Literal>
                                        <div class="img-search-panel">
                                            <img id="plSearchToggle" class="panel-search-toggle" src="<%$ebFile:~/Content/currenttheme/images/products/ico_search_transactions.png%>" style="margin-top: -14px;" runat="server" tabindex="0" alt="search" />
                                            <div class="desktop-only tablet-only pull-right">
                                                <asp:LinkButton ID="lnkToggleDisplayList" runat="server" ToolTip="<%$FrontEndResources:TRX00701,OperListView%>" OnClick="btnToggleDisplayList_Click"></asp:LinkButton>
                                                <asp:LinkButton ID="lnkToggleDisplayTimeline" runat="server" ToolTip="<%$FrontEndResources:TRX00701,OperTreeView%>" OnClick="btnToggleDisplayTimeline_Click"></asp:LinkButton>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div class="col-lg-8 col-max panel-content panel-search" style="background-color: rgb(247, 246, 246); display: none;">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                <it:DatePickerTextBoxRangeMetroControl_v3 ID="dpFromTo" Label="<%$FrontEndResources:DATALIST,From%>" LabelTo="<%$FrontEndResources:DATALIST,To%>" runat="server" ValidationRequiredMessage="<%$FrontEndResources:DATALIST,RequiredDateMessage%>" CssClass="field field_v2 field-full" ToolTip="<%$FrontEndResources:DATALIST,From%>" ToolTipTo="<%$FrontEndResources:DATALIST,To%>" />
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                <it:DatePickerTextBoxRangeMetroControl_v3 ID="dpFromToExecute" Label="<%$FrontEndResources:DATALIST,FromExecute%>" LabelTo="<%$FrontEndResources:DATALIST,To%>" runat="server" ValidationRequiredMessage="<%$FrontEndResources:DATALIST,RequiredDateMessage%>" CssClass="field field_v2 field-full" ToolTip="<%$FrontEndResources:DATALIST,FromExecute%>" ToolTipTo="<%$FrontEndResources:DATALIST,To%>" />
                            </div>
                            <div class="clearBoth"></div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style="margin-bottom: 3px">
                                <it:CurrencyTextBoxIntervalControl_v2 ID="txtAmountRange" Label="<%$FrontEndResources:TRX00701,Amount%>" LabelTo="<%$FrontEndResources:TRX00701,To%>" runat="server" CssClass="field field_v2 field-full" ToolTip="<%$FrontEndResources:TRX00701,Amount%>" />
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 margin-bottom" style="margin-bottom: 10px">
                                <div class="field field_v2 field-full">
                                    <div class="label-wrapper">
                                        <asp:Label runat="server" Text="<%$FrontEndResources:TRX00701,Currency%>" class="leftField-label" ToolTip="<%$FrontEndResources:TRX00701,Currency%>"></asp:Label>
                                    </div>
                                    <div class="centerField-wrapper">
                                        <div>
                                            <select runat="server" name="ddlCurrency" id="ddlCurrency" class="multiselectbox" multiple="true" style="width: 100%" tabindex="-1" aria-hidden="true"></select>
                                        </div>
                                    </div>
                                    <div class="clearBoth"></div>
                                </div>
                            </div>
                            <div class="clearBoth"></div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style="margin-bottom: 10px">
                                <div class="field field_v2 field-full">
                                    <div class="label-wrapper">
                                        <asp:Label runat="server" Text="<%$FrontEndResources:TRX00701,State%>" ToolTip="<%$FrontEndResources:TRX00701,State%>" class="leftField-label"></asp:Label>
                                    </div>
                                    <div class="centerField-wrapper">
                                        <div>
                                            <select runat="server" name="ddlState" id="ddlState" class="multiselectbox" multiple="true" style="width: 100%" tabindex="-1" aria-hidden="true"></select>
                                        </div>
                                    </div>
                                    <div class="clearBoth"></div>
                                </div>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 margin-bottom" style="margin-bottom: 10px">
                                <div class="field field_v2 field-full">
                                    <div class="label-wrapper">
                                        <asp:Label runat="server" Text="<%$FrontEndResources:TRX00701,TransactionType%>" ToolTip="<%$FrontEndResources:TRX00701,TransactionType%>" class="leftField-label"></asp:Label>
                                    </div>
                                    <div class="centerField-wrapper">
                                        <div>
                                            <select runat="server" name="ddlTransactionType" id="ddlTransactionType" class="multiselectbox" multiple="true" style="width: 100%" tabindex="-1" aria-hidden="true"></select>
                                        </div>
                                    </div>
                                    <div class="clearBoth"></div>
                                </div>
                            </div>
                            <div class="clearBoth"></div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 margin-bottom" style="margin-bottom: 10px">
                                <div class="field field_v2 field-full">
                                    <div class="label-wrapper">
                                        <asp:Label runat="server" Text="<%$FrontEndResources:TRX00701,AccontNumber%>" ToolTip="<%$FrontEndResources:TRX00701,AccontNumber%>" class="leftField-label"></asp:Label>
                                    </div>
                                    <div class="centerField-wrapper">
                                        <div>
                                            <select runat="server" name="ddlAccountNumber" id="ddlAccountNumber" class="multiselectbox" multiple="true" style="width: 100%" tabindex="-1" aria-hidden="true"></select>
                                        </div>
                                    </div>
                                    <div class="clearBoth"></div>
                                </div>

                            </div>
                            <div runat="server" id="divOperationCreator" class="col-xs-12 col-sm-12 col-md-6 col-lg-6 margin-bottom" style="margin-bottom: 10px">
                                <div class="field field_v2 field-full">
                                    <div class="label-wrapper">
                                        <asp:Label runat="server" Text="<%$FrontEndResources:TRX00701,OperationCreator%>" ToolTip="<%$FrontEndResources:TRX00701,OperationCreator%>" class="leftField-label"></asp:Label>
                                    </div>
                                    <div class="centerField-wrapper">
                                        <div>
                                            <select runat="server" name="ddlOperationCreator" id="ddlOperationCreator" class="multiselectbox" multiple="true" style="width: 100%" tabindex="-1" aria-hidden="true"></select>
                                        </div>
                                    </div>
                                    <div class="clearBoth"></div>
                                </div>
                            </div>
                            <div class="clearBoth"></div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 margin-bottom" style="margin-bottom: 10px">
                                <it:FormRadioList_v3 ID="rbShowLoginOperation" LabelText="<%$FrontEndResources:TRX00701,ShowLoginOperation%>" runat="server" CssClass="big-radioButton" RepeatDirection="Horizontal" ToolTip="<%$FrontEndResources:TRX00701,ShowLoginOperation%>" />
                            </div>
                            <div class="clearBoth"></div>

                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                                <asp:Button ID="btnSearch" CssClass="btn btn-primary btn-margin btn-search-filter" Text="<%$FrontEndResources:TRX00701,btnSearch %>" runat="server" OnClick="btnSearch_Click" />
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
            <asp:UpdatePanel runat="server" ID="updatePanelOperations">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSearch" />
                </Triggers>
                <ContentTemplate>
                    <div class="table-grid-border panel-operations-display">
                        <asp:HiddenField runat="server" ID="displayFormat"></asp:HiddenField>
                        <it:FlowContainerDetail ID="flwData" CssClass="panel panel-detail borderOperations" runat="server">
                            <div class="col-lg-12 clearPadding overflowHidden">
                                <div class="metro">
                                    <div id="gridContainer" class="gridContainer desktop-only tablet-only phone-only" runat="server">
                                        <it:GridViewControl ID="gvOperations" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 inside-table" EmptyDataText="<%$FrontEndResources:DATALIST,NoOperationsInfo%>"
                                            GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" RecordCounterComplementarText="<%$FrontEndResources:TRX00701,gridDataecordCounterComplementarText %>" OnRowDataBound="gvOperations_RowDataBound">
                                            <Columns>
                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important visible-md visible-lg visible-sm" HeaderText="<%$FrontEndResources:TRX00701,lblType%>" ItemStyle-Width="56px">
                                                    <ItemTemplate>
                                                        <asp:Image ID="imgType" CssClass="img-table img-circlev2 img-circle" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important visible-md visible-lg visible-sm" HeaderText="<%$FrontEndResources:TRX00701,Date%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDate" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important visible-md visible-lg visible-sm" HeaderText="<%$FrontEndResources:TRX00701,Hour%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblHour" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important visible-md visible-lg visible-sm" HeaderText="<%$GenericFrontEndResources:Channel%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblChannel" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData visible-md visible-lg visible-sm padding8Important" HeaderText="<%$GenericFrontEndResources:Description%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDescription" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData visible-md visible-lg visible-sm padding8Important" HeaderText="<%$FrontEndResources:TRX00701,State%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblState" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData visible-md visible-lg visible-sm padding8Important" ItemStyle-Width="180px" HeaderText="<%$GenericFrontEndResources:Account%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAccount" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="right padding8Important formatTableData visible-md visible-lg visible-sm" ItemStyle-CssClass="right" HeaderText="<%$GenericFrontEndResources:Amount%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAmount" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important visible-md visible-lg visible-sm" ItemStyle-Width="70px" HeaderText="<%$GenericFrontEndResources:Currency%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCurrency" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="" ControlStyle-CssClass="visible-md visible-lg visible-sm" ItemStyle-CssClass="paddingTop14Important">
                                                    <ItemTemplate>
                                                        <%--<i class="icon-zoom-in visible-md visible-lg visible-sm img-table magnifierGlassListing smallIcon" style="text-indent: -100px; padding-bottom: 13px; margin-top: 3px;" id="iconDetail" runat="server"></i>--%>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField Visible="false" ItemStyle-CssClass="padding8Important">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblOperaton" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </it:GridViewControl>
                                    </div>

                                    <div id="timelineContainer" class="timeline desktop-only tablet-only" runat="server">
                                        <div id="timelineEmpty" class="timeline desktop-only tablet-only" runat="server" visible="false">
                                            <div class="table-grid table-responsive table hovered table-resp-to1199 inside-table">
                                                <div>
                                                    <table class="table hovered table-resp-to1199 inside-table" cellspacing="0" style="border-collapse: collapse;">
                                                        <tbody>
                                                            <tr>
                                                                <td><span id="timelineEmptyLabel" runat="server"></span></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <asp:Repeater ID="rptTimelineRecords" runat="server" OnItemDataBound="rptTimelineRecords_ItemDataBound">
                                            <ItemTemplate>
                                                <input type="hidden" id="operationId" runat="server" />
                                                <input type="hidden" id="ExtendedPropertyList" runat="server" />
                                                <div id="rawDate" runat="server"></div>
                                                <div id="hdValor" runat="server"></div>
                                                <div id="hdCurrency" runat="server"></div>
                                                <div class="lineContainer">
                                                    <div id="monthContainer" class="date" runat="server"></div>
                                                </div>
                                                <div id="lineContainer" runat="server" class="lineContainer" tabindex="0">
                                                    <div id="dateContainer" class="flLeft dateContainer" runat="server">
                                                        <asp:Literal ID="txtDate" runat="server"></asp:Literal>
                                                        <span class="transactions-history">
                                                            <asp:Literal ID="txtTime" runat="server"></asp:Literal>
                                                        </span>
                                                    </div>
                                                    <div id="transactionicon" runat="server" />
                                                    <div id="leftContainer" runat="server">
                                                        <div class="txtDescricao">
                                                            <asp:Literal ID="txtDescricao" runat="server"></asp:Literal>
                                                        </div>
                                                        <div class="txtValor">
                                                            <asp:Literal ID="txtValor" runat="server"></asp:Literal>
                                                        </div>
                                                        <asp:HiddenField ID="hdnTransactionId" runat="server" />
                                                        <asp:HiddenField ID="hdnStatusId" runat="server" />
                                                        <div id="status" runat="server"></div>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>

                                        <asp:Button ID="moreResults" CssClass="moreResults" runat="server" OnClick="moreResults_Click" />
                                        <asp:Button ID="moreResultsAutoScroll" CssClass="AutoScroll" runat="server" OnClick="moreResults_Click" />
                                    </div>


                                </div>
                            </div>
                            <asp:Button ID="btnSort" CssClass="hidden" runat="server" />
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
    <asp:HiddenField ID="hdnAccountNumbers" runat="server" />
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("bootstrap-multiselect.js".ResolveJsUrl(),eBankit.Common.Sites.Utils.CacheVersionKey.JScript)%>"></script>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00701-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>

    <script type="text/javascript">
        $(document).ready(function () {


            $("#selectCreators").on("click", function () {
                document.getElementsByClassName("expandButton").getAttribute("aria-expanded") = false;

            });

            $("#flwSearch").on("click", function () {
                var v = $("#searchOpen").val();
                $("#searchOpen").val(Math.abs(v - 1));
            });

            $("#flwSearchThird").on("click", function () {
                var v = $("#searchOpen").val();
                $("#searchOpen").val(Math.abs(v - 1));
            });

            $(".btn-search-datalist").on("click", function (e) {
                if ($("#aspnetForm").valid()) {
                    $(".panel-search").slideUp();
                } else {
                    e.preventDefault();
                }
            });

            // Search validation
            jQuery.validator.setDefaults({
                focusInvalid: false,
                onfocusout: false
            });

            $(".btn-search-datalist").on("click", function (e) {
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
                        li: '<li class="multiselect-option"><a class="multiselect-item multiselect-value" tabindex="0" role="checkbox" aria-checked="true"><div class="cbcontainer cbcontainerUser"><input type="checkbox" class="singlecheck" /><div class="checkmark chekmarkuser"></div><label></label></div></a></li>',
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
                $(this).attr("aria-label", $(this).children().children('label').text());
            });

            $(".multiselect-item").each(function () {
                $(this).attr("aria-label", $(this).children().children('label').text());
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
            $('.chekmarkuser').on("click keypress change", function () {
                var checkboxes = $(this).siblings('input[type="checkbox"]');
                var li = $(this).parents().eq(2);
                var cb = $(this).siblings('.checkbox').children('input[type="checkbox"]');
                var anchor = $(this).parents().eq(1);
                $(cb).trigger("click");
                if (li.hasClass("active")) 
                    checkboxes.prop("checked", true);
                else 
                    checkboxes.prop("checked", false);

                $(anchor).attr("aria-checked", $(anchor).children().children('.singlecheck')[0].checked)
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
                var anchor = $(this).children('a');
                $(anchor).attr("aria-checked", $(this).children().children().children('.singlecheck')[0].checked)
            });



            $('.multiselect-group').on("change", function () {
                $(this).find('.checkmarkgroup').click();
            });

            $('.multiselect-all').unbind("change");

            $('.multiselect-all').on("click keypress change", function () {
                VerifyAnchors();
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

            $state.siblings().find('.multiselect-option').on("change", function () {
                var $executed = $state.siblings().find('input[value="Executed"]');
                var $checkbox = $(this).find('input').not('.singlecheck');
                var $checkCount = $state.siblings().find('input:checked').not('.singlecheck').length;
                if ($checkbox.is(':checked') && $checkbox.val() != $executed.val()) {
                    $calendPickerDate3.val("");
                    $calendPickerDate3.prop('disabled', true);
                    $calendPickerDate4.val("");
                    $calendPickerDate4.prop('disabled', true);
                }
                else if (($checkbox.is(':checked') && $checkbox.val() == $executed.val() || $executed.is(':checked')) && $checkCount == 1) {
                    $calendPickerDate3.prop('disabled', false);
                    $calendPickerDate4.prop('disabled', false);
                }
                else {
                    $calendPickerDate3.val("");
                    $calendPickerDate3.prop('disabled', true);
                    $calendPickerDate4.val("");
                    $calendPickerDate4.prop('disabled', true);
                }
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
            if (cb.length == cbCount + 1 && !$(cb).first().prop("checked") && cbAll.length != 0) {
                $(cb).first().click();
                $(cbAll).first().children().attr("aria-checked", $(cb).first()[0].checked);
            }
            $(cbAll).first().children().attr("aria-checked", $(cb).first()[0].checked);
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

        function VerifyAnchors() {
            var anchors = $('a.multiselect-item');

            $(anchors).each(function () {
                try {
                    $(this).attr("aria-checked", $(this).children().children('.singlecheck')[0].checked)
                }
                catch { }
            });
        }
    </script>
</div>

