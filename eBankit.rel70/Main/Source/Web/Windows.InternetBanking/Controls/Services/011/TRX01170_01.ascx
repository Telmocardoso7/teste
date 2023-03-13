<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01170_01.ascx.cs" Inherits="TRX01170_01" %>

<%@ Import Namespace="eBankit.Business.Entities.InternetBanking._011" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<br />
<div id="divContent" runat="server" class="transaction-content">

    <asp:UpdatePanel ID="updContent" runat="server" UpdateMode="Always">
        <ContentTemplate>

            <it:FlowInnerContainer ID="flwData0" Title="<%$FrontEndResources:TRX01170,ExportDataFormatTitle %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <p class="infoAudit">
                    <asp:Label runat="server" Text="<%$FrontEndResources:TRX01170,InfoExportData%>" />
                </p>
                <br />

                <div class="audit-header-container audit-header-filetype-body">
                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                        <div class="audit-header-body row">
                            <div class=" ">
                                <it:FormRadioList_v3 ID="rbExportPDF" runat="server" ValidationGroup="FileTypeGroup" CssClass="big-radioButton" HideLabel="false" Visible="true" />
                            </div>
                        </div>
                    </div>
                </div>
                  
                <div class="audit-header-container audit-header-filetype-body">
                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                        <div class="audit-header-body row">
                                <div class=" ">
                                <it:FormRadioList_v3 ID="rbExportXML" runat="server" ValidationGroup="FileTypeGroup" CssClass="big-radioButton" HideLabel="false" Visible="true" />
                            </div>                
                        </div>
                    </div>
                </div>


                <asp:HiddenField runat="server" ID="hdnFileType" />

                <asp:Label ID="lblErrorChooseTypeMessage" CssClass="lblErrorChooseTypeMessage messageHidden" runat="server" ForeColor=" #d24627" Text="<%$FrontEndResources:TRX01170,ChooseTypeMessageError %>"></asp:Label>

            </it:FlowInnerContainer>

            <div class="flwData1Wrapper">
                <it:FlowInnerContainer ID="flwData1" CssClass="flwData1Class" Title="<%$FrontEndResources:TRX01170,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                    <div style="display:none;"></div>
                    <div class="dataTypeWrapper">
                        <div class="audit-header-container audit-table-header">
                            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                                <div class="audit-header-body row">
                                    <div class="col-md-9 col-sm-9 col-xs-9 ">
                                        <div class="cbcontainer ">
                                            <asp:CheckBox ID="cbAuditData" runat="server" />
                                            <div class="checkmark all"></div>
                                        </div>
                                        <asp:Label runat="server" Text="<%$FrontEndResources:TRX01170,SelectAllTransactions %>" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="audit-repeater">
                        <asp:Repeater runat="server" ID="rpAuditDataType" OnItemDataBound="rpAuditDataType_OnItemDataBound">
                            <ItemTemplate>
                                <asp:Panel ID="divAuditItemRow" CssClass="audit-item-body row " runat="server">
                                    <div class="col-md-2 col-sm-2 col-xs-3 wrapperCbContainer">
                                        <div class="cbcontainer ">
                                            <asp:HiddenField ID="HiddenField2" runat="server" Value='<%# (int)(((AuditDataType) Container.DataItem).AuditData) %>' />
                                            <asp:CheckBox ID="cbAuditData" runat="server" />
                                            <div class="checkmark single"></div>
                                        </div>
                                    </div>
                                    <div id="transactionIcon" runat="server" class="audit-info-icon">
                                        <img runat="server" id="imgIcon" />
                                    </div>
                                    <div class="col-md-3 col-sm-10 col-xs-9 text-truncate audit-content-row-text">
                                        <p class="key">
                                            <asp:Label AssociatedControlID="cbAuditData" runat="server" Text="<%# ((AuditDataType) Container.DataItem).Description %>" />
                                        </p>
                                    </div>
                                </asp:Panel>
                                <hr class="line90" />
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    </div>
                    <asp:Label ID="Label1" CssClass="lblErrorChooseContentMessage messageHidden" runat="server" ForeColor="#d24627" Text="<%$FrontEndResources:TRX01170,ChooseContentMessageError %>"></asp:Label>

                </it:FlowInnerContainer>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">
        var hdnExportDataFileTypeID = '<%= hdnFileType.ClientID %>';
    </script>

    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/Services/Transactions/TRX01170-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01170-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>

<style>
    .boxError{
        border: 1px solid #d24627!important;
    }

    .dataTypeWrapper{
        border:none;
    }

    .messageHidden{
        display:none;
    }

</style>
