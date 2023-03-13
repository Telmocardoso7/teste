<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LandingPendingOperationsControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.LandingPendingOperationsControl" %>

<div class="pending-corp-landing">
	<asp:Panel ID="pnAllData" CssClass="pnAllData" runat="server">
        
		<asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
			<Triggers>
				<asp:AsyncPostBackTrigger ControlID="btnCancelPending" EventName="Click" />
			</Triggers>
            <ContentTemplate>
                <asp:Panel runat="server" ID="pnlHeaderContainer">
                    <div class="pendOperSeparator"></div>
                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts">
                        <asp:Label ID="lblLastOperationsTitle" CssClass="dashboardSliderTitle PendOperAlignLeft" Text="<%$FrontEndResources:Custom,PanelPendingOperations%>" runat="server"></asp:Label>
                        <a id="aPendOperations" runat="server">
                            <asp:Label ID="lblViewMore" CssClass="dashboardSliderTitle PendOperViewMore" Text="<%$FrontEndResources:Custom,ViewMore%>" runat="server"></asp:Label>
                        </a>
                    </div>

                    <div id="WaitingAuthEmptyContainer" runat="server" visible="false" class="pend-oper-empty-container">
                        <div class="text-center col-xs-12 empty-icon"></div>
                        <div class="col-xs-12 text-center empty-title">
                            <asp:Literal ID="litWaitingAuthEmptyMessageTitle" runat="server" Text="<%$FrontEndResources:PendOper,WaitingAuthEmptyMessageTitle%>"></asp:Literal>
                        </div>
                        <div class="col-xs-12 text-center empty-message">
                            <asp:Literal ID="litWaitingAuthEmptyMessage" runat="server" Text="<%$FrontEndResources:PendOper,WaitingAuthEmptyMessage%>"></asp:Literal>
                        </div>
                    </div>
                    <div class="clearBoth"></div>
                </asp:Panel>

                <asp:Panel runat="server" ID="pnlContainer">
                    <div id="scrollContainer" class="scrollContainerAccountsCorp" runat="server">
                        <div id="scroolContentCorporate" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max metro content-accounts overflowHidden">
                            <asp:Repeater ID="rptPendingOperations" runat="server" OnItemDataBound="rptPendingOperations_ItemDataBound" OnItemCommand="rptPendingOperations_ItemCommand">
                                <ItemTemplate>
                                    <div id="divPendingOperation" class="contentBoxCorporate box-red" runat="server">

                                        <div class="col-xs-8">
                                            <div class="col-xs-12 corp-container">
                                                <div class="scroll-item-top">
                                                    <h4 class="CorpAlwaysVisible">
                                                        <asp:Literal ID="litOperationType" runat="server"></asp:Literal>
                                                    </h4>
                                                </div>
                                            </div>
                                            <div class="clearBoth"></div>
                                            <div id="divBalance" class="col-xs-12 scroll-item-value positive" runat="server">
                                                <h3 class="CorpAccBalance">
                                                    <asp:Literal ID="litOperationValue" runat="server"></asp:Literal>
                                                    <span>
                                                        <asp:Literal ID="litOperationCurrency" runat="server"></asp:Literal></span>
                                                </h3>
                                            </div>
                                        </div>

                                        <div class="col-xs-4 btn-container-list">
                                            <div class="col-xs-12 col-sm-6">
                                                <asp:LinkButton ID="icoCancel" ClientIDMode="AutoID" CssClass="" runat="server" CommandName="Cancel">
												<div class="icon-cancel-btn icon-pendop-cancel"></div>
                                                </asp:LinkButton>
                                                <br />
                                                <asp:Label ID="ltCancel" CssClass="txt-cancel-btn" runat="server" Text="<%$FrontEndResources:PendOper,Cancel%>"></asp:Label>
                                            </div>
                                            <div class="col-xs-12 col-sm-6">
                                                <asp:LinkButton ID="icoApprove" ClientIDMode="AutoID" CssClass="" runat="server" CommandName="Approve">
												<div class="icon-approve-btn icon-pendop-approve"></div>
                                                </asp:LinkButton>
                                                <br />
                                                <asp:Label ID="ltApprove" CssClass="txt-approve-btn" runat="server" Text="<%$FrontEndResources:PendOper,Approve%>"></asp:Label>
                                            </div>

                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:HiddenField ID="hdnPendOperSelected" runat="server" />
                            <asp:Button ID="btnCancelPending" Style="display: none;" runat="server" />
                        </div>
                    </div>
                    <div class="clearBoth"></div>
                </asp:Panel>
            </ContentTemplate>
		</asp:UpdatePanel>

	</asp:Panel>
</div>
<script type="text/javascript">
	CancelPending = function (operId) {
		var hdnPendOperSelected = $('[id$=hdnPendOperSelected]');
		hdnPendOperSelected.val(operId);
		var btnCancelPending = $('[id$=btnCancelPending]');
		btnCancelPending.click();
	};
</script>
