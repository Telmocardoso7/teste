<%@ control language="C#" autoeventwireup="true" codebehind="TRX01304_01.ascx.cs" inherits="TRX01304_01" %>
<%@ import namespace="eBankit.Common.InternetBanking" %>
<div runat="server" class="transaction-content pending-oper pending-corp marginBottom10">
    <div class="grayContainer bottomBorderInfoTopMessage">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
            <asp:Literal runat="server" Text="<%$FrontEndResources:TRX01304,MyPendingOperationsMessage %>"></asp:Literal>
        </div>
    </div>

    <div id="tabsMyPendingOperations">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max pend-opr">
            <ul class="nav nav-tabs">
                <li class="col-xs-6"><a href="#tab-my-operations" onclick="setTab('tab-my-operations');">
                    <asp:Literal runat="server" Text="<%$FrontEndResources:TRX01304,MyPendingOperations%>"></asp:Literal></a></li>
                <li class="col-xs-6 " aria-selected="true"><a href="#tab-expired-canceled-rejected" onclick="UpdateUserOpHist(); setTab('tab-expired-canceled-rejected');">
                    <div class="newNotExecutedOperationBullet" id="newNotExecutedBulletTitle" style="margin-right: 4px;display:none" runat="server"></div>
                    <asp:Literal runat="server" Text="<%$FrontEndResources:TRX01304,MyNotExecutedOperations%>"></asp:Literal></a></li>
            </ul>
        </div>

        <div id="tab-my-operations">
            <asp:UpdatePanel ID="updPanelMyOperations" runat="server" UpdateMode="Always">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnCancelPending" EventName="Click" />
                </Triggers>
                <ContentTemplate>


                    <div class="col-xs-12 pending-operation-message" id="infoDivMyPendingCounterMessage" runat="server">
                        <!--full-->
                        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                            <div class="pull-left pending-operation-literal">
                                <asp:Literal runat="server" ID="myPendingOperationsToAuthorizeCounter"></asp:Literal>
                            </div>

                            <div class="dropdown pull-right no-padding cancel-expired-operations col-xs-3">
                                <it:DropDownListControl_v2 ID="ddlSortMyPending" AutoPostBack="true" runat="server" ShowLabel="false" OnSelectedChanged="ddlSortMyPending_SelectedChanged" Label="<%$FrontEndResources:TRX01811,SelectOption %>" />
                                </br>  
                            </div>

                        </div>
                    </div>

                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                        <div id="scrollContainerMyOp" class="row scrollContainerAccountsCorp box-rpt" runat="server">
                            <div id="scroolContentCorporateMyOp" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 metro content-accounts overflowHidden">
                                <div id="MyOperationsEmptyContainer" runat="server" visible="false" class="pend-oper-empty-container">
                                    <div class="text-center col-xs-12 empty-icon"></div>
                                    <div class="col-xs-12 text-center empty-title">
                                        <asp:Literal ID="litMyOperationsEmptyMessageTitle" runat="server" Text="<%$FrontEndResources:TRX01304,MyOperationsMessageTitle%>"></asp:Literal>

                                    </div>
                                    <div class="col-xs-12 text-center empty-message">
                                        <asp:Literal ID="litMyOperationsEmptyMessage" runat="server" Text="<%$FrontEndResources:TRX01304,MyOperationsEmptyMessage%>"></asp:Literal>
                                    </div>
                                </div>
                                <asp:Repeater ID="rptMyPendingOperations" runat="server" OnItemDataBound="rptMyPendingOperations_ItemDataBound" OnItemCommand="rptMyPendingOperations_ItemCommand">
                                    <ItemTemplate>
                                        <div id="divPendingOperation" class="contentBoxCorporate box-red" runat="server">
                                            <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2">
                                                <div class="CorpAlwaysVisible content-overflow">
                                                    <asp:Image runat="server" ID="pendingOperationImage" CssClass="pending-image"></asp:Image>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-4">
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
                                                <asp:LinkButton ID="aOpenDetail" runat="server" CssClass="col-xs-3 icon-detail-btn icon-btn" CommandName="DetailPending" ToolTip="<%$FrontEndResources:TRX01304,Detail%>"></asp:LinkButton>
                                                <asp:LinkButton ID="icoReuse" runat="server" CssClass="col-xs-3 icon-reuse-btn icon-btn" ToolTip="<%$FrontEndResources:TRX01304,Reuse%>" Enabled="true" CommandName="Reuse" Visible="false"></asp:LinkButton>

                                            </div>
                                            <div class="clearBoth"></div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:HiddenField ID="HiddenField4" runat="server" />
                                <asp:HiddenField ID="hdnCancelSucess" runat="server" />
                                <asp:Button ID="Button4" Style="display: none;" runat="server" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div id="tab-expired-canceled-rejected">
            <asp:UpdatePanel ID="updPanelCanceledExpired" runat="server" UpdateMode="Always">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnCancelPending" EventName="Click" />
                    <asp:AsyncPostBackTrigger ControlID="btnUpdateUserOpHist" EventName="Click" />
                </Triggers>
                <ContentTemplate>


                    <div class="col-xs-12 pending-operation-message" id="infoDivMyNotExecutedCounterMessage" runat="server">
                        <!--full-->
                        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                            <div class="pull-left pending-operation-literal">
                                <asp:Literal runat="server" ID="newNotExecutedOperationsCounterMesssage" Visible="false"></asp:Literal>
                            </div>

                            <div class="dropdown pull-right no-padding cancel-expired-operations col-xs-3">
                                <it:DropDownListControl_v2 ID="ddlSortCancelledAndExpired" AutoPostBack="true" runat="server" ShowLabel="false" OnSelectedChanged="ddlSortCancelledAndExpired_SelectedIndexChanged" Label="<%$FrontEndResources:TRX01811,SelectOption %>" />
                                </br>  
                            </div>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                        <!--center-->
                        <div id="scrollContainerMyOpExpiredCanceledRejected" class="row scrollContainerAccountsCorp" runat="server">
                            <div id="scroolContentCorporateExpiredCanceledRejected" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 metro content-accounts overflowHidden">

                                <div id="MyOperationsExpiredCanceledRejectedEmptyContainer" runat="server" visible="false" class="pend-oper-empty-container">
                                    <div class="text-center col-xs-12 empty-icon"></div>
                                    <div class="col-xs-12 text-center empty-title">
                                        <asp:Literal ID="litMyOperationsDateExpireCanceledRejectedEmptyMessageTitle" runat="server" Text="<%$FrontEndResources:TRX01304,MyOperationsExpiredCanceledRejectedEmptyMessageTitle%>"></asp:Literal>
                                    </div>
                                    <div class="col-xs-12 text-center empty-message">
                                        <asp:Literal ID="litMyOperationsDateExpireCanceledRejectedEmptyMessage" runat="server" Text="<%$FrontEndResources:TRX01304,MyOperationsExpiredCanceledRejectedEmptyMessage%>"></asp:Literal>
                                    </div>
                                </div>

                                <asp:Repeater ID="rptMyPendingOperationsExpireDateCanceledRejected" runat="server" OnItemDataBound="rptMyPendingOperationsExpireDateCanceledRejected_ItemDataBound" OnItemCommand="rptMyPendingOperationsExpireDateCanceledRejected_ItemCommand">
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
                                                        <asp:Literal ID="litStateTitle" Text="<%$FrontEndResources:TRX01304,OperationState%>" runat="server"></asp:Literal>
                                                    </div>
                                                </div>
                                                <div class="clearBoth"></div>
                                                <div id="div1" runat="server">
                                                    <div class="CorpPeriodicityValue content-overflow pend-content">
                                                        <span ID="litState" runat="server"></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-xs-12 col-sm-12 col-md-2 col-lg-2 btn-container-list">
                                                <asp:LinkButton ID="icoCancel" ClientIDMode="AutoID" CssClass="col-xs-3 icon-cancel-btn icon-btn icon-cancelthird-btn"  ToolTip="<%$FrontEndResources:TRX1302,PopupCancelTitle%>" runat="server" CommandName="btnCancelPending_Click"></asp:LinkButton>
                                                <asp:LinkButton ID="aOpenDetail" runat="server" CssClass="col-xs-3 icon-detail-btn icon-btn" ToolTip="<%$FrontEndResources:TRX01304,Detail%>" CommandName="DetailExpired"></asp:LinkButton>
                                                <asp:LinkButton ID="icoReuse" runat="server" CssClass="col-xs-3 icon-reuse-btn icon-btn" ToolTip="<%$FrontEndResources:TRX01304,Reuse%>" CommandName="Reuse" Visible="true"></asp:LinkButton>
                                            </div>
                                            <div class="clearBoth"></div>
                                        </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <asp:HiddenField ID="HiddenField6" runat="server" />
                                <asp:Button ID="Button6" Style="display: none;" runat="server" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:HiddenField ID="hdnSelectedTab" runat="server" Value="tab-my-operations" />
        </div>

    </div>

    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01304-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("/Scripts/Services/Transactions/TRX01304-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript)%>"></script>
    <asp:HiddenField ID="hdnPendOperSelected" runat="server" />
    <asp:Button ID="btnGoTo" Style="display: none;" runat="server" />
    <asp:Button ID="btnCancelPending" Style="display: none;" runat="server" />
    <asp:Button ID="btnUpdateUserOpHist" Style="display: none;" runat="server" OnClick="btnUpdateUserOpHist_Click" />

    <script type="text/javascript">
        $(document).ready(function () {
            $("img[id*='pendingOperationImage']").each(function () {
                if ($(this).attr("alt") === undefined)
                    $(this).attr("alt", "");
            });

            $("img[id*='pendingOperationImageExpires']").each(function () {
                if ($(this).attr("alt") === undefined)
                    $(this).attr("alt", "");
            });
        });
        function UpdateUserOpHist() {
            var btnHidden = $('#<%= btnUpdateUserOpHist.ClientID %>');
            if (btnHidden != null) {
                btnHidden.click();
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
            $("#tabsMyPendingOperations").tabs();
            TabKeyboardEvents();

            var tab = document.getElementById('<%= hdnSelectedTab.ClientID%>').value;
            if (tab !== null)
                $('#tabsMyPendingOperations a[href="#' + tab + '"]').click();
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
            
            if (document.getElementById('<%= hdnCancelSucess.ClientID%>').value)
                document.getElementById('<%= newNotExecutedBulletTitle.ClientID %>').style.display = 'inline-block';
        } 

        function TabKeyboardEvents() {
            $("#tabsMyPendingOperations").tabs().find('.nav-tabs').find('li').each(function () {
                $(this).on("click keypress keyup keydown", function () {
                    $("#tabsMyPendingOperations").tabs().find('.nav-tabs').find('li').attr('tabindex', '0');
                });
            });
        }

        function setTab(href) {
            if (document.getElementById('<%= hdnSelectedTab.ClientID%>') !== null)
                document.getElementById('<%= hdnSelectedTab.ClientID%>').value = href;
        };

    </script>
</div>

