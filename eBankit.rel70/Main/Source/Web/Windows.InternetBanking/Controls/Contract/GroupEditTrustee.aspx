<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="GroupEditTrustee.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Controls.Contract.GroupEditTrustee" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TransactionFeaturedContent" runat="server">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto">
        <h3 class="head head-top">
            <asp:Literal ID="litTitle" Text="<%$FrontEndResources:GroupEditTrustee,Title%>" runat="server"></asp:Literal>
        </h3>
    </div>
    <%--Top disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
    <asp:Literal ID="literalGenericTop" runat="server"></asp:Literal>
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-max divInformational border-bottom-brand-terciary" style="margin: 20px auto">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro text-brand-terciary" style="margin: 20px auto">
            <asp:Literal ID="Literal3" Text="<%$FrontEndResources:GroupEditTrustee,Informational%>" runat="server"></asp:Literal>
        </div>
    </div>
    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="TransactionMainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("GroupEditTrustee.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    <div id="divMainContent" runat="server">
        <section class="muc costumer-contract-details">
            <div class="ebankit-accordion-list col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro muc-no-border-top" id="divContractDetails" runat="server">
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro displayInlineBlock">
                    <h3 class="head fontWeightBold">
                        <asp:Literal ID="litContractSummary" Text="<%$FrontEndResources:GroupEditTrustee,GridTitle%>" runat="server"></asp:Literal>
                    </h3>
                </div>
                <asp:UpdatePanel runat="server" ID="upTransactions" UpdateMode="Always">
                    <ContentTemplate>
                        <it:GridViewControl ID="gvTrustrees" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow no-margin contractTableResponsive"
                            EmptyDataText="<%$FrontEndResources:GroupEditTrustee,NoTrustees%>"
                            GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="GVTrustrees_RowDataBound">
                            <Columns>
                                <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-3 noPaddingHeader" HeaderText="<%$FrontEndResources:ContractDetails,TrustreeName%>">
                                    <HeaderTemplate>
                                        <div class="col-xs-12 noPaddingLeft noPaddingRight adjustMargin">
                                            <div class="col-xs-5 col-md-3 noPaddingLeft noPaddingRight" colchk="1">
                                                <div class="cbcontainer cbcontainer-trustee ">
                                                    <asp:CheckBox ID="chkAllSelectInclude" runat="server" />
                                                    <div class="checkmark select-all checkAllInclude custom-muc-chk" colchk="1"></div>
                                                </div>
                                            </div>
                                            <div class="col-xs-7 col-md-8 noPaddingLeft noPaddingRight">
                                                <asp:Label ID="lblInclude" runat="server" Text="<%$FrontEndResources:GroupEditTrustee,TitleColumnActive%>" CssClass="lblContractResponsive marginRight10 lblSpanHeadTrustee text-brand-terciary breakWhiteSpaces" />
                                            </div>
                                        </div>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <div class="cbcontainer cbcontainer-trustee" colchk="1">
                                            <asp:CheckBox ID="chkSelectInclude" runat="server" />
                                            <div class="checkmark single checkInclude custom-muc-chk" colchk="1"></div>
                                        </div>
                                        <asp:Label ID="lblCustomerNumber" runat="server" Text="" Visible="false" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-3 text-brand-terciary noPaddingHeader" HeaderText="<%$FrontEndResources:ContractDetails,TrustreeName%>">
                                    <HeaderTemplate>
                                        <div>
                                            <asp:Label runat="server" Text="<%$FrontEndResources:ContractDetails,TrustreeName%>" CssClass="lblContractResponsive marginRight10 lblSpanHeadTrustee text-brand-terciary breakWhiteSpaces overflowNotSet" />
                                        </div>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="lblResponsiveOwnerName" runat="server" Text="<%$FrontEndResources:ContractDetails,TrustreeName%>" CssClass="lblContractResponsive marginRight10" />
                                        <asp:Label ID="lblTrustreeName" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-3 text-brand-terciary noPaddingHeader" HeaderText="<%$FrontEndResources:ContractDetails,Username%>">
                                    <ItemTemplate>
                                        <asp:Label ID="lblResponsiveOwnerUsername" runat="server" Text="<%$FrontEndResources:ContractDetails,Username%>" CssClass="lblContractResponsive marginRight10" />
                                        <asp:Label ID="lblTrustreeAlias" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-3 text-brand-terciary noPaddingHeader" HeaderText="<%$FrontEndResources:ContractDetails,AlternativeUsername%>">
                                    <ItemTemplate>
                                        <asp:Label ID="lblResponsiveOwnerAlternativeUsername" runat="server" Text="<%$FrontEndResources:ContractDetails,AlternativeUsername%>" CssClass="lblContractResponsive marginRight10" />
                                        <asp:Label ID="lblTrustreeAlternativeAlias" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </it:GridViewControl>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max trs_buttons">
                    <div class="trs_buttons-action">
                        <asp:LinkButton ID="btnContractGoBack" runat="server" OnClick="BtnContractGoBack_Click" CssClass="btn btn-default">
                            <asp:Literal ID="litBtnGoBack" Text="<%$FrontEndResources:GroupEditTrustee,ButtonGoBack%>" runat="server"></asp:Literal>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnTrusteeSave" runat="server" OnClick="BtnTrusteeSave_Click" CssClass="btn btn-primary">
                            <asp:Literal ID="litBtnTrusteeSave" Text="<%$FrontEndResources:TrusteeEdit,ButtonSave%>" runat="server"></asp:Literal>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <%--Bottom disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
    <asp:Literal ID="literalGenericBottom" runat="server"></asp:Literal>
    <script>
        $(document).ready(function () {
            $($("#MainContent_TransactionMainContent_gvTrustrees_chkAllSelectInclude").parent()).keyup(function (e) {
                if (e.keyCode === 32 || e.keyCode === 13) {
                    $("#MainContent_TransactionMainContent_gvTrustrees_chkAllSelectInclude").parent().find(".select-all").trigger("click");
                };
            });
            $('[id^="MainContent_TransactionMainContent_gvTrustrees_chkSelectInclude_"]').change(function (e) {
                if ($('[id^="MainContent_TransactionMainContent_gvTrustrees_chkSelectInclude_"]:checked').length == $('[id^="MainContent_TransactionMainContent_gvTrustrees_chkSelectInclude_"]').length)
                    $("#MainContent_TransactionMainContent_gvTrustrees_chkAllSelectInclude").prop('checked', true);
                else
                    $("#MainContent_TransactionMainContent_gvTrustrees_chkAllSelectInclude").prop('checked', false);
            });
        });
    </script>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/Services/MUC/ebankit-muc-trustees-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>

</asp:Content>
