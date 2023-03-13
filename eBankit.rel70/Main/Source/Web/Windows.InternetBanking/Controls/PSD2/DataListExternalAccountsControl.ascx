<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DataListExternalAccountsControl.ascx.cs" Inherits="DataListExternalAccountsControl" %>


<div id="divDataList" runat="server">
    <div class="transaction-content" style="margin-bottom: 10px">
        <it:FlowContainerDetail ID="flwSearch" CssClass="panel panel-detail" runat="server">
            <div id="divSearchCriteria" runat="server">
                <div class="metro" style="margin-left: 0px;">
                    <div class="panel" data-role="panel" id="divTesteaver" style="border: none; margin-bottom: 0px; background-color: rgb(247, 246, 246);">
                        <div class="listHeader">
                            <div class="col-lg-8 col-max panel-header panel-header-3" id="pnSearchHeader" onclick="$('.panel-search').slideToggle();">
                                <asp:Literal ID="litSearchInfo" Text="<%$FrontEndResources:DATALIST,SearchInfo %>" runat="server"></asp:Literal>

                                <div class="img-search-panel">
                                    <img id="Img1" src="<%$ebFile:~/content/currenttheme/images/products/ico_search_transactions.png%>" style="margin-top: -12px;"
                                        runat="server"  tabindex="0" alt="search"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8 col-max panel-content panel-search" style="background-color: rgb(247, 246, 246);">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                <it:DatePickerTextBoxRangeMetroControl_v3 ID="dpFromTo" Label="<%$FrontEndResources:DATALIST,From%>" LabelTo="<%$FrontEndResources:DATALIST,To%>" runat="server" CssClass="field field_v2 metro" />
                            </div>
                            <div class="clearBoth"></div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                                <asp:Button ID="btnSearch" CssClass="btn btn-primary btn-margin btn-search-datalist" Text="<%$FrontEndResources:TRX00701,btnSearch %>" ToolTip="<%$FrontEndResources:TRX00701,btnSearch %>" runat="server" />
                            </div>
                            <div class="clearBoth"></div>
                        </div>
                    </div>
                </div>
                <div class="clearBoth"></div>
            </div>
        </it:FlowContainerDetail>
        <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div class="table-grid-border col-lg-8 col-max">
                    <div id="slider"></div>
                    <asp:HiddenField ID="hdnActualPageId" Value="0" runat="server" />
                    <div class="col-lg-12 clearPadding">
                        <asp:HiddenField ID="hdnProof" runat="server" />
                        <asp:Button ID="btnSort" CssClass="hidden" runat="server" />
                        <div class="metro" style="overflow: auto;">
                            <it:GridViewControl ID="gridData" runat="server" AutoGenerateColumns="false" CssClass="table hovered inside-table" IsResponsive="true" EmptyDataText="<%$FrontEndResources:DATALIST,NoMovementsInfo%>"
                                GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" RecordCounterComplementarText="<%$FrontEndResources:DATALIST,gridDataecordCounterComplementarText %>"
                                OnRowDataBound="gridData_RowDataBound" ShowPageNumbers="false" NextBtnEnabled="false" PreviousBtnEnabled="false">
                                <Columns>
                                    <asp:TemplateField HeaderText="<%$FrontEndResources:ExternalAccounts,Date%>" HeaderStyle-Width="15%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblTransactionDate" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="<%$FrontEndResources:ExternalAccounts,DateValue%>" HeaderStyle-Width="15%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblValueDate" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$FrontEndResources:ExternalAccounts,Description%>" HeaderStyle-Width="40%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDescription" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$FrontEndResources:ExternalAccounts,Value%>" HeaderStyle-Width="15%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAmount" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$FrontEndResources:ExternalAccounts,Currency%>" HeaderStyle-Width="5%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCurrency" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton NavigateUrl="#" ID="imgTransactionDetail" runat="server" ToolTip="<%$FrontEndResources:TRX02103,TransactionDetail%>" CssClass="accountExpandicon"></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField ItemStyle-CssClass="hideGridColumn">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="hdnTransactionDetailURL" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </it:GridViewControl>
                        </div>
                    </div>
                    <div class="clearBoth"></div>
                </div>

                <div id="proofContainer" class="proof-container" runat="server">
                    <div class="proof-inner">
                        <asp:PlaceHolder ID="phProofInner" runat="server"></asp:PlaceHolder>
                    </div>
                </div>
                <div class="clearBoth"></div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Button ID="btnLoadList" CssClass="hidden" runat="server" />
        <iframe id="iframeControlDocument" name="iframeControlDocument" src="/DigitalDocument.aspx" height="0" width="0" style="border: 0;" aria-label="iframeControlDocument"></iframe>
    </div>
</div>
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

<style type="text/css">
    #main_container {
        width: 100% !important;
    }

    .hideGridColumn
        {
            display: none;
        }
</style>
