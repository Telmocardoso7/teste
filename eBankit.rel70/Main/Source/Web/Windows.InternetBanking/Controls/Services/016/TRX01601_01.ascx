<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01601_01.ascx.cs" Inherits="TRX01601_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div runat="server" class="col-xs-12 col-sm-10 col-md-10 col-lg-10 col-lg-8 col-max crumbsPS2" style="margin-top: 40px">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Panel ID="Panel1" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" runat="server">
    <ul runat="server" class="item col-sm-12 col-xs-12" style="display: inline-block;">
        <li id="TabImportFile" runat="server" class="select col-sm-6 col-xs-6">
            <asp:LinkButton ID="linkImport" runat="server" CssClass="LinkTxtColor" Text="<%$FrontEndResources:TRX01601,linkImport%>" OnClick="ClickImportFile"></asp:LinkButton>
        </li>
        <li id="TabManualUpload" runat="server" class="notselect col-sm-6 col-xs-6 tabBorders">
            <asp:LinkButton ID="linkManual" runat="server" CssClass="LinkTxtColor" Text="<%$FrontEndResources:TRX01601,linkManual%>" OnClick="ClickManualUpload"></asp:LinkButton>
        </li>
    </ul>
                </asp:Panel>

        </ContentTemplate>
    </asp:UpdatePanel>
</div>
<div class="clearBoth"></div>

<div id="divContent" runat="server" class="transaction-content">
    <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:Panel ID="pnControls" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" runat="server">
    <%-- UpLoadFile --%>
    <it:FlowInnerContainer ID="flwData1" Title="<%$FrontEndResources:TRX01601,TitleDataContainer%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
        <div runat="server" style="background-color: transparent;">
            <div class="panel-body row" style="padding-top: 0; padding-bottom: 0;">
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max lineContainer" style="padding-bottom: 20px;">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 content-body">
                        <section>
                            <div class="row" style="padding: 0 20px 20px 20px;">
                                <div id="divFileTypee" class="col-sm-12">
                                    <asp:Label ID="lblFileType" Text="<%$FrontEndResources:TRX01601,lblFileType%>" runat="server"></asp:Label>
                                </div>
                                <div id="divDownload" class="col-sm-12" style="padding-bottom: 10px;" runat="server">
                                    <asp:Label ID="lblDownloadSample" Text="<%$FrontEndResources:TRX01601,lblDownloadSample%>" ForeColor="Black" runat="server"></asp:Label>
                                </div>
                                <div id="divInfoFile" class="col-sm-12" runat="server">
                                    <asp:Label ID="lblInfoFile" Text="<%$FrontEndResources:TRX01601,lblInfoFile%>" ForeColor="Black" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="trx-container">
                                <div class="col-xs-12 no-padding">
                                    <div class="col-xs-12 col-sm-10">
                                        <it:TextBoxControl_v2 ID="txtUploadFile" Width="100%" Enabled="false" IsRequired="true" runat="server" Label="<%$FrontEndResources:TRX01601,PS2File%>" Watermark="<%$FrontEndResources:TRX01601,NoFileSelected%>" />
                                    </div>
                                    <div class="col-xs-12 col-sm-2" style="cursor: pointer; margin-top: 5px; padding-left: 0 !important">
                                        <asp:Label ID="btnSelectFile" Text="<%$FrontEndResources:TRX01601,btnSelectFile%>" Style="cursor: pointer;" AssociatedControlID="ucAttachUploader" runat="server">
                                        </asp:Label>
                                    </div>
                                    <div style="display: none">
                                        <asp:FileUpload ID="ucAttachUploader" runat="server" CssClass="rpt-btnimg-add" ClientIDMode="Predictable" />
                                        <asp:HiddenField ID="hiddenField" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </section>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearBoth"></div>
    </it:FlowInnerContainer>
    <%-- Manual --%>
    <asp:UpdatePanel ID="updContent" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div id="divGroupPaymentsList" runat="server" visible="false">
                <div id="divPaymentsListTitle" runat="server" style="padding-top: 40px;" class="col-xs-12 col-sm-10 col-md-10 col-lg-10 col-lg-8 col-max">
                    <div id="divPaymentTitle" runat="server" style="float: left;">
                        <asp:Label ID="lblTitleManual" CssClass="LinkTxtColor" Text="<%$FrontEndResources:TRX01601,TitleContainerManual%>" runat="server" />
                    </div>
                    <div id="divAddPaymentLink" runat="server" style="float: right; cursor: pointer;">
                        <asp:Label ID="lkbAddPaymentClick" runat="server" CssClass="LinkTxtColor" Text="<%$FrontEndResources:TRX01601,AddPayment%>">
                        </asp:Label>
                        <img id="imgUser" alt="" src="<%$ebFile:~/content/Themes/ebankIT/images/icon/plus.png %>" style="vertical-align: text-top; width: 15px; height: 15px;" runat="server" />
                    </div>
                </div>
                <div class="clearBoth"></div>
                <hr style="margin-top: 0 !important;" />
                <div id="divPaymentsListContent" runat="server" style="padding-top: 20px;" class="col-xs-12 col-sm-10 col-md-10 col-lg-10 col-lg-8 col-max">
                    <div runat="server" style="padding-bottom: 20px;">
                        <asp:Label Style="display: block;" CssClass="LinkTxtColorOrange" Text="<%$FrontEndResources:TRX01601,TitleEmptyList%>" runat="server" />
                        <asp:Label Style="display: block;" CssClass="LinkTxtColor" Text="<%$FrontEndResources:TRX01601,TitleAddPayment%>" runat="server" />
                    </div>
                </div>
                <div id="scrollContainer" class="scrollContainerAccounts" runat="server" visible="false">
                    <div id="scroolContentOperations" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts overflowHidden">
                        <div class="col-sm-4 col-xs-5" style="background-color: white; height: 100px; padding: 20px;">
                            <asp:Label Style="display: block; color: #009999; font-weight: bold;" Text="<%$FrontEndResources:TRX01601,NumberOperations%>" runat="server" />
                            <asp:Label ID="NumberOperations" Style="display: block;" CssClass="LinkTxtColor" Text="1" runat="server" />
                        </div>
                        <div class="col-sm-8 col-xs-7" style="background-color: white; height: 100px; border-left: #eeeeee solid 10px; padding: 20px;">
                            <asp:Label Style="display: block; color: #009999; font-weight: bold;" Text="<%$FrontEndResources:TRX01601,TotalAmount%>" runat="server" />
                            <asp:Label ID="TotalAmount" Style="color: #3AA835; font-weight: bold;" runat="server" Text="250.00" />
                            <asp:Label runat="server" Text="EUR" CssClass="LinkTxtColor" />
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                    <div class="table-grid-border">
                        <it:FlowContainerDetail ID="flwData" CssClass="panel panel-detail" runat="server">
                            <div class="col-lg-12 clearPadding overflowHidden">
                                <div class="metro">
                                    <div id="gridContainer" runat="server">
                                        <it:GridViewControl ID="gridManualPayments" runat="server" OnRowDataBound="gridManualPaymentsRowDataBound" AutoGenerateColumns="false" CssClass="table hovered noarrow pointedRow" IsResponsive="true" AllowPag="false"
                                            GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false">
                                            <Columns>
                                                <asp:TemplateField HeaderStyle-Width="12%" HeaderText="<%$FrontEndResources:TRX01601,OperationNr%>" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important">
                                                    <ItemTemplate>
                                                        <asp:Label ID="labelPaymentNumber" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField HeaderStyle-Width="10%" DataField="ContactSessionId" HeaderText="<%$FrontEndResources:TRX01601,Type%>" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important" />
                                                <asp:BoundField HeaderStyle-Width="18%" DataField="BeneficiaryName" HeaderText="<%$FrontEndResources:TRX01601,BeneficaryName%>" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important" />
                                                <asp:BoundField HeaderStyle-Width="26%" DataField="IBAN" HeaderText="<%$FrontEndResources:TRX01601,BeneficaryIban%>" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important" />
                                                <asp:BoundField HeaderStyle-Width="15%" DataField="Amount" HeaderText="<%$FrontEndResources:TRX01601,Amount%>" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important" />
                                                <asp:BoundField HeaderStyle-Width="10%" DataField="Description" HeaderText="<%$FrontEndResources:TRX01601,Reference%>" HeaderStyle-CssClass="padding8Important" ItemStyle-CssClass="padding8Important" />
                                                <asp:TemplateField HeaderStyle-CssClass="right" ItemStyle-CssClass="padding8Important" HeaderStyle-Width="5%" ItemStyle-Width="5%">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lDeletePayment" runat="server" OnClick="btnDelete_Click">
                                                            <asp:Image ID="imgDeletePayment" ImageUrl="<%$ebFile:~/Content/currenttheme/images/icon/ico_delete_small.png%>" runat="server" />
                                                        </asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </it:GridViewControl>
                                    </div>
                                </div>
                            </div>
                            <asp:Button ID="btnSort" CssClass="hidden" runat="server" />
                        </it:FlowContainerDetail>
                    </div>
                </div>
                <hr />
                <div style="clear: both;"></div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>

    <asp:Button ID="btnUploadFileValidate" CssClass="hidden" runat="server" />
    <asp:HiddenField ID="hdnFileOpen" ClientIDMode="Static" Value="0" runat="server" />
    <asp:HiddenField ID="hdnTableOpen" ClientIDMode="Static" Value="0" runat="server" />
    <asp:HiddenField ID="hdnGridWithData" ClientIDMode="Static" Value="0" runat="server" />

    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01601-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01601-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>

