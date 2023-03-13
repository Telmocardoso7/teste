<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01301_01.ascx.cs" Inherits="TRX01301_01" %>
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
                <li class="col-xs-4 ui-tabs-active ui-state-active" aria-selected="true"><a href="#tabs-waiting-autho">
                    <asp:Literal runat="server" Text="<%$FrontEndResources:PendOper,WaitingForPending %>"></asp:Literal></a></li>
                <li class="col-xs-4"><a href="#tabs-third-party">
                    <asp:Literal runat="server" Text="<%$FrontEndResources:PendOper,WaitingForPendingThird %>"></asp:Literal></a></li>
                <li class="col-xs-4"><a href="#tabs-date-expires" onclick="UpdateUserOpHist();">
                    <div class="newNotExecutedOperationBullet" id="newNotExecutedBulletTitle" style="margin-right: 4px;" runat="server" visible="false"></div>
                    <asp:Literal runat="server" Text="<%$FrontEndResources:PendOper,DateExpires %>"></asp:Literal></a></li>
            </ul>
        </div>
        <div id="tabs-waiting-autho">
            <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnCancelPending" EventName="Click" />
                </Triggers>
                <ContentTemplate>

                    <div class="col-xs-12 pending-operation-message" id="infoDivPendingCounterMessage" runat="server">
                        <!--full-->
                        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                            <div class="pull-left pending-operation-literal">
                                <asp:Literal runat="server" ID="OperationsToAuthorizeCounter"></asp:Literal>
                            </div>

                            <div class="dropdown pull-right no-padding cancel-expired-operations col-xs-3" style="top: 10px">
                                <it:DropDownListControl_v2 ID="ddlSortPending" AutoPostBack="true" runat="server" ShowLabel="false" OnSelectedChanged="ddlSortPending_SelectedChanged" />
                                </br>
                            </div>
                        </div>
                    </div>
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

                                                <div class="CorpAlwaysVisible content-overflow">
                                                    <asp:Image runat="server" ID="pendingOperationImage" CssClass="pending-image"></asp:Image>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                                <div>
                                                    <div class="CorpAlwaysVisible content-overflow">
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
                                                    <div class="CorpDate content-overflow">
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
                                            <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2 btn-container-list">
                                                <asp:LinkButton ID="icoCancel" ClientIDMode="AutoID" CssClass="col-xs-3 icon-cancel-btn icon-btn icon-cancelthird-btn" runat="server" CommandName="Cancel"></asp:LinkButton>
                                                <asp:LinkButton ID="icoApprove" ClientIDMode="AutoID" CssClass="col-xs-3 icon-approve-btn icon-btn" runat="server" CommandName="Approve" OnClientClick="SetHiddenField()"></asp:LinkButton>
                                                <asp:LinkButton ID="aOpenDetail" runat="server" CssClass="col-xs-3 icon-detail-btn icon-btn" CommandName="Detail" OnClientClick="SetHiddenField()"></asp:LinkButton>
                                            </div>
                                            <div class="clearBoth"></div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:HiddenField ID="HiddenField1" runat="server" />
                                <asp:Button ID="Button1" Style="display: none;" runat="server" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="tabs-third-party" style="margin-top: 10px;">
            <asp:UpdatePanel ID="updPanelThirdparty" runat="server" UpdateMode="Conditional">
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
                                <it:DropDownListControl_v2 ID="ddlSortThirdParty" AutoPostBack="true" runat="server" ShowLabel="false" OnSelectedChanged="ddlSortThirdParty_SelectedIndexChanged" />
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
                                <asp:Repeater ID="rptPendingOperationsThird" runat="server" OnItemDataBound="rptPendingOperations_ItemDataBound" OnItemCommand="rptPendingOperations_ItemCommand">
                                    <ItemTemplate>
                                        <div id="divPendingOperation" class="contentBoxCorporate box-red" runat="server">
                                            <div class="col-xs-12 col-sm-12 col-md-1 col-lg-1">
                                                <div class="CorpAlwaysVisible content-overflow">
                                                    <asp:Image runat="server" ID="pendingOperationImage" CssClass="pending-image"></asp:Image>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                                <div>
                                                    <div class="CorpAlwaysVisible content-overflow">
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
                                                    <div class="CorpDate content-overflow">
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
                                            <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2 btn-container-list">
                                                <asp:LinkButton ID="icoCancel" ClientIDMode="AutoID" CssClass="col-xs-3 icon-cancel-btn icon-btn icon-cancelthird-btn" runat="server" CommandName="Cancel"></asp:LinkButton>
                                                <asp:LinkButton ID="icoApprove" ClientIDMode="AutoID" CssClass="col-xs-3 icon-approve-btn icon-btn" runat="server" CommandName="Approve"></asp:LinkButton>
                                                <asp:LinkButton ID="aOpenDetail" runat="server" CssClass="col-xs-3 icon-detail-btn icon-btn" CommandName="Detail"></asp:LinkButton>
                                            </div>
                                            <div class="clearBoth"></div>
                                        </div>
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
            <asp:UpdatePanel ID="UpdatePanelDateExpires" runat="server" UpdateMode="Conditional">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnCancelPending" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnUpdateUserOpHist" EventName="Click" />
                </Triggers>
                <ContentTemplate>
                    <div class="col-xs-12 pending-operation-message" id="infoDivNotExecutedCounterMessage" runat="server">
                        <!--full-->
                        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                            <div class="pull-left pending-operation-literal">
                                <asp:Literal runat="server" ID="OperationsNotExecutedCounter" Visible="false"></asp:Literal>
                            </div>

                            <div class="dropdown pull-right no-padding cancel-expired-operations col-xs-3" style="top: 10px;">
                                <it:DropDownListControl_v2 ID="ddlSortCancelledAndExpired" AutoPostBack="true" runat="server" ShowLabel="false" OnSelectedChanged="ddlSortCancelledAndExpired_SelectedIndexChanged" />
                                </br>
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                        <div id="scrollContainerDateExpires" class="row scrollContainerAccountsCorp" runat="server">
                            <div id="scroolContentCorporateDateExpires" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 metro content-accounts overflowHidden">
                                <div id="ExpiredEmptyContainer" runat="server" visible="false" class="pend-oper-empty-container">
                                    <div class="text-center col-xs-12 empty-icon"></div>
                                    <div class="col-xs-12 text-center empty-title">
                                        <asp:Literal ID="expiredEmptyMessageTitle" runat="server" Text="<%$FrontEndResources:PendOper,ExpiredEmptyMessageTitle%>"></asp:Literal>
                                    </div>
                                    <div class="col-xs-12 text-center empty-message">
                                        <asp:Literal ID="expiredEmptyMessage" runat="server" Text="<%$FrontEndResources:PendOper,ExpiredEmptyMessage%>"></asp:Literal>
                                    </div>
                                </div>
                                <asp:Repeater ID="rptPendingOperationsDateExpires" runat="server" OnItemDataBound="rptPendingOperations_ItemDataBound" OnItemCommand="rptPendingOperations_ItemCommand">
                                    <ItemTemplate>
                                        <div id="divPendingOperation" class="contentBoxCorporate box-red" runat="server">
                                            <div class="col-xs-12 col-sm-12 col-md-1 col-lg-1">
                                                <div class="CorpAlwaysVisible content-overflow">
                                                    <div class="pending-operation-bullet">
                                                        <div class="newNotExecutedOperationBullet" id="newNotExecutedBullet" runat="server" visible="false"></div>
                                                    </div>
                                                    <div class="pending-operation-image">
                                                        <asp:Image runat="server" ID="pendingOperationImage" CssClass="pending-image"></asp:Image>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
                                                <div>
                                                    <div class="CorpAlwaysVisible content-overflow">
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
                                            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                                                <div>
                                                    <div class="CorpDate content-overflow">
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
                                                    <div class="CorpPeriodicity content-overflow">
                                                        <asp:Literal ID="litStateTitle" Text="<%$FrontEndResources:TRX01304158,OperationState%>" runat="server"></asp:Literal>
                                                    </div>
                                                </div>
                                                <div class="clearBoth"></div>
                                                <div id="div1" runat="server">
                                                    <div class="CorpPeriodicityValue content-overflow pend-content">
                                                        <asp:Literal ID="litState" runat="server"></asp:Literal>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2 btn-container-list">

                                                <asp:LinkButton ID="aOpenDetail" runat="server" CssClass="col-xs-3 icon-detail-btn icon-btn" ToolTip="<%$FrontEndResources:TRX01801,Detail%>" CommandName="Detail"></asp:LinkButton>
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
        </div>
        <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01301-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    </div>
    <asp:HiddenField ID="hdnPendOperSelected" runat="server" />
    <asp:HiddenField ID="waitingMyAuthActive" runat="server" />
    <asp:Button ID="btnGoTo" Style="display: none;" runat="server" />
    <asp:Button ID="btnCancelPending" Style="display: none;" runat="server" />
    <asp:Button ID="btnUpdateUserOpHist" Style="display: none;" runat="server" OnClick="btnUpdateUserOpHist_Click" />

    <script type="text/javascript">

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
            eBankit.Presentation.SetBlockPageCommon();
            $('body').block();
            var hdnPendOperSelected = $('[id$=hdnPendOperSelected]');
            hdnPendOperSelected.val(operId);
            var btnCancelPending = $('[id$=btnCancelPending]');
            btnCancelPending.click();
        }

        $(document).ready(function () {
            $("#tabs").tabs();
        });

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
    </script>
</div>