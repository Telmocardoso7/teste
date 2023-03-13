<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01999_01.ascx.cs" Inherits="TRX01999_01" %>

<div id="divContent" runat="server" class="transaction-content">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <it:FlowContainerDetail ID="flwSearch" CssClass="panel panel-detail" runat="server">
        <div id="divSearchCriteria" runat="server">
            <div class="metro" style="margin-left: 0px;">
                <div class="panel" data-role="panel" id="divTesteaver" style="border: none; margin-bottom: 0px; background-color: rgb(247, 246, 246);">
                    <div class="listHeader">
                        <div class="col-lg-8 col-max panel-header panel-header-3" id="pnSearchHeader" onclick="$('.panel-search').slideToggle();">
                            <asp:Literal ID="litSearchInfo" Text="<%$FrontEndResources:DATALIST,SearchInfo %>" runat="server"></asp:Literal>

                            <div class="img-search-panel">
                                <img id="Img1" src="<%$ebFile:~/content/currenttheme/images/products/ico_search_transactions.png%>" style="margin-top: -12px;"
                                    runat="server" alt="search" />
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8 col-max panel-content panel-search" style="background-color: rgb(247, 246, 246);">
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" runat="server" id="dynamic">
                            <it:DatePickerTextBoxRangeMetroControl_v3 ID="dpFromTo" Label="<%$FrontEndResources:DATALIST,From%>" LabelTo="<%$FrontEndResources:DATALIST,To%>" runat="server" CssClass="field field_v2 metro" MinDate="2019/10/10" MaxDate="2020/12/31" ShowToolTipLikeHelp="true" ToolTip="teste1" ToolTipTo="<%$FrontEndResources:DATALIST,From %>" ToolTipKey="<%$FrontEndResources:DATALIST,To %>"/>
                            </div>
                        <div class="clearBoth"></div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                            <asp:Button ID="btnSearch" CssClass="btn btn-primary btn-margin btn-search-datalist" Text="<%$FrontEndResources:TRX00701,btnSearch %>" runat="server" />
                        </div>
                        <div class="clearBoth"></div>
                    </div>
                </div>
            </div>
            <div class="clearBoth"></div>
        </div>
    </it:FlowContainerDetail></ContentTemplate></asp:UpdatePanel>
    <asp:UpdatePanel ID="updContent" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <it:FlowInnerContainer ID="flwData1" Title="Label Groups" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <div>
                    <it:EntitiesDropDownListControl ID="EntityControl" TransactionId="3" Label="<%$FrontEndResources:Generic,Entities %>" runat="server" AutoCompleteEnabled="true" />
                    <it:FlowLabel_v3 ID="label1" Label="Label 1" runat="server" Fullwidth="false" />
                    <asp:DropDownList ID="ddlLabel1" runat="server" Style="margin-left: 22%; margin-top: -3%;"></asp:DropDownList>
                    <it:FlowLabel_v3 ID="label2" Label="Label 2" runat="server" />
                    <asp:DropDownList ID="ddlLabel2" runat="server" Style="margin-left: 22%; margin-top: -3%;"></asp:DropDownList>
                    <it:FlowLabel_v3 ID="label3" Label="Label 3" runat="server" />
                    <asp:DropDownList ID="ddlLabel3" runat="server" Style="margin-left: 22%; margin-top: -3%;"></asp:DropDownList>
                    <it:FlowLabel_v3 ID="label4" Label="Label 4" runat="server" />
                    <asp:DropDownList ID="ddlLabel4" runat="server" Style="margin-left: 22%; margin-top: -3%;"></asp:DropDownList>
                    <it:FlowLabel_v3 ID="label5" Label="Label 5" runat="server" />
                    <asp:DropDownList ID="ddlLabel5" runat="server" Style="margin-left: 22%; margin-top: -3%;"></asp:DropDownList>
                    <it:FlowLabel_v3 ID="label6" Label="Label 6" runat="server" />
                    <asp:DropDownList ID="ddlLabel6" runat="server" Style="margin-left: 22%; margin-top: -3%;"></asp:DropDownList>
                </div>
            </it:FlowInnerContainer>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">
        eBankit.Presentation.DataListControl = function () {
            $(".panel-search").slideUp();


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

            $(".panel-search-toggle").on("click", function () {
                $(".panel-search").slideToggle();
            });

            var $calendPickerDateName1 = $calendPickerDate1.attr("name");
            var $calendPickerDateName2 = $calendPickerDate2.attr("name");

            var $params = { debug: false, rules: {}, messages: {}, success: function (label) { label.addClass("valid"); } };
            $params['rules'][$calendPickerDateName1] = { "required": true, "Validate1DateLimit": true, "ValidateDateFormat": true };
            $params['rules'][$calendPickerDateName2] = { "required": true, "Validate2DateLimit": true, "ValidateDateFormat": true };




            $params['messages'][$calendPickerDateName1] = {
                Validate1DateLimit: function () { return top.eBankit.Presentation.GetResource("DateRangeLimits"); },
                ValidateDateFormat: function () { return top.eBankit.Presentation.GetResource("DateRangeLimits"); }
            };

            $params['messages'][$calendPickerDateName2] = {
                Validate2DateLimit: function () { return ""; },
                ValidateDateFormat: function () { return ""; }
            };



            var validator = $("#aspnetForm").validate($params);

            jQuery.validator.addMethod("ValidateDateFormat", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp($calendPickerDate1.val()) && eBankit.Presentation.InternalValidation($calendPickerDate1.val()); });
            jQuery.validator.addMethod("ValidateDateFormat", function (value, element) { return eBankit.Presentation.ValidateNotRequiredDateFormatExp($calendPickerDate2.val()) && eBankit.Presentation.InternalValidation($calendPickerDate2.val()); });

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

        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.Presentation.DataListControl);

        $(document).ready(function () {
            eBankit.Presentation.DataListControl();
        });
    </script>

    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/Services/Transactions/TRX01999-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Content/Themes/master/Services/Transactions/TRX01999-1.0.css", eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>


