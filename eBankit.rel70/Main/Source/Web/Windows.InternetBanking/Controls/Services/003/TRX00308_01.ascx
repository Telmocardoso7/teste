<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00308_01.ascx.cs" Inherits="TRX00308_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="transactionForm" runat="server">
    <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Panel ID="pnControls" CssClass="clearPadding" runat="server">
                <div class="transaction-content" style="margin-bottom: 10px">
                    <it:FlowInnerContainer ID="FlowInnerContainer2" Title="<%$FrontEndResources:TRX00308,SelectedDeposit %>" CustomCssClass="col-max bs-reduced bs-head-metro" runat="server">
                        <div class="col-xs-12 accountWrapper" style="padding: 0; border: none !important; margin-bottom: 0;">
                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-4 col-container-center clearPadding fullHeight" style="width: 250px;">
                                <img id="Img" src="<%$ebFile:~/Content/currenttheme/images/credit_card.png%>" alt="credit card" style="max-width: 100%; max-height: 100%;" class="img-responsive img-products" runat="server" />
                            </div>

                            <div class="col-xs-12 col-sm-9 col-md-9 col-lg-8 productexpand" id="trxDepositosPrazoprdexp" style="padding-right: 0; height: 150px">
                                <div class="col-container-center" style="padding: 0; width: 100%; height: 75%;">
                                    <h3 class="col-container-center" style="color: rgb(24, 146, 174) !important; font-size: 17px; margin-top: 10px; margin-bottom: 10px; padding: 0; font-family: 'Gotham Medium';">
                                        <asp:Literal ID="litProductTitle" runat="server"></asp:Literal></h3>
                                    <div class="selPrd-description">
                                        <asp:Literal ID="litProductDescription" runat="server"></asp:Literal>
                                    </div>
                                </div>
                                <div style="height: 25%">
                                    <a id="aChangeProduct" runat="server" class="flLeft ebankit-pointer-text" style="text-align: right; color: #333; cursor: pointer;"><span class="changeIcon" style="color: rgb(242,166,64);">
                                        <asp:Literal ID="litChangeProduct" runat="server" Text="<%$FrontEndResources:TRX00308,litChangeProduct %>"></asp:Literal></span></a>
                                </div>
                                <div class="clearBoth"></div>
                            </div>
                            <div class="clearBoth"></div>
                        </div>
                    </it:FlowInnerContainer>
                </div>
                <div class="clearBoth"></div>
                <div class="transaction-content" id="trxDepositosPrazo">
                    <it:FlowInnerContainer ID="flwData1" Title="<%$FrontEndResources:TRX00308,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                        <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Always">
                            <ContentTemplate>
                                <div id="productData" runat="server" class="tableWrapper table-responsive" style="border: none;">
                                    <div class="col-lg-12 clearPadding">
                                        <div class="metro inner-table table-container">
                                            <it:GridViewControl ID="grdData" runat="server" AutoGenerateColumns="false" CssClass="table noarrow" IsResponsive="true" AllowPag="false"
                                                GridLines="None" AllowsTopAnchor="true" EnableRowClicks="true" RecordCounterComplementarText="<%$FrontEndResources:DATALIST,gridDataecordCounterComplementarText %>" OnRowDataBound="grdData_RowDataBound" OnRowClicked="grdData_RowClicked">
                                                <Columns>
                                                    <asp:TemplateField HeaderStyle-CssClass="center col-xs-1" ItemStyle-CssClass="link">
                                                        <ItemTemplate>
                                                            <asp:Image ID="rdbtn" ImageUrl="<%$ebFile:~/Content/currenttheme/images/ico_radio_button.png%>" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-CssClass="center col-xs-3" ItemStyle-CssClass="link" HeaderText="<%$FrontEndResources:TRX00304,litDays%>">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblDaysFrom" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-CssClass="center col-xs-5" ItemStyle-CssClass="link" HeaderText="<%$FrontEndResources:TRX00304,litAmount%>">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblAmountFrom" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderStyle-CssClass="center col-xs-3" ItemStyle-CssClass="link" HeaderText="<%$FrontEndResources:TRX00304,litRate%>">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lblRate" runat="server" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </it:GridViewControl>
                                        </div>
                                    </div>
                                </div>
                                <div class="clearBoth"></div>
                                <it:CurrencyTextBoxControlAuto ID="txtAmount" Visible="True" ValidateWithAccountBalance="true"
                                    ShowCurrency="True" AllowValuesUnderOne="false"
                                    MaxLength="23" IsRequired="True" ShowLimitValidation="true" TransactionId="248" AssetImpactTypeId="2"
                                    Label="<%$FrontEndResources:TRX00308,Amount%>" runat="server" Style="padding-top: 20px;"
                                    ValidationRequiredMessage="<%$FrontEndResources:JS,RequiredAmount%>"
                                    ValidationInvalidInputMessage="<%$FrontEndResources:JS,InvalidAmount%>"
                                    OnKeyUp="eBankit.Presentation.TRX00308.ValidateAmount();" />
                                <it:NumberTextBoxControl_v3 ID="txtTimeFrame" OnlyPositiveValues="True" MaxLength="5" MinLength="1" Label="<%$FrontEndResources:TRX00308,txtTimeFrame%>" Width="80"
                                    ValidationRequiredMessage="<%$FrontEndResources:JS,RequiredTerm%>"
                                    ValidationInvalidInputMessage="<%$FrontEndResources:JS,InvalidTerm%>"
                                    OnBlur="eBankit.Presentation.TRX00308.ValidateTerm();" runat="server" />
                                <div class="clearBoth"></div>
                                <it:FlowLabel_v2 ID="lblInterestRateToBeApplied" Label="<%$FrontEndResources:TRX00308,InterestRateToBeApplied%>" runat="server" />
                                <it:FlowLabel_v2 ID="lblNetInterestReceivable" Label="<%$FrontEndResources:TRX00308,NetInterestReceivable%>" runat="server" />
                                <asp:HiddenField ID="hdnMinValue" runat="server" />
                                <asp:HiddenField ID="hdnMaxValue" runat="server" />
                                <asp:HiddenField ID="hdnMinDays" runat="server" />
                                <asp:HiddenField ID="hdnMaxDays" runat="server" />
                                <asp:HiddenField ID="hdnInterestRate" runat="server" />
                                <asp:HiddenField ID="hdnCurrency" runat="server" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </it:FlowInnerContainer>
                    <it:FlowInnerContainer ID="flwData2" Title="<%$FrontEndResources:TRX00308,GeneralConditions%>" CustomCssClass="col-max bs-reduced bs-head-metro-orange bs-reduced-transaction" runat="server">
                        <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Always">
                            <ContentTemplate>
                                <div style="">
                                    <button id="btCardGeneralConditions" type="button" class="metro btn btn-ebankit-pdf" runat="server">
                                        <span class="text-responsive-1">
                                            <asp:Literal ID="Literal1" Text="<%$FrontEndResources:TRX00308,GeneralConditions%>" runat="server"></asp:Literal></span>
                                    </button>
                                    <div class="clearBoth"></div>
                                    <button id="btSheetInformation" type="button" class="metro btn btn-ebankit-pdf" runat="server">
                                        <span class="text-responsive-1">
                                            <asp:Literal ID="Literal2" Text="<%$FrontEndResources:TRX00308,SheetInformation%>" runat="server"></asp:Literal></span>
                                    </button>
                                </div>
                                <div class="metro input-control checkbox" data-role="input-control" style="padding-left: 35px;">
                                    <label class="inline-block">
                                        <input type="checkbox" id="chkGeneralConditions" runat="server" />
                                        <span class="check"></span>
                                        <asp:Literal ID="litCheckConditions" Text="<%$FrontEndResources:TRX00308,Conditions %>" runat="server"></asp:Literal>
                                    </label>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </it:FlowInnerContainer>
                </div>
                <script>
                    eBankit.Presentation.TRX00308 = {};
                    eBankit.Presentation.TRX00308.ValidateCustom = function () {
                        var ret = true;
                        //if (!chkFiles.is(':checked') && hdnShowDocs.val() == "true") {
                        //    itcore_ui.ShowTopPopupWarning(top.eBankit.Presentation.GetResource("SavingGeneralConditions"), top.eBankit.Presentation.GetResource("SavingGeneralConditionsTitle"), '');
                        //    ret = false;
                        //}
                        var validAmount = eBankit.Presentation.TRX00308.ValidateAmount();
                        var validTerm = eBankit.Presentation.TRX00308.ValidateTerm();
                        if (!validAmount || !validTerm) {
                            ret = false;
                        }
                        return ret;
                    };

                    eBankit.Presentation.TRX00308.ValidateAmount = function () {

                        var ret = true;
                        var amount = $('[id$=txtAmount_txField]');
                        var currencySymbol = $('[id$=txtAmount_txField]').val();
                        currencySymbol = currencySymbol.replace(/\.|\,/g, "");
                        currencySymbol = currencySymbol.replace(/[0-9]/g, "");
                        var amountValue = parseValueNumberWithSymbol(amount.val(), currencySymbol);
                        var minAmount = parseFormattedNumber($('[id$=hdnMinValue]').val());
                        var maxAmount = parseFormattedNumber($('[id$=hdnMaxValue]').val());

                        eBankit.Presentation.RemoveValidateMsg(amount);
                        if (amountValue == null || amountValue == '' || isNaN(amountValue)) {
                            ret = false;
                            eBankit.Presentation.InsertValidateMsg_V2(amount, top.eBankit.Presentation.GetResource("RequiredAmount"));
                            $('[id$=lblNetInterestReceivable_lblRightIn]').text('');
                        } else {
                            eBankit.Presentation.RemoveValidateMsg(amount);
                            if (amountValue < minAmount || amountValue > maxAmount) {
                                ret = false;
                                eBankit.Presentation.InsertValidateMsg_V2(amount, top.eBankit.Presentation.GetResource("InvalidAmount"));
                                $('[id$=lblNetInterestReceivable_lblRightIn]').text('');
                            } else {
                                eBankit.Presentation.TRX00308.CalculateNetInterest();
                                eBankit.Presentation.RemoveValidateMsg(amount);
                            }
                        }
                        return ret;
                    };

                    eBankit.Presentation.TRX00308.ValidateTerm = function () {

                       

                        var ret = true;
                        var term = $('[id$=txtTimeFrame_txField]');
                        var termValue = term.val().replace(",", ".");                        
                        var minTerm = $('[id$=hdnMinDays]').val().replace(",", ".");
                        var maxTerm = $('[id$=hdnMaxDays]').val().replace(",", ".");
                        eBankit.Presentation.RemoveValidateMsg(term);
                        if (termValue == null || termValue == '') {
                            ret = false;
                            eBankit.Presentation.InsertValidateMsg_V2(term, top.eBankit.Presentation.GetResource("RequiredTerm"));
                        } else {
                            eBankit.Presentation.RemoveValidateMsg(term);
                            if (parseFloat(termValue) < parseFloat(minTerm) || parseFloat(termValue) > parseFloat(maxTerm)) {
                                ret = false;
                                eBankit.Presentation.InsertValidateMsg_V2(term, top.eBankit.Presentation.GetResource("InvalidTerm"));
                            } else {
                                eBankit.Presentation.RemoveValidateMsg(term);
                            }
                        }
                        return ret;
                    };

                    eBankit.Presentation.TRX00308.CalculateNetInterest = function () {
                        var currencySymbol = $('[id$=txtAmount_txField]').val();
                        currencySymbol = currencySymbol.replace(/\.|\,/g, "");
                        currencySymbol = currencySymbol.replace(/[0-9]/g, "");
                        var amount = parseValueNumberWithSymbol($('[id$=txtAmount_txField]').val(), currencySymbol);
                        var positionSymbol = '<%=InternetBankingSettings.Currency.CurrencyPlacement %>';                       
                        var interestRate = parseFormattedNumber($('[id$=hdnInterestRate]').val());
                        var days = parseInt($('[id$=txtTimeFrame_txField]').val());
                        var currency = $('[id$=hdnCurrency]').val();
                        var yearGain = amount * (interestRate / 100);
                        var totalGain = ((yearGain * days) / 365).toFixed(2);
                         $('[id$=lblNetInterestReceivable_lblRightIn]').text(currencySymbol+ totalGain.replace(".", ",") + " " + currency);
                        switch (positionSymbol) {
                            //prefix case
                            case "p":
                                {
                                    $('[id$=lblNetInterestReceivable_lblRightIn]').text(currencySymbol+ totalGain.replace(".", ",") + " " + currency);
                                    break;
                                }
                            //sufix and default case
                            case "s":
                            default:
                                {
                                    $('[id$=lblNetInterestReceivable_lblRightIn]').text(totalGain.replace(".", ",") + currencySymbol+ " " + currency);
                                    break;
                                }
                        }
                        

                    };

                    function parseValueNumberWithSymbol (value, currency) {
                        value = value.replace(currency, "");
                        isDecimalComma = value.split(",")[1] != undefined && value.split(",")[1].length == 2;
                        if (isDecimalComma) {
                            value = value.replaceAll(".", "").replace(",", ".");
                        } else {
                            value = value.replaceAll(",", "");
                        }
                        return parseFloat(value)
                    }

                    GoToChangeProduct = function () {
                        eBankit.Presentation.SetBlockPageCommon();
                        $('body').block();
                        eBankit.document.location.href = '/Security/Transactions/Transactions.aspx?trxid=TRX00304<%=System.Configuration.ConfigurationManager.AppSettings["projectId"].ToString() %>';
                    };

                    OpenGeneralConditionsDoc = function (productId) {
                        document.getElementById("iframeControlDocument").src = '/Document.aspx?prdId=' + productId;
                        //window.open('/Document.aspx?prdId=' + productId);
                    };
                    OpenSheetInformationDoc = function (productId) {
                        document.getElementById("iframeControlDocument").src = '/Document.aspx?prdId=' + productId;
                        //window.open('/Document.aspx?prdId=' + productId);
                    };
                </script>
                <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00308-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>
</div>
<iframe name="iframeControlDocument" id="iframeControlDocument" src="" height="0" width="0" style="border: 0px; display: none"></iframe>
<asp:HiddenField ID="hdnShowDocs" runat="server" Value="true" />
