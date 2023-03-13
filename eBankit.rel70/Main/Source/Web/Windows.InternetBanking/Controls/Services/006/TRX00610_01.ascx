<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00610_01.ascx.cs" Inherits="TRX00610_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server">
    <script type="text/javascript">
        function confirmDelete(currentMessage) {
            top.confirmDeleteHandler = function () {
                eval(currentMessage.href);
            }
            itcore_ui.ShowTopPopupConfirm("<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX00610", "PopupConfirmation").Replace("\"","&quot;") %>", '<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX00610", "TitleConfirm") %>', 'top.confirmDeleteHandler();');
        }
    </script>
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
        <div class="transaction-content" id="trxMatrixCard">
            <asp:UpdatePanel runat="server" ID="updatePanelOperations">
                <ContentTemplate>
                    <div class="table-grid-border">
                        <it:FlowContainerDetail ID="flwData" CssClass="panel panel-detail" runat="server">
                            <div class="col-lg-12 clearPadding overflowHidden">
                                <div class="metro">
                                    <div id="gridContainer" runat="server">
                                        <it:ExtendedGridView ID="gridCodes" runat="server" AutoGenerateColumns="false" CssClass="table hovered nowrap table-fixed" IsResponsive="true"
                                            GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" AllowSorting="false" OnRowDataBound="GridCodesRowDataBound" OnRowCommand="GridCodesRowCommand">
                                            <Columns>
                                                <asp:BoundField HeaderStyle-Width="25%" DataField="AccessCodeTypeDescription" HeaderText="<%$FrontEndResources:TRX00610,Type%>" />
                                                <asp:BoundField HeaderStyle-Width="25%" DataField="AccessCodeStatusDescription" HeaderText="<%$FrontEndResources:TRX00610,Status%>" />
                                                <asp:BoundField HeaderStyle-Width="25%" DataField="UpdateDate" HeaderText="<%$FrontEndResources:TRX00610,UpdateDate%>" />
                                                <asp:TemplateField HeaderStyle-CssClass="right" ItemStyle-CssClass="padding8Important" HeaderStyle-Width="5%" ItemStyle-Width="5%">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lkbCancelCredential" runat="server" OnClientClick="if(!confirmDelete(this)) return false;" CommandName="CancelCredential" CommandArgument='<%# Eval("UserAccessCodeId") %>' >
                                                            <p>
                                                                <asp:Image ID="imgCancelCredential" ImageUrl="<%$ebFile:~/Content/currenttheme/images/icon/ico_delete_small.png%>" runat="server" />
                                                                <%--<asp:Label ID="Label1" runat="server" Text="<%$FrontEndResources:TRX00610,Cancel%>" />--%>
                                                            </p>
                                                        </asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="right" ItemStyle-CssClass="padding8Important" HeaderStyle-Width="5%" ItemStyle-Width="5%">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lkbLockCredential" runat="server" Visible="false" CommandName="LockCredential" CommandArgument='<%#  Eval("UserAccessCodeId") %>'>
                                                            <p>
                                                                <asp:Image ID="imgLockCredential" ImageUrl="<%$ebFile:~/Content/currenttheme/images/icon/lock.png%>" runat="server" />
                                                                <%--<asp:Label ID="Label2" runat="server" Text="<%$FrontEndResources:TRX00610,Lock%>" />--%>
                                                            </p>
                                                        </asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="right" ItemStyle-CssClass="padding8Important" HeaderStyle-Width="5%" ItemStyle-Width="5%">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="lkbUnLockCredential" runat="server" Visible="false" CommandName="UnLockCredential" CommandArgument='<%#  Eval("UserAccessCodeId") %>'>
                                                            <p>
                                                                <asp:Image ID="imgUnlockCredential" ImageUrl="<%$ebFile:~/Content/currenttheme/images/icon/unlock.png%>" runat="server" />
                                                                <%--<asp:Label ID="Label3" runat="server" Text="<%$FrontEndResources:TRX00610,Unlock%>" />--%>
                                                            </p>
                                                        </asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <EmptyDataTemplate>
                                                <asp:Literal ID="Literal1" runat="server" Text="<%$FrontEndResources:TRX00610,EmptyGrid%>"></asp:Literal>
                                            </EmptyDataTemplate>
                                        </it:ExtendedGridView>
                                    </div>
                                </div>
                            </div>
                            <asp:Button ID="btnSort" CssClass="hidden" runat="server" />
                        </it:FlowContainerDetail>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <div class="clearBoth paddingTop20 paddingBottom20"></div>
    <div id="ImgPanel" class="fullWidth noFloatOfHidden landingAccountContainer clearPadding paddingTop20 paddingBottom20">
        <div class="info-bottom-text col-lg-8 col-max">
            <asp:Label ID="lblWarning" Text="<%$FrontEndResources:TRX00610,Warning%>" runat="server"></asp:Label>
        </div>
    </div>
    <div class="clearBoth"></div>
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max noPadding" id="divSave" runat="server">
        <it:FlowCommandsContainer ID="fcSaveImage" runat="server">
            <RightButtons>
                <a id="btnRequestNew" class="btn btn-primary" style="margin-top: 55px; height: 40px; font-size: 1.2rem; padding: 11px 30px !important; font-family: 'Gotham Light'; width: 207px;" onclick="RequestNewMatrixCard()" runat="server">
                    <asp:Literal ID="litContinue" Text="<%$FrontEndResources:TRX00610,RequestNew%>" runat="server"></asp:Literal>
                </a>
            </RightButtons>
        </it:FlowCommandsContainer>
    </div>
    <script type="text/javascript">
        var projId = "<%=ConfigurationManager.AppSettings["projectId"].ToString() %>";
    </script>

    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("/Scripts/Services/Transactions/TRX00610-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00610-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>


