
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00153_01.ascx.cs" Inherits="TRX00153_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <div class="panel panel-detail">
        <div id="divSearchCriteria" runat="server">
            <div class="metro" style="margin-left: 0px;">
                <div class="panel" data-role="panel" id="divFilter" style="border: none; margin-bottom: 0px; background-color: rgb(247, 246, 246);">
                    <div class="listHeader">
                        <div class="col-lg-8 col-max panel-header panel-header-3" onclick="$('.panel-search').slideToggle();">
                            <asp:Literal ID="litSearchInfo" Text="<%$FrontEndResources:DATALIST,SearchInfo %>" runat="server"></asp:Literal>
                            <div class="img-search-panel">
                                <img src="<%$ebFile:~/Content/currenttheme/images/products/ico_search_transactions.png%>" style="margin-top: -12px;" runat="server" alt="search" />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 col-max panel-content panel-search" style="background-color: rgb(247, 246, 246);">
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                            <it:DatePickerTextBoxRangeMetroControl_v3 ID="datepicker" Label="<%$FrontEndResources:DATALIST,From%>" LabelTo="<%$FrontEndResources:DATALIST,To%>" runat="server" CssClass="field field_v2 metro" />
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                            <it:DropDownListControl_v2 ID="ddlDocType" Width="100%" Label="<%$FrontEndResources:TRX00153,DocumentType%>" CssClass="field field_v2 field-full" runat="server" />
                        </div>
                        <div class="clearBoth" style="padding-top: 15px"></div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                            <asp:Button ID="btnSearch" CssClass="btn btn-primary btn-margin btn-search-filter btn-search-datalist" OnClientClick="return FilterSearch();" runat="server" OnClick="btnSearch_Click" Text="<%$FrontEndResources:TRX00901,btnSearch%>" />
                        </div>
                        <div class="clearBoth"></div>
                    </div>
                </div>
            </div>
            <div class="clearBoth"></div>
        </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
        <div class="transaction-content" id="trxDocsDigitais">
            <asp:UpdatePanel runat="server" ID="updatePanelOperations">
                <ContentTemplate>
                    <div class="table-grid-border">
                        <it:FlowContainerDetail ID="flwData" CssClass="panel panel-detail borderOperations" runat="server">
                            <div class="col-lg-12 clearPadding overflowHidden">
                                <div class="metro">
                                    <div id="gridContainer" style="display: block; overflow: hidden; margin-top: 20px;" runat="server">
                                        <it:GridViewControl ID="gvDigitalDocs" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table table-resp-to1199 inside-table noarrow" EmptyDataText="<%$FrontEndResources:TRX00153,NoDigitalDocs%>"
                                            GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="gvDigitalDocs_RowDataBound" AllowPag="false">
                                            <Columns>
                                                <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00153,DocumentDate%>" HeaderStyle-Width="10%" ItemStyle-Width="10%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDocumentDate" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00153,DocumentType%>" HeaderStyle-Width="30%" ItemStyle-Width="30%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDocumentType" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00153,DocumentName%>" HeaderStyle-Width="55%" ItemStyle-Width="55%">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDocumentName" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="right" ItemStyle-CssClass="padding8Important" HeaderStyle-Width="5%" ItemStyle-Width="5%">
                                                    <ItemTemplate>
                                                        <asp:Image ID="imgPDF" ImageUrl="<%$ebFile:~/Content/currenttheme/images/products/ico_export_pdf.png%>" CssClass="img-table img-circlev2 cursorPointer" Style="width: 40px;" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </it:GridViewControl>
                                        <div class="col-lg-8 col-max">
                                            <it:Pager ID="pager" runat="server" PageSize="10" PagerType="NumericPages" OnPageChanged="ClickPageChanged" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <asp:Button ID="btnSort" CssClass="hidden" runat="server" />
                        </it:FlowContainerDetail>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <iframe id="iframeControlProof" name="iframeControlProof" src="/ProofPage.aspx" height="0" width="0" style="border: 0px;"></iframe>
        </div>
    </div>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00153-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
<script type="text/javascript">

    eBankit.Presentation.TRX00153 = function () {

        $(".panel-search").slideUp();


        $(".btn-search-datalist").on("click", function (e) {
            if ($("#aspnetForm").valid()) {
                $(".panel-search").slideUp();
            } else {
                e.preventDefault();
            }
        });

        $('.btn-search-datalist').keypress(function (e) {
            if (e.keyCode === 32 || e.keyCode === 13) {
                e.preventDefault();
                $(this).click();
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

        $(".panel-search-toggle").on("click", function () {
            $(".panel-search").slideToggle();
        });

        var $calendPickerDateName1 = $calendPickerDate1.attr("name");
        var $calendPickerDateName2 = $calendPickerDate2.attr("name");


        var $params = { debug: false, rules: {}, messages: {}, success: function (label) { label.addClass("valid"); } };
        $params['rules'][$calendPickerDateName1] = { "required": true, "Validate1DateLimit": true, "ValidateDateFormat": true };
        $params['rules'][$calendPickerDateName2] = { "required": true, "Validate2DateLimit": true, "ValidateDateFormat2": true };

        $params['messages'][$calendPickerDateName1] = {
        Validate1DateLimit: function () { return top.eBankit.Presentation.GetResource("DateRangeLimits"); },
        ValidateDateFormat: function () { return  top.eBankit.Presentation.GetResource("DateRangeLimits"); }
    };

    $params['messages'][$calendPickerDateName2] = {
        Validate2DateLimit: function () { return ""; },
        ValidateDateFormat2: function () { return ""; }
    };

        var validator = $("#aspnetForm").validate($params);


        jQuery.validator.addMethod("ValidateDateFormat", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp($calendPickerDate1.val()) && eBankit.Presentation.InternalValidation($calendPickerDate1.val()); });
        jQuery.validator.addMethod("ValidateDateFormat2", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp($calendPickerDate2.val()) && eBankit.Presentation.InternalValidation($calendPickerDate2.val()); });

        jQuery.validator.addMethod("Validate1DateLimit", function (value, element) { return eBankit.Presentation.ValidateMaxDate(value, $calendPickerDate2.val()); });
        jQuery.validator.addMethod("Validate2DateLimit", function (value, element) { return eBankit.Presentation.ValidateMinDate(value, $calendPickerDate1.val()); });


        jQuery.validator.messages.required = top.eBankit.Presentation.GetResource("RequiredField");

        $calendPickerDate1.click(function () {
        var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate2.val());
        var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate1.val());
        var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate1.val(), dateJSFormat));
        var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate2.val(), dateJSFormat));

        if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
            $calendPickerDate1.removeClass("error valid");
            $calendPickerDate2.removeClass("error valid");
            $calendPickerDate1.next("label").remove();
            $calendPickerDate2.next("label").remove();
        } else {
            $calendPickerDate1.addClass("error valid");
            $calendPickerDate2.addClass("error valid");
            $("#aspnetForm").submit();

        }
    });

    $calendPickerDate2.click(function () {
        var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate2.val());
        var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate1.val());
        var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate1.val(), dateJSFormat));
        var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate2.val(), dateJSFormat));

        if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
            $calendPickerDate1.removeClass("error valid");
            $calendPickerDate2.removeClass("error valid");
            $calendPickerDate1.next("label").remove();
            $calendPickerDate2.next("label").remove();
        } else {
            $calendPickerDate1.addClass("error valid");
            $calendPickerDate2.addClass("error valid");
            $("#aspnetForm").submit();

        }
    });

        $calendPickerDate2.focusout(function () {
            var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate2.val());
            var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate1.val());
            var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate1.val(), dateJSFormat));
            var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate2.val(), dateJSFormat));
            var firstDate = eBankit.dateJS.formatDate($calendPickerDate2.datepicker("getStartDate"), dateJSFormat);
            var lastDate = eBankit.dateJS.formatDate($calendPickerDate2.datepicker("getEndDate"), dateJSFormat);
            var formatedFirstDate = eBankit.dateJS.getDateFromFormat(firstDate, dateJSFormat);
            var formatedLastDate = eBankit.dateJS.getDateFromFormat(lastDate, dateJSFormat);
            var formatedDate = eBankit.dateJS.getDateFromFormat($calendPickerDate2.val(), dateJSFormat);

            if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
                $calendPickerDate1.removeClass("error valid");
                $calendPickerDate2.removeClass("error valid");
                $calendPickerDate1.next("label").remove();
                $calendPickerDate2.next("label").remove();
            } else {
                $calendPickerDate1.addClass("error valid");
                $calendPickerDate2.addClass("error valid");
                $("#aspnetForm").submit();

            }
            if (formatedDate < formatedFirstDate || formatedDate > formatedLastDate) {
                $calendPickerDate2.val('');
            }
        });


        $calendPickerDate1.focusout(function () {
            var dateMaxFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate2.val());
            var dateMinFormatValid = eBankit.Presentation.InternalValidation($calendPickerDate1.val());
            var dateMin = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate1.val(), dateJSFormat));
            var dateMax = new Date(eBankit.dateJS.getDateFromFormat($calendPickerDate2.val(), dateJSFormat));
            var firstDate = eBankit.dateJS.formatDate($calendPickerDate2.datepicker("getStartDate"), dateJSFormat);
            var lastDate = eBankit.dateJS.formatDate($calendPickerDate2.datepicker("getEndDate"), dateJSFormat);
            var formatedFirstDate = eBankit.dateJS.getDateFromFormat(firstDate, dateJSFormat);
            var formatedLastDate = eBankit.dateJS.getDateFromFormat(lastDate, dateJSFormat);
            var formatedDate = eBankit.dateJS.getDateFromFormat($calendPickerDate1.val(), dateJSFormat);

            if (dateMax >= dateMin && dateMaxFormatValid == true && dateMinFormatValid == true) {
                $calendPickerDate1.removeClass("error valid");
                $calendPickerDate2.removeClass("error valid");
                $calendPickerDate1.next("label").remove();
                $calendPickerDate2.next("label").remove();
            } else {
                $calendPickerDate1.addClass("error valid");
                $calendPickerDate2.addClass("error valid");
                $("#aspnetForm").submit();

            }
            if (formatedDate < formatedFirstDate || formatedDate > formatedLastDate) {
                $calendPickerDate1.val('');
            }
        });
    }

    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.TRX00153);

    $(document).ready(function () {
        eBankit.Presentation.TRX00153();
    });

</script>
