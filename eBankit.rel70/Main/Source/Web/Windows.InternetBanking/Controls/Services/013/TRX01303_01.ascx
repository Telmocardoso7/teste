<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01303_01.ascx.cs" Inherits="TRX01303_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div class="transaction-content accountDetail marginBottom10">
    <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Panel ID="pnControls" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" runat="server">
                <div class="grayContainer">
                    <it:FlowInnerContainer ID="flwPendOper" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 break-none" style="min-height: 77px;">
                            <p class="accounts-panel-p">
                                <asp:Literal ID="litOper" Text="<%$FrontEndResources:TRX01302,litOper%>" runat="server"></asp:Literal>
                            </p>
                            <h3 class="favorit-center accounts-panel-h" id="hCCOperValue" style="margin-bottom: 0px; padding-bottom: 10px;" runat="server">
                                <asp:Literal ID="lblOperValue" runat="server"></asp:Literal>
                            </h3>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 break-xs" style="min-height: 77px;">
                            <p class="accounts-panel-p">
                                <asp:Literal ID="litChannel" Text="<%$FrontEndResources:TRX01302,litChannel%>" runat="server"></asp:Literal>
                            </p>
                            <h3 class="favorit-center accounts-panel-h" id="hCCChannelValue" runat="server">
                                <asp:Literal ID="lblChannelValue" runat="server"></asp:Literal>
                            </h3>
                        </div>
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 break-md" style="min-height: 77px;">
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
                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 break-xs" style="min-height: 77px;">
                            <p class="accounts-panel-p">
                                <asp:Literal ID="litOperationState" Text="<%$FrontEndResources:TRX01302,OperationState%>" runat="server"></asp:Literal>
                            </p>
                            <h3 class="favorit-center accounts-panel-h operations-status" id="operationState" runat="server">
                                <asp:Literal ID="lblOperationState" runat="server"></asp:Literal>
                            </h3>
                            <h3 class="favorit-center accounts-panel-h" id="userCancel" runat="server">
                                <asp:Literal ID="lblUserCancel" runat="server"></asp:Literal>
                            </h3>
                        </div>
                        <div style="clear: both;"></div>
                    </it:FlowInnerContainer>
                </div>
                <it:FlowInnerContainer ID="flwAuthorizationType" Title="<%$FrontEndResources:TRX01303,AuthorizationTypeTitle %>" CustomCssClass="bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                    <div style="clear: both;">
                        <it:FlowLabel_v2 ID="lblAuthorizationType" IsRequired="false" MaxLength="0" MinLength="0" Label="<%$FrontEndResources:TRX01303,lblAuthorizationType%>" runat="server" />
                    </div>
                </it:FlowInnerContainer>
                <it:FlowInnerContainer ID="flwPriorAuthorizations" Title="<%$FrontEndResources:TRX01303,PriorAuthorizationsTitle%>" CustomCssClass="bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                    <div class="table-grid-border">
                        <it:FlowContainerDetail ID="flwData" CssClass="panel panel-detail" runat="server">
                            <div class="col-lg-12" style="padding-left: 0px; padding-right: 0px;">
                                <div class="metro">
                                    <it:GridViewControl ID="gvPriorAuthorizations" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="grid-no-arrow table table-resp-to1199"
                                        GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" RecordCounterComplementarText="<%$FrontEndResources:TRX00701,gridDataecordCounterComplementarText %>" OnRowDataBound="gvPriorAuthorizations_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField HeaderStyle-CssClass="center" HeaderText="" ItemStyle-Width="40px">
                                                <ItemTemplate>
                                                    <asp:Image ID="imgUser" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="<%$GenericFrontEndResources:User%>" ItemStyle-Width="120">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAuthorizerUser" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="<%$GenericFrontEndResources:Name%>" HeaderStyle-CssClass="table-description" ItemStyle-Width="220">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblAuthorizerName" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="<%$GenericFrontEndResources:SignatureType%>" ItemStyle-Width="220">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblSignatureType" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="<%$FrontEndResources:PreviousAuth,Date%>" HeaderStyle-Width="220">
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

                        <div id="divNoPriorAuthorizations" class="metro" visible="false" runat="server">
                            <div class="warn" style="text-align: center;">
                                <asp:Label ID="lblNoPriorAuthorizations" Text="<%$FrontEndResources:TRX01303,NoPriorAuthorizations %>" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                </it:FlowInnerContainer>
                <div class="trs_buttons col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro transp">
                    <a id="btnCancelToPenOperDetail" class="btn btn-default" runat="server">
                        <span>&nbsp;</span>
                        <asp:Literal Text="<%$FrontEndResources:TRX01303,backToAuthorize%>" runat="server"></asp:Literal>
                    </a>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="clearBoth"></div>
</div>
