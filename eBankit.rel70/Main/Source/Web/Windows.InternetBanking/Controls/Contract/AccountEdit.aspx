<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="AccountEdit.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Controls.Contract.AccountEdit" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<asp:Content ID="Content1" ContentPlaceHolderID="TransactionFeaturedContent" runat="server">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto">
        <h3 class="head head-top">
            <asp:Literal ID="litTitle" Text="<%$FrontEndResources:AccountEdit,Title%>" runat="server"></asp:Literal>
        </h3>
    </div>
    <%--Top disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
    <asp:Literal ID="literalGenericTop" runat="server"></asp:Literal>
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-max divInformational" style="margin: 20px auto">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto">
            <asp:Literal ID="Literal3" Text="<%$FrontEndResources:AccountEdit,Informational%>" runat="server"></asp:Literal>
        </div>
    </div>

    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="TransactionMainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("MucAccounts.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    <div id="divMainContent" runat="server">

        <section class="costumer-contract-details">

            <div class="ebankit-accordion-list" id="divContractDetails" runat="server">
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro">
                    <h3 class="head">
                        <asp:Literal ID="litContractSummary" Text="<%$FrontEndResources:AccountEdit,GridTitle%>" runat="server"></asp:Literal>
                    </h3>
                </div>

                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro">
                    <it:GridViewControl ID="gvContractAccounts" runat="server" AutoGenerateColumns="false" IsResponsive="true"
                        CssClass="table hovered table-resp-to1199 noarrow  no-margin" EmptyDataText="<%$FrontEndResources:ContractDetails,NoAccounts%>"
                        GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="GVContractAccounts_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important visible-md visible-lg visible-sm theadcol" HeaderText="<%$FrontEndResources:ContractDetails,TrustreeName%>">
                                <HeaderTemplate>
                                    <div class="cbcontainer ">
                                        <asp:CheckBox ID="chkAllSelectActive" runat="server" />
                                        <div class="checkmark select-all custom-muc-chk"></div>
                                        <asp:Label ID="lblActiveHead" runat="server" Text="<%$FrontEndResources:AccountEdit,TitleColumnActive%>" CssClass="lblContractResponsive marginRight10" />
                                    </div>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div class="cbcontainer ">
                                        <asp:CheckBox ID="chkSelectActive" runat="server" />
                                        <div class="checkmark single custom-muc-chk"></div>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderStyle-CssClass="formatTableData visible-md visible-lg visible-sm padding8Important">
                                <HeaderTemplate>
                                    <asp:Label ID="lblActive" runat="server" Text="<%$FrontEndResources:ContractDetails,AccountNumber%>" CssClass="lblContractResponsive marginRight10" />
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <div style="text-align: left;">
                                        <asp:Label ID="lblAccountId" runat="server" />
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </it:GridViewControl>

                </div>
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro cbcontainer" style="margin-top: 35px;">
                    <div class="checkbox-description">
                        <asp:CheckBox ID="chkFutureAccounts" runat="server" />
                        <div class="checkmark single custom-muc-chk"></div>
                        <span style="font-size: 14px;">
                            <asp:Literal ID="checkboxText" runat="server" Text="<%$FrontEndResources:ContractDetails,FutureAccountsDescription%>"></asp:Literal>
                        </span>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max trs_buttons">
                    <div class="trs_buttons-action">
                        <asp:LinkButton ID="btnContractGoBack" runat="server" OnClick="BtnContractGoBack_Click" CssClass="btn btn-default">
                            <asp:Literal ID="litBtnGoBack" Text="<%$FrontEndResources:TrusteeEdit,ButtonCancel%>" runat="server"></asp:Literal>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnTrusteeSave" runat="server" OnClick="BtnAccountSave_Click" CssClass="btn btn-primary">
                            <asp:Literal ID="litBtnTrusteeSave" Text="<%$FrontEndResources:TrusteeEdit,ButtonSave%>" runat="server"></asp:Literal>
                        </asp:LinkButton>
                    </div>
                </div>

            </div>

        </section>
    </div>
    <%--Bottom disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
    <asp:Literal ID="literalGenericBottom" runat="server"></asp:Literal>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/Services/MUC/ebankit-muc-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>

    <script>
        $(document).ready(function () {
            $('.pagination').remove();
            $($("#MainContent_TransactionMainContent_gvContractAccounts_chkAllSelectActive").parent()).keyup(function (e) {
                if (e.keyCode === 32 || e.keyCode === 13) {
                    $("#MainContent_TransactionMainContent_gvContractAccounts_chkAllSelectActive").parent().find(".select-all").trigger("click");
                };
            });
            $('[id^="MainContent_TransactionMainContent_gvContractAccounts_chkSelectActive_"]').change(function (e) {
                if ($('[id^="MainContent_TransactionMainContent_gvContractAccounts_chkSelectActive_"]:checked').length == $('[id^="MainContent_TransactionMainContent_gvContractAccounts_chkSelectActive_"]').length)
                    $("#MainContent_TransactionMainContent_gvContractAccounts_chkAllSelectActive").prop('checked', true);
                else
                    $("#MainContent_TransactionMainContent_gvContractAccounts_chkAllSelectActive").prop('checked', false);
            });
            var ariaLabel = $("#MainContent_TransactionMainContent_gvContractAccounts_chkAllSelectActive").attr("aria-label");
            $("#MainContent_TransactionMainContent_gvContractAccounts_chkAllSelectActive").parent().find("div").attr("aria-label", ariaLabel);
            $("#MainContent_TransactionMainContent_gvContractAccounts_chkAllSelectActive").parent().find("div").attr("title", ariaLabel);
        });
    </script>

</asp:Content>
