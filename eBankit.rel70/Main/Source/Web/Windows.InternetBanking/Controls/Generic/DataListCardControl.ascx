<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DataListCardControl.ascx.cs" Inherits="DataListCardControl" %>

<%--<h5 id="title" class="single-head" runat="server">
    <asp:Literal Text="<%$FrontEndResources:DATALIST,Statements%>" runat="server"></asp:Literal></h5>--%>
<%--<div id="container" style="padding: 10px; border: solid 1px #eaeaea;" runat="server">--%>
<asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
        <div id="divDataList" runat="server">
            <div class="transaction-content" style="margin-bottom: 10px">
                <it:FlowContainerDetail ID="flwSearch" CssClass="panel panel-detail" runat="server">
                    <div id="divSearchCriteria" runat="server">
                        <div class="metro" style="margin-left: 0px;">
                            <div class="panel" data-role="panel" id="divTesteaver" style="border: none; margin-bottom: 0px;">
                                <div class="listHeader">
                                    <div class="col-lg-8 col-max panel-header panel-header-3" id="pnSearchHeader">
                                        <asp:Literal ID="litSearchInfo" Text="<%$FrontEndResources:DATALIST,SearchInfoCards %>" runat="server"></asp:Literal>

                                        <div class="img-search-panel">
                                            <img id="Img1" src="<%$ebFile:~/content/currenttheme/images/products/ico_search_transactions.png%>" onclick="$('.panel-search').slideToggle();" style="margin-top: -12px;"
                                                runat="server" alt="search"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-lg-8 col-max panel-content panel-search" style="background-color: rgb(247, 246, 246);">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-10">
                                        <it:DatePickerTextBoxRangeMetroControl_v3 ID="dpFromTo" Label="<%$FrontEndResources:DATALIST,From%>" LabelTo="<%$FrontEndResources:DATALIST,To%>" runat="server" CssClass="field field_v2 metro" />
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-2">
                                        <asp:Button ID="btnSearch" CssClass="btn btn-primary btn-margin btn-search-datalist" Text="<%$FrontEndResources:TRX00701,btnSearch %>" runat="server" />
                                    </div>
                                    <div class="clearBoth"></div>
                                </div>
                            </div>
                        </div>
                        <div class="clearBoth"></div>
                    </div>
                    <div class="table-grid-border col-lg-8 col-max">
                        <div id="slider"></div>
                        <asp:HiddenField ID="hdnActualPageId" Value="0" runat="server" />
                        <div class="col-lg-12 clearPadding">
                            <asp:HiddenField ID="hdnProof" runat="server" />
                            <asp:Button ID="btnSort" CssClass="hidden" runat="server" />
                            <div class="metro">
                                <it:GridViewControl ID="gridData" runat="server" AutoGenerateColumns="false" CssClass="table hovered inside-table" IsResponsive="true"
                                    GridLines="None" AllowsTopAnchor="true" EmptyDataText="<%$FrontEndResources:DATALIST,NoMovementsInfo%>" EnableRowClicks="false" RecordCounterComplementarText="<%$FrontEndResources:DATALIST,gridDataecordCounterComplementarText %>">
                                    <Columns>
                                    </Columns>
                                </it:GridViewControl>
                            </div>
                        </div>
                        <div class="clearBoth"></div>
                    </div>
                </it:FlowContainerDetail>
                <div id="proofContainer" class="proof-container" runat="server">
                    <div class="proof-inner">
                        <asp:PlaceHolder ID="phProofInner" runat="server"></asp:PlaceHolder>
                    </div>
                </div>
                <div class="clearBoth"></div>
                <asp:Button ID="btnLoadList" CssClass="hidden" runat="server" />
            </div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/Services/Transactions/DataListCardControl.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>

