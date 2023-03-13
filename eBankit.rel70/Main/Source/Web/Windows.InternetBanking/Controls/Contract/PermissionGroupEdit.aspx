<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="PermissionGroupEdit.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Controls.Contract.PermissionGroupEdit" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Content ID="FeaturedContent" ContentPlaceHolderID="TransactionFeaturedContent" runat="server">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto">
        <h3 class="head head-top">
            <asp:Literal ID="litTitle" Text="<%$FrontEndResources:PermissionGroupEdit,Title%>" runat="server"></asp:Literal>
        </h3>
    </div>
    <%--Top disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
    <asp:Literal ID="literalGenericTop" runat="server"></asp:Literal>
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro text-brand-terciary" style="margin: 20px auto">
            <asp:Literal ID="Literal1" Text="<%$FrontEndResources:PermissionGroupEdit,Informational%>" runat="server"></asp:Literal>
        </div>
    </div>
    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="TransactionMainContent" runat="server">

    <script type="text/javascript">
        var control = {};

        control.Init = function () {
            $("[data-delete-singular]").on("click", function (event) {
                var elem = $(this);
                event.preventDefault();
                itcore_ui.ShowTopPopupConfirm_V3(
                    "",
                    '<%=eBankit.Common.Globalization.Translate.GetTransactionString("PermissionGroupEdit", "PopupDeclineTitle")%>',
                    '<%=eBankit.Common.Globalization.Translate.GetTransactionString("PermissionGroupEdit", "PopupDeclineConfirmationMessage")%>',
                    elem.attr("href"), '',
                    '<%=eBankit.Common.Globalization.Translate.GetTransactionString("PermissionGroupEdit", "PopupCancelBtnKeepOperation")%>',
                    '<%=eBankit.Common.Globalization.Translate.GetTransactionString("PermissionGroupEdit", "PopupCancelBtnConfirmDeclineOperation")%>');

                return false;
            });
        }

        $(document).ready(function () {
            control.Init();
        });

        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function () {
            control.Init();
        });
    </script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("PermissionGroupEdit.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    <div id="divMainContent" runat="server" class="col-lg-8 col-max grid-contract-items grid-no-pagination">
        <section class="costumer-contract-details">
            <div class="ebankit-accordion-list usersNotIncludedDiv" id="divUsersNotIncluded" runat="server">
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro">
                    <h3 class="head bold">
                        <asp:Literal ID="Literal2" Text="<%$FrontEndResources:PermissionGroupEdit,GridTitleNotIncluded%>" runat="server"></asp:Literal>
                    </h3>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro" style="background-color: darkorange;">
                    <h3 class="head" style="color: #333333;">
                        <asp:Literal ID="Literal4" Text="<%$FrontEndResources:PermissionGroupEdit,InformationNotIncluded%>" runat="server"></asp:Literal>
                    </h3>
                </div>
                <it:GridViewControl ID="gvTrustreesNotIncluded" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow no-margin contractTableResponsive"
                    EmptyDataText="<%$FrontEndResources:ContractDetails,NoTrusteesOwners%>"
                    GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="GVTrustreesNotIncluded_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary" HeaderText="<%$FrontEndResources:PermissionGroupEdit,TrustreeName%>">
                            <ItemTemplate>
                                <asp:Label ID="lblResponsiveOwnerName" runat="server" Text="<%$FrontEndResources:PermissionGroupEdit,TrustreeName%>" CssClass="lblContractResponsive marginRight10" />
                                <asp:Label ID="lblTrustreeName" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary" HeaderText="<%$FrontEndResources:PermissionGroupEdit,Username%>">
                            <ItemTemplate>
                                <asp:Label ID="lblResponsiveOwnerUsername" runat="server" Text="<%$FrontEndResources:PermissionGroupEdit,Username%>" CssClass="lblContractResponsive marginRight10" />
                                <asp:Label ID="lblTrustreeAlias" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary" HeaderText="<%$FrontEndResources:PermissionGroupEdit,AlternativeUsername%>">
                            <ItemTemplate>
                                <asp:Label ID="lblResponsiveOwnerAlternativeUsername" runat="server" Text="<%$FrontEndResources:PermissionGroupEdit,AlternativeUsername%>" CssClass="lblContractResponsive marginRight10" />
                                <asp:Label ID="lblTrustreeAlternativeAlias" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </it:GridViewControl>
            </div>
            <div class="ebankit-accordion-list" id="divUsersIncluded" runat="server">
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro">
                    <h3 class="head bold">
                        <asp:Literal ID="Literal3" Text="<%$FrontEndResources:PermissionGroupEdit,GridTitle%>" runat="server"></asp:Literal>
                    </h3>
                </div>
                <it:GridViewControl ID="gvGroups" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow no-margin contractTableResponsive"
                    EmptyDataText="<%$FrontEndResources:ContractDetails,NoTrusteesOwners%>"
                    GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="GVGroups_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary" HeaderText="<%$FrontEndResources:PermissionGroupEdit,GroupName%>">
                            <ItemTemplate>
                                <asp:Label ID="lblGroupName" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2 numberOfUsers text-brand-terciary" HeaderText="<%$FrontEndResources:PermissionGroupEdit,NumberUsers%>">
                            <ItemTemplate>
                                <asp:Label ID="lblNumberUsers" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias numberOfUsers" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="col-md-2 col-sm-6 col-xs-1 col-xs-offset-2 col-sm-offset-1 col-md-offset-0 text-brand-terciary">
                            <ItemTemplate>
                                <p class="action-buttons align-buttons-right">
                                    <asp:LinkButton ID="btnDeleteRow" runat="server" ToolTip="<%$FrontEndResources:PermissionGroupEdit,ToolTipButtonDelete%>" data-modal="yes"
                                        CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' OnClick="btnDelete_Click" data-delete-singular="" CssClass="btn-delete"></asp:LinkButton>
                                    <asp:LinkButton ID="btnDuplicate" runat="server" ToolTip="<%$FrontEndResources:PermissionGroupEdit,ToolTipButtonDuplicate%>"
                                        CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' OnClick="btnDuplicate_Click" CssClass="btn-duplicate"></asp:LinkButton>
                                    <asp:LinkButton ID="btnEdit" runat="server" ToolTip="<%$FrontEndResources:PermissionGroupEdit,ToolTipButtonEdit%>"
                                        CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' OnClick="btnEdit_Click" CssClass="btn-edit"></asp:LinkButton>
                                </p>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </it:GridViewControl>
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max trs_buttons">
                    <div class="trs_buttons-action">
                        <asp:LinkButton ID="btnNew" runat="server" OnClick="BtnNew_Click" CssClass="btn btn-default">
                            <asp:Literal ID="litBtnNew" Text="<%$FrontEndResources:PermissionGroupEdit,ButtonNew%>" runat="server"></asp:Literal>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max trs_buttons">
                <div class="trs_buttons-action">
                    <asp:LinkButton ID="btnContractGoBack" runat="server" OnClick="BtnContractGoBack_Click" CssClass="btn btn-default ">
                        <asp:Literal ID="litBtnGoBack" Text="<%$FrontEndResources:PermissionGroupEdit,ButtonCancel%>" runat="server"></asp:Literal>
                    </asp:LinkButton>
                    <asp:LinkButton ID="btnTrusteeSave" runat="server" OnClick="BtnSave_Click" CssClass="btn btn-primary btn-save">
                        <asp:Literal ID="litBtnTrusteeSave" Text="<%$FrontEndResources:PermissionGroupEdit,ButtonSave%>" runat="server"></asp:Literal>
                    </asp:LinkButton>
                </div>
            </div>
        </section>
    </div>
    <%--Bottom disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
    <asp:Literal ID="literalGenericBottom" runat="server"></asp:Literal>
</asp:Content>

