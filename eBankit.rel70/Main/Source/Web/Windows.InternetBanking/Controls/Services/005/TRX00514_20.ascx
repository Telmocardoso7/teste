<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00514_20.ascx.cs" Inherits="TRX00514_20" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server">
    <div class="proof-inner">
        <asp:PlaceHolder ID="phProofInner" runat="server"></asp:PlaceHolder>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-8 col-max clearPadding">
        <div id="divResult" runat="server" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 bs-reduced bs-head-metro bs-reduced-transaction transp clearPadding">

            <h3 id="titleSelectProduct" runat="server" class="head" style="padding: 0px"></h3>
            <div style="border: none; padding-bottom: 0px">
                <div id="divProduct" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 fillcredid" style="height: 100px; padding: 0px; background-color: #eee">
                    <div style="width: 58%; float: left">
                        <h3 id="titleProduct" runat="server" class="head" style="padding: 12px 0px 7px 10px"></h3>
                        <div class="info-bottom-text col-max" style="padding-left: 10px; overflow:hidden; height: 50px;">
                            <asp:Label ID="lblProductText" runat="server"></asp:Label>
                        </div>
                    </div>
                    <div id="imgProduct" class="imageProductCredit" runat="server"></div>
                </div>
            </div>

            <div id="divResultAccount" runat="server" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 bs-reduced bs-head-metro bs-reduced-transaction transp loanResult clearPadding"></div>

            <div style="clear: both;"></div>
            <asp:UpdatePanel ID="udpSimulationData" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSimulator" />
                </Triggers>
                <ContentTemplate>

                    <asp:HiddenField ID="hdnmaxBallonVar" runat="server" />
                    <asp:HiddenField ID="hdnmaxInitialVar" runat="server" />
                    <asp:HiddenField ID="hdnCurrentMaxBallon" runat="server" />
                    <asp:HiddenField ID="hdnCurrentMaxInitial" runat="server" />
                    <div id="divResultData" runat="server" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 bs-reduced bs-head-metro bs-reduced-transaction transp loanResult clearPadding"></div>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>
        <div id="divAdjust" class="col-xs-12 col-sm-12 col-md-4 col-lg-4" style="float:right">
            <div id="divAdjustControls" style="background-color: #eee; padding:10px" runat="server" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 bs-reduced bs-head-metro transp">
                <asp:Label ID="lblTitleSimulationloan" Style="display: block; color: rgb(1, 115, 167); text-transform:uppercase; margin-bottom: 10px; font-family:'Gotham Book'" CssClass="" Text="<%$FrontEndResources:TRX00514,lblTitleSimulationloan %>" runat="server"></asp:Label>
                <asp:Label ID="lblSubsTitleSimulationloan" Style="display: block; margin-bottom: 25px; font-family:'Gotham Book'" CssClass="" Text="<%$FrontEndResources:TRX00514,lblSubsTitleSimulationloan %>" runat="server"></asp:Label>
                <div id="divLoanAmount" style="margin-bottom:20px" runat="server">
                    <div class="sliderTitle">
                        <it:FlowLabel_v3 ID="flwLoanAmount" Label="<%$FrontEndResources:TRX00514,LoanAmount %>" runat="server" />
                    </div>
                    <asp:TextBox ID="tbLoanAmount" runat="server" CssClass="slideValue" aria-labelledby="MainContent_TransactionMainContent_txpTransactions_ctl01_flwLoanAmount_lbLeftSpan"></asp:TextBox>
                    <div style="clear: both;"></div>
                    <div class="metro field field_v2 break">
                        <div class="label-wrapper"></div>
                        <div class="sliderPick">
                            <%--<div id="sliderLoanAmountMore" class="divLess"></div>--%>
                            <div id="sliderLoanAmount" class="divCenter"></div>
    <%--                        <div id="sliderLoanAmountLess" class="divMore"></div>--%>
                        </div>
                        <div style="clear: both;"></div>
                    </div>
                </div>
                <div id="divCollateralValue" style="margin-bottom:20px" runat="server">
                    <div class="sliderTitle">
                        <it:FlowLabel_v3 ID="flwCollateralValue" Label="<%$FrontEndResources:TRX00514,CollateralValue %>" runat="server" />
                    </div>
                    <asp:TextBox ID="tbCollateralValue" runat="server" CssClass="slideValue" aria-labelledby="MainContent_TransactionMainContent_txpTransactions_ctl01_flwCollateralValue_lbLeftSpan"></asp:TextBox>
                    <div style="clear: both;"></div>
                    <div class="metro field field_v2 break" style="padding-top: 10px;">
                        <div class="label-wrapper"></div>
                        <div class="sliderPick">
                     <%--       <div id="sliderCollateralValueLess" class="divLess"></div>--%>
                            <div id="sliderCollateralValue" class="divCenter"></div>
                     <%--       <div id="sliderCollateralValueMore" class="divMore"></div>--%>
                        </div>
                        <div style="clear: both;"></div>
                    </div>
                </div>
                <div id="divLoanDuration" style="margin-bottom:20px" runat="server">
                    <div class="sliderTitle">
                        <it:FlowLabel_v3 ID="flwLoanDuration" Text="<%$FrontEndResources:TRX00514,flwLoanDuration %>" Label="<%$FrontEndResources:TRX00514,lblLoanDuration %>" runat="server" /> 
                    </div>
                    <asp:TextBox ID="tbLoanDuration" runat="server" CssClass="slideValue" aria-labelledby="MainContent_TransactionMainContent_txpTransactions_ctl01_flwLoanDuration_lbLeftSpan"></asp:TextBox>
                    <div style="clear: both;"></div>
                    <div class="metro field field_v2 break" style="padding-top: 10px;">
                        <div class="label-wrapper"></div>
                        <div class="sliderPick">
    <%--                        <div id="sliderLoanDurationLess" class="divLess"></div>--%>
                            <div id="sliderLoanDuration" class="divCenter"></div>
    <%--                        <div id="sliderLoanDurationMore" class="divMore"></div>--%>
                        </div>
                        <div style="clear: both;"></div>
                    </div>
                </div>
                <div id="divInitialPayment" style="margin-bottom:20px" runat="server">
                    <div class="sliderTitle">
                        <it:FlowLabel_v3 ID="flwInitialPayment" Label="<%$FrontEndResources:TRX00514,lblInitialPayment %>" runat="server" /> 
                    </div>
                    <asp:TextBox ID="tbInitialPayment" runat="server" CssClass="slideValue" aria-labelledby="MainContent_TransactionMainContent_txpTransactions_ctl01_flwInitialPayment_lbLeftSpan"></asp:TextBox>
                    <div style="clear: both;"></div>
                    <div class="metro field field_v2 break" style="padding-top: 10px;">
                        <div class="label-wrapper"></div>
                        <div class="sliderPick">
                            <div id="sliderInitialPayment" class="divCenter"></div>
                        </div>
                        <div style="clear: both;"></div>
                    </div>
                </div>
                <div id="divBalloonPayment" style="margin-bottom:20px" runat="server">
                    <div class="sliderTitle">
                        <it:FlowLabel_v3 ID="flwBalloonPayment" Label="<%$FrontEndResources:TRX00514,flwBalloonPayment %>" runat="server" /> 
                    </div>
                    <asp:TextBox ID="tbBalloonPayment" runat="server" CssClass="slideValue" aria-labelledby="MainContent_TransactionMainContent_txpTransactions_ctl01_flwBalloonPayment_lbLeftSpan"></asp:TextBox>
                    <div style="clear: both;"></div>
                    <div class="metro field field_v2 break" style="padding-top: 10px;">
                        <div class="label-wrapper"></div>
                        <div class="sliderPick">
                            <div id="sliderBalloonPayment" class="divCenter"></div>
                        </div>
                        <div style="clear: both;"></div>
                    </div>
                </div>
                <div id="divInterestOnlyPeriod" style="margin-bottom:20px" runat="server">
                    <div class="sliderTitle">
                        <it:FlowLabel_v3 ID="flwInterestOnlyPeriod" Text="<%$FrontEndResources:TRX00514,month %>" Label="<%$FrontEndResources:TRX00514,flwInterestOnlyPeriod %>" runat="server" />
                    </div>
                    <asp:TextBox ID="tbInterestOnlyPeriod" runat="server" CssClass="slideValue" aria-labelledby="MainContent_TransactionMainContent_txpTransactions_ctl01_flwInterestOnlyPeriod_lbLeftSpan"></asp:TextBox>
                    <div style="clear: both;"></div>
                    <div class="metro field field_v2 break" style="padding-top: 10px;">
                        <div class="label-wrapper"></div>
                        <div class="sliderPick">
    <%--                        <div id="sliderInterestOnlyPeriodLess" class="divLess"></div>--%>
                            <div id="sliderInterestOnlyPeriod" class="divCenter"></div>
    <%--                        <div id="sliderInterestOnlyPeriodMore" class="divMore"></div>--%>
                        </div>
                        <div style="clear: both;"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <asp:UpdatePanel ID="udpGraphData" runat="server" UpdateMode="Conditional">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSimulator" />
        </Triggers>
        <ContentTemplate>
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding">
                <div class="clearBoth"></div>
                <it:CreditSimulationGraphData ID="graphSimulation" runat="server"></it:CreditSimulationGraphData>
            </div>
            <asp:Panel ID="pnlOppeningAccount" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" runat="server">
                <div class="clearBoth"></div>
            </asp:Panel>
            <asp:Panel ID="pnlFirstTransfer" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" Style="padding-bottom: 30px;" runat="server">
                <div class="clearBoth"></div>
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="flwDataContainer" UpdateMode="Conditional" ChildrenAsTriggers="true" runat="server">
        <ContentTemplate>

        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-8 col-max clearPadding">
            <div id="divPaymentPlan" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 bs-reduced bs-head-metro bs-reduced-transaction transp loanResult clearPadding" runat="server">
                <h3 id="titlePaymentPlan" runat="server" class="head"></h3>
                <div>
                    <h3 id="titlePickPlan" runat="server" class="head-plan head" ></h3>
                    <span class="metro icon-circle" style="float: right;">
                        <i id="collapsePlanIcon" style="float: right; margin-left: 4px;" runat="server" onclick="SetAccountType(this);"></i>
                    </span>

                    <div class="clearBoth"></div>
                    <div id="collapsePlan"  runat="server" >
                        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max loanPlan">
                            <div class="table-grid-border">
                                <it:FlowContainerDetail ID="flwData" CssClass="panel panel-detail borderOperations" runat="server">
                                    <div class="clearPadding overflowHidden">
                                        <div class="metro">
                                            <it:GridViewControl ID="gvSalariesAgenda" AllowPag="true" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table table-resp-to1199 inside-table noarrow"
                                                GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="gvOperations_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00514,RecordType%>" ItemStyle-CssClass="paddingTop13Important paddingBottom13Important paddingLeft8Important paddingRight8Important" HeaderStyle-Width="35%" ItemStyle-Width="35%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRecordType" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00514,Installment%>" ItemStyle-CssClass="paddingTop13Important paddingBottom13Important paddingLeft8Important paddingRight8Important" HeaderStyle-Width="13%" ItemStyle-Width="13%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInstallment" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00514,PaymentValue%>" HeaderStyle-CssClass="right" HeaderStyle-Width="15%" ItemStyle-CssClass="right paddingTop13Important paddingBottom13Important paddingLeft8Important paddingRight8Important" ItemStyle-Width="15%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPaymentValue" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00514,InterestValue%>" HeaderStyle-CssClass="right" HeaderStyle-Width="17%" ItemStyle-CssClass="paddingTop13Important paddingBottom13Important paddingLeft8Important paddingRight8Important right" ItemStyle-Width="17%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblInterestValue" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00514,DebtValue%>" HeaderStyle-CssClass="right" ItemStyle-CssClass="paddingTop13Important paddingBottom13Important paddingLeft8Important paddingRight8Important right" HeaderStyle-Width="16%" ItemStyle-Width="16%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDebtValue" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00514,PaymentDate%>" ItemStyle-CssClass="paddingTop13Important paddingBottom13Important paddingLeft8Important paddingRight8Important right" HeaderStyle-Width="15%" ItemStyle-Width="10%">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblPaymentDate" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-CssClass="right">
                                                        <ItemTemplate>
                                                            <i class="curLoanSimulationArrowStyle" id="iconDetail" runat="server"></i>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </it:GridViewControl>
                                            <div class="col-lg-8 col-max">
                                                <it:Pager ID="pager" runat="server" PageSize="10" VisiblePages="10" PagerType="NumericPages" OnPageChanged="ClickPageChanged" />
                                            </div>
                                        </div>
                                    </div>
                                    <asp:Button ID="btnSort" CssClass="hidden" runat="server" />
                                </it:FlowContainerDetail>
                            </div>
                        </div>
                    </div>
                        <asp:LinkButton runat="server" CssClass="hidden" ID="btnSimulator"></asp:LinkButton>
                </div>
            </div>
        </div>

        </ContentTemplate>
    </asp:UpdatePanel>

    <div class="inprint" style="margin-top: 20px;">
        <asp:Label ID="lblOperationID" runat="server"></asp:Label>
        <asp:Label ID="lblPrintDate" Style="display: block; margin-top: 10px;" runat="server"></asp:Label>
    </div>
    <div class="clearBoth"></div>

    <asp:HiddenField ID="hdnFavoritImageId" runat="server" />
    <asp:HiddenField ID="hdnFavoritBenef" runat="server" />
    <div class="clearBoth paddingTop20 paddingBottom20"></div>

    <div id="ImgPanel" class="fullWidth noFloatOfHidden landingAccountContainer clearPadding paddingTop20 paddingBottom20">
        <div class="info-bottom-text col-lg-8 col-max">
            <asp:Label ID="lblWarning" Text="<%$FrontEndResources:TRX00514,Warning%>" runat="server"></asp:Label>
        </div>
    </div>

     <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00514-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>

<%--<link rel="stylesheet" href="//code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">--%>
<script src="../../../Scripts/jquery-ui-1.13.js"></script>
<link href="../../../Content/Themes/ebankIT/components/TRX00514.css" rel="stylesheet" />

<script>

    function ShowOpen() {
        SetAccountType(null);
    }

    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        loadSlider(true);
    });

    $(document).ready(function () {
        loadSlider(false);

        $('#aspnetForm').keypress(function (e) {
            if (e.keyCode == '13') {
                RefreshSimulation();
                return false;
            }
        });

        $('#aspnetForm').submit(function (e) {
            $("input").blur();
            $("textarea").blur();
        });
    });

    function loadSlider(destroy) {
        CreateSlider(tbLoanAmount, "#sliderLoanAmount", currentLoanAmount, minLoanAmount, maxLoanAmount, stepLoanAmount, destroy);

        CreateSlider(tbLoanDuration, "#sliderLoanDuration", currentLoanDuration, minLoanDuration, maxLoanDuration, stepLoanDuration, destroy);

        if (initCollateralValue)
            CreateSlider(tbCollateralValue, "#sliderCollateralValue", currentCollateralValue, minCollateralValue, maxCollateralValue, stepCollateralValue, destroy);

        if (initInitialPayment)
            CreateSlider(tbInitialPayment, "#sliderInitialPayment", currentInitialPayment, minInitialPayment, maxInitialPayment, stepInitialPayment, destroy);

        if (initBalloonPayment)
            CreateSlider(tbBalloonPayment, "#sliderBalloonPayment", currentBalloonPayment, minBalloonPayment, maxBalloonPayment, stepBalloonPayment, destroy);

        if (initInterestOnlyPeriod)
            CreateSlider(tbInterestOnlyPeriod, "#sliderInterestOnlyPeriod", currentInterestOnlyPeriod, minInterestOnlyPeriod, maxInterestOnlyPeriod, stepInterestOnlyPeriod, destroy);

    }

    SetAccountType = function (obj) {
        var iconArrowNIB = $('[id$=collapsePlan]');

        var iconArrow = $('[id$=collapsePlanIcon]');
        if (iconArrow.hasClass("icon-transfers-up")) {
            iconArrow.removeClass("icon-transfers-up");
            iconArrow.addClass("icon-transfers-down");
            iconArrowNIB.css("display", "none");
            //iconArrowNIB.hide();
        }
        else {
            iconArrow.removeClass("icon-transfers-down");
            iconArrow.addClass("icon-transfers-up");
            iconArrowNIB.css("display", "inline");
            //iconArrowNIB.show();
        }
    }
    GetMaxRelativeBallon = function (valLoan) {
        var balloonPaymentRelativeMax = '';
        var hdnmaxBallonVar = $("input[id*='hdnmaxBallonVar']");
        if ( hdnmaxBallonVar.length) {
            if (valLoan != '' && $("input[id*='hdnmaxBallonVar']").val() != '') {
                balloonPaymentRelativeMax = eval(parseFloat(valLoan) * (parseFloat($("input[id*='hdnmaxBallonVar']").val()) / 100));
            }
        }
        return balloonPaymentRelativeMax;
    }
    GetMaxRelativeInitial = function (valLoan)
    {
        var hdnmaxInitialVar = $("input[id*='hdnmaxInitialVar']");
        var initialPaymentRelativeMax = '';
        if (hdnmaxInitialVar.length) {
            if (valLoan != '' && hdnmaxInitialVar.val() != '') {
                 initialPaymentRelativeMax = eval(parseFloat(valLoan) * (parseFloat($("input[id*='hdnmaxInitialVar']").val()) / 100));
            }
        }
        return initialPaymentRelativeMax;
    }

    CreateSlider = function (targetObj, sliderId, cur, min, max, step, destroy) {
        if (destroy) $(sliderId).slider("destroy");
        $(sliderId).slider({
            range: "min",
            value: cur,
            min: min,
            max: max,
            step: step,
            change: function (event, ui) {
                if ($("#sliderCollateralValue").length && $("#sliderLoanAmount").length) {
                    if (sliderId == "#sliderLoanAmount") {
                        if (ui.value > $("#sliderCollateralValue").slider('value')) {
                            tbCollateralValue.val(ui.value);
                            $("#sliderCollateralValue").slider({ value: ui.value });
                          
                           
                        }
                    }
                    else if (sliderId == "#sliderCollateralValue") {
                        if (ui.value < $("#sliderLoanAmount").slider('value')) {
                            tbLoanAmount.val(ui.value);
                            $("#sliderLoanAmount").slider({ value: ui.value });     
                        }
                    }
                }
                
                if (sliderId == "#sliderLoanAmount") {
                    if ($("#sliderInitialPayment").length) {

                        var maxInitial = GetMaxRelativeInitial(tbLoanAmount.val());
                        if ($("#sliderInitialPayment").slider('value') > maxInitial) {
                            $("input[id*='hdnCurrentMaxInitial']").val(maxInitial);
 
                            tbInitialPayment.val(maxInitial)
                            $("#sliderInitialPayment").slider({ value: maxInitial, max: maxInitial });
                        }
                        else {
                            $("input[id*='hdnCurrentMaxInitial']").val(maxInitial);
                            maxInitialPayment = maxInitial;
                            $("#sliderInitialPayment").slider({ max: maxInitial });

                        }
                    }
                    if ($("#sliderBalloonPayment").length) {
                        var maxBallon = GetMaxRelativeBallon(tbLoanAmount.val());
                        if ($("#sliderBalloonPayment").slider('value') > maxBallon)
                        {
                            $("input[id*='hdnCurrentMaxBallon']").val(maxBallon);
                            tbBalloonPayment.val(maxBallon)
                            $("#sliderBalloonPayment").slider({ value: maxBallon, max: maxBallon });
                        }
                        else {
                            maxBalloonPayment = maxBallon;
                            $("input[id*='hdnCurrentMaxBallon']").val(maxBallon);
                            $("#sliderBalloonPayment").slider({ max: maxInitial });
 
                        }
                    }
                }

                RefreshSimulation();
            },
            slide: function (event, ui) {
                targetObj.val(ui.value);
            },
            create: function (event, ui) {
                targetObj.val(cur);
            }
        });

        //targetObj.val(cur);

        targetObj.focus(function () {
            targetObj.select();
        });

        targetObj.keypress(function (evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode;
            return !(charCode != 46 && charCode > 31 && (charCode < 48 || charCode > 57));
        });

        targetObj.change(function () {
            if (targetObj.val() < $(sliderId).slider("option", "min")) {
                $(sliderId).slider({ value: $(sliderId).slider("option", "min") });
                targetObj.val($(sliderId).slider("option", "min"));
            }

            if (targetObj.val() <= $(sliderId).slider("option", "max")) {
                $(sliderId).slider({ value: targetObj.val() });
            }
            else {
                $(sliderId).slider({ value: $(sliderId).slider("option", "max") });
                targetObj.val($(sliderId).slider("option", "max"));
            }
        });
    };

    function RefreshSimulation() {
        __doPostBack(btnSimulator, '');
    }
</script>
