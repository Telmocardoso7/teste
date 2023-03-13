<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01302_01.ascx.cs" Inherits="TRX01302_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div class="transaction-content accountDetail marginBottom10">
    <asp:Panel ID="pnControls" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" runat="server">
        <div class="grayContainer">
            <it:FlowInnerContainer ID="flwPendOper" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server" role="button" aria-pressed="false">
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 break-none trx-information">
                    <p class="accounts-panel-p">
                        <asp:Literal ID="litOper" Text="<%$FrontEndResources:TRX01302,litOper%>" runat="server"></asp:Literal>
                    </p>
                    <h3 class="favorit-center accounts-panel-h" id="hCCOperValue" runat="server">
                        <asp:Literal ID="lblOperValue" runat="server"></asp:Literal>
                    </h3>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 break-xs trx-information">
                    <p class="accounts-panel-p">
                        <asp:Literal ID="litChannel" Text="<%$FrontEndResources:TRX01302,litChannel%>" runat="server"></asp:Literal>
                    </p>
                    <h3 class="favorit-center accounts-panel-h" id="hCCChannelValue" runat="server">
                        <asp:Literal ID="lblChannelValue" runat="server"></asp:Literal>
                    </h3>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 break-md trx-information">
                    <p class="accounts-panel-p">
                        <asp:Literal ID="litCreator" Text="<%$FrontEndResources:TRX01302,litCreator%>" runat="server"></asp:Literal>
                    </p>
                    <h3 class="favorit-center accounts-panel-h" id="hCCCreatorValue" runat="server">
                        <asp:Literal ID="lblCreatorValue" runat="server"></asp:Literal>
                    </h3>
                    <h3 class="favorit-center accounts-panel-h" id="h1" runat="server">
                        <asp:Literal ID="lblDateValue" runat="server"></asp:Literal>
                    </h3>
                </div>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 break-xs trx-information">
                    <p class="accounts-panel-p">
                        <asp:Literal ID="litOperationState" Text="<%$FrontEndResources:TRX01302,OperationState%>" runat="server"></asp:Literal>
                    </p>
                    <h3 class="favorit-center accounts-panel-h" id="operationState" runat="server">
                        <span class="" ID="lblOperationState" runat="server"></span>
                    </h3>
                    <h3 class="favorit-center accounts-panel-h" id="userCancel" runat="server">
                        <asp:Literal ID="lblUserCancel" runat="server"></asp:Literal>
                    </h3>
                </div>
                <div style="clear: both;"></div>
            </it:FlowInnerContainer>
        </div>
        <it:FlowInnerContainer ID="flwOperDetails" Title="<%$FrontEndResources:TRX01302,OperDetailsTitle %>" CustomCssClass="bs-reduced bs-head-metro bs-reduced-transaction" runat="server"  role="button" aria-pressed="false">
            <div style="clear: both;">
                <asp:PlaceHolder ID="pchAllFileds" runat="server"></asp:PlaceHolder>
            </div>
        </it:FlowInnerContainer>
        <it:FlowInnerContainer ID="flwAuthorizationType" Title="<%$FrontEndResources:TRX01303,AuthorizationTypeTitle %>" CustomCssClass="bs-reduced bs-head-metro bs-reduced-transaction" runat="server"  role="button" aria-pressed="false">
            <div style="clear: both;">
                <it:FlowLabel ID="lblAuthorizationType" IsRequired="false" MaxLength="0" MinLength="0" Label="<%$FrontEndResources:TRX01303,lblAuthorizationType%>" runat="server" />
            </div>
        </it:FlowInnerContainer>
        <it:FlowInnerContainer ID="flwPriorAuthorizations" Title="<%$FrontEndResources:TRX01303,PriorAuthorizationsTitle%>" CustomCssClass="bs-reduced bs-head-metro bs-reduced-transaction" runat="server"  role="button" aria-pressed="false">
            <div class="table-grid-border" style="border: none;">
                <it:FlowContainerDetail ID="flwData" CssClass="panel panel-detail" CustomCssClass="bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                    <div class="col-lg-12" style="padding-left: 0px; padding-right: 0px;">
                        <div class="metro">
                            <it:GridViewControl ID="gvPriorAuthorizations" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="grid-no-arrow table table-resp-to1199"
                                GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" RecordCounterComplementarText="<%$FrontEndResources:TRX00701,gridDataecordCounterComplementarText %>" OnRowDataBound="gvPriorAuthorizations_RowDataBound"
                                tabindex="0" role="button" aria-pressed="false">
                                <Columns>
                                    <asp:TemplateField HeaderStyle-CssClass="center" HeaderText="" ItemStyle-Width="40px">
                                        <ItemTemplate>
                                            <asp:Image ID="imgUser" runat="server" AlternateText="" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$GenericFrontEndResources:User%>" ItemStyle-Width="120">
                                        <ItemTemplate>
                                            <asp:Label ID="lblAuthorizerUser" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$FrontEndResources:TRX01302,Decision%>" ItemStyle-Width="100">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDecision" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$FrontEndResources:TRX01302,Reason%>" ItemStyle-Width="260" >
                                        <ItemTemplate>
                                            <asp:Label ID="lblReason" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" runat="server"/>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$FrontEndResources:TRX01302,SignatureType%>" ItemStyle-Width="160">
                                        <ItemTemplate>
                                            <asp:Label ID="lblSignatureType" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$GenericFrontEndResources:Date%>" HeaderStyle-Width="90">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDate" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="<%$GenericFrontEndResources:Hour%>" HeaderStyle-Width="90">
                                        <ItemTemplate>
                                            <asp:Label ID="lblHour" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </it:GridViewControl>
                        </div>
                    </div>
                </it:FlowContainerDetail>

                <div id="divNoPriorAuthorizations" class="metro bs-reduced bs-head-metro bs-reduced-transaction" visible="false" runat="server">
                    <div class="warn" style="text-align: center;">
                        <asp:Label ID="lblNoPriorAuthorizations" Text="<%$FrontEndResources:TRX01303,NoPriorAuthorizations %>" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </it:FlowInnerContainer>

        <div class="clearBoth"></div>

        <div class="trs_buttons col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro transp">
            <div class="trs_buttons-action">

                <a id="btnGoToMyPending" class="btn btn-default" style="margin-top: 10px;" runat="server"><span>&nbsp;</span><asp:Literal Text="<%$FrontEndResources:TRX01302,MyPendOperList%>" runat="server"></asp:Literal></a>
                <a id="btnCancel" class="btn btn-default" style="margin-top: 10px;" runat="server"><span>&nbsp;</span><asp:Literal Text="<%$FrontEndResources:TRX01302,pendOperList%>" runat="server"></asp:Literal></a>
                <asp:LinkButton ID="btnCancelPending" class="btn btn-default" Style="margin-top: 10px;" runat="server" OnClientClick="if(!confirmDeletePending(this)) return false;" OnCommand="btnCancelPending_CommandClick" Text="<%$FrontEndResources:TRX01302,CancelOperationBtn%>"></asp:LinkButton>

                <it:WorkflowLinkButton ID="btnNextFlowItemAuthorizePending" WorkflowAction="Next" CausesValidation="true" CssClass="btn btn-primary" Style="margin-top: 10px;" OnClientClick="if(ReasonFlag && (!approveWithReason(this))) return false;" runat="server">
                    <span>&nbsp;</span><asp:Literal Text="<%$FrontEndResources:TRX01302,authorize%>" runat="server"></asp:Literal>
                </it:WorkflowLinkButton>
            </div>
            <asp:HiddenField ID="hdnReason" runat="server"/>
            <asp:HiddenField ID="hdnSelectedTab" runat="server"/>
        </div>


        <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01302-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />

        <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("/Scripts/Services/Transactions/TRX01302-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript)%>"></script>
        <script type="text/javascript">  

               
 
            var reason = document.getElementById('<%= hdnReason.ClientID %>');
            function confirmDeletePending(currentMessage) {

                top.confirmDeleteHandler = function () {                    
                    eval(currentMessage.href);
                }

                top.confirmDeleteHandlerReason = function () {
                    reason.value = document.getElementById('modalTxtArea').value.replace(/([^a-zA-z0-9.,: ]+)/g, s0 => '');
                    eval(currentMessage.href);
                }
                <%if (myApprovalRedirect)
                {%>
            <%if (ReasonActive)
                    {%>
                        itcore_ui.ShowTopPopupConfirmWithTextArea_V2("<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX1302", "PopupDeclineReasonTitle")%>", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX1302", "PopupDeclineReasonContentMessage").Replace("\"", "&quot;") %>", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX1302", "PopupDeclineReasonSubtitle")%>", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX1302", "PopupDeclineReasonLabel")%>", "top.confirmDeleteHandlerReason();", "", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX1302", "PopupDeclineReasonBtnKeepOperation").ToUpperInvariant()%>", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX1302", "PopupDeclineReasonBtnConfirmDeclineOperation").ToUpperInvariant()%>");
                    <%}
                    else
                    {%>
                        itcore_ui.ShowTopPopupConfirm_V3("<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX1302", "PopupCancelContentMessage").Replace("\"", "&quot;") %>", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX1302", "PopupDeclineTitle")%>",  "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX1302", "PopupDeclineConfirmationMessage")%>", "top.confirmDeleteHandler();", "","<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX1302", "PopupCancelBtnKeepOperation").ToUpperInvariant()%>","<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX1302", "PopupCancelBtnConfirmDeclineOperation").ToUpperInvariant()%>");
                    <%}
                }
                else
                {%>
                    itcore_ui.ShowTopPopupConfirm_V3("<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX1302", "PopupCancelContentMessage").Replace("\"", "&quot;") %>", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX1302", "PopupCancelTitle")%>",  "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX1302", "PopupCancelConfirmationMessage")%>", "top.confirmDeleteHandler();", "","<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX1302", "PopupCancelBtnKeepOperation").ToUpperInvariant()%>","<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX1302", "PopupCancelBtnConfirmCancelOperation").ToUpperInvariant()%>");
                    <%}%>
                }


            function approveWithReason(currentMessage) {
              
                top.confirmAuthorizeHandler = function () {
                    reason.value = document.getElementById('modalTxtArea').value.replace(/([^a-zA-z0-9.,: ]+)/g, s0 => '');
                    eval(currentMessage.href);
                }


                itcore_ui.ShowTopPopupConfirmWithTextArea_V1("<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX01302", "PopupApproveWithReasonTitle").Replace("\"", "&quot;") %>", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX01302", "PopupApproveWithReasonTextContent")%>", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX01302", "PopupApproveWithReasonTextArea")%>", "top.confirmAuthorizeHandler();", "", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX01302", "PopupApproveWithReasonBtnKeep").ToUpperInvariant()%>", "<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX01302", "PopupApproveWithReasonBtnApprove").ToUpperInvariant()%>");
            }
        </script>
    </asp:Panel>
    <div class="clearBoth"></div>
</div>