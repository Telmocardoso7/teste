<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="AddAccount.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Controls.Contract.AddAccount" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TransactionFeaturedContent" runat="server">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro text-brand-terciary" style="margin: 20px auto">
        <h3 class="head head-top">
            <asp:Literal ID="litTitle" Text="<%$FrontEndResources:AccountAdd,Title%>" runat="server"></asp:Literal>
        </h3>
    </div>
    <%--Top disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
    <asp:Literal ID="literalGenericTop" runat="server"></asp:Literal>
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-max divInformational border-bottom-brand-terciary" style="margin: 20px auto">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro text-brand-terciary" style="margin: 20px auto">
            <asp:Literal ID="Literal5" Text="<%$FrontEndResources:AccountAdd,Informational%>" runat="server"></asp:Literal>
        </div>
    </div>

    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="TransactionMainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("GroupEdit.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />

    <div id="divMainContent" runat="server">

        <section class="costumer-contract-details">

            <div class="ebankit-accordion-list" id="divContractDetails" runat="server">

                <asp:UpdatePanel runat="server" ID="upTransactions" UpdateMode="Always" class="ebankit-accordion-list col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro muc-no-border-top">
                    <ContentTemplate>
                        <div class="col-xs-12 bs-reduced bs-head-metro title-grid">
                            <h3 class="head">
                                <asp:Literal ID="Literal1" Text="<%$FrontEndResources:AccountAdd,subTitle%>" runat="server"></asp:Literal>
                            </h3>
                        </div>
                        <table class="table hovered table-resp-to1199 noarrow  no-margin ebankit-accordion-list">
                            <asp:Repeater runat="server" ID="rptNewAccounts" OnItemDataBound="rptNewAccounts_ItemDataBound">
                                <HeaderTemplate>
                                    <thead>
                                        <th class="col-xs-8">
                                            <asp:Label runat="server" ID="lblAccountHeader" Text="<%$FrontEndResources:ContractDetails,AccountNumber%>"></asp:Label>
                                        </th>
                                        <th class="col-xs-4"></th>
                                    </thead>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tbody>
                                        <tr class="account-wrapper item">
                                            <td class="col-xs-8">
                                                <div class="metro field field_v2 break width100percent">
                                                    <div>
                                                        <asp:TextBox runat="server" CssClass="col-xs-9" MaxLength="50" ID="AccountNumber"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <p class="action-buttons">
                                                    <asp:LinkButton ID="btnDeleteRow" runat="server" ToolTip="<%$FrontEndResources:AccountAdd,DeleteAccountTooltip%>"
                                                        data-toggle="tooltip" data-placement="top" data-container="body" data-original-title=""
                                                        CommandArgument='<%# Container.ItemIndex %>' OnClick="BtnDeleteRow_Click"
                                                        CssClass="btn-delete"></asp:LinkButton>
                                                </p>
                                            </td>
                                        </tr>
                                    </tbody>
                                </ItemTemplate>
                            </asp:Repeater>
                        </table>
                    </ContentTemplate>
                </asp:UpdatePanel>

                <!-- Button New -->
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max trs_buttons">
                    <div class="trs_buttons-action">
                        <asp:LinkButton ID="btnNew" runat="server" OnClick="BtnAdd_Click" CssClass="btn btn-default">
                            <asp:Literal ID="litBtnNew" Text="<%$FrontEndResources:AccountAdd,AddAnotherBtn%>" runat="server"></asp:Literal>
                        </asp:LinkButton>
                    </div>
                </div>

                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max trs_buttons">
                    <div class="trs_buttons-action">
                        <asp:LinkButton ID="btnContractGoBack" runat="server" OnClick="BtnContractGoBack_Click" CssClass="btn btn-default">
                            <asp:Literal ID="litBtnGoBack" Text="<%$FrontEndResources:AccountAdd,ButtonBack%>" runat="server"></asp:Literal>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnTrusteeSave" runat="server" OnClick="BtnAccountSave_Click" CssClass="btn btn-primary">
                            <asp:Literal ID="litBtnTrusteeSave" Text="<%$FrontEndResources:AccountAdd,ButtonSave%>" runat="server"></asp:Literal>
                        </asp:LinkButton>
                    </div>
                </div>

            </div>

        </section>
    </div>
    <%--Bottom disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
    <asp:Literal ID="literalGenericBottom" runat="server"></asp:Literal>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/Services/MUC/ebankit-muc-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>">    </script>

</asp:Content>
