<%@ Page Language="C#" MasterPageFile="~/Masters/Transaction.Master" AutoEventWireup="true" CodeBehind="ExportData.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Controls.ExportData.ExportData" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TransactionFeaturedContent" runat="server">

    <section class="featured col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max noPadding">
        <div class="bs-reduced metro">
            <div class="fullWidth spacer10"></div>
            <hgroup class="title">
                <h3 class="head head-top">
                    <asp:Literal ID="lbPageTitle" Text="<%$FrontEndResources:ExportData,ExportDataTitle%>" runat="server"></asp:Literal>
                </h3>
            </hgroup>
            <div class="clearBoth"></div>
        </div>
    </section>
    <br />
      <div class="custom-accounts-panel">
            <div class="headerContainer">
                <div class="metro info-bottom-text col-lg-8 col-max heavyMargin">
                    <span id="MainContent_TransactionMainContent_lbAccountSubtitle" class="infoTopMessage">
                        <asp:Literal ID="litContractSummary" Text="<%$FrontEndResources:ExportData,ExportDataDescription%>" runat="server"></asp:Literal>
                    </span>
                </div>
            </div>
        </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="TransactionMainContent" runat="server">

    <%@ Import Namespace="eBankit.Common.InternetBanking" %>

    <div id="divContent" runat="server" class="transaction-content">
        <asp:UpdatePanel ID="updContent" runat="server" UpdateMode="Always">
            <ContentTemplate>

                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">

                    <div runat="server" id="divContentNoData" class="col-max bs-reduced bs-head-metro bs-reduced-transaction">
                        <div class="contentExportNoData">
                            <img id="imgWarningExportedData" alt="" class="img-circle imgWarningExportedData" runat="server" />
                            <br />
                            <div class="noDataMessages" style="margin-top: 40px; padding-bottom: 10px; margin-bottom: 10px;">
                                <p style="color: #555555;font-weight: 600;"><asp:Literal ID="Literal1" Text="<%$FrontEndResources:ExportData,ExportNoDataTitle%>" runat="server"></asp:Literal></p>
                                <p style="color: #555555;font-weight: normal;"><asp:Literal ID="Literal2" Text="<%$FrontEndResources:ExportData,ExportNoDataDescription%>" runat="server"></asp:Literal></p>
                            </div>
     
                            <a runat="server" ID="btnExport" class="btn btn-primary">
                                <asp:Literal runat="server" ID="Literal3" Text="<%$FrontEndResources:ExportData,ExportDataTitle%>"></asp:Literal>
                            </a>

                        </div>
                    </div>
                

                    <div runat="server" id="divContentData" class="col-max bs-reduced bs-head-metro bs-reduced-transaction">

                          <it:GridViewControl ID="gvFilesData" runat="server" AllowCustomPaging="false" AutoGenerateColumns="false" 
                                                 IsResponsive="true" CssClass="table hovered table-resp-to1199 inside-table" 
                                                    GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="gvFilesData_RowDataBound">
                                <Columns>
                                    <asp:TemplateField  HeaderStyle-CssClass="formatTableData padding8Important visible-md visible-lg visible-sm" 
                                                        HeaderText="<%$FrontEndResources:ExportData,Date%>">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDate" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                                
                                        <asp:TemplateField  HeaderStyle-CssClass="formatTableData padding8Important visible-md visible-lg visible-sm" 
                                                        HeaderText="<%$FrontEndResources:ExportData,Description%>">
                                        <ItemTemplate>
                                            <asp:Label ID="lblDescription" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField  HeaderStyle-CssClass="formatTableData padding8Important visible-md visible-lg visible-sm" 
                                                        HeaderText="<%$FrontEndResources:ExportData,FileType%>">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFileType" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField  HeaderStyle-CssClass="formatTableData padding8Important visible-md visible-lg visible-sm" 
                                                        HeaderText="<%$FrontEndResources:ExportData,FileSize%>">
                                        <ItemTemplate>
                                            <asp:Label ID="lblFileSize" runat="server" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                        <asp:TemplateField  HeaderStyle-CssClass="formatTableData padding8Important visible-md visible-lg visible-sm alignTextCenter" 
                                                        HeaderText="<%$FrontEndResources:ExportData,download%>">
                                        <ItemTemplate>
                                            <img runat="server" ID="btnDownload" class="btnDownload" target-id="" src="/Content/Themes/ebankIT/images/icon/action/action_download.png" />
                                            <%--<asp:Button runat="server" ID="btnDownloadFile" Visible="true" Text="DOWNLOAD DO XPTO" OnClick="btnDownloadFile_Click" />--%>
                                            <asp:HiddenField runat="server" Id="hdnDownloadId" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>
                        </it:GridViewControl>
                        <div style="float:right;">
                            <a runat="server" ID="btnExportDataBottom" class="btn btn-primary">
                                <asp:Literal runat="server" ID="Literal4" Text="<%$FrontEndResources:ExportData,ExportDataTitle%>"></asp:Literal>
                            </a>
                        </div>
                    </div>
            </div>
            </ContentTemplate>
        </asp:UpdatePanel>


        <asp:UpdatePanel runat="server">
            <ContentTemplate>
            
                

            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <iframe id="iframeControlProof" name="iframeControlProof" src="/ProofPage.aspx" height="0" width="0" style="border: 0px;" role="presentation"></iframe>
    
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("/Scripts/Services/ExportData/ExportData-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>

</asp:Content>