<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="ContractDetails.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.ContractDetails" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<%@ Import Namespace="eBankit.Common" %>
<%@ Import Namespace="eBankit.Common.Extensions" %>

<asp:Content ID="FeaturedContent" ContentPlaceHolderID="TransactionFeaturedContent" runat="server">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto">
        <h3 class="head head-top">
            <asp:Literal ID="litTitle" Text="<%$FrontEndResources:ContractDetails,Title%>" runat="server"></asp:Literal>
        </h3>
    </div>
    <%--Top disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
    <asp:Literal ID="literalGenericTop" runat="server"></asp:Literal>
    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="TransactionMainContent" runat="server">

    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("PendingOperations.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("contractdetails.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />

    <div id="divMainContent" class="transaction-content" runat="server">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro">
            <h3 class="head">
                <asp:Literal ID="litContractSummary" Text="<%$FrontEndResources:ContractDetails,ContractSummary%>" runat="server"></asp:Literal>
            </h3>
        </div>
        <section class="grayContainer costumer-data-container" style="margin: 0;">
            <div class="col-lg-8 col-max">
                <div class="contract-img img-container">
                    <img id="imgContractProfile" src="<%$ebFile:~/Content/currenttheme/images/user-icon.png%>" alt="" class="img-profile img-circle" runat="server" />
                </div>
                <div class="contract-title bs-reduced bs-head-metro">
                    <h3 class="head">
                        <asp:Literal ID="litContractId" runat="server"></asp:Literal>
                        <asp:HiddenField ID="hidContractId" runat="server" />
                    </h3>
                </div>
                <div class="contract-subtitle">
                    <h3 class="head">
                        <asp:Literal ID="litCreatedContractDate" runat="server"></asp:Literal>
                    </h3>
                </div>
                <div id="divContractStatus" class="contract-status" runat="server">
                    <h3 class="head">
                        <asp:Literal ID="litContractStatus" runat="server"></asp:Literal>
                    </h3>
                </div>
            </div>
        </section>
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro">
            <h3 class="head">
                <asp:Literal ID="litContractDetails" Text="<%$FrontEndResources:ContractDetails,ContractDetails%>" runat="server"></asp:Literal>
            </h3>
        </div>

        <section class="costumer-contract-details">
            <div class="ebankit-accordion-list" id="divContractDetails" runat="server">

                <%-- CONTRACT TYPE --%>
                <div class="panel">
                    <div id="divContractType" class="panel-heading collapsed" data-toggle="collapse" data-parent="#<%=divContractDetails.ClientID%>" href="#<%=divContractTypeContent.ClientID%>" onkeydown="eBankit.Presentation.ContractDetails.KeydownHandler(this, event);" onkeyup="eBankit.Presentation.ContractDetails.KeyupHandler(this, event);">
                        <div class="col-lg-8 col-max collapse-title remove-background-title">
                            <div class="step-info-content">
                                <asp:Literal ID="litContractTypeTitle" Text="<%$FrontEndResources:ContractDetails,ContractTypeTitle%>" runat="server"></asp:Literal>
                                <span class="collapse-subtitle">
                                    <asp:Literal ID="litContractTypeSubtitle" runat="server"></asp:Literal>
                                </span>
                            </div>

                            <div class="step-muc-actions">
                                <asp:LinkButton ID="LinkButton1" runat="server" data-toggle="tooltip" TabIndex="0" data-placement="top" data-container="body" ToolTip="<%$FrontEndResources:ContractDetails,Expand%>" data-original-title="" CssClass="muc-exp-col muc-details-expand "></asp:LinkButton>
                            </div>
                        </div>

                    </div>
                    <div id="divContractTypeContent" runat="Server" class=" col-lg-8 col-max panel-collapse collapse">
                        <div class="collapse-content">
                            <it:FlowInnerContainer ID="flwContractTypeContainer" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" Title="<%$FrontEndResources:ContractDetails,ContractTypeTitle%>" runat="server">
                                <div>
                                    <it:FlowLabel_v3 ID="flwContractTrustrees" Label="<%$FrontEndResources:ContractDetails,litContractIncludesTrustees%>" runat="server" />
                                </div>
                            </it:FlowInnerContainer>
                        </div>
                    </div>
                </div>

                <%-- CONTRACT PACKAGE --%>
                <div class="panel">
                    <div id="divPackage" class="panel-heading collapsed" data-toggle="collapse" data-parent="#<%=divContractDetails.ClientID%>" href="#<%=divPackageContent.ClientID%>" onkeydown="eBankit.Presentation.ContractDetails.KeydownHandler(this, event);" onkeyup="eBankit.Presentation.ContractDetails.KeyupHandler(this, event);">
                        <div class="col-lg-8 col-max collapse-title remove-background-title">
                            <div class="step-info-content">
                                <asp:Literal ID="litPackageTitle" Text="<%$FrontEndResources:ContractDetails,PackageTitle%>" runat="server"></asp:Literal>
                                <span class="collapse-subtitle">
                                    <asp:Literal ID="litPackageSubtitle" runat="server"></asp:Literal>
                                </span>
                            </div>
                            <div class="step-muc-actions">
                                <asp:LinkButton ID="LinkButton2" runat="server" data-toggle="tooltip" TabIndex="0" data-placement="top" data-container="body" ToolTip="<%$FrontEndResources:ContractDetails,Expand%>" data-original-title="" CssClass="muc-exp-col muc-details-expand "></asp:LinkButton>
                            </div>

                        </div>
                    </div>
                    <div id="divPackageContent" runat="server" class="col-lg-8 col-max panel-collapse collapse">
                        <div class="collapse-content row">
                            <div class="col-xs-12 bs-reduced bs-head-metro">
                                <h3 class="head">
                                    <asp:Literal ID="litSelectedPackage" Text="<%$FrontEndResources:ContractDetails,SelectedPackage%>" runat="server"></asp:Literal>
                                </h3>
                                <div class="grayContainer costumer-data-container" style="margin: 0;">
                                    <div class="packge-img img-container">
                                        <img id="imgPackage" src="" alt="" class="img-profile img-circle imgPackage" runat="server" />
                                    </div>
                                    <div class="package-title bs-reduced bs-head-metro">
                                        <h3 class="head">
                                            <asp:Literal ID="litPackageName" runat="server"></asp:Literal>
                                        </h3>
                                    </div>
                                    <div class="package-subtitle">
                                        <h3 class="head">
                                            <asp:Literal ID="litPackageDescription" runat="server"></asp:Literal>
                                        </h3>
                                    </div>
                                    <div class="package-features">
                                        <asp:LinkButton ID="lnkPackageFeatures" runat="server">
                                            <asp:Literal ID="litPackageFeatures" Text="<%$FrontEndResources:ContractDetails,PackageFeaturesIncluded%>" runat="server"></asp:Literal>
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-12 bs-reduced bs-head-metro">
                                <h3 class="head">
                                    <asp:Literal ID="litOptionalPackage" Text="<%$FrontEndResources:ContractDetails,OptionalPackage%>" runat="server"></asp:Literal>
                                </h3>
                                <hr class="no-margin" />
                                <div id="divOptionalPackages" runat="server" class="grid-contract-items grid-no-pagination">
                                    <it:GridViewControl ID="gvOtherPackages" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow no-margin" EmptyDataText="<%$FrontEndResources:ContractDetails,NoOptionalPackages%>"
                                        GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="GVOtherPackages_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important col-sm-7" HeaderText="<%$FrontEndResources:ContractDetails,PackageName%>">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblPackageName" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-CssClass="col-sm-5">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="lnkPackageFeaturesGrid" runat="server">
                                                        <asp:Literal ID="litPackageFeatures" Text="<%$FrontEndResources:ContractDetails,PackageFeatures%>" runat="server"></asp:Literal>
                                                    </asp:LinkButton>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </it:GridViewControl>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%-- CONTRACT ACCOUNTS --%>
                <div class="panel">
                    <div id="divContractAccounts" class="panel-heading collapsed" data-toggle="collapse" data-parent="#<%=divContractDetails.ClientID%>"
                        href="#<%= (!this.IsVirtualEntity)  ? divContractAccountsContent.ClientID : divContractAccountsGroupsContent.ClientID %>">
                        <div id="divAccounts" class="col-lg-8 col-max collapse-title remove-background-title">
                            <div class="step-info-content">
                                <asp:Literal ID="litContractAccountsTitle" Text="<%$FrontEndResources:ContractDetails,ContractAccountsTitle%>" runat="server"></asp:Literal>
                                <span class="collapse-subtitle">
                                    <asp:Literal ID="litContractAccountsSubtitle" runat="server"></asp:Literal>
                                </span>
                            </div>
                            <div class="step-muc-actions">
                                <asp:LinkButton ID="lnkEditStepAccounts" runat="server" TabIndex="0" data-toggle="tooltip" data-placement="top" data-container="body" ToolTip="<%$FrontEndResources:ContractDetails,EditTooltip%>" data-original-title="" CssClass="isAlias btn-edit edit-accounts-button muc-edit"></asp:LinkButton>
                                <asp:LinkButton ID="LinkButton3" runat="server" data-toggle="tooltip" TabIndex="0" data-placement="top" data-container="body" ToolTip="<%$FrontEndResources:ContractDetails,Expand%>" data-original-title="" CssClass="muc-exp-col muc-details-expand "></asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <% if (!this.IsVirtualEntity)
                        { %>
                    <div id="divContractAccountsContent" runat="Server" class="col-lg-8 col-max panel-collapse collapse">
                        <div class="collapse-content row">
                            <div class="col-xs-12 bs-reduced bs-head-metro">
                                <hr class="no-margin" />
                                <div class="grid-contract-items grid-no-pagination">
                                    <it:GridViewControl ID="gvContractAccounts" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow  no-margin" EmptyDataText="<%$FrontEndResources:ContractDetails,NoAccounts%>"
                                        GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="GVContractAccounts_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField HeaderStyle-CssClass="formatTableData visible-md visible-lg visible-sm padding8Important" HeaderText="<%$FrontEndResources:ContractDetails,AccountNumber%>">
                                                <ItemTemplate>
                                                    <div style="text-align: left;">
                                                        <asp:Label ID="lblAccountId" runat="server" />
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                        </Columns>
                                    </it:GridViewControl>
                                    <div class="cbcontainer cb-contract-detail">
                                        <input type="checkbox" id="cbSelected" runat="server" disabled="disabled" hidden="hidden" />
                                        <div class="checkmark single custom-muc-chk"></div>
                                        <div class="checkbox-description">
                                            <span style="font-size: 14px;">
                                                <asp:Literal ID="checkboxText" runat="server" Text="<%$FrontEndResources:ContractDetails,FutureAccountsDescription%>"></asp:Literal></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <% }
                        else
                        {   %>

                    <div id="divContractAccountsGroupsContent" runat="Server" class="col-lg-8 col-max panel-collapse collapse">

                        <div class="col-xs-12 bs-reduced bs-head-metro">
                            <h3 class="head">
                                <asp:Literal ID="Literal2" Text="<%$FrontEndResources:ContractDetails,AccountsGroups%>" runat="server"></asp:Literal>
                            </h3>
                        </div>
                        <hr class="no-margin" />
                        <div runat="server" id="divContainerAccounts" class="grid-contract-items grid-no-pagination ">

                            <asp:Repeater runat="server" ID="rptAcountsGroups" OnItemDataBound="rptAcountsGroups_ItemDataBound">
                                <HeaderTemplate>
                                    <table class="table hovered table-resp-to1199 noarrow  no-margin ebankit-accordion-list">
                                        <thead>
                                            <tr class="table-header">
                                                <th class="formatTableData padding8Important visible-md visible-lg visible-sm">
                                                    <asp:Label runat="server" ID="lblHeaderCol1" Text="<%$FrontEndResources:ContractDetails,Group%>"></asp:Label></th>
                                                <th class="formatTableData padding8Important visible-md visible-lg visible-sm">
                                                    <asp:Label runat="server" ID="lblHeaderCol2" Text="<%$FrontEndResources:ContractDetails,ActiveAccountsHeader%>"></asp:Label></th>
                                                <th class="formatTableData padding8Important visible-md visible-lg visible-sm"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <tr class="panel-heading collapsed" data-toggle="collapse" data-parent="#<%=divContractAccountsGroupsContent.ClientID%>" href='#listaccounts-<%# Eval("GroupIndex") %>'>
                                        <td>
                                            <asp:Label runat="server" ID="lblValCol1" Text="<%$FrontEndResources:AccountGroup,OtherEntitiesAccountGroup%>"> </asp:Label></td>
                                        <td>
                                            <asp:Label runat="server" ID="lblValCol2"> </asp:Label></td>
                                        <td class="detail-group-head " style="width: 60px;"><a>
                                            <div class="collapse-title"></div>
                                        </a></td>
                                    </tr>
                                    <br />
                                    <tr id="listaccounts-<%# Eval("GroupIndex") %>" aria-expanded="false" class="collapse" clientidmode="Static" style="width: 100%;">
                                        <td class="width100percent" colspan="3">
                                            <div runat="server" id="divAccountsInGroupContssent" class="col-xs-12 bs-reduced bs-head-metro account-subtitle-header">
                                                <h3 class="head">
                                                    <asp:Literal ID="Literal2" Text="<%$FrontEndResources:ContractDetails,Accounts%>" runat="server"></asp:Literal>
                                                </h3>
                                                <hr />
                                            </div>
                                            <br />


                                            <div class="container-accounts" id="group-<%# Eval("GroupName") %>">
                                                <hr />

                                                <!-- Accounts -->
                                                <asp:Repeater runat="server" ID="rptAccount" OnItemDataBound="rptAccount_ItemDataBound">
                                                    <HeaderTemplate>
                                                        <div class="account-header text-brand-terciary border-bottom-brand-terciary">
                                                            <asp:Label runat="server" ID="lblAccountHeader" Text="<%$FrontEndResources:ContractDetails,AccountNumber%>"></asp:Label>
                                                        </div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <div class="account-wrapper account-contract-details-format">
                                                            <div class="col-xs-9">
                                                                <asp:Label runat="server" ID="lblAccountNumber"></asp:Label>
                                                            </div>
                                                            <div class="col-xs-3" runat="server" id="divPendingLabel">
                                                                <asp:Label runat="server" id="lblPendingNotOtherEntity" Text="<%$FrontEndResources:AccountEdit,PendingApproval%>"
                                                                    ToolTip="<%$FrontEndResources:AccountEdit,AccountStatusTooltip%>"
                                                                    data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="MUCPendingApprovalLabel"></asp:Label>

                                                                <asp:Label runat="server" ID="lblImgPendingNotOtherEntity" class="img-info" TabIndex="0"
                                                                    ToolTip="<%$FrontEndResources:AccountEdit,AccountStatusTooltip%>"
                                                                    data-toggle="tooltip" data-placement="top" data-container="body" data-original-title=""></asp:Label>

                                                            </div>
                                                        </div>

                                                    </ItemTemplate>
                                                </asp:Repeater>

                                                <!-- Pending Accounts -->
                                                <asp:Repeater runat="server" ID="rptAccountPending" OnItemDataBound="rptAccountPending_ItemDataBound" Visible="false">
                                                    <HeaderTemplate>
                                                        <table class="table hovered table-resp-to1199 noarrow  no-margin ebankit-accordion-list without-line-top">
                                                            <thead>
                                                                <tr class="table-header">
                                                                    <th class="formatTableData padding8Important visible-md visible-lg visible-sm text-brand-terciary">
                                                                        <div class="cbcontainer" style="font-weight: normal !important;">
                                                                            <asp:Label runat="server" Text="<%$FrontEndResources:ContractDetails,AccountNumber%>"></asp:Label>
                                                                        </div>
                                                                    </th>
                                                                    <th class="formatTableData padding8Important visible-md visible-lg visible-sm col-xs-4 text-brand-terciary"></th>
                                                                </tr>
                                                            </thead>
                                                            <tbody>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <tr class="account-wrapper item">
                                                            <td class="col-xs-9" style="text-align: left;">
                                                                <asp:Label runat="server" ID="lblAccountNumberPending"></asp:Label></td>
                                                            <td class="col-xs-1">

                                                                <asp:Label runat="server" Text="<%$FrontEndResources:AccountEdit,PendingApproval%>"
                                                                    ToolTip="<%$FrontEndResources:AccountEdit,AccountStatusTooltip%>"
                                                                    data-toggle="tooltip" data-placement="top" data-container="body" data-original-title=""></asp:Label>

                                                                <asp:Label runat="server" class="img-info" TabIndex="0"
                                                                    ToolTip="<%$FrontEndResources:AccountEdit,AccountStatusTooltip%>"
                                                                    data-toggle="tooltip" data-placement="top" data-container="body" data-original-title=""></asp:Label>

                                                            </td>
                                                        </tr>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </tbody>
                                                        </table>
                                                    </FooterTemplate>
                                                </asp:Repeater>

                                            </div>
                                        </td>
                                    </tr>

                                </ItemTemplate>
                                <FooterTemplate>
                                    </tbody>
                                            </table>
                                </FooterTemplate>

                            </asp:Repeater>

                        </div>

                    </div>

                    <% } %>
                </div>

                <%-- CONTRACT TRUSTEES --%>
                <div class="panel">
                    <div id="divContractTrustrees" class="panel-heading collapsed" data-toggle="collapse" data-parent="#<%=divContractDetails.ClientID%>" href="#<%=divContractTrustreesContent.ClientID%>">
                        <div class="col-lg-8 col-max collapse-title remove-background-title">
                            <div class="step-info-content">
                                <asp:Literal ID="litContractTrustreesTitle" Text="<%$FrontEndResources:ContractDetails,Trustees%>" runat="server"></asp:Literal>
                                <span class="collapse-subtitle">
                                    <asp:Literal ID="litContractTrustreesSubitle" runat="server"></asp:Literal>
                                </span>
                            </div>
                            <div class="step-muc-actions">
                                <asp:LinkButton ID="lnkEditStepTrustees" runat="server" data-toggle="tooltip" TabIndex="0" data-placement="top" data-container="body" ToolTip="<%$FrontEndResources:ContractDetails,EditTooltip%>" data-original-title="" CssClass="isAlias btn-edit edit-trustees-button muc-edit" />
                                <asp:LinkButton ID="LinkButton5" runat="server" data-toggle="tooltip" TabIndex="0" data-placement="top" data-container="body" ToolTip="<%$FrontEndResources:ContractDetails,Expand%>" data-original-title="" CssClass="muc-exp-col muc-details-expand "></asp:LinkButton>
                            </div>
                        </div>
                    </div>

                    <div id="divContractTrustreesContent" runat="Server" class="col-lg-8 col-max panel-collapse collapse">
                        <div class="collapse-content row">
                            <%-- OWNER and TRUSTEES --%>
                            <div class="col-xs-12 bs-reduced bs-head-metro">
                                <h3 class="head">
                                    <asp:Literal ID="litTrusteesOwners" Text="<%$FrontEndResources:TrusteeEdit,GridTitle%>" runat="server"></asp:Literal>
                                </h3>
                                <hr class="no-margin" />
                                <div class="grid-contract-items grid-no-pagination">
                                    <div class="grid-contract-items grid-no-pagination">
                                        <it:GridViewControl ID="gvTrustreesOwners" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow no-margin contractTableResponsive"
                                            EmptyDataText="<%$FrontEndResources:ContractDetails,NoTrusteesOwners%>"
                                            GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="GVTrustrees_RowDataBound">
                                            <Columns>
                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary" HeaderText="<%$FrontEndResources:ContractDetails,Active%>">
                                                    <ItemTemplate>
                                                        <div class="cbcontainer cb-contract-detail">
                                                            <input type="checkbox" id="chkIsActive" runat="server" disabled="disabled" hidden="hidden" />
                                                            <div runat="server" id="fancyActiveCheckbox" class="checkmark single custom-muc-chk"></div>
                                                        </div>

                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary" HeaderText="<%$FrontEndResources:ContractDetails,ContractOwner%>">
                                                    <ItemTemplate>
                                                        <%--<asp:CheckBox ID="chkIsOwner" runat="server" />--%>
                                                        <div class="cbcontainer cb-contract-detail">
                                                            <input type="checkbox" id="chkIsOwner" runat="server" disabled="disabled" hidden="hidden" />
                                                            <div runat="server" id="fancyIsOwnerCheckbox" class="checkmark single custom-muc-chk"></div>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary" HeaderText="<%$FrontEndResources:ContractDetails,TrustreeName%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblResponsiveOwnerName" runat="server" Text="<%$FrontEndResources:ContractDetails,TrustreeName%>" CssClass="lblContractResponsive marginRight10" />
                                                        <asp:Label ID="lblTrustreeName" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary" HeaderText="<%$FrontEndResources:ContractDetails,Username%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblResponsiveOwnerUsername" runat="server" Text="<%$FrontEndResources:ContractDetails,Username%>" CssClass="lblContractResponsive marginRight10" />
                                                        <asp:Label ID="lblTrustreeAlias" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary" HeaderText="<%$FrontEndResources:ContractDetails,AlternativeUsername%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblResponsiveOwnerAlternativeUsername" runat="server" Text="<%$FrontEndResources:ContractDetails,AlternativeUsername%>" CssClass="lblContractResponsive marginRight10" />
                                                        <asp:Label ID="lblTrustreeAlternativeAlias" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>

                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary" HeaderText="<%$FrontEndResources:ContractDetails,LastAccess%>">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblResponsiveLastAccess" runat="server" Text="<%$FrontEndResources:ContractDetails,LastAccess%>" CssClass="lblContractResponsive marginRight10" />
                                                        <asp:Label ID="lblLastAccess" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary">
                                                    <ItemTemplate>
                                                        <asp:Button runat="server" ID="btnPassword" CssClass="action-reset-password" ToolTip="<%$FrontEndResources:ContractDetails,ResetPassword%>" OnClick="btnPassword_Click"></asp:Button>
                                                        <asp:Button runat="server" ID="btnUnlockSecCredentials" CssClass="action-unlock-credentials" ToolTip="<%$FrontEndResources:ContractDetails,UnlockSecCredentials%>" OnClick="btnUnlockSecCredentials_Click"></asp:Button>
                                                        <asp:Button runat="server" ID="btnLockContractAccess" CssClass="action-lock-contract-access" ToolTip="<%$FrontEndResources:ContractDetails,LockContractAccess%>" OnClick="btnLockContractAccess_Click"></asp:Button>
                                                        <asp:Button runat="server" ID="btnUnlockContractAccess" CssClass="action-unlock-contract-access" ToolTip="<%$FrontEndResources:ContractDetails,UnlockContractAccess%>" OnClick="btnUnlockContractAccess_Click"></asp:Button>
                                                        <asp:Button runat="server" ID="btnEdit" CssClass="action-edit" ToolTip="<%$FrontEndResources:ContractDetails,EditAdherent%>" OnClick="btnEdit_Click"></asp:Button>
                                                    </ItemTemplate>
                                                </asp:TemplateField>


                                            </Columns>
                                        </it:GridViewControl>
                                    </div>
                                </div>
                            </div>

                            <!-- Pending -->
                            <div class="col-xs-12 bs-reduced bs-head-metro" style="margin-top: 25px;">
                                <div id="divPending" runat="server">
                                    <h3 class="head">
                                        <asp:Literal ID="Literal4" Text="<%$FrontEndResources:TrusteeEdit,GridTitlePending%>" runat="server"></asp:Literal>
                                    </h3>
                                    <hr class="no-margin" />
                                </div>
                                <div class="grid-contract-items grid-no-pagination">
                                    <div class="grid-contract-items grid-no-pagination">
                                        <it:GridViewControl ID="gvPendingTrustees" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow no-margin contractTableResponsive"
                                            EmptyDataText="<%$FrontEndResources:ContractDetails,NoTrusteesOwners%>"
                                            GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="GVPendingTrustees_RowDataBound">
                                            <Columns>
                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary" HeaderText="<%$FrontEndResources:ContractDetails,TrustreeName%>">
                                                    <HeaderTemplate>
                                                        <div style="position: absolute;">
                                                            <asp:Label runat="server" Text="<%$FrontEndResources:ContractDetails,TrustreeName%>" CssClass="lblContractResponsive marginRight10 lblSpanHeadTrustee text-brand-terciary" />
                                                        </div>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblResponsiveOwnerName" runat="server" Text="<%$FrontEndResources:ContractDetails,TrustreeName%>" CssClass="lblContractResponsive marginRight10 text-brand-terciary" />
                                                        <asp:Label ID="lblTrustreeName" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine col-xs-10 text-brand-terciary" HeaderText="">
                                                    <ItemTemplate>
                                                        <div class="pendingAlignRight">
                                                            <asp:Label runat="server" Text="<%$FrontEndResources:TrusteeEdit,PendingApproval%>"
                                                                ToolTip="<%$FrontEndResources:TrusteeEdit,TrusteeStatusTooltip%>"
                                                                data-toggle="tooltip" data-placement="top" data-container="body" data-original-title=""></asp:Label>

                                                            <asp:Label runat="server" class="img-info" TabIndex="0"
                                                                ToolTip="<%$FrontEndResources:TrusteeEdit,TrusteeStatusTooltip%>"
                                                                data-toggle="tooltip" data-placement="top" data-container="body" data-original-title=""></asp:Label>
                                                        </div>
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

                <%-- PERMISION GROUPS --%>
                <div class="panel">
                    <asp:HiddenField ID="hdnMUCEditOwnerCanEditOwnPermissionGroup" runat="server" />
                    <asp:HiddenField ID="hdnNumberOfOwners" runat="server" />
                    <div id="divPermissionGroup" class="panel-heading collapsed" data-toggle="collapse" data-parent="#<%=divContractDetails.ClientID%>" href="#<%=divPermissionGroupContent.ClientID%>">
                        <div class="col-lg-8 col-max collapse-title remove-background-title edit-tile">
                            <div class="step-info-content">
                                <asp:Literal ID="litPermGroupsTitle" Text="<%$FrontEndResources:ContractDetails,PermGroupsTitle%>" runat="server"></asp:Literal>
                                <span class="collapse-subtitle">
                                    <asp:Literal ID="litPermGroupsSubtitle" runat="server"></asp:Literal>
                                </span>
                            </div>
                            <div class="step-muc-actions">
                                <asp:LinkButton ID="lnkEditPermissionGroups" runat="server" data-toggle="tooltip" TabIndex="0" data-placement="top" data-container="body" ToolTip="<%$FrontEndResources:ContractDetails,EditTooltip%>" CssClass="isAlias btn-edit edit-permissiongroups-button muc-edit" />
                                <asp:LinkButton ID="LinkButton4" runat="server" data-toggle="tooltip" TabIndex="0" data-placement="top" data-container="body" ToolTip="<%$FrontEndResources:ContractDetails,Expand%>" data-original-title="" CssClass="muc-exp-col muc-details-expand "></asp:LinkButton>
                            </div>

                        </div>
                    </div>
                    <div id="divPermissionGroupContent" runat="Server" class=" col-lg-8 col-max panel-collapse collapse">
                        <div class="collapse-content row">
                            <div class="col-xs-12 bs-reduced bs-head-metro">
                                <h3 class="head">
                                    <asp:Literal ID="litPermGroupsTitle2" Text="<%$FrontEndResources:ContractDetails,PermGroupsSubtitle%>" runat="server"></asp:Literal>
                                </h3>
                                <hr class="no-margin" />
                                <div class="ebankit-accordion-list grid-contract-items" id="divPermGroupList" runat="server">
                                    <asp:Repeater ID="rptPermissionGroups" runat="server" OnItemDataBound="RPTPermissionGroups_ItemDataBound">
                                        <HeaderTemplate>
                                            <div id="divPerminissionHeader" class="row table-div-header border-bottom-brand-terciary">
                                                <div class="col-xs-6 text-brand-terciary">
                                                    <asp:Literal ID="litPermGroupsNameTitle" Text="<%$FrontEndResources:ContractDetails,TrustreeName%>" runat="server"></asp:Literal>
                                                </div>
                                                <div class="col-xs-6 text-brand-terciary">
                                                    <asp:Literal ID="Literal1" Text="<%$FrontEndResources:ContractDetails,TrustreeNumber%>" runat="server"></asp:Literal>
                                                </div>
                                            </div>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <div class="panel">
                                                <div id="divPermHeading" runat="server" class="panel-heading collapsed" data-toggle="collapse" tabindex="0" onkeydown="eBankit.Presentation.ContractDetails.KeydownHandler(this, event);" onkeyup="eBankit.Presentation.ContractDetails.KeyupHandler(this, event);">
                                                    <div class="collapse-title">
                                                        <div class="col-xs-6 table-cell">
                                                            <asp:Label ID="lblName" runat="server" />
                                                        </div>
                                                        <div class="col-xs-6 table-cell">
                                                            <asp:Label ID="lblTrustees" runat="server" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div id="divPermGroupContent" runat="Server" class="panel-collapse collapse">
                                                    <h3 class="head">
                                                        <asp:Literal ID="litTrusteeUsers" Text="<%$FrontEndResources:ContractDetails,TrusteeUsers%>" runat="server"></asp:Literal>
                                                    </h3>
                                                    <hr class="no-margin" />
                                                    <div class="grid-contract-items grid-no-pagination">
                                                        <it:GridViewControl ID="gvPermissionTrustees" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow no-margin contractTableResponsive" EmptyDataText="<%$FrontEndResources:ContractDetails,NoPermissionTrustees%>"
                                                            GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="GVPermissionTrustees_RowDataBound">
                                                            <Columns>
                                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important text-brand-terciary" HeaderText="<%$FrontEndResources:ContractDetails,Name%>">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblResponsivePermGroupName" runat="server" Text="<%$FrontEndResources:ContractDetails,Name%>" CssClass="lblContractResponsive marginRight10" />
                                                                        <asp:Label ID="lblName" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important text-brand-terciary" HeaderText="<%$FrontEndResources:ContractDetails,Username%>">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblResponsivePermGroupUsername" runat="server" Text="<%$FrontEndResources:ContractDetails,Username%>" CssClass="lblContractResponsive marginRight10" />
                                                                        <asp:Label ID="lblUserName" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important text-brand-terciary" HeaderText="<%$FrontEndResources:ContractDetails,AlternativeUsername%>">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblResponsivePermGroupAlternativeUsername" runat="server" Text="<%$FrontEndResources:ContractDetails,AlternativeUsername%>" CssClass="lblContractResponsive marginRight10" />
                                                                        <asp:Label ID="lblAlternativeUserName" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>

                                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important text-brand-terciary" HeaderText="<%$FrontEndResources:ContractDetails,SignType%>">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblResponsivePermGroupSignType" runat="server" Text="<%$FrontEndResources:ContractDetails,SignType%>" CssClass="lblContractResponsive marginRight10" />
                                                                        <asp:Label ID="lblSignType" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </it:GridViewControl>
                                                    </div>
                                                    <h3 class="head">
                                                        <asp:Literal ID="litRules" Text="<%$FrontEndResources:ContractDetails,TitleGridRules%>" runat="server"></asp:Literal>
                                                    </h3>
                                                    <hr class="no-margin" />
                                                    <div class="grid-contract-items grid-no-pagination">
                                                        <it:GridViewControl ID="gvRules" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow no-margin contractTableResponsive" EmptyDataText="<%$FrontEndResources:ContractDetails,NoPermissionRules%>"
                                                            GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="GVRules_RowDataBound">
                                                            <Columns>
                                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important" HeaderText="<%$FrontEndResources:ContractDetails,AccountName%>">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblResponsiveRulesAccount" runat="server" Text="<%$FrontEndResources:ContractDetails,AccountName%>" CssClass="lblContractResponsive marginRight10" />
                                                                        <asp:Label ID="lblAccount" runat="server" />
                                                                        <asp:Label ID="lblTooltip" class="img-info account-tooltip" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important" HeaderText="<%$FrontEndResources:ContractDetails,Channel%>">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblResponsiveRulesChannel" runat="server" Text="<%$FrontEndResources:ContractDetails,Channel%>" CssClass="lblContractResponsive marginRight10" />
                                                                        <asp:Label ID="lblChannel" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important" HeaderText="<%$FrontEndResources:ContractDetails,Feature%>">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblResponsiveRulesFeature" runat="server" Text="<%$FrontEndResources:ContractDetails,Permission%>" CssClass="lblContractResponsive marginRight10" />
                                                                        <asp:Label ID="lblFeature" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important" HeaderText="<%$FrontEndResources:GroupEditRule,ddlPermission%>">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblResponsiveRulesPermission" runat="server" Text="<%$FrontEndResources:GroupEditRule,ddlPermission%>" CssClass="lblContractResponsive marginRight10" />
                                                                        <asp:Label ID="lblPermission" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important" HeaderText="<%$FrontEndResources:GroupEditRule,ddlLimitType%>">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblResponsiveLimitType" runat="server" Text="<%$FrontEndResources:GroupEditRule,ddlLimitType%>" CssClass="lblContractResponsive marginRight10" />
                                                                        <asp:Label ID="lblLimitType" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important headerBreakSpace" HeaderText="<%$FrontEndResources:GroupEdit,Limit%>">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblResponsiveRulesLimitPerTransaction" runat="server" Text="<%$FrontEndResources:GroupEdit,Limit%>" CssClass="lblContractResponsive marginRight10" />
                                                                        <asp:Label ID="lblLimitPerTransaction" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important" HeaderText="<%$FrontEndResources:ContractDetails,Periodicity%>">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblResponsiveRulesPeriodicity" runat="server" Text="<%$FrontEndResources:ContractDetails,DailyLimit%>" CssClass="lblContractResponsive marginRight10" />
                                                                        <asp:Label ID="lblPeriodicity" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                            </Columns>
                                                        </it:GridViewControl>
                                                    </div>


                                                    <h3 class="head">
                                                        <asp:Literal ID="Literal4" Text="<%$FrontEndResources:ContractDetails,PermissionGroupSignatures%>" runat="server"></asp:Literal>
                                                    </h3>
                                                    <hr class="no-margin" />
                                                    <div class="grid-contract-items grid-no-pagination">
                                                        <it:GridViewControl ID="GVPermissionGroupSignatures" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow no-margin contractTableResponsive"
                                                            EmptyDataText="<%$FrontEndResources:ContractDetails,NoPermissionGroupSignatures%>"
                                                            GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="GVPermissionGroupSignatures_RowDataBound">
                                                            <Columns>
                                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important" HeaderText="<%$FrontEndResources:ContractDetails,AccountName%>">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblResponsiveRulesAccount" runat="server" Text="<%$FrontEndResources:ContractDetails,AccountName%>" CssClass="lblContractResponsive marginRight10" />
                                                                        <asp:Label ID="lblAccount" runat="server" />
                                                                        <asp:Label ID="lblTooltip" class="img-info account-tooltip" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important" HeaderText="<%$FrontEndResources:ContractDetails,Transaction%>">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblResponsiveTransaction" runat="server" Text="<%$FrontEndResources:ContractDetails,Transaction%>" CssClass="lblContractResponsive marginRight10" />
                                                                        <asp:Label ID="lblTransaction" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important" HeaderText="<%$FrontEndResources:ContractDetails,SignatureRule%>">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblResponsiveSignatureRule" runat="server" Text="<%$FrontEndResources:ContractDetails,SignatureRule%>" CssClass="lblContractResponsive marginRight10" />
                                                                        <asp:Label ID="lblSignatureRule" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important" HeaderText="<%$FrontEndResources:ContractDetails,MinAmount%>">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblResponsiveMinAmount" runat="server" Text="<%$FrontEndResources:ContractDetails,MinAmount%>" CssClass="lblContractResponsive marginRight10" />
                                                                        <asp:Label ID="lblMinAmount" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important" HeaderText="<%$FrontEndResources:ContractDetails,MaxAmount%>">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="lblResponsiveMaxAmount" runat="server" Text="<%$FrontEndResources:ContractDetails,MaxAmount%>" CssClass="lblContractResponsive marginRight10" />
                                                                        <asp:Label ID="lblMaxAmount" runat="server" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateField>


                                                            </Columns>
                                                        </it:GridViewControl>
                                                    </div>

                                                    <div style="margin-bottom: 70px">
                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <%-- CONTRACT SIGNATURES --%>
                <div class="panel">
                    <div id="divContractSignatures" class="panel-heading collapsed" data-toggle="collapse" data-parent="#<%=divContractDetails.ClientID%>" href="#<%=divContractSignaturesContent.ClientID%>">
                        <div class="col-lg-8 col-max collapse-title remove-background-title">
                            <div class="step-info-content">
                                <asp:Literal ID="litContractSignaturesTitle" Text="<%$FrontEndResources:ContractDetails,ContractSignaturesTitle%>" runat="server"></asp:Literal>
                                <span class="collapse-subtitle">
                                    <asp:Literal ID="litContractSignaturesSubtitle" Text="<%$FrontEndResources:ContractDetails,ContractSignaturesSubtitle%>" runat="server"></asp:Literal>
                                </span>
                            </div>

                            <div class="step-muc-actions">
                                <asp:LinkButton ID="lnkEditSignatureRules" runat="server" data-toggle="tooltip" TabIndex="0" data-placement="top" data-container="body" ToolTip="<%$FrontEndResources:ContractDetails,EditTooltip%>" data-original-title="" CssClass="isAlias btn-edit edit-signature-button muc-edit" />
                                <asp:LinkButton ID="LinkButton6" runat="server" data-toggle="tooltip" TabIndex="0" data-placement="top" data-container="body" ToolTip="<%$FrontEndResources:ContractDetails,Expand%>" data-original-title="" CssClass="muc-exp-col muc-details-expand "></asp:LinkButton>
                            </div>
                        </div>
                    </div>
                    <div id="divContractSignaturesContent" runat="Server" class="col-lg-8 col-max panel-collapse collapse">
                        <div class="collapse-content row">
                            <div class="col-xs-12 bs-reduced bs-head-metro">
                                <h3 class="head">
                                    <asp:Literal ID="litContractLimits" Text="<%$FrontEndResources:ContractDetails,ContractLimits%>" runat="server"></asp:Literal>
                                </h3>
                                <hr class="no-margin" />
                                <div class="grid-contract-items grid-no-pagination">
                                    <it:GridViewControl ID="gvLimits" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow no-margin contractTableResponsive" EmptyDataText="<%$FrontEndResources:SignatureEdit,NoLimitRules%>"
                                        GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="GVLimits_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important" HeaderText="<%$FrontEndResources:ContractDetails,Account%>">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblResponsiveAccount" runat="server" Text="<%$FrontEndResources:ContractDetails,Account%>" CssClass="lblContractResponsive marginRight10" />
                                                    <asp:Label ID="lblAccount" runat="server" />
                                                    <asp:Label ID="lblTooltip" class="img-info account-tooltip" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important" HeaderText="<%$FrontEndResources:ContractDetails,Channel%>">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblResponsiveChannel" runat="server" Text="<%$FrontEndResources:ContractDetails,Channel%>" CssClass="lblContractResponsive marginRight10" />
                                                    <asp:Label ID="lblChannel" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important" HeaderText="<%$FrontEndResources:ContractDetails,Feature%>">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblResponsiveFeature" runat="server" Text="<%$FrontEndResources:ContractDetails,Feature%>" CssClass="lblContractResponsive marginRight10" />
                                                    <asp:Label ID="lblFeature" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important" HeaderText="<%$FrontEndResources:GroupEditRule,ddlLimitType%>">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblResponsiveLimitType" runat="server" Text="<%$FrontEndResources:GroupEditRule,ddlLimitType%>" CssClass="lblContractResponsive marginRight10" />
                                                    <asp:Label ID="lblLimitType" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important" HeaderText="<%$FrontEndResources:GroupEdit,Limit%>">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblResponsiveLimitPerTransaction" runat="server" Text="<%$FrontEndResources:GroupEdit,Limit%>" CssClass="lblContractResponsive marginRight10" />
                                                    <asp:Label ID="lblLimitPerTransaction" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important" HeaderText="<%$FrontEndResources:ContractDetails,Periodicity%>">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblResponsivePeriodicity" runat="server" Text="<%$FrontEndResources:ContractDetails,Periodicity%>" CssClass="lblContractResponsive marginRight10" />
                                                    <asp:Label ID="lblPeriodicity" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </it:GridViewControl>
                                </div>
                            </div>
                            <div class="col-xs-12 bs-reduced bs-head-metro">
                                <h3 class="head">
                                    <asp:Literal ID="litSignatures" Text="<%$FrontEndResources:ContractDetails,ContractSignaturesTitle%>" runat="server"></asp:Literal>
                                </h3>
                                <hr class="no-margin" />
                                <div class="grid-contract-items grid-no-pagination">
                                    <it:GridViewControl ID="gvSignatureRules" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow no-margin  contractTableResponsive" EmptyDataText="<%$FrontEndResources:ContractDetails,NoPermissionGroupSignatures%>"
                                        GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="GVSignatureRules_RowDataBound">
                                        <Columns>
                                            <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important text-brand-terciary" HeaderText="<%$FrontEndResources:ContractDetails,Account%>">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblResponsiveSignatureAccount" runat="server" Text="<%$FrontEndResources:ContractDetails,Account%>" CssClass="lblContractResponsive marginRight10" />
                                                    <asp:Label ID="lblAccount" runat="server" />
                                                    <asp:Label ID="lblTooltip" class="img-info account-tooltip" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important text-brand-terciary" HeaderText="<%$FrontEndResources:ContractDetails,Transaction%>">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblResponsiveSignatureTransaction" runat="server" Text="<%$FrontEndResources:ContractDetails,Transaction%>" CssClass="lblContractResponsive marginRight10" />
                                                    <asp:Label ID="lblTransaction" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important text-brand-terciary" HeaderText="<%$FrontEndResources:ContractDetails,SignatureRule%>">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblResponsiveSignatureRule" runat="server" Text="<%$FrontEndResources:ContractDetails,SignatureRule%>" CssClass="lblContractResponsive marginRight10" />
                                                    <asp:Label ID="lblSignatureRule" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important text-brand-terciary" HeaderText="<%$FrontEndResources:ContractDetails,MinAmount%>">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblResponsiveSignatureMinAmount" runat="server" Text="<%$FrontEndResources:ContractDetails,MinAmount%>" CssClass="lblContractResponsive marginRight10" />
                                                    <asp:Label ID="lblMinAmount" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important text-brand-terciary" HeaderText="<%$FrontEndResources:ContractDetails,MaxAmount%>">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblResponsiveSignatureMaxAmount" runat="server" Text="<%$FrontEndResources:ContractDetails,MaxAmount%>" CssClass="lblContractResponsive marginRight10" />
                                                    <asp:Label ID="lblMaxAmount" runat="server" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </it:GridViewControl>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <it:FlowInnerContainer ID="flwHasPendingOperations" Title="<%$FrontEndResources:ContractDetails,Note%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" Visible="false" runat="server">
                    <div class="alertMessagePending" runat="server" id="AlertMessagePending" />

                    <div style="clear: both;" class="divContentMessagesPending">
                        <div>
                            <asp:Label runat="server" ID="lblPrimaryMessagePending" Text="<%$FrontEndResources:EditPermission,PrimaryMessagePending%>" />
                            <br />
                        <asp:Label runat="server" ID="lblSecondaryMessagePending" Text="<%$FrontEndResources:EditPermission,SecondaryMessagePending%>" />

                            <div class="metro">
                            </div>
                            <table>
                                <tr>
                                    <td>
                                        <div class="checkbox-pending">
                                            <label>
                                                <asp:CheckBox ID="chkPending" runat="server" />
                                                <span class="box-check"></span>
                                            </label>
                                        </div>
                                    </td>
                                    <td>
                                        <asp:Label ID="CheckboxPending" runat="server" Text="<%$FrontEndResources:EditPermission,CheckboxPending%>" />
                                    </td>

                                </tr>
                            </table>

                        </div>
                    </div>

                </it:FlowInnerContainer>
            </div>
        </section>
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max trs_buttons">
            <div class="trs_buttons-action">
                <asp:LinkButton ID="btnContractGoBack" runat="server" OnClick="BtnContractGoBack_Click" CssClass="btn btn-default">
                    <asp:Literal ID="litBtnGoBack" Text="<%$FrontEndResources:ContractDetails,BackToDashboard%>" runat="server"></asp:Literal>
                </asp:LinkButton>
                <asp:LinkButton ID="btnCancel" runat="server" OnClick="BtnCancel_Click" CssClass="btn btn-default">
                    <asp:Literal ID="litCancel" Text="<%$FrontEndResources:ContractDetails,CancelBtn%>" runat="server"></asp:Literal>
                </asp:LinkButton>
                <asp:LinkButton ID="btnSave" runat="server" OnClick="BtnSave_Click" CssClass="btn btn-primary btn-save">
                    <asp:Literal ID="litSave" Text="<%$FrontEndResources:ContractDetails,SaveBtn%>" runat="server"></asp:Literal>
                </asp:LinkButton>
            </div>
        </div>
        <%--Bottom disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
        <asp:Literal ID="literalGenericBottom" runat="server"></asp:Literal>
    </div>

    <script>
        var isVirtualEntity = <%= this.IsVirtualEntity.ToString().ToLower() %>;

        var textForExpand = '<%= this.translateExpand %>';
        var textForCollapse = '<%= this.translateCollapse %>';
    </script>

    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/Services/MUC/muc-details-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>

    <style>
        .account-wrapper.item {
            min-height: 70px;
            border-bottom: 1px solid #eee;
        }

        .account-subtitle-header {
            color: #0173a7;
            /* border: solid 1px #ddd; */
            padding: 40px 0px 10px;
            top: 0px;
            /* height: 50px; */
            font-size: 17px;
            font-family: "Gotham Book", "Open Sans", "Arial", "sans-serif";
            padding-top: 0;
        }

        .container-accounts .account-header {
            padding-bottom: 25px;
            height: 35px;
            position: relative;
            display: inline-block;
            width: 100%;
            margin-bottom: 25px;
        }

        .headerBreakSpace {
            white-space: break-spaces !important;
        }

        .custom-muc-chk {
            position: relative;
            display: inline-block;
        }

        .checkbox-description {
            margin-left: 0px !important;
        }

        .width100percent {
            width: 100%;
        }

        .without-line-top {
            border-top: none;
        }

        .edit-title {
            color: black !important;
        }

        .step-info-content {
            width: 70%;
            display: flow-root;
        }
    </style>

</asp:Content>

