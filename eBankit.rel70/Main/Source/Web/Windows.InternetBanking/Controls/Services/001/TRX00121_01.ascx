<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00121_01.ascx.cs" Inherits="TRX00121_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div id="divContent" runat="server" class="transaction-content">

    <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:Panel ID="pnControls" CssClass="clearPadding" runat="server">

                <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <it:FlowInnerContainer ID="flwData" Title="<%$FrontEndResources:TRX00121,DestAccountContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction transaction-collapse-itens" runat="server">
                            <div>
                                <div style="background-color: transparent;">
                                    <div id="divAccountNumber" class="panel-heading ebankit-pointer-text ebankit-account-selector field field_v2 collapse-transfers" data-toggle="collapse" onclick="eBankit.Presentation.TRX00121.SetAccountType(this,3);" onkeypress="if(event.keyCode === 32)this.click();" runat="server" tabindex="0" role="button">
                                        <div class="label-wrapper">
                                            <span class="ebankit-pointer-text2 leftField-label">
                                                <asp:Literal ID="Literal4" Text="<%$FrontEndResources:TRX00121,MyAccounts %>" runat="server" /></span>

                                            <span class="metro icon-circle">
                                                <i id="collapseEbankitAccountIcon" class="icon-transfers-up" style="float: left; margin-left: 4px;" runat="server"></i>
                                            </span>
                                        </div>
                                        <div class="clearBoth"></div>
                                    </div>
                                    <div id="collapseEbankitAccount" class="panel-collapse in" runat="server">
                                        <asp:HiddenField ID="hdnClientSource" runat="server" />
                                        <div class="panel-body row" style="padding-top: 0px; padding-bottom: 0px;">
                                            <div id="divOwnAccount" class="field-own" runat="server">
                                                <it:AutoCompleteDropDownList_v2 ID="ddlOwnAccounts" Label="<%$FrontEndResources:TRX00121,txtOwnAccountDestNumber %>" OnChange="eBankit.Presentation.TRX00121.AccountBlur();" IsRequired="true" runat="server" />
                                                <asp:HiddenField ID="hdnAccountRetDrop2" runat="server" />
                                                <asp:HiddenField ID="hdnAccountRetDropName2" runat="server" />
                                                <asp:HiddenField ID="hdnAccountRetDrop" runat="server" />
                                                <asp:HiddenField ID="hdnAccountRetDropName" runat="server" />
                                            </div>
                                        </div>
                                        <div class="panel-body row" style="padding-top: 0px; padding-bottom: 0px;">
                                            <div id="divGroupOwnAccount" class="field-own" runat="server">
                                                <div class="field field_v2 metro break">
                                                    <div class="label-wrapper" style="margin-bottom: 20px;">
                                                        <label id="lblGrpAccount" runat="server" class="leftField-label req">Contas de Grupo</label>
                                                    </div>
                                                    <div class="centerField-wrapper req">
                                                        <div style="position: relative;">
                                                            <select runat="server" id="ddlGrpAccount" class="multiselectbox" multiple="false" tabindex="-1" aria-hidden="true"></select>

                                                        </div>
                                                    </div>
                                                </div>
                                                <asp:HiddenField ID="searchOpen" ClientIDMode="Static" runat="server" Value="0" />
                                            </div>
                                        </div>
                                        <div class="clearBoth"></div>
                                    </div>
                                </div>

                                <div style="background-color: transparent;">
                                    <div id="divMyAccount" class="panel-heading ebankit-pointer-text ebankit-account-selector field field_v2" data-toggle="collapse" onclick="eBankit.Presentation.TRX00121.SetAccountType(this,1);" runat="server" onkeypress="if(event.keyCode === 32)this.click();" tabindex="0" role="button">
                                        <div class="label-wrapper">
                                            <span class="ebankit-pointer-text2 leftField-label">
                                                <asp:Literal ID="Literal2" Text="<%$FrontEndResources:TRX00121,AccountName %>" runat="server" /></span>
                                            <span class="metro icon-circle">
                                                <i id="collapseEbankitMyAccount" class="icon-transfers-up" style="float: left; margin-left: 4px;" runat="server"></i>
                                            </span>
                                        </div>
                                        <div class="clearBoth"></div>
                                    </div>
                                    <div id="collapseEbankitMyAcc" class="panel-collapse collapse" runat="server">
                                        <div class="panel-body row" style="padding-top: 0px; padding-bottom: 0px;">
                                            <it:FormRadioList_v3 ID="frlTypeAcc" runat="server" ToolTip="" RadioTooltip="" CssClass="big-radioButton" RepeatDirection="Horizontal" HideLabel="false" />
                                            <div id="divAtlanticoNIB" runat="server" class="marginBottom10 hidden-panel" style="display: none !important;">
                                                <it:TextBoxControl_v2 ID="txtAccountNumberNIB" ShowToolTipLikeHelp="true" ToolTipKey="flwNib" ToolTipPlacement="right" IsRequired="true" RegexExpression="/^[0-9]{21}$/" MaxLength="21" MinLength="21" ValidationInvalidInputMessage="<%$FrontEndResources:TRX00121,InvalidInputAccount%>" runat="server" />
                                            </div>
                                            <div id="divAtlanticoNumber" runat="server" class="marginBottom10">
                                                <it:TextBoxControl_v2 ID="txtAccountNumber" IsRequired="true" RegexExpression="/^[0-9]{6,18}$/" MaxLength="18" MinLength="6" ValidationInvalidInputMessage="<%$FrontEndResources:TRX00121,InvalidInputAccount%>" runat="server" />
                                            </div>
                                        </div>
                                        <div class="clearBoth"></div>
                                    </div>
                                </div>
                                <div style="background-color: transparent;">
                                    <div id="divAccountNIB" class="panel-heading ebankit-pointer-text ebankit-account-selector field field_v2" data-toggle="collapse" onclick="eBankit.Presentation.TRX00121.SetAccountType(this,2);" runat="server" onkeypress="if(event.keyCode === 32)this.click();" tabindex="0" role="button">
                                        <div class="label-wrapper">
                                            <span class="ebankit-pointer-text2 leftField-label">
                                                <asp:Literal ID="Literal1" Text="<%$FrontEndResources:TRX00121,AccInOtherBank %>" runat="server" />
                                            </span>
                                            <span class="metro icon-circle">
                                                <i id="collapseEbankitNIBIcon" class="icon-transfers-up" style="float: left; margin-left: 4px;" runat="server"></i>
                                            </span>
                                        </div>
                                        <div class="clearBoth"></div>
                                    </div>
                                    <div id="collapseEbankitNIB" class="panel-collapse collapse" runat="server">
                                        <div class="panel-body row" style="padding-top: 0px; padding-bottom: 0px;">
                                            <it:TextBoxControl_v2 ID="txtAccountDestIBAN" CssClass="metro field field_v2 break input-iban" ShowToolTipLikeHelp="true" ToolTipKey="flwIBAN" ToolTipPlacement="right" IsRequired="true" MaxLength="30" OnBlur="eBankit.Presentation.TRX00121.ValidateIBAN()" Label="<%$FrontEndResources:TRX00121,txtAccountDestIBAN%>" runat="server" />
                                        </div>
                                        <div class="clearBoth"></div>
                                    </div>
                                </div>
                                <div class="clearBoth"></div>
                            </div>
                        </it:FlowInnerContainer>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <it:FlowInnerContainer ID="FlowInnerContainer1" Title="<%$FrontEndResources:TRX00121,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                    <div class="clearBoth">
                        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
                            <ContentTemplate>
                                <it:CurrencyTextBoxControlAuto ID="txtAmount" IsRequired="true" ValidateWithAccountBalance="true"
                                    ShowCurrency="true" AllowValuesUnderOne="true" ShowLimitValidation="true" TransactionId="4" AssetImpactTypeId="1"
                                    MaxLength="0" Width="50%" ValidationRequiredMessage="<%$FrontEndResources:TRX00121,txtAmountValidationRequiredMessage %>"
                                    ValidationMinValueInputMessage="txtQuantityMinValue" MinValue="0.00"
                                    ValidationInvalidInputMessage="<%$FrontEndResources:TRX00121,txtAmountValidationInvalidInputMessage %>"
                                    Label="<%$FrontEndResources:TRX00121,txtAmount%>" runat="server"
                                    OnKeyUp="eBankit.Presentation.TRX00121.ValidateAmount();" />
                                <div class="clearBoth"></div>
                                <asp:Button ID="btnRefreshLimitValidation" CssClass="hidden btnRefreshLimitValidation" runat="server" OnClick="btnRefreshLimitValidation_Click" />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div class="form-separator">
                            <hr>
                        </div>
                        <asp:UpdatePanel ID="UpdatePanel33" runat="server" UpdateMode="Always">
                            <ContentTemplate>
                                <asp:HiddenField ID="hdnTransferType" runat="server" />
                                <div id="divDescriptionIntrabank" runat="server">
                                    <it:TextBoxControl_v2 ID="txtDescription" MaxLength="200" TextMode="MultiLine" Rows="2" IsRequired="true" Label="<%$FrontEndResources:TRX00121,txtDescription%>" runat="server" />
                                </div>
                                <div id="divDescriptionInterbank" runat="server">
                                    <it:TextBoxControl_v2 ID="txtInterbankDescription" MaxLength="200" TextMode="MultiLine" Rows="2" IsRequired="true" Label="<%$FrontEndResources:TRX00121,txtInterbankDescription%>" runat="server" />
                                    <it:TextBoxControl_v2 ID="txtBeneficiaryName" IsRequired="true" MaxLength="70" Label="<%$FrontEndResources:TRX00121,txtBeneficiary%>" runat="server" />
                                    <it:TextBoxControl_v2 ID="txtBeneficiaryAddress" IsRequired="true" MaxLength="140" TextMode="MultiLine" Rows="4" Label="<%$FrontEndResources:TRX00121,txtBeneficiaryAddress%>" runat="server" />

                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div id="divUrgent" runat="server" class="hidden-panel">
                            <div class="form-separator">
                                <hr>
                            </div>
                            <it:FormRadioList_v3 ID="frlUrgent" ToolTip="Urgente" ShowToolTipLikeHelp="true" ToolTipPlacement="right" RadioTooltip="Não|Sim" runat="server" CssClass="big-radioButton metro field field_v2 break input-iban" LabelText="<%$FrontEndResources:TRX00121,Urgent %>" RepeatDirection="Horizontal" HideLabel="false" />
                        </div>
                    </div>
                </it:FlowInnerContainer>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <div id="divMotive" class="hidden-panel" runat="server">
                            <it:FlowInnerContainer ID="FlowInnerContainer3" Title="<%$FrontEndResources:TRX00121,MotiveContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction bs-benef-to-hide" runat="server">
                                <div>
                                    <it:DropDownListControl_v2 ID="ddlCategory" runat="server" Label="<%$FrontEndResources:TRX00121,ddlCategory%>" IsRequired="True" AutoPostBack="true" OnSelectedChanged="ddlCategory_SelectedChanged" />

                                </div>
                            </it:FlowInnerContainer>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <it:FlowInnerContainer ID="FlowInnerContainer2" Title="<%$FrontEndResources:TRX00121,NotificationContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                    <div style="margin-bottom: 10px;">

                        <asp:UpdatePanel ID="UpdatePanelNotificationContainer" runat="server" UpdateMode="Always">
                            <ContentTemplate>
                                <div class="formatTextEmailPhone" style="box-shadow: none; background-color: transparent;">
                                    <it:TextBoxControl_v2 ID="txtEmailToNotify" MaxLength="80" IsRequired="false" Label="<%$FrontEndResources:TRX00121,txtEmailToNotify%>" runat="server" />
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <div class="clearBoth"></div>
                    </div>

                    <asp:HiddenField ID="hdnSelectedType" runat="server" />
                    <asp:HiddenField ID="hdnUrgent" runat="server" />
                </it:FlowInnerContainer>
            </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:HiddenField ID="hdnIsBAck" runat="server" />
    <asp:HiddenField ID="hdnMultiSelectSelectedVal" runat="server" />
    
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("/Scripts/Services/Transactions/TRX00121-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("bootstrap-multiselect.js".ResolveJsUrl(),eBankit.Common.Sites.Utils.CacheVersionKey.JScript)%>"></script>
    <script type="text/javascript">
        var hdnIsBAck = $('[id$=hdnIsBAck]');
        var hdnMultiSelectSelectedVal = $('[id$=hdnMultiSelectSelectedVal]');
       
        $(document).ready(function () {
            StartMultiselect();
        });

        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(BindBackMultiselect);

        function StartMultiselect() {
            var groups = {};
            $("select option[OptionGroup]").each(function () {
                groups[$.trim($(this).attr("OptionGroup"))] = true;
            });
            $.each(groups, function (c) {
                $("select option[OptionGroup='" + c + "']").wrapAll('<optgroup label="' + c + '">');
            });

            $("#flwSearch").on("click", function () {
                var v = $("#searchOpen").val();
                $("#searchOpen").val(Math.abs(v - 1));
            });

            $('.multiselectbox').multiselect({
                enableFiltering: true,
                filterBehavior: 'both',
                enableCaseInsensitiveFiltering: true,
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
                    button: '<button type="button" id="expandButton" class="multiselect dropdown-toggle" data-toggle="dropdown" title=" "><span class="multiselect-selected-text corpGroupText">cenas</span></button>',
                    filter: '<li class="multiselect-item multiselect-filter"><div class="input-group"><input class="form-control multiselect-search" aria-label="<%=eBankit.Common.Globalization.Translate.GetTransactionString("CorpGroupAccountDdl", "AccounSearchPlaceHolder").Replace("\"","&quot;") %>" type="text" style=" width:100% !important;max-height: 50px !important;"/></div></li>',
                    li: '<li class="multiselect-option"><a class="multiselect-item multiselect-value" tabindex="0"><div class="cbcontainer cbcontainerCorpGroup"><input type="checkbox" class="singlecheck" /><label></label></div></a><li class="multiselect-item divider"></li></li>',
                    ul: '<ul class="multiselect-container dropdown-menu" style=" width:100%; max-height: 450px;overflow-y: scroll;" id="dropdownMenu"></ul>'
                },
                onChange: function (option, checked, select) {
                    eBankit.Presentation.RemoveValidateMsg($('#expandButton'));
                    $('#expandButton_error').remove();
                }
            });

            $('.multiselectbox').prop('selectedIndex', -1);

            $(".multiselect-search").on('keydown', function (e) {
                if (e.keyCode == 13) {
                    $(".multiselect-search").blur();
                }
            });

            $(".multiselect-search").on('focus', function (e) {
                this.placeholder = '';
            });

            $(".multiselect-search").blur(function () {
                if ($(this).val() == '' && $(this).attr('placeholder') == '') {
                    $(this).prop("placeholder", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("CorpGroupAccountDdl", "AccounSearchPlaceHolder").Replace("\"","&quot;") %>");
                }
            });

            $("#selectusers").on("click", function () {
                $(".btn-group").click()
            });

            $(".singlecheck").hide();
            $("#divSelect").hide();
            $('.multiselect-group').addClass('group-name');

            $('#expandButton').click(function () {
                eBankit.Presentation.RemoveValidateMsg($('#expandButton'));
                $('#expandButton_error').remove();
            });

            $('.multiselect-item.multiselect-value').on('keydown', function (e) {
                if (e.keyCode === 32 || e.keyCode === 13) {
                    $(this).children().children('label[class=radio]')[0].click();
                }
            });

            $('.multiselect-group').each(function () {
                var groupname = $(this).find('b').text().trim();
                if ($("select option[Shared='" + groupname + "|False']").length > 0)
                    $(this).find("a").append("<img class='sharedIcon' src='/Content/Themes/ebankit/images/icon/action/corporate/action-shared.png' title='<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX00121", "sharedIconTooltip").Replace("\"","&quot;") %>'>");
            });

            $(document.getElementsByClassName('multiselect-option default')).find('.cbcontainerCorpGroup').css('pointer-events', 'none')
        };


        function BindBackMultiselect() {
            if (hdnIsBAck.val() == 'true' && userSource.val() == 7) {
                $($('[id$=ddlCorporateGroups').find('option')[0]).prop('selected', 'selected').change();
            }
            hdnIsBAck.val('false');
        };
    </script>

    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00121-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("ebankit-multiselect.css".ResolveCssUrl(""), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
