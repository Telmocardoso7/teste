<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00149_01.ascx.cs" Inherits="TRX00149_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <div class="panel panel-detail">
        <div>
            <div id="divSearchCriteria" runat="server">
                <div class="metro noMargin">
                    <div class="panel" data-role="panel" id="divFilter">
                        <div class="listHeader">
                            <div class="col-lg-8 col-max panel-header panel-header-3" id="pnSearchHeader" onclick="$('.panel-search').slideToggle();">
                                <asp:Literal ID="litSearchInfo" Text="<%$FrontEndResources:DATALIST,SearchInfo %>" runat="server"></asp:Literal>
                                <div class="searchIconContainer">
                                    <img id="Img1" src="<%$ebFile:~/content/currenttheme/images/products/ico_search_transactions.png%>" runat="server" alt="search"/>
                                </div>

                            </div>
                        </div>
                        <div class="col-lg-8 col-max panel-content panel-search" id="radioFilterContainer">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                <it:DropDownListControl_v2 ID="ddlClients" Label="<%$FrontEndResources:TRX00149,Clients%>" CssClass="field field_v2 field-full" runat="server" />
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 radioContainer">
                                <it:FormRadioList_v3 ID="frlSortType" runat="server" CssClass="big-radioButton" LabelText="<%$FrontEndResources:TRX00149,SortType %>" RepeatDirection="Horizontal" HideLabel="false" />
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                <it:NumberTextBoxControl_v2 ID="txtAccountNumber" Visible="false" IsNumber="true" Label="<%$FrontEndResources:TRX00149,txtAccountNumber%>" runat="server" />
                            </div>

                            <div class="clearBoth"></div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                                <asp:Button ID="btnSearch" CssClass="btn btn-primary btn-margin searchBtn" Text="<%$FrontEndResources:TRX00701,btnSearch %>" runat="server" OnClick="btnSearch_Click" />
                            </div>
                            <div class="clearBoth"></div>
                        </div>
                    </div>
                </div>
                <div class="clearBoth"></div>
            </div>
            <div class="col-lg-8 col-max clearPadding">
                <asp:UpdatePanel runat="server" ID="updatePanelOperations">
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="btnSearch" />
                    </Triggers>
                    <ContentTemplate>
                        <div class="table-grid-border">
                            <it:FlowContainerDetail ID="flwData" CssClass="panel panel-detail borderOperations" runat="server">
                                <div class="col-lg-12 clearPadding overflowHidden">
                                    <div class="metro">

                                        <it:GridViewControl ID="gvSalariesAgenda" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table table-resp-to1199 inside-table noarrow" EmptyDataText="<%$FrontEndResources:DATALIST,NoOperationsInfo%>"
                                            GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" RecordCounterComplementarText="<%$FrontEndResources:TRX00701,gridDataecordCounterComplementarText %>" OnRowDataBound="gvOperations_RowDataBound">
                                            <Columns>
                                                <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00149,lblMaturityDate%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblMaturityDate" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00149,lblDescription%>" ItemStyle-CssClass="descricao-xs">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblDescription" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00149,lblItemReference%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblItemReference" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00149,lblAccountNumber%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAccountNumber" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00149,lblAmount%>" HeaderStyle-CssClass="right" ItemStyle-CssClass="right">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblAmount" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00149,lblCurrency%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblCurrency" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00149,lblItem%>" ItemStyle-CssClass="visible-md visible-lg visible-sm">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblItem" runat="server" CssClass="visible-md visible-lg visible-sm" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </it:GridViewControl>

                                    </div>
                                </div>
                                <asp:Button ID="btnSort" CssClass="hidden" runat="server" />
                                <asp:HiddenField ID="hdnSortExpression" runat="server" />
                            </it:FlowContainerDetail>
                        </div>
                        <div class="proof-inner">
                            <asp:PlaceHolder ID="phProofInner" Visible="false" runat="server"></asp:PlaceHolder>
                        </div>

                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <iframe id="iframeControlProof" src="/ProofPage.aspx" height="0" width="0" style="border: 0px;"></iframe>
        </div>
    </div>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00149-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>

<script type="text/javascript">
    $(document).ready(function () {
        var hPanel = $(".panel-content");
        if (hPanel) {
            hPanel.hide();
        }

        // Search validation
        jQuery.validator.setDefaults({
            focusInvalid: false,
            onfocusout: false
        });
    });

</script>
