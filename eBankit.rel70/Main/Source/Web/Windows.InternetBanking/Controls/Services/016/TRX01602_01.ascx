<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01602_01.ascx.cs" Inherits="TRX01602_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <div class="panel panel-detail">
        <div id="divSearchCriteria" runat="server">
            <div class="metro" style="margin-left: 0;">
                <div class="panel" data-role="panel" id="divFilter" style="border: none; margin-bottom: 0; background-color: rgb(247, 246, 246);">
                    <div class="listHeader">
                        <div class="col-lg-8 col-max panel-header panel-header-3" onclick="$('.panel-search').slideToggle();">
                            <asp:Literal ID="litSearchInfo" Text="<%$FrontEndResources:TRX01602,SearchInfo %>" runat="server"></asp:Literal>
                            <div class="img-search-panel">
                                <img src="<%$ebFile:~/Content/currenttheme/images/products/ico_search_transactions.png%>" style="margin-top: -12px;" runat="server" alt="search" />
                            </div>
                        </div>
                        <div class="clearBoth"></div>
                    </div>
                    <div class="col-lg-8 col-max panel-content panel-search" style="background-color: rgb(247, 246, 246);">
                        <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                            <it:DatePickerTextBoxRangeMetroControl_v3 ID="dpFromTo" Label="<%$FrontEndResources:DATALIST,From%>" LabelTo="<%$FrontEndResources:DATALIST,To%>" runat="server" ValidationRequiredMessage="<%$FrontEndResources:DATALIST,RequiredDateMessage%>" CssClass="field field_v2 field-full metro" />
                        </div>
                        <div class="clearBoth"></div>
                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                            <asp:Button ID="btnSearch" CssClass="btn btn-primary btn-margin btn-search-filter" OnClick="btnSearch_Click" OnClientClick="return FilterSearch();" runat="server" Text="<%$FrontEndResources:TRX00901,btnSearch%>" />
                        </div>
                        <div class="clearBoth"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="metro table-grid-border col-lg-8 col-max">
        <div class="table-grid table-responsive table hovered inside-table table-resp-to1199 table-movements">
            <asp:Repeater ID="rptAllFiles" runat="server" OnItemDataBound="rptAllFiles_ItemDataBound">
                <HeaderTemplate>
                    <table class="table hovered inside-table table-resp-to1199">
                        <tbody>
                            <tr class="table-header">
                                <th>
                                    <asp:Literal Text="<%$FrontEndResources:TRX01602,FileDate%>" ID="lblDescOperator" runat="server" />
                                </th>
                                <th>
                                    <asp:Literal Text="<%$FrontEndResources:TRX01602,FileName%>" ID="lblActivationDate" runat="server" />
                                </th>
                                <th>
                                    <asp:Literal Text="<%$FrontEndResources:TRX01602,FileMoney%>" ID="lblActivationTime" runat="server" />
                                </th>
                                <th>
                                    <asp:Literal Text="<%$FrontEndResources:TRX01602,Currency%>" ID="lblCurrency" runat="server" />
                                </th>
                                <th>
                                    <asp:Literal Text="<%$FrontEndResources:TRX01602,FileState%>" ID="lblStatusDate" runat="server" />
                                </th>
                                <th></th>
                                <th></th>
                            </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Literal ID="valFileDate" runat="server" />
                        </td>
                        <td>
                            <asp:Literal ID="valFileName" runat="server" />
                        </td>
                        <td>
                            <asp:Literal ID="valFileMoney" runat="server" />
                        </td>
                        <td>
                            <asp:Literal ID="valCurrency" runat="server" />
                        </td>
                        <td>
                            <asp:Literal ID="valFileState" runat="server" />
                        </td>
                        <td>
                            <asp:Image ID="imgPDF" ImageUrl="<%$ebFile:~/Content/currenttheme/images/products/ico_export_pdf.png%>" CssClass="img-table img-circlev2 cursorPointer" style="width: 30px;" runat="server" />
                        </td>
                        <td>
                            <asp:LinkButton href="javascript:void(0);" ID="btnDetails" CssClass="magnifierGlassListing smallIcon" Style="height: 40px; display: block; background-position: center center; background-size: 30px !important;" runat="server"></asp:LinkButton>
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
				    </table>
                </FooterTemplate>
            </asp:Repeater>
            <iframe id="iframeControlProof" name="iframeControlProof" src="/ProofPage.aspx" height="0" width="0" style="border: 0px;"></iframe>
        </div>
    </div>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01602-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>

<script type="text/javascript">
    FilterSearch = function () {
        return $("#aspnetForm").valid();
    };
</script>

