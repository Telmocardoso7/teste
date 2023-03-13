<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00703_01.ascx.cs" Inherits="TRX00703_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server">
    <div class="panel-favorit">
        <div class="col-xs-12 ch-header-container">
            <div class="col-max bs-reduced bs-head-metro bs-popup">
                <div class="img-operation-div">
                    <span class="img-operation-span"></span>
                    <img id="imgOperationType" src="<%$ebFile:~/Content/currenttheme/images/benef_1.png%>" alt="" class="img-operation" runat="server" />
                </div>
                <div class="operation-type ">
                    <asp:Literal ID="litOperationType" runat="server"></asp:Literal>
                </div>
                <div class="operation-value">
                    <asp:Literal ID="litOperationValue" runat="server"></asp:Literal>
                </div>
                <div class="operation-status">
                    <asp:Label ID="litOperationStatus" runat="server"></asp:Label>
                </div>
                <asp:Label ID="litOperationDateCancel" runat="server" Visible="false"></asp:Label>
                <div>
                    <asp:Label ID="litOperationDate" runat="server" />
                </div>
                <div>
                    <asp:Label ID="litOperationStatusUpdateDate" runat="server" />
                </div>
                <div>
                    <asp:Label ID="litContractNumber" runat="server" />
                </div>
            </div>
        </div>


        <div class="col-xs-12 division-line"></div>
        <asp:Panel ID="pnControls" CssClass="col-xs-12 label-left reasonWordBreak opDetails-grid table-responsive" runat="server">

            <asp:Panel ID="pnAuthorization" runat="server">
                <it:FlowInnerContainer ID="FlowInnerContainer1" Title="<%$FrontEndResources:TRX00703,AuthorizationsTitle%>" CustomCssClass="bs-reduced bs-head-metro bs-reduced-transaction ch-header-container" runat="server">
                    <div class="table-grid-border" style="border: 0px;">
                        <it:FlowContainerDetail ID="flwData" CssClass="panel panel-detail" runat="server">
                            <div class="col-lg-12" style="padding-left: 0px; padding-right: 0px;">
                                <div class="metro">


                                    <!--<div class="col-max bs-reduced bs-head-metro bs-popup">-->

                                    <it:GridViewControl ID="gvPriorAuthorizations" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="grid-no-arrow table table-resp-to1199"
                                        GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" RecordCounterComplementarText="<%$FrontEndResources:TRX00701,gridDataecordCounterComplementarText %>" OnRowDataBound="gvPriorAuthorizations_RowDataBound">

                                        <Columns>
                                            <asp:TemplateField HeaderStyle-CssClass="center" HeaderText="" ItemStyle-Width="60" HeaderStyle-Width="60" ItemStyle-CssClass="imgUser">
                                                <ItemTemplate>
                                                    <asp:Image ID="imgUser" GenerateEmptyAlternateText="true" AlternateText="" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="<%$GenericFrontEndResources:User%>" ItemStyle-Width="140">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAuthorizerUser" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00703,Decision %>" HeaderStyle-CssClass="table-description" ItemStyle-Width="90">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAuthorizerDecision" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00703,Reason %>" HeaderStyle-CssClass="table-description" ItemStyle-Width="140">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAuthorizerReason" data-toggle="tooltip" data-placement="top" data-container="body" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="<%$GenericFrontEndResources:SignatureType%>" ItemStyle-Width="200">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSignatureType" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="<%$GenericFrontEndResources:Date%>" HeaderStyle-Width="100">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblDate" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="<%$GenericFrontEndResources:Hour%>" HeaderStyle-Width="100">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblHour" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </it:GridViewControl>
                                    <div id="divNoPriorAuthorizations" class="col-xs-12 ch-header-container" visible="false" runat="server">
                                        <div class="warn">
                                            <asp:Label ID="lblNoPriorAuthorizations" Text="<%$FrontEndResources:TRX00703,NoPriorAuthorizations %>" runat="server"></asp:Label>
                                        </div>
                                    </div>
                                    <!--</div>-->


                                </div>
                            </div>
                        </it:FlowContainerDetail>
                    </div>
                </it:FlowInnerContainer>
            </asp:Panel>
            <div class="clearBoth"></div>
            <it:FlowInnerContainer ID="FlowInnerContainer2" Title="<%$FrontEndResources:TRX00703,BulkOperationsAuthorized%>" CustomCssClass="bs-reduced bs-head-metro bs-reduced-transaction ch-header-container" runat="server" Visible="false">
                <div id="divGridBulk" runat="server" class="table-grid-border" style="border: 0px;">
                    <it:FlowContainerDetail ID="flwBulk" CssClass="panel panel-detail" runat="server">
                        <div class="col-lg-12" style="padding-left: 0px; padding-right: 0px;">
                            <div class="metro">


                                <!--<div class="col-max bs-reduced bs-head-metro bs-popup">-->

                                <it:GridViewControl ID="gvBulkOperations" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="relOperation-grid grid-no-arrow table table-resp-to1199"
                                    GridLines="None" AllowsTopAnchor="true" AllowPag="true" EnableRowClicks="false" RecordCounterComplementarText="<%$FrontEndResources:TRX00703,gridBlkComplementarText %>" OnRowDataBound="gvBulkOperations_RowDataBound">

                                    <Columns>
                                        <asp:TemplateField HeaderStyle-CssClass="center" HeaderText="" ItemStyle-Width="60" HeaderStyle-Width="60" ItemStyle-CssClass="imgBulk">
                                            <ItemTemplate>
                                                <asp:Image ID="imgUser" runat="server" CssClass="imgUserBulk" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00703,blkOperation%>" ItemStyle-CssClass="relOperation" ItemStyle-Width="200" HeaderStyle-Width="200">
                                            <ItemTemplate>
                                                <asp:Label ID="lblTransaction" runat="server" class="lblTransactionBulk blue relOperation-label" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title=""></asp:Label>
                                                <asp:Label ID="lblAccount" class="relOperation-label" runat="server" />
                                                <asp:Label ID="lblState" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00703,blkCreationDate%>" ItemStyle-Width="120" HeaderStyle-Width="100">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCreationDate" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$FrontEndResources:RelatedOperations,Title%>" HeaderStyle-CssClass="relOperation-desktop" ItemStyle-CssClass="relOperation-desktop" ItemStyle-Width="100" HeaderStyle-Width="100">
                                            <ItemTemplate>
                                                <asp:Label ID="lblRelationship" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00703,blkAmount%>" HeaderStyle-CssClass="relOperation-desktop" ItemStyle-CssClass="relOperation-desktop" ItemStyle-Width="100" HeaderStyle-Width="100">
                                            <ItemTemplate>
                                                <asp:Label ID="lblAmount" runat="server" />
                                                <asp:Label ID="lblCurrency" runat="server" Visible="false" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="right hidden-print" ItemStyle-CssClass="relOperation-link hidden-print" HeaderStyle-Width="60">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="lnkDetail" runat="server" ToolTip="<%$FrontEndResources:TRX00703,Detail%>">
                                                    <span class="relOperation-link__icon"></span>
                                                </asp:HyperLink>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </it:GridViewControl>

                            </div>
                        </div>
                    </it:FlowContainerDetail>
                </div>
                <div id="divErrorBulk" runat="server" style="display: none">
                    <div class="grayContainer alert alert-warning_v3 fade in col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max" style="padding: 5px 0px; top: 0px; left: 0px;" role="alert" aria-atomic="true">
                        <div class="modal-body-icon text-center" style="padding: 15px">
                            <i class="message-icon message-warning"></i>
                        </div>
                        <h4 class="alert-heading" style="padding-bottom: 10px">
                            <asp:Label Text="<%$FrontEndResources:RelatedOperations,ErrorDetail %>" runat="server"></asp:Label>
                        </h4>
                        <div style="clear: both;"></div>
                    </div>
                </div>
            </it:FlowInnerContainer>

        </asp:Panel>




        <div class="clearBoth"></div>

        <div class="proof-inner">
            <asp:PlaceHolder ID="phProofInner" runat="server"></asp:PlaceHolder>
        </div>

        <div class="inprint">
            <asp:Label ID="lblOperationID" runat="server"></asp:Label>
            <asp:Label ID="lblPrintDate" class="print-date" runat="server"></asp:Label>
        </div>

    </div>
    <div class="clearBoth"></div>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00703-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00703-1.0-theme.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00703-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>

</div>


