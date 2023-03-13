<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00161_01.ascx.cs" Inherits="TRX00161_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <div class="metro" style="margin-left: 0px; padding-top: 25px;">
        <asp:Panel runat="server" CssClass="panel searchCriteria collapsed" data-role="panel" ID="divFilter" Style="margin-bottom: 0px; border: none; background-color: rgb(247, 246, 246);">
            <div class="panel panel-detail noBottomMargin" id="flwSearch">
                <div>
                    <div id="divSearchCriteria">
                        <div class="metro" style="margin-left: 0px;">
                            <div class="panel" data-role="panel" id="divTesteaver" style="border: none; margin-bottom: 0px;">
                                <div class="listHeader">
                                    <div class="col-lg-8 col-max panel-header panel-header-3" runat="server" id="pnSearchHeader" onclick="$('.panel-search').slideToggle();"></div>
                                </div>
                            </div>
                        </div>
                        <div class="clearBoth"></div>
                    </div>
                </div>
            </div>

            <asp:Panel CssClass="col-lg-8 col-max panel-content panel-search panelSearchStyle paddingTop" Style="background-color: rgb(247, 246, 246); display: none;" runat="server" ID="searchCriteriaOptions">
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                    <it:DropDownListControl_v2 ID="ddlTransferType" IsRequired="false" Label="<%$FrontEndResources:TRX00161,ddlTransferType%>" runat="server" CssClass="field field_v2 field-full" />
                    <it:DropDownListControl_v2 ID="ddlTransferStatus" IsRequired="false" Label="<%$FrontEndResources:TRX00161,ddlTransferStatus%>" runat="server" CssClass="field field_v2 field-full paddingTop" />
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                    <it:DatePickerTextBoxRangeMetroControl_v3 ID="dtSearchDate" IsRequired="false" runat="server" LabelTo="<%$FrontEndResources:DATALIST,To%>" Label="<%$FrontEndResources:TRX00161,searchFrom%>" />
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 paddingTopButtonList">
                    <asp:Button ID="btnSearch" CssClass="btn btn-primary btn-margin btn-search-datalist" Text="<%$FrontEndResources:TRX00161,btnList %>" runat="server" OnClick="btnRefresh_Click" />
                    <asp:HiddenField ID="hfSearchClick" Value="0" runat="server" />
                </div>
                <div class="clearBoth"></div>
            </asp:Panel>
        </asp:Panel>
        <asp:HiddenField ID="searchOpen" ClientIDMode="Static" runat="server" Value="0" />
    </div>

    <div class="col-lg-8 col-max">
        <asp:UpdatePanel ID="upSchedules" runat="server" UpdateMode="Always">
            <ContentTemplate>
                <it:FlowInnerContainer ID="flwData1" runat="server" CustomCssClass="col-max col-max panel panel-detail borderOperations">
                    <div class="col-lg-12 clearPadding overflowHidden">
                        <div class="metro">
                            <it:GridViewControl ID="gvTransfers" AllowPag="true" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table table-resp-to1199 inside-table noarrow"
                                GridLines="None" AllowsTopAnchor="true" EmptyDataText="<%$FrontEndResources:DATALIST,NoOperationsInfo%>" EnableRowClicks="false" OnRowDataBound="gvTransfers_RowDataBound">
                                <Columns>
                                    <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00161,OperationType%>" HeaderStyle-Width="30%" ItemStyle-Width="30%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblOperationType" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00161,InitDate%>" HeaderStyle-CssClass="right" HeaderStyle-Width="10%" ItemStyle-CssClass="right" ItemStyle-Width="10%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblInitDate" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00161,EndDate%>" HeaderStyle-CssClass="right" HeaderStyle-Width="10%" ItemStyle-CssClass="right" ItemStyle-Width="10%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblEndDate" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00161,Value%>" HeaderStyle-CssClass="right" HeaderStyle-Width="10%" ItemStyle-CssClass="right" ItemStyle-Width="10%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblValue" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00161,Currency%>" HeaderStyle-Width="10%" ItemStyle-Width="10%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblCurrency" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00161,Periodicity%>" HeaderStyle-Width="10%" ItemStyle-Width="10%">
                                        <ItemTemplate>
                                            <asp:Label ID="lblPeriodicity" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="right" ItemStyle-CssClass="padding8Important" HeaderStyle-Width="5%" ItemStyle-Width="5%">
                                        <ItemTemplate>
                                            <asp:HiddenField ID="delteHF" runat="server" />
                                            <i class="icon-zoom-in" id="iconDelete" runat="server"></i>
                                       </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderStyle-CssClass="right" ItemStyle-CssClass="padding8Important" HeaderStyle-Width="5%" ItemStyle-Width="5%">
                                        <ItemTemplate>
                                            <i class="magnifierGlassListing smallIcon" style="height: 40px; cursor: pointer; display: block; background-position: center center; background-size: 30px !important;" id="iconDetail" runat="server"></i>
                                         </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </it:GridViewControl>
                        </div>
                    </div>
                    <asp:Button ID="btnSort" CssClass="hidden" runat="server" />
                    <asp:HiddenField ID="hdnSortExpression" runat="server" />
                    <asp:HiddenField ID="hField" runat="server" />
                    <asp:Label ID="hdLabel" CssClass="hidden" runat="server"></asp:Label>
                </it:FlowInnerContainer>
            </ContentTemplate>           
        </asp:UpdatePanel>
         <script type="text/javascript">
            <%--var projectId = '<%=ConfigurationManager.AppSettings["projectId"] %>';--%>
             eBankit.Presentation.TRX00161 = eBankit.Presentation.TRX00161 || {};
             eBankit.Presentation.TRX00161.Vars = {
                projectId: "<%=ConfigurationManager.AppSettings["projectId"] %>",
                selectedAcc: function () { return $("[id$='hdnSelectedAccountId']").val(); }
            };
         </script>
    </div>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00161-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00161-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
<script type="text/javascript">    
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        $(".searchCriteria").panel();
        $("#flwSearch").on("click", function () {
            var v = $("#searchOpen").val();
            $("#searchOpen").val(Math.abs(v - 1));
        });
    });

    $(document).ready(function () {
        $("#flwSearch").on("click", function () {
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
            ValidateDateFormat: function () { return top.eBankit.Presentation.GetResource("DateRangeLimits"); }
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
    });

</script>
