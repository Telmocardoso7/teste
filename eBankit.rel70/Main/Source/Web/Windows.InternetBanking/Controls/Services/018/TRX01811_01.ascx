<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01811_01.ascx.cs" Inherits="TRX01811_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div runat="server" class="transaction-content pending-oper pending-corp marginBottom10">
    <div class="grayContainer bottomBorderInfoTopMessage">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
            <asp:Literal ID="pendOperationMsg" runat="server"></asp:Literal>
        </div>
    </div>
    <div id="tabs">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max pend-opr">
            <ul class="nav nav-tabs">
                <li class="col-xs-4" aria-selected="true" tabindex="1"><a href="#tabs-waiting-autho" onclick="setTab('tabs-waiting-autho');">
                    <asp:Literal runat="server" Text="<%$FrontEndResources:PendOper,WaitingForPending %>"></asp:Literal></a></li>
                <li class="col-xs-4"><a href="#tabs-third-party" onclick="setTab('tabs-third-party');" tabindex="2">
                    <asp:Literal runat="server" Text="<%$FrontEndResources:PendOper,WaitingForPendingThird %>"></asp:Literal></a></li>
                <li class="col-xs-4" tabindex="3"><a href="#tabs-date-expires" onclick="UpdateUserOpHist();setTab('tabs-date-expires');" onkeypress="UpdateUserOpHist();setTab('tabs-date-expires');">
                    <div class="newNotExecutedOperationBullet" id="newNotExecutedBulletTitle" style="margin-right: 4px;" runat="server" visible="false"></div>
                    <asp:Literal runat="server" Text="<%$FrontEndResources:PendOper,DateExpires %>"></asp:Literal></a></li>
            </ul>
        </div>
        <div id="tabs-waiting-autho">
            <div class="metro" style="margin-left: 0px; padding-top: 25px;">
                <asp:UpdatePanel runat="server" ID="updatePanel2">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSearch" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:Panel runat="server" CssClass="panel searchCriteria collapsed" data-role="panel" ID="divFilter" Style="margin-bottom: 20px; border: none; background-color: rgb(247, 246, 246);">
                            <div class="panel panel-detail noBottomMargin" id="flwSearch">
                                <div>
                                    <div id="divSearchCriteria">
                                        <div class="metro" style="margin-left: 0px;">
                                            <div class="panel" data-role="panel" id="divTesteaver" style="border: none; margin-bottom: 0px;">
                                                <div class="listHeader">
                                                    <div class="col-lg-8 col-max panel-header panel-header-3" runat="server" id="pnSearchHeader" onclick="$('.searchCriteriaOptions').slideToggle();" tabindex="0" onkeypress="$('.searchCriteriaOptions').slideToggle();"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearBoth"></div>
                                    </div>
                                </div>
                            </div>

                            <asp:Panel CssClass="col-lg-8 col-max panel-content panel-search panelSearchStyle paddingTop searchCriteriaOptions" Style="background-color: rgb(247, 246, 246); display: none;" runat="server" ID="searchCriteriaOptions">
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <it:DatePickerTextBoxRangeMetroControl_v3 ID="dpCreationFromToPending" Label="<%$FrontEndResources:DATALIST,From%>" LabelTo="<%$FrontEndResources:DATALIST,To%>" runat="server" ValidationRequiredMessage="<%$FrontEndResources:DATALIST,RequiredDateMessage%>" CssClass="field field_v2 field-full" ToolTip="<%$FrontEndResources:DATALIST,From%>" ToolTipTo="<%$FrontEndResources:DATALIST,To%>" />
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <it:DatePickerTextBoxRangeMetroControl_v3 ID="dpExpirationFromToPending" Label="<%$FrontEndResources:DATALIST,ExpirationFrom%>" LabelTo="<%$FrontEndResources:DATALIST,To%>" runat="server" ValidationRequiredMessage="<%$FrontEndResources:DATALIST,RequiredDateMessage%>" CssClass="field field_v2 field-full" ToolTip="<%$FrontEndResources:DATALIST,ExpirationFrom%>" ToolTipTo="<%$FrontEndResources:DATALIST,To%>" />
                                </div>
                                <div class="clearBoth"></div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style="margin-bottom: 3px">
                                    <it:CurrencyTextBoxIntervalControl_v2 ID="txtAmountRangePending" Label="<%$FrontEndResources:TRX01811,Amount%>" LabelTo="<%$FrontEndResources:TRX01811,To%>" runat="server" CssClass="field field_v2 field-full" ToolTip="<%$FrontEndResources:TRX01811,Amount%>" />
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 margin-bottom" style="margin-bottom: 10px">
                                    <div class="field field_v2 field-full">
                                        <div class="label-wrapper">
                                            <asp:Label runat="server" Text="<%$FrontEndResources:TRX01811,Currency%>" class="leftField-label" ToolTip="<%$FrontEndResources:TRX01811,Currency%>"></asp:Label>
                                        </div>
                                        <div class="centerField-wrapper">
                                            <div>
                                                <select runat="server" name="ddlCurrencyPending" id="ddlCurrencyPending" class="multiselectbox" multiple="true" style="width: 100%" tabindex="-1" aria-hidden="true"></select>
                                            </div>
                                        </div>
                                        <div class="clearBoth"></div>
                                    </div>
                                </div>
                                <div class="clearBoth"></div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 margin-bottom" style="margin-bottom: 10px">
                                    <div class="field field_v2 field-full">
                                        <div class="label-wrapper">
                                            <asp:Label runat="server" Text="<%$FrontEndResources:TRX01811,OpCreatorLit%>" class="leftField-label" ToolTip="<%$FrontEndResources:TRX01811,OpCreatorLit%>"></asp:Label>
                                        </div>
                                        <div class="centerField-wrapper">
                                            <div>
                                                <select runat="server" id="ddlOpCreatorPending" class="multiselectbox" multiple="true" style="width: 100%" tabindex="-1" aria-hidden="true"></select>
                                            </div>
                                        </div>
                                        <div class="clearBoth"></div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 margin-bottom" style="margin-bottom: 10px">
                                    <div class="field field_v2 field-full">
                                        <div class="label-wrapper">
                                            <asp:Label runat="server" Text="<%$FrontEndResources:TRX01811,TransactionType%>" ToolTip="<%$FrontEndResources:TRX01811,TransactionType%>" class="leftField-label"></asp:Label>
                                        </div>
                                        <div class="centerField-wrapper">
                                            <div>
                                                <select runat="server" name="ddlTransactionTypePending" id="ddlTransactionTypePending" class="multiselectbox" multiple="true" style="width: 100%" tabindex="-1" aria-hidden="true"></select>
                                            </div>
                                        </div>
                                        <div class="clearBoth"></div>
                                    </div>
                                </div>
                                <div class="clearBoth"></div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 margin-bottom" style="margin-bottom: 10px">
                                    <div class="field field_v2 field-full">
                                        <div class="label-wrapper">
                                            <asp:Label runat="server" Text="<%$FrontEndResources:TRX01811,AccontNumber%>" ToolTip="<%$FrontEndResources:TRX01811,AccontNumber%>" class="leftField-label"></asp:Label>
                                        </div>
                                        <div class="centerField-wrapper">
                                            <div>
                                                <select runat="server" name="ddlAccountNumberPending" id="ddlAccountNumberPending" class="multiselectbox" multiple="true" style="width: 100%" tabindex="-1" aria-hidden="true"></select>
                                            </div>
                                        </div>
                                        <div class="clearBoth"></div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 margin-bottom" style="margin-bottom: 10px">
                                    <it:TextBoxControl_v2 runat="server" CssClass="field field_v2 field-full" ID="txtBeneficiaryAccountPending" ShowLabel="true" autocomplete="off" IsRequired="false" Label="<%$FrontEndResources:TRX01811,BeneficiaryAccount%>" ToolTip="<%$FrontEndResources:TRX01811,BeneficiaryAccount%>"></it:TextBoxControl_v2>
                                </div>
                                <div class="clearBoth"></div>
                                <div class="searchBtnDiv">
                                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                                    </div>
                                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                        <asp:LinkButton ID="btnSearch" CssClass="btn btn-default btn-search" Text="<%$FrontEndResources:TRX01811,Search %>" runat="server" OnCommand="btnSearch_Click" />
                                    </div>
                                </div>
                                <div class="clearBoth"></div>
                            </asp:Panel>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:HiddenField ID="searchOpen" ClientIDMode="Static" runat="server" Value="0" />
            </div>
            <div class="clearBoth"></div>
            <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <div class="col-xs-12 pending-operation-message" id="infoDivPendingCounterMessage" runat="server">
                        <!--full-->
                        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                            <div class="pull-left pending-operation-literal">
                                <asp:Literal runat="server" ID="OperationsToAuthorizeCounter"></asp:Literal>
                            </div>

                            <div class="dropdown pull-right no-padding cancel-expired-operations col-xs-3" style="top: 10px">
                                <it:DropDownListControl_v2 ID="ddlSortPending" AutoPostBack="true" runat="server" ShowLabel="false" OnSelectedChanged="ddlSortPending_SelectedChanged" Label="<%$FrontEndResources:TRX01811,SelectOption %>" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bulkButtons" id="DivBulkButtonsUp" runat="server">
                <div class="content-accounts overflowHidden">
                    <asp:Panel ID="divItemRow" CssClass="buttons-panel" runat="server">
                        <div id="checkbox" class="col-xs-12 col-sm-12 col-md-5 col-lg-5">
                            <div class="cbcontainer cbkop" id="divCheckboxBulk" runat="server">
                                <asp:CheckBox ID="cbSelected" runat="server" />
                                <div id="checkmarkall" class="checkmark all pending-check-all" tabindex="0"></div>
                            </div>
                            <asp:Label ID="selectAll" runat="server" Text="<%$FrontEndResources:TRX01811,SelectAllOperations %>" CssClass="pending-check-label" />
                        </div>

                        <div class="bulk-buttons">
                            <div class="col-xs-12 btnDiv">
                                <asp:LinkButton ID="btnDeleteAllUp" runat="server" Text="<%$FrontEndResources:TRX01811,CancelSelected%>" CssClass="btn btn-default btn-block pending-button" OnClientClick="if(!confirmDeletePending(this)) return false;" OnCommand="BtnCommand_Click"></asp:LinkButton>
                            </div>
                            <div>
                                <it:WorkflowLinkButton ID="btnAuthorizeBulkUp" WorkflowAction="next" CausesValidation="false" CssClass="btn btn-primary btn-block pending-button" OnClientClick="if(ReasonFlag && (!approveWithReason(this))) return false;" runat="server">                    <span>&nbsp;</span><asp:literal text="<%$FrontEndResources:TRX01811,ApproveSelected%>" runat="server"></asp:literal>
                                </it:WorkflowLinkButton>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
            <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnCancelPending" EventName="Click" />
                </Triggers>
                <ContentTemplate>

                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                        <div id="scrollContainer" class="row scrollContainerAccountsCorp box-rpt" runat="server">
                            <div id="scroolContentCorporate" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 metro content-accounts overflowHidden">
                                <div id="WaitingAuthEmptyContainer" runat="server" visible="false" class="pend-oper-empty-container">
                                    <div class="text-center col-xs-12 empty-icon"></div>
                                    <div class="col-xs-12 text-center empty-title">
                                        <asp:Literal ID="litWaitingAuthEmptyMessageTitle" runat="server" Text="<%$FrontEndResources:PendOper,WaitingAuthEmptyMessageTitle%>"></asp:Literal>
                                    </div>
                                    <div class="col-xs-12 text-center empty-message">
                                        <asp:Literal ID="litWaitingAuthEmptyMessage" runat="server" Text="<%$FrontEndResources:PendOper,WaitingAuthEmptyMessage%>"></asp:Literal>
                                    </div>
                                </div>
                                <asp:Repeater ID="rptPendingOperations" runat="server" OnItemDataBound="rptPendingOperations_ItemDataBound" OnItemCommand="rptPendingOperations_ItemCommand">
                                    <ItemTemplate>
                                        <div id="divPendingOperation" class="contentBoxCorporate box-red" runat="server">
                                            <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
                                                <div class="cbcontainer pending-operation-bullet cbkop" id="divCheckboxBulk" runat="server" style="display: inline-block; width: fit-content;">
                                                    <asp:CheckBox ID="cbSelected" runat="server" />
                                                    <div class="checkmark single pending-check-single" tabindex="0"></div>
                                                </div>
                                                <div class="CorpAlwaysVisible content-overflow">
                                                    <asp:Image runat="server" ID="pendingOperationImage" CssClass="pending-image"></asp:Image>
                                                </div>
                                            </div>
                                            <%--                                            <asp:Label AssociatedControlID="cbSelected" runat="server">--%>

                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4 marginLeftBulk10">
                                                <div>
                                                    <div class="CorpAlwaysVisible content-overflow key">
                                                        <asp:Literal ID="litOperationType" runat="server"></asp:Literal>
                                                    </div>
                                                </div>
                                                <div class="clearBoth"></div>
                                                <div id="divAccount" runat="server">
                                                    <div class="CorpAccNumber content-overflow pend-content">
                                                        <asp:Literal ID="litOperationAccountValue" runat="server"></asp:Literal>
                                                    </div>
                                                </div>
                                                <div class="clearBoth"></div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2 marginLeftBulk10">
                                                <div>
                                                    <div class="CorpDate content-overflow key">
                                                        <asp:Literal ID="litOperationAmmount" Text="<%$FrontEndResources:PendOper,Amount%>" runat="server"></asp:Literal>
                                                    </div>
                                                </div>
                                                <div class="clearBoth"></div>
                                                <div id="divBalance" runat="server">
                                                    <div class="CorpAccBalance content-overflow pend-content">
                                                        <asp:Literal ID="litOperationValue" runat="server"></asp:Literal>
                                                        <span>
                                                            <asp:Literal ID="litOperationCurrency" runat="server"></asp:Literal></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2 marginLeftBulk10">
                                                <div>
                                                    <div class="CorpDate">
                                                        <asp:Literal ID="litOperationDate" Text="<%$FrontEndResources:PendOper,ExpireDate%>" runat="server"></asp:Literal>
                                                    </div>
                                                </div>
                                                <div class="clearBoth"></div>
                                                <div id="divDate" runat="server">
                                                    <div class="CorpDateValue content-overflow pend-content">
                                                        <asp:Literal ID="litOperationDateValue" runat="server"></asp:Literal>
                                                    </div>
                                                </div>
                                            </div>

                                            <%--                                            </asp:Label>--%>

                                            <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2 btn-container-list">
                                                <asp:LinkButton ID="icoCancel" ClientIDMode="AutoID" CssClass="col-xs-3 icon-cancel-btn icon-btn icon-cancelthird-btn" runat="server" CommandName="Cancel"></asp:LinkButton>
                                                <asp:LinkButton ID="icoApprove" ClientIDMode="AutoID" CssClass="col-xs-3 icon-approve-btn icon-btn" runat="server" CommandName="Approve" OnClientClick="SetHiddenField()"></asp:LinkButton>
                                                <asp:LinkButton ID="aOpenDetail" runat="server" CssClass="col-xs-3 icon-detail-btn icon-btn" CommandName="Detail" OnClientClick="SetHiddenField()"></asp:LinkButton>
                                            </div>
                                            <div class="clearBoth"></div>
                                        </div>
                                        <asp:HiddenField ID="hoperId" runat="server" />
                                    </ItemTemplate>
                                </asp:Repeater>

                                <asp:HiddenField ID="HiddenField1" runat="server" />

                                <asp:Button ID="Button1" Style="display: none;" runat="server" />
                            </div>
                        </div>
                    </div>
                    <asp:HiddenField ID="numberops" runat="server" />
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max" style="margin-bottom: 71px" id="DivBulkButtonsDown" runat="server">
                <div class="content-accounts overflowHidden">
                    <asp:Panel ID="Panel1" CssClass="buttons-panel" runat="server">
                        <div class="bulk-buttons btnsBulkDown" style="margin-top: 20px;">
                            <div class="col-xs-12 btnDiv">
                                <asp:LinkButton ID="btnDeleteAllDown" runat="server" Text="<%$FrontEndResources:TRX01811,CancelSelected%>" CssClass="btn btn-default btn-block pending-button" OnClientClick="if(!confirmDeletePending(this)) return false;" OnCommand="BtnCommand_Click"></asp:LinkButton>
                            </div>
                            <div>
                                <it:WorkflowLinkButton ID="btnAuthorizeBulkDown" WorkflowAction="next" CausesValidation="false" CssClass="btn btn-primary btn-block pending-button" OnClientClick="if(ReasonFlag && (!approveWithReason(this))) return false;" runat="server">
                    <span>&nbsp;</span><asp:literal text="<%$FrontEndResources:TRX01811,ApproveSelected%>" runat="server"></asp:literal>
                                </it:WorkflowLinkButton>
                            </div>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
        <div id="tabs-third-party" style="margin-top: 10px;">
            <div class="metro" style="margin-left: 0px; padding-top: 25px;">
                <asp:UpdatePanel runat="server" ID="updatePanel1">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSearch" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:Panel runat="server" CssClass="panel searchCriteria collapsed" data-role="panel" ID="divFilterThird" Style="margin-bottom: 20px; border: none; background-color: rgb(247, 246, 246);">
                            <div class="panel panel-detail noBottomMargin" id="flwSearchThird">
                                <div>
                                    <div>
                                        <div class="metro" style="margin-left: 0px;">
                                            <div class="panel" data-role="panel" style="border: none; margin-bottom: 0px;">
                                                <div class="listHeader">
                                                    <div class="col-lg-8 col-max panel-header panel-header-3" runat="server" id="pnSearchHeaderThird" onclick="$('.searchCriteriaOptionsThird').slideToggle();" tabindex="0" onkeypress="$('.searchCriteriaOptionsThird').slideToggle();"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearBoth"></div>
                                    </div>
                                </div>
                            </div>

                            <asp:Panel CssClass="col-lg-8 col-max panel-content panel-search panelSearchStyle paddingTop searchCriteriaOptionsThird" Style="background-color: rgb(247, 246, 246); display: none;" runat="server" ID="searchCriteriaOptionsThird">
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <it:DatePickerTextBoxRangeMetroControl_v3 ID="dpCreationFromToThird" Label="<%$FrontEndResources:DATALIST,From%>" LabelTo="<%$FrontEndResources:DATALIST,To%>" runat="server" ValidationRequiredMessage="<%$FrontEndResources:DATALIST,RequiredDateMessage%>" CssClass="field field_v2 field-full" ToolTip="<%$FrontEndResources:DATALIST,From%>" ToolTipTo="<%$FrontEndResources:DATALIST,To%>" />
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <it:DatePickerTextBoxRangeMetroControl_v3 ID="dpExpirationFromToThird" Label="<%$FrontEndResources:DATALIST,ExpirationFrom%>" LabelTo="<%$FrontEndResources:DATALIST,To%>" runat="server" ValidationRequiredMessage="<%$FrontEndResources:DATALIST,RequiredDateMessage%>" CssClass="field field_v2 field-full" ToolTip="<%$FrontEndResources:DATALIST,ExpirationFrom%>" ToolTipTo="<%$FrontEndResources:DATALIST,To%>" />
                                </div>
                                <div class="clearBoth"></div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style="margin-bottom: 3px">
                                    <it:CurrencyTextBoxIntervalControl_v2 ID="txtAmountRangeThird" Label="<%$FrontEndResources:TRX01811,AmountThird%>" LabelTo="<%$FrontEndResources:TRX01811,To%>" runat="server" CssClass="field field_v2 field-full" ToolTip="<%$FrontEndResources:TRX01811,Amount%>" />
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 margin-bottom" style="margin-bottom: 10px">
                                    <div class="field field_v2 field-full">
                                        <div class="label-wrapper">
                                            <asp:Label runat="server" Text="<%$FrontEndResources:TRX01811,CurrencyThird%>" class="leftField-label" ToolTip="<%$FrontEndResources:TRX01811,CurrencyThird%>"></asp:Label>
                                        </div>
                                        <div class="centerField-wrapper">
                                            <div>
                                                <select runat="server" name="ddlCurrencyThird" id="ddlCurrencyThird" class="multiselectbox" multiple="true" style="width: 100%" tabindex="-1" aria-hidden="true"></select>
                                            </div>
                                        </div>
                                        <div class="clearBoth"></div>
                                    </div>
                                </div>
                                <div class="clearBoth"></div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 margin-bottom" style="margin-bottom: 10px">
                                    <div class="field field_v2 field-full">
                                        <div class="label-wrapper">
                                            <asp:Label runat="server" Text="<%$FrontEndResources:TRX01811,OpCreatorLit%>" class="leftField-label" ToolTip="<%$FrontEndResources:TRX01811,OpCreatorLit%>"></asp:Label>
                                        </div>
                                        <div class="centerField-wrapper">
                                            <div>
                                                <select runat="server" id="ddlOpCreatorThird" class="multiselectbox" multiple="true" style="width: 100%" tabindex="-1"></select>
                                            </div>
                                        </div>
                                        <div class="clearBoth"></div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 margin-bottom" style="margin-bottom: 10px">
                                    <div class="field field_v2 field-full">
                                        <div class="label-wrapper">
                                            <asp:Label runat="server" Text="<%$FrontEndResources:TRX01811,TransactionTypeThird%>" ToolTip="<%$FrontEndResources:TRX01811,TransactionTypeThird%>" class="leftField-label"></asp:Label>
                                        </div>
                                        <div class="centerField-wrapper">
                                            <div>
                                                <select runat="server" name="ddlTransactionTypeThird" id="ddlTransactionTypeThird" class="multiselectbox" multiple="true" style="width: 100%" tabindex="-1" aria-hidden="true"></select>
                                            </div>
                                        </div>
                                        <div class="clearBoth"></div>
                                    </div>
                                </div>
                                <div class="clearBoth"></div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 margin-bottom" style="margin-bottom: 10px">
                                    <div class="field field_v2 field-full">
                                        <div class="label-wrapper">
                                            <asp:Label runat="server" Text="<%$FrontEndResources:TRX01811,AccontNumberThird%>" ToolTip="<%$FrontEndResources:TRX01811,AccontNumberThird%>" class="leftField-label"></asp:Label>
                                        </div>
                                        <div class="centerField-wrapper">
                                            <div>
                                                <select runat="server" name="ddlAccountNumberThird" id="ddlAccountNumberThird" class="multiselectbox" multiple="true" style="width: 100%" tabindex="-1" aria-hidden="true"></select>
                                            </div>
                                        </div>
                                        <div class="clearBoth"></div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 margin-bottom" style="margin-bottom: 10px">
                                    <it:TextBoxControl_v2 runat="server" CssClass="field field_v2 field-full" ID="txtBeneficiaryAccountThird" ShowLabel="true" autocomplete="off" IsRequired="false" Label="<%$FrontEndResources:TRX01811,BeneficiaryAccountThird%>" ToolTip="<%$FrontEndResources:TRX01811,BeneficiaryAccountThird%>"></it:TextBoxControl_v2>
                                </div>
                                <div class="clearBoth"></div>
                                <div class="searchBtnDiv">
                                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                                    </div>
                                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                        <asp:LinkButton ID="btnSearchThird" CssClass="btn btn-default btn-search" Text="<%$FrontEndResources:TRX01811,SearchThird %>" runat="server" OnCommand="btnSearchThird_Click" />
                                    </div>
                                </div>
                                <div class="clearBoth"></div>

                            </asp:Panel>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:HiddenField ID="searchOpenThird" ClientIDMode="Static" runat="server" Value="0" />
            </div>
            <div class="clearBoth"></div>
            <asp:UpdatePanel ID="updPanelThirdparty" runat="server" UpdateMode="Always">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnCancelPending" EventName="Click" />
                </Triggers>
                <ContentTemplate>

                    <div class="col-xs-12 pending-operation-message" id="infoDivThirdPartyCounterMessage" runat="server">
                        <!--full-->
                        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                            <div class="pull-left pending-operation-literal">
                                <asp:Literal runat="server" ID="OperationsToThirdAuthorizeCounter"></asp:Literal>
                            </div>

                            <div class="dropdown pull-right no-padding cancel-expired-operations col-xs-3" style="top: 10px;">
                                <it:DropDownListControl_v2 ID="ddlSortThirdParty" AutoPostBack="true" runat="server" ShowLabel="false" OnSelectedChanged="ddlSortThirdParty_SelectedIndexChanged" Label="<%$FrontEndResources:TRX01811,SelectOption %>" />
                                </br>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                        <div id="scrollContainerThird" class="row scrollContainerAccountsCorp" runat="server">
                            <div id="scroolContentCorporateThird" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 content-accounts overflowHidden">
                                <div id="ThirdPartyEmptyContainer" runat="server" visible="false" class="pend-oper-empty-container">
                                    <div class="text-center col-xs-12 empty-icon"></div>
                                    <div class="col-xs-12 text-center empty-title">
                                        <asp:Literal ID="litThirdPartyEmptyMessageTitle" runat="server" Text="<%$FrontEndResources:PendOper,ThirdPartyEmptyMessageTitle%>"></asp:Literal>
                                    </div>
                                    <div class="col-xs-12 text-center empty-message">
                                        <asp:Literal ID="litThirdPartyEmptyMessage" runat="server" Text="<%$FrontEndResources:PendOper,ThirdPartyEmptyMessage%>"></asp:Literal>
                                    </div>
                                </div>
                                <asp:Repeater ID="rptPendingOperationsThird" runat="server" OnItemDataBound="rptPendingOperationsThird_ItemDataBound" OnItemCommand="rptPendingOperationsThird_ItemCommand">
                                    <ItemTemplate>
                                        <div id="divPendingOperation" class="contentBoxCorporate box-red" runat="server">
                                            <div class="col-xs-12 col-sm-12 col-md-1 col-lg-1">
                                                <div class="CorpAlwaysVisible content-overflow">
                                                    <asp:Image runat="server" ID="pendingOperationImageThird" CssClass="pending-image-third"></asp:Image>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                                <div>
                                                    <div class="CorpAlwaysVisible content-overflow key">
                                                        <asp:Literal ID="litOperationType" runat="server"></asp:Literal>
                                                    </div>
                                                </div>
                                                <div class="clearBoth"></div>
                                                <div id="divAccount" runat="server">
                                                    <div class="CorpAccNumber content-overflow pend-content">
                                                        <asp:Literal ID="litOperationAccountValue" runat="server"></asp:Literal>
                                                    </div>
                                                </div>
                                                <div class="clearBoth"></div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
                                                <div>
                                                    <div class="CorpDate content-overflow key">
                                                        <asp:Literal ID="litOperationAmmount" Text="<%$FrontEndResources:PendOper,Amount%>" runat="server"></asp:Literal>
                                                    </div>
                                                </div>
                                                <div class="clearBoth"></div>
                                                <div id="divBalance" runat="server">
                                                    <div class="CorpAccBalance content-overflow pend-content">
                                                        <asp:Literal ID="litOperationValue" runat="server"></asp:Literal>
                                                        <span>
                                                            <asp:Literal ID="litOperationCurrency" runat="server"></asp:Literal></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                                                <div>
                                                    <div class="CorpDate key">
                                                        <asp:Literal ID="litOperationDate" Text="<%$FrontEndResources:PendOper,ExpireDate%>" runat="server"></asp:Literal>
                                                    </div>
                                                </div>
                                                <div class="clearBoth"></div>
                                                <div id="divDate" runat="server">
                                                    <div class="CorpDateValue content-overflow pend-content">
                                                        <asp:Literal ID="litOperationDateValue" runat="server"></asp:Literal>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2 btn-container-list">
                                                <asp:LinkButton ID="icoCancel" ClientIDMode="AutoID" CssClass="col-xs-3 icon-cancel-btn icon-btn icon-cancelthird-btn" runat="server" CommandName="Cancel"></asp:LinkButton>
                                                <asp:LinkButton ID="icoApprove" ClientIDMode="AutoID" CssClass="col-xs-3 icon-approve-btn icon-btn" runat="server" CommandName="Approve"></asp:LinkButton>
                                                <asp:LinkButton ID="aOpenDetail" runat="server" CssClass="col-xs-3 icon-detail-btn icon-btn" CommandName="Detail"></asp:LinkButton>
                                            </div>
                                            <div class="clearBoth"></div>
                                        </div>
                                        <asp:HiddenField ID="hoperId" runat="server" />
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:HiddenField ID="HiddenField2" runat="server" />
                                <asp:Button ID="Button2" Style="display: none;" runat="server" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="tabs-date-expires">
            <div class="metro" style="margin-left: 0px; padding-top: 25px;">
                <asp:UpdatePanel runat="server" ID="updatePanel3">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSearch" />
                    </Triggers>
                    <ContentTemplate>
                        <asp:Panel runat="server" CssClass="panel searchCriteria collapsed" data-role="panel" ID="divFilterExpired" Style="margin-bottom: 20px; border: none; background-color: rgb(247, 246, 246);">
                            <div class="panel panel-detail noBottomMargin" id="flwSearchExpired">
                                <div>
                                    <div>
                                        <div class="metro" style="margin-left: 0px;">
                                            <div class="panel" data-role="panel" style="border: none; margin-bottom: 0px;">
                                                <div class="listHeader">
                                                    <div class="col-lg-8 col-max panel-header panel-header-3" runat="server" id="pnSearchHeaderExpired" onclick="$('.searchCriteriaOptionsExpired').slideToggle();" tabindex="0" onkeypress="$('.searchCriteriaOptionsExpired').slideToggle();"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="clearBoth"></div>
                                    </div>
                                </div>
                            </div>

                            <asp:Panel CssClass="col-lg-8 col-max panel-content panel-search panelSearchStyle paddingTop searchCriteriaOptionsExpired" Style="background-color: rgb(247, 246, 246); display: none;" runat="server" ID="searchCriteriaOptionsExpired">
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <it:DatePickerTextBoxRangeMetroControl_v3 ID="dpCreationFromToNotExecuted" Label="<%$FrontEndResources:DATALIST,From%>" LabelTo="<%$FrontEndResources:DATALIST,To%>" runat="server" ValidationRequiredMessage="<%$FrontEndResources:DATALIST,RequiredDateMessage%>" CssClass="field field_v2 field-full" ToolTip="<%$FrontEndResources:DATALIST,From%>" ToolTipTo="<%$FrontEndResources:DATALIST,To%>" />
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <it:DatePickerTextBoxRangeMetroControl_v3 ID="dpExpirationFromToNotExecuted" Label="<%$FrontEndResources:DATALIST,ExpirationFrom%>" LabelTo="<%$FrontEndResources:DATALIST,To%>" runat="server" ValidationRequiredMessage="<%$FrontEndResources:DATALIST,RequiredDateMessage%>" CssClass="field field_v2 field-full" ToolTip="<%$FrontEndResources:DATALIST,ExpirationFrom%>" ToolTipTo="<%$FrontEndResources:DATALIST,To%>" />
                                </div>
                                <div class="clearBoth"></div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6" style="margin-bottom: 3px">
                                    <it:CurrencyTextBoxIntervalControl_v2 ID="txtAmountRangeNotExecuted" Label="<%$FrontEndResources:TRX01811,AmountNotExecuted%>" LabelTo="<%$FrontEndResources:TRX01811,To%>" runat="server" CssClass="field field_v2 field-full" ToolTip="<%$FrontEndResources:TRX01811,AmountNotExecuted%>" />
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 margin-bottom" style="margin-bottom: 10px">
                                    <div class="field field_v2 field-full">
                                        <div class="label-wrapper">
                                            <asp:Label runat="server" Text="<%$FrontEndResources:TRX01811,CurrencyNotExecuted%>" class="leftField-label" ToolTip="<%$FrontEndResources:TRX01811,CurrencyNotExecuted%>"></asp:Label>
                                        </div>
                                        <div class="centerField-wrapper">
                                            <div>
                                                <select runat="server" name="ddlCurrencyNotExecuted" id="ddlCurrencyNotExecuted" class="multiselectbox" multiple="true" style="width: 100%" tabindex="-1" aria-hidden="true"></select>
                                            </div>
                                        </div>
                                        <div class="clearBoth"></div>
                                    </div>
                                </div>
                                <div class="clearBoth"></div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 margin-bottom" style="margin-bottom: 10px">
                                    <div class="field field_v2 field-full">
                                        <div class="label-wrapper">
                                            <asp:Label runat="server" Text="<%$FrontEndResources:TRX01811,OpCreatorLit %>" class="leftField-label" ToolTip="<%$FrontEndResources:TRX01811,OpCreatorLit %>"></asp:Label>
                                        </div>
                                        <div class="centerField-wrapper">
                                            <div>
                                                <select runat="server" id="ddlOpCreatorNotExecuted" class="multiselectbox" multiple="true" style="width: 100%" tabindex="-1"></select>
                                            </div>
                                        </div>
                                        <div class="clearBoth"></div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 margin-bottom" style="margin-bottom: 10px">
                                    <div class="field field_v2 field-full">
                                        <div class="label-wrapper">
                                            <asp:Label runat="server" Text="<%$FrontEndResources:TRX01811,TransactionTypeNotExecuted%>" ToolTip="<%$FrontEndResources:TRX01811,TransactionTypeNotExecuted%>" class="leftField-label"></asp:Label>
                                        </div>
                                        <div class="centerField-wrapper">
                                            <div>
                                                <select runat="server" name="ddlTransactionTypeNotExecuted" id="ddlTransactionTypeNotExecuted" class="multiselectbox" multiple="true" style="width: 100%" tabindex="-1" aria-hidden="true"></select>
                                            </div>
                                        </div>
                                        <div class="clearBoth"></div>
                                    </div>
                                </div>
                                <div class="clearBoth"></div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 margin-bottom" style="margin-bottom: 10px">
                                    <div class="field field_v2 field-full">
                                        <div class="label-wrapper">
                                            <asp:Label runat="server" Text="<%$FrontEndResources:TRX01811,AccontNumberNotExecuted%>" ToolTip="<%$FrontEndResources:TRX01811,AccontNumberNotExecuted%>" class="leftField-label"></asp:Label>
                                        </div>
                                        <div class="centerField-wrapper">
                                            <div>
                                                <select runat="server" name="ddlAccountNumberNotExecuted" id="ddlAccountNumberNotExecuted" class="multiselectbox" multiple="true" style="width: 100%" tabindex="-1" aria-hidden="true"></select>
                                            </div>
                                        </div>
                                        <div class="clearBoth"></div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 margin-bottom" style="margin-bottom: 10px">
                                    <it:TextBoxControl_v2 runat="server" CssClass="field field_v2 field-full" ID="txtBeneficiaryAccountNotExecuted" ShowLabel="true" autocomplete="off" IsRequired="false" Label="<%$FrontEndResources:TRX01811,BeneficiaryAccountNotExecuted%>" ToolTip="<%$FrontEndResources:TRX01811,BeneficiaryAccountNotExecuted%>"></it:TextBoxControl_v2>
                                </div>
                                <div class="clearBoth"></div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 margin-bottom" style="margin-bottom: 10px">
                                    <div class="field field_v2 field-full">
                                        <div class="label-wrapper">
                                            <asp:Label runat="server" Text="<%$FrontEndResources:TRX01811,StatusCancelledAndExpired%>" ToolTip="<%$FrontEndResources:TRX01811,StatusCancelledAndExpired%>" class="leftField-label"></asp:Label>
                                        </div>
                                        <div class="centerField-wrapper">
                                            <div>
                                                <select runat="server" name="ddlStatusCancelledAndExpired" id="ddlStatusCancelledAndExpired" class="multiselectbox" multiple="true" style="width: 100%" tabindex="-1" aria-hidden="true"></select>
                                            </div>
                                        </div>
                                        <div class="clearBoth"></div>
                                    </div>
                                </div>
                                <div class="clearBoth"></div>
                                <div class="searchBtnDiv">
                                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                                    </div>
                                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                        <asp:LinkButton ID="btnSearchExpired" CssClass="btn btn-default btn-search" Text="<%$FrontEndResources:TRX01811,SearchNotExecuted %>" runat="server" OnCommand="btnSearchExpired_Click" />

                                    </div>
                                </div>
                                <div class="clearBoth"></div>

                            </asp:Panel>
                        </asp:Panel>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <asp:HiddenField ID="searchOpenExpired" ClientIDMode="Static" runat="server" Value="0" />
            </div>

            <asp:UpdatePanel ID="UpdatePanelDateExpires" runat="server" UpdateMode="Always">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnCancelPending" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnUpdateUserOpHist" EventName="Click" />
                </Triggers>
                <ContentTemplate>
                    <div class="col-xs-12 pending-operation-message" id="infoDivNotExecutedCounterMessage" runat="server">
                        <!--full-->
                        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                            <div class="pull-left pending-operation-literal">
                                <asp:Literal runat="server" ID="OperationsNotExecutedCounter"></asp:Literal>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                        <div id="scrollContainerDateExpires" class="row scrollContainerAccountsCorp" runat="server">
                            <div id="scroolContentCorporateDateExpires" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 metro content-accounts overflowHidden">
                                <div id="ExpiredEmptyContainer" runat="server" visible="false" class="pend-oper-empty-container">
                                    <div class="text-center col-xs-12 empty-icon"></div>
                                    <div class="col-xs-12 text-center empty-title">
                                        <asp:Literal ID="expiredEmptyMessageTitle" runat="server" Text="<%$FrontEndResources:TRX01811,ExpiredEmptyMessageTitle%>"></asp:Literal>
                                    </div>
                                    <div class="col-xs-12 text-center empty-message">
                                        <asp:Literal ID="expiredEmptyMessage" runat="server" Text="<%$FrontEndResources:TRX01811,ExpiredEmptyMessage%>"></asp:Literal>
                                    </div>
                                </div>
                                <asp:Repeater ID="rptPendingOperationsDateExpires" runat="server" OnItemDataBound="rptPendingOperationsDateExpires_ItemDataBound" OnItemCommand="rptPendingOperationsDateExpires_ItemCommand">
                                    <ItemTemplate>
                                        <div id="divPendingOperation" class="contentBoxCorporate box-red" runat="server">
                                            <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
                                                <div class="CorpAlwaysVisible content-overflow">
                                                    <div class="pending-operation-bullet">
                                                        <div class="newNotExecutedOperationBullet" id="newNotExecutedBullet" runat="server" visible="false"></div>
                                                    </div>
                                                    <div class="pending-operation-image">
                                                        <asp:Image runat="server" ID="pendingOperationImageExpires" CssClass="pending-image"></asp:Image>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                                <div>
                                                    <div class="CorpAlwaysVisible content-overflow key">
                                                        <asp:Literal ID="litOperationType" runat="server"></asp:Literal>
                                                    </div>
                                                </div>
                                                <div class="clearBoth"></div>
                                                <div id="divAccount" runat="server">
                                                    <div class="CorpAccNumber content-overflow pend-content">
                                                        <asp:Literal ID="litOperationAccountValue" runat="server"></asp:Literal>
                                                    </div>
                                                </div>
                                                <div class="clearBoth"></div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
                                                <div>
                                                    <div class="CorpDate content-overflow key">
                                                        <asp:Literal ID="litOperationAmmount" Text="<%$FrontEndResources:PendOper,Amount%>" runat="server"></asp:Literal>
                                                    </div>
                                                </div>
                                                <div class="clearBoth"></div>
                                                <div id="divBalance" runat="server">
                                                    <div class="CorpAccBalance content-overflow pend-content">
                                                        <asp:Literal ID="litOperationValue" runat="server"></asp:Literal>
                                                        <span>
                                                            <asp:Literal ID="litOperationCurrency" runat="server"></asp:Literal></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
                                                <div>
                                                    <div class="CorpPeriodicity content-overflow key">
                                                        <asp:Literal ID="litStateTitle" Text="<%$FrontEndResources:TRX01811,OperationState%>" runat="server"></asp:Literal>
                                                    </div>
                                                </div>
                                                <div class="clearBoth"></div>
                                                <div id="div1" runat="server">
                                                    <div class="CorpPeriodicityValue content-overflow pend-content">
                                                        <span id="litState" runat="server"></span>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2 btn-container-list">

                                                <asp:LinkButton ID="aOpenDetail" runat="server" CssClass="col-xs-3 icon-detail-btn icon-btn" ToolTip="<%$FrontEndResources:TRX01811,Detail%>" CommandName="Detail"></asp:LinkButton>
                                            </div>
                                            <div class="clearBoth"></div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:HiddenField ID="HiddenField3" runat="server" />
                                <asp:Button ID="Button3" Style="display: none;" runat="server" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:HiddenField ID="hdnDeclineReason" runat="server" />
            <asp:HiddenField ID="hdnReason" runat="server" />
            <asp:HiddenField ID="hdnSelectedTab" runat="server" Value="tabs-waiting-autho" />

        </div>
        <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01811-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    </div>
    <asp:HiddenField ID="hdnPendOperSelected" runat="server" />
    <asp:HiddenField ID="hdnAccountNumbers" runat="server" />
    <asp:HiddenField ID="hdnAccountGroups" runat="server" />

    <asp:HiddenField ID="condition" runat="server" />
    <asp:HiddenField ID="waitingMyAuthActive" runat="server" />
    <asp:Button ID="btnGoTo" Style="display: none;" runat="server" />
    <asp:Button ID="btnCancelPending" Style="display: none;" runat="server" />
    <asp:Button ID="btnUpdateUserOpHist" Style="display: none;" runat="server" OnClick="btnUpdateUserOpHist_Click" />

    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01811-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("bootstrap-multiselect.js".ResolveJsUrl(),eBankit.Common.Sites.Utils.CacheVersionKey.JScript)%>"></script>
    <script type="text/javascript">

        var regPerPage = '<%=ConfigurationManager.AppSettings["PendingOperations.RegistersPerPage"] %>';
        var declineReason = document.getElementById('<%= hdnDeclineReason.ClientID %>');
        var reason = document.getElementById('<%= hdnReason.ClientID %>');

        function approveWithReason(currentMessage) {

            top.confirmAuthorizeHandler = function () {

                reason.value = document.getElementById('modalTxtArea').value.replace(/([^a-zA-z0-9.,: ]+)/g, s0 => '');
                eval(currentMessage.href);
            }


            itcore_ui.ShowTopPopupConfirmWithTextArea_V1("<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX01811", "PopupApproveWithReasonTitle").Replace("\"", "&quot;") %>", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX01811", "PopupApproveWithReasonTextContent")%>", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX01811", "PopupApproveWithReasonTextArea")%>", "top.confirmAuthorizeHandler();", "", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX01811", "PopupApproveWithReasonBtnKeep").ToUpperInvariant()%>", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX01811", "PopupApproveWithReasonBtnApprove").ToUpperInvariant()%>");


        };

        $(document).ready(function () {            

            $("img").each(function () {
                if ($(this).attr("alt") === undefined)
                    $(this).attr("alt", "");
            });

            TabEvents();

            $("#selectCreators").on("click keypress", function () {
                document.getElementById("expandButton").getAttribute("aria-expanded") = false;

            });

            $("#flwSearch").on("click keypress", function () {
                var v = $("#searchOpen").val();
                $("#searchOpen").val(Math.abs(v - 1));
            });

            $("#flwSearchThird").on("click keypress", function () {
                var v = $("#searchOpen").val();
                $("#searchOpen").val(Math.abs(v - 1));
            });

            $(".btn-search-datalist").on("click keypress", function (e) {
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

            $(".btn-search-datalist").on("click keypress", function (e) {
                if ($("#aspnetForm").valid()) {
                    $(".panel-search").slideUp();
                } else {
                    e.preventDefault();
                }
            });

            $(".panel-search-toggle").on("click keypress", function () {
                $(".panel-search").slideToggle();
            });

        });

        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(StartMultiselect);
        prm.add_pageLoaded(StartMultiselect);
        prm.add_pageLoaded(Recheck);
        prm.add_pageLoaded(TabEvents);
        prm.add_pageLoaded(AddAttributesToCheckBox);

        function AddAttributesToCheckBox() {
            $('[id*="cbSelected"]').attr("title", "checkbox")
        }

        function StartMultiselect() {
            var groupsPending = {};
            var groupsThird = {};
            var groupsNotExecuted = {};

            $("[id$=ddlAccountNumberPending] option").each(function () {
                var optAttr = $(this).attr("OptionGroup");
                if (typeof optAttr !== 'undefined' && optAttr !== false) {
                    $(this).attr('OptionGroup', $.trim($(this).attr('OptionGroup') + 'PendingOpTab1'));
                    groupsPending[$.trim($(this).attr('OptionGroup'))] = true;
                }
                else if (!jQuery.isEmptyObject(JSON.parse($("[id$=hdnAccountGroups]").val()))) {
                    var group = JSON.parse($("[id$=hdnAccountGroups]").val())[$(this).attr("value")];
                    $(this).attr('OptionGroup', $.trim(group + 'PendingOpTab1'));
                    groupsPending[$.trim($(this).attr('OptionGroup'))] = true;
                }
            });

            $("[id$=ddlAccountNumberThird] option").each(function () {
                var optAttr = $(this).attr("OptionGroup");
                if (typeof optAttr !== 'undefined' && optAttr !== false) {
                    $(this).attr('OptionGroup', $.trim($(this).attr('OptionGroup') + 'PendingOpTab2'));
                    groupsThird[$.trim($(this).attr('OptionGroup'))] = true;
                }
                else if (!jQuery.isEmptyObject(JSON.parse($("[id$=hdnAccountGroups]").val()))) {
                    var group = JSON.parse($("[id$=hdnAccountGroups]").val())[$(this).attr("value")];
                    $(this).attr('OptionGroup', $.trim(group + 'PendingOpTab2'));
                    groupsThird[$.trim($(this).attr('OptionGroup'))] = true;
                }
            });

            $("[id$=ddlAccountNumberNotExecuted] option").each(function () {
                var optAttr = $(this).attr("OptionGroup");
                if (typeof optAttr !== 'undefined' && optAttr !== false) {
                    $(this).attr('OptionGroup', $.trim($(this).attr('OptionGroup') + 'PendingOpTab3'));
                    groupsNotExecuted[$.trim($(this).attr('OptionGroup'))] = true;
                }
                else if (!jQuery.isEmptyObject(JSON.parse($("[id$=hdnAccountGroups]").val()))) {
                    var group = JSON.parse($("[id$=hdnAccountGroups]").val())[$(this).attr("value")];
                    $(this).attr('OptionGroup', $.trim(group + 'PendingOpTab3'));
                    groupsNotExecuted[$.trim($(this).attr('OptionGroup'))] = true;
                }
            });

            $.each(groupsPending, function (c) {
                if ($("select option[OptionGroup='" + c + "']").parent('optgroup').length == 0) {
                    $("select option[OptionGroup='" + c + "']").wrapAll('<optgroup label="' + c.replace('PendingOpTab1', '') + '">');
                }
            });

            $.each(groupsThird, function (c) {
                if ($("select option[OptionGroup='" + c + "']").parent('optgroup').length == 0) {
                    $("select option[OptionGroup='" + c + "']").wrapAll('<optgroup label="' + c.replace('PendingOpTab2', '') + '">');
                }
            });

            $.each(groupsNotExecuted, function (c) {
                if ($("select option[OptionGroup='" + c + "']").parent('optgroup').length == 0) {
                    $("select option[OptionGroup='" + c + "']").wrapAll('<optgroup label="' + c.replace('PendingOpTab3', '') + '">');
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
                    selectAllText: "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX01811", "AllSelectedText").Replace("\"","&quot;") %>",
                    nonSelectedText: "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX01811", "SearchHere").Replace("\"","&quot;") %>",
                    allSelectedText: "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX01811", "AllSelectText").Replace("\"","&quot;") %>",
                    filterPlaceholder: "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX01811", "SelectUsers").Replace("\"","&quot;") %>",
                    nSelectedText: "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX01811", "Multiple").Replace("\"","&quot;") %>",
                    templates: {
                        button: '<button type="button" class="multiselect dropdown-toggle expandButton" data-toggle="dropdown"><span class="multiselect-selected-text"></span></button>',
                        filter: '<li class="multiselect-item multiselect-filter"><div class="input-group"><input  class="form-control multiselect-search" type="text" tabindex="0"/></div></li>',
                        li: '<li class="multiselect-option"><a class="multiselect-item multiselect-value" tabindex="0" role="checkbox" aria-checked="true"><div class="cbcontainer cbcontainerUser"><input type="checkbox" class="singlecheck" /><div class="checkmark chekmarkuser"></div><label></label></div></a></li>',
                        ul: '<ul class="multiselect-container dropdown-menu scroll" style="position:relative" ></ul>',
                    }

                });
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

            $(".btn-select").on("click keyup", function (e) {
                if (e.type === "keyup") {
                    if (e.keyCode === 13)
                        $(".btn-group").click();
                }
                else
                    $(".btn-group").click();
            });

            $('.chekmarkuser').unbind();
            $('.chekmarkuser').on("click keypress", function () {
                var checkboxes = $(this).siblings('input[type="checkbox"]');
                var li = $(this).parents().eq(2);
                var cb = $(this).siblings('.checkbox').children('input[type="checkbox"]');
                var anchor = $(this).parents().eq(1);
                $(cb).trigger("click");
                $(this).toggleClass("selected");
                if (li.hasClass("active"))
                    checkboxes.prop("checked", true);
                else
                    checkboxes.prop("checked", false);

                $(anchor).attr("aria-checked", $(anchor).children().children('.singlecheck')[0].checked);
                VerifyAll($(li).parent());
                VerifyGroup($(li).prevAll('.multiselect-group').eq(0));
            });
            $('.multiselect-option').on("change", function () {
                var li = $(this).parents().eq(2);
                VerifyAll($(li).parent());
                VerifyGroup($(this).prevAll('.multiselect-group').eq(0));
                var anchor = $(this).children('a');
                $(anchor).attr("aria-checked", $(this).children().children().children('.singlecheck')[0].checked);
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

        function UpdateUserOpHist() {
            var btnHidden = $('#<%= btnUpdateUserOpHist.ClientID %>');
            if (btnHidden != null) {
                btnHidden.click();
            }
        }

        function SetHiddenField() {
            if ($('#ui-id-2').parent().attr("aria-selected") == "true") {
                var hdnwaitingMyAuthActive = $('[id$=waitingMyAuthActive]');
                hdnwaitingMyAuthActive.val(true);
            }
        }

        GoToDetails = function (operId) {
            eBankit.Presentation.SetBlockPageCommon();
            $('body').block();
            var hdnPendOperSelected = $('[id$=hdnPendOperSelected]');
            hdnPendOperSelected.val(operId);
            var btnGoTo = $('[id$=btnGoTo]');
            btnGoTo.click();
        }

        CancelPending = function (operId) {
            <% if (ReasonActive)
        {%>
                var modalTxtArea = document.getElementById('modalTxtArea');
                if (modalTxtArea != null) {
                    declineReason.value = document.getElementById('modalTxtArea').value.replace(/([^a-zA-z0-9.,: ]+)/g, s0 => '');
                }
                else {
                    declineReason.value = "";
                }
            <%}%>

                eBankit.Presentation.SetBlockPageCommon();
                $('body').block();
                var hdnPendOperSelected = $('[id$=hdnPendOperSelected]');
                var nOps = $('[id$=numberops]');
                hdnPendOperSelected.val(operId);
                var btnCancelPending = $('[id$=btnCancelPending]');
                btnCancelPending.click();
                if ($('#ui-id-2').parent().attr("aria-selected") == "true" && nOps.val() > 0) {
                    if (regPerPage <= nOps.val() - 1) {
                        document.getElementsByClassName("pending-operation-literal")[0].innerHTML = '<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX01811", "BulkPendingOperationsCounterMessage") %>'.format({ 0: regPerPage, 1: nOps.val() - 1 });
                } else {
                    document.getElementsByClassName("pending-operation-literal")[0].innerHTML = '<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX01811", "BulkPendingOperationsCounterMessage") %>'.format({ 0: nOps.val() - 1, 1: nOps.val() - 1 });
                }
            }
        }
        function TabEvents() {
            $("#tabs").tabs().find('.nav-tabs').find('li').each(function () {
                $(this).on("click keypress keyup keydown", function () {
                    $("#tabs").tabs().find('.nav-tabs').find('li').attr('tabindex', '0');
                });
            });
            $("#tabs").tabs({

                beforeLoad: function (event, ui) {
                    $("#tabs").tabs().find('.nav-tabs').find('li').each(function () {
                        $(this).attr('tabindex', '0');
                    });

                },
                load: function (event, ui) {
                    $("#tabs").tabs().find('.nav-tabs').find('li').each(function () {
                        $(this).attr('tabindex', '0');
                    });

                }

            });



        }
        $(document).ready(function () {
            $("#tabs").tabs();
            TabEvents();
            VerifyAllCheck();
            $('.cbkop').find('input').attr('tabindex', '-1');

            var tab = document.getElementById('<%= hdnSelectedTab.ClientID%>').value;
                if (tab !== null)
                    $('#tabs a[href="#' + tab + '"]').click();
            });


        prm.add_endRequest(VerifyAllCheck);
        prm.add_endRequest(TabEvents);
        prm.add_pageLoaded(TabEvents);

        prm.add_pageLoaded(function () {
            $(".checkmark.single").on('click keypress', function () {
                $(this).prev().click();
                $(this).toggleClass("selected");
                $(this).closest(".pend-row").toggleClass("toggle-selected");

                VerifyAllCheck();
            });
        });

        prm.add_endRequest(function () {
            $(".checkmark.all").on('click keypress', function () {
                cc = $(this).prev();
                cc.click();

                v = cc.prop('checked');
                var row = $(".pending-operation-bullet");
                if (v) {
                    row.addClass("selected");
                    row.parents(".pend-row").addClass("toggle-selected");
                } else {
                    row.removeClass("selected");
                    row.parents(".pend-row").removeClass("toggle-selected");
                }
                row.find('input:checkbox').each(function () {
                    $(this).prop('checked', v);
                });

                VerifyAllCheck();
            });

        });

        prm.add_pageLoaded(function () {
            $(".checkmark.all").on('click keypress', function () {
                cc = $(this).prev();
                cc.click();

                v = cc.prop('checked');
                var row = $(".pending-operation-bullet");
                if (v) {
                    row.addClass("selected");
                    row.parents(".pend-row").addClass("toggle-selected");
                } else {
                    row.removeClass("selected");
                    row.parents(".pend-row").removeClass("toggle-selected");
                }
                row.find('input:checkbox').each(function () {
                    $(this).prop('checked', v);
                });

                VerifyAllCheck();
                TabEvents();
            });
        });

        function VerifyAllCheck() {
            var cb = $('.pending-operation-bullet').find('input:checkbox:checked');
            if (cb.length > 0) {
                $('.buttons-panel a').each(function () {
                    $(this).removeClass('aspNetDisabled'); $(this).removeClass('disabled');
                    $(this).attr("tabindex", "0");
                });
            } else {
                $('.buttons-panel a').each(function () {
                    $(this).addClass('aspNetDisabled'); $(this).addClass('disabled');
                    $(this).attr("tabindex", "-1");

                });
            }
            var cbCount = $('.pending-operation-bullet').find('input:checkbox').length;
            cbAll = $(".checkmark.all").prev();

            cbAll.prop('checked', cb.length == cbCount);
        }

        function confirmDeletePending(currentMessage) {

            top.confirmDeleteHandler = function () {
                eval(currentMessage.href);
            }


            top.confirmDeleteHandlerReason = function () {
                declineReason.value = document.getElementById('modalTxtArea').value.replace(/([^a-zA-z0-9.,: ]+)/g, s0 => '');
                eval(currentMessage.href);
            }


             <%if (ReasonActive)
        {%>
                itcore_ui.ShowTopPopupConfirmWithTextArea_V2("<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX01811", "PopupDeclineBulkReasonTitle")%>", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX01811", "PopupDeclineBulkReasonSubtitle")%>", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX01811", "PopupDeclineBulkReasonContentMessage").Replace("\"", "&quot;") %>", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX01811", "PopupDeclineBulkReasonLabel")%>", "top.confirmDeleteHandlerReason();", "", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX01811", "PopupDeclineBulkReasonBtnKeepOperation").ToUpperInvariant()%>", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX01811", "PopupDeclineBulkReasonBtnConfirmDeclineOperation").ToUpperInvariant()%>");
            <%}
        else
        {%>
                itcore_ui.ShowTopPopupConfirm_V3("<%=eBankit.Common.Globalization.Translate.GetTransactionString("BulkApproval", "PopUpMessagePending").Replace("\"","&quot;") %>", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("BulkApproval", "PopUpTitlePending") %>", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("BulkApproval", "PopUpSubTitlePeding") %>", "top.confirmDeleteHandler();", "", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("JS", "KeepSelectedOperations").ToUpperInvariant() %>", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("JS", "DeclineSelectedOperations").ToUpperInvariant() %>");
            <%}%>
        }

        var postbackControl = null;
        var parm = Sys.WebForms.PageRequestManager.getInstance();
        parm.add_beginRequest(BeginRequestHandler);
        parm.add_endRequest(EndRequestHandler);

        function BeginRequestHandler(sender, args) {
            postbackControl = args.get_postBackElement();
            postbackControl.disabled = true;
        }
        function EndRequestHandler(sender, args) {
            postbackControl.disabled = false;
            postbackControl = null;
        }

        function validateKeypress(validChars) {
            var keyChar = String.fromCharCode(event.which || event.keyCode);
            return validChars.test(keyChar) ? keyChar : false;
        }

        function setTab(href) {
            if (document.getElementById('<%= hdnSelectedTab.ClientID%>') !== null)
                    document.getElementById('<%= hdnSelectedTab.ClientID%>').value = href;
        };
    </script>
</div>
