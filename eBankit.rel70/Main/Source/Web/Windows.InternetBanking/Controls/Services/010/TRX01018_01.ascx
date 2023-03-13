<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01018_01.ascx.cs" Inherits="TRX01018_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <asp:Panel ID="pnControls" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" runat="server">
        <div class="panel">
            <div id="divContractTrustreesContent" runat="Server" class="col-lg-8 col-max">
                <div class="row">
                    <%-- OWNER --%>
                    <div class="col-xs-12 bs-reduced bs-head-metro">
                        <h3 class="head">
                            <asp:Literal ID="litTrusteesOwners" Text="<%$FrontEndResources:ContractDetails,TrusteesOwners%>" runat="server"></asp:Literal>
                        </h3>
                        <hr class="no-margin" />
                        <div class="grid-contract-items grid-no-pagination">
                            <div class="grid-contract-items grid-no-pagination">
                                <it:GridViewControl ID="gvTrustreesOwners" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow no-margin contractTableResponsive"
                                    EmptyDataText="<%$FrontEndResources:ContractDetails,NoTrusteesOwners%>"
                                    GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="GVTrustrees_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important col-xs-2" HeaderText="<%$FrontEndResources:ContractDetails,TrustreeName%>">
                                            <ItemTemplate>
                                                 <asp:Label ID="lblResponsiveTrustreeName" runat="server" Text="<%$FrontEndResources:ContractDetails,TrustreeName%>" CssClass="lblContractResponsive marginRight10" />
                                                <asp:Label ID="lblTrustreeName" runat="server"  data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important col-xs-2" HeaderText="<%$FrontEndResources:ContractDetails,Username%>">
                                            <ItemTemplate>
                                                 <asp:Label ID="lblResponsiveTrustreeAlias" runat="server" Text="<%$FrontEndResources:ContractDetails,Username%>" CssClass="lblContractResponsive marginRight10" />
                                                <asp:Label ID="lblTrustreeAlias" runat="server"  data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-3" HeaderText="<%$FrontEndResources:ContractDetails,AlternativeUsername%>">
                                            <ItemTemplate>
                                                <asp:Label ID="lblResponsiveTrusteesAlternativeUsername" runat="server" Text="<%$FrontEndResources:ContractDetails,AlternativeUsername%>" CssClass="lblContractResponsive marginRight10" />
                                                <asp:Label ID="lblTrusteesAlternativeAlias" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                                            </ItemTemplate>
                                       </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important col-xs-2" HeaderText="<%$FrontEndResources:ContractDetails,CustomerNumber%>">
                                            <ItemTemplate>
                                                 <asp:Label ID="lblResponsiveTrustreeCustomerNumber" runat="server" Text="<%$FrontEndResources:ContractDetails,CustomerNumber%>" CssClass="lblContractResponsive marginRight10" />
                                                <asp:Label ID="lblTrustreeCustomerNumber" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>                                        
                                        <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important col-xs-3" ItemStyle-CssClass="btn-container-list">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnEditPermissionGroup" ToolTip="<%$FrontEndResources:ContractDetails,Edit%>" OnClick="BtnEditPermissionGroup_Click" runat="server" CssClass="icon-btn icon-edit-btn"></asp:LinkButton>
                                                <asp:LinkButton ID="btnLockCredentials" ToolTip="<%$FrontEndResources:ContractDetails,Lock%>" runat="server" CommandName="LockCredentials" OnClientClick="if(!confirmDeletePending(this)) return false;" OnCommand="BtnCommand_Click" CssClass="icon-btn icon-lock-btn"></asp:LinkButton>
                                                <asp:LinkButton ID="btnUnlockCredentials" ToolTip="<%$FrontEndResources:ContractDetails,Unlock%>" runat="server" CommandName="UnlockCredentials" Visible="false" OnCommand="BtnCommand_Click" CssClass="icon-btn icon-unlock-btn"></asp:LinkButton>
                                                <asp:LinkButton ID="btnResetCredentials" ToolTip="<%$FrontEndResources:ContractDetails,Reset%>" OnClick="BtnResetCredentials_Click" runat="server" CssClass="icon-btn icon-reset-btn"></asp:LinkButton>
                                                <asp:LinkButton ID="btnChangeAliasState" ToolTip="<%$FrontEndResources:ContractDetails,Change%>" OnClick="BtnChangeAliasState_Click" runat="server" CssClass="icon-btn icon-change-alias-btn"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </it:GridViewControl>
                            </div>
                        </div>
                    </div>

                    <%-- TRUSTEES --%>
                    <div class="col-xs-12 bs-reduced bs-head-metro">
                        <h3 class="head">
                            <asp:Literal ID="litTrustees" Text="<%$FrontEndResources:ContractDetails,Trustees%>" runat="server"></asp:Literal>
                        </h3>
                        <hr class="no-margin" />
                        <div class="grid-contract-items grid-no-pagination">
                            <div class="grid-contract-items grid-no-pagination">
                                <it:GridViewControl ID="gvTrustrees" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow no-margin contractTableResponsive"
                                    EmptyDataText="<%$FrontEndResources:ContractDetails,NoTrustees%>"
                                    GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="GVTrustrees_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important col-xs-2" HeaderText="<%$FrontEndResources:ContractDetails,TrustreeName%>">
                                            <ItemTemplate>
                                                <asp:Label ID="lblResponsiveTrustreeName" runat="server" Text="<%$FrontEndResources:ContractDetails,TrustreeName%>" CssClass="lblContractResponsive marginRight10" />
                                                <asp:Label ID="lblTrustreeName" runat="server"  data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important col-xs-2" HeaderText="<%$FrontEndResources:ContractDetails,Username%>">
                                            <ItemTemplate>
                                                <asp:Label ID="lblResponsiveTrustreeAlias" runat="server" Text="<%$FrontEndResources:ContractDetails,Username%>" CssClass="lblContractResponsive marginRight10" />
                                                <asp:Label ID="lblTrustreeAlias" runat="server"  data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-3" HeaderText="<%$FrontEndResources:ContractDetails,AlternativeUsername%>">
                                            <ItemTemplate>
                                                <asp:Label ID="lblResponsiveTrusteesAlternativeUsername" runat="server" Text="<%$FrontEndResources:ContractDetails,AlternativeUsername%>" CssClass="lblContractResponsive marginRight10" />
                                                <asp:Label ID="lblTrusteesAlternativeAlias" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                                            </ItemTemplate>
                                       </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important col-xs-2" HeaderText="<%$FrontEndResources:ContractDetails,CustomerNumber%>">
                                            <ItemTemplate>
                                                <asp:Label ID="lblResponsiveTrustreeCustomerNumber" runat="server" Text="<%$FrontEndResources:ContractDetails,CustomerNumber%>" CssClass="lblContractResponsive marginRight10" />
                                                <asp:Label ID="lblTrustreeCustomerNumber" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important col-xs-3" ItemStyle-CssClass="btn-container-list">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnEditPermissionGroup" ToolTip="<%$FrontEndResources:ContractDetails,Edit%>" OnClick="BtnEditPermissionGroup_Click" runat="server" CssClass="icon-btn icon-edit-btn"></asp:LinkButton>
                                                <asp:LinkButton ID="btnLockCredentials" ToolTip="<%$FrontEndResources:ContractDetails,Lock%>" runat="server" CommandName="LockCredentials" OnClientClick="if(!confirmDeletePending(this)) return false;" OnCommand="BtnCommand_Click" CssClass="icon-btn icon-lock-btn"></asp:LinkButton>
                                                <asp:LinkButton ID="btnUnlockCredentials" ToolTip="<%$FrontEndResources:ContractDetails,Unlock%>" runat="server" CommandName="UnlockCredentials" Visible="false" OnCommand="BtnCommand_Click" CssClass="icon-btn icon-unlock-btn"></asp:LinkButton>
                                                <asp:LinkButton ID="btnResetCredentials" ToolTip="<%$FrontEndResources:ContractDetails,Reset%>" OnClick="BtnResetCredentials_Click" runat="server" CssClass="icon-btn icon-reset-btn"></asp:LinkButton>
                                                <asp:LinkButton ID="btnChangeAliasState" ToolTip="<%$FrontEndResources:ContractDetails,Change%>" OnClick="BtnChangeAliasState_Click" runat="server" CssClass="icon-btn icon-change-alias-btn"></asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </it:GridViewControl>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </asp:Panel>
    <asp:HiddenField ID="hdnVerifyPending" Value="false" runat="server" />
    <script type="text/javascript">
        var hdVerifyPending = document.getElementById("<%=hdnVerifyPending.ClientID%>")


        function confirmDeletePending(currentMessage) {
            hdVerifyPending.value = false;
            top.confirmDeleteHandler = function () {
                hdVerifyPending.value = true;
                eval(currentMessage.href);
            }

            top.rejectDeleteHandler = function () {
                hdVerifyPending.value = false;
                eval(currentMessage.href);
            }

            if ($countPending > 0) {
                itcore_ui.ShowTopPopupConfirm_V3("<%=eBankit.Common.Globalization.Translate.GetTransactionString("EditPermission", "PopUpMessagePending").Replace("\"","&quot;") %>", '<%=eBankit.Common.Globalization.Translate.GetTransactionString("EditPermission", "PopUpTitlePending") %>','<%=eBankit.Common.Globalization.Translate.GetTransactionString("EditPermission", "PopUpSubTitlePeding") %>', 'top.confirmDeleteHandler();', 'top.rejectDeleteHandler();', '<%=eBankit.Common.Globalization.Translate.GetTransactionString("JS", "KeepOperations") %>','<%=eBankit.Common.Globalization.Translate.GetTransactionString("JS", "CancelOperations") %>');
            } else {
                return true;
            }

        }


    </script>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/Services/Transactions/TRX01018-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01018-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>


