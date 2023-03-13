<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01902_01.ascx.cs" Inherits="TRX01902_01" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<%@ Import Namespace="eBankit.Common" %>
<%@ Import Namespace="eBankit.Common.Extensions" %>

<div id="divContent" runat="server" class="transaction-content">

    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("PendingOperations.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01902-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("contractdetails.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />

    <section class="section-warning content-message metro">
        <div class="stPosition col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max clearPadding">
            <div id="MainContent_TransactionMainContent_divMessage" class="alert alert-warning_v2 fade in widthInherit">
                <h4 class="alert-heading div-warning_v2">
                    <asp:Label runat="server" ID="divGroup" Text='<%$FrontEndResources:transactionCart,checkoutExplanationMessage%>' />
                </h4>
                <div class="clearBoth"></div>
            </div>
        </div>
    </section>
    <input type="hidden" id="OldContractId" runat="server" />
    <div class="clearBoth"></div>
    <section class="costumer-contract-details">
        <div class="ebankit-accordion-list" id="divContractDetails" runat="server">
            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro">
                <h3 class="head">
                    <asp:Literal ID="litContractSummary" Text="<%$FrontEndResources:ContractDetails,ContractDetails%>" runat="server"></asp:Literal>
                </h3>
            </div>
            <%-- CONTRACT TYPE --%>
            <div class="panel">
                <div id="divContractType" class="panel-heading collapsed" data-toggle="collapse" data-parent="#<%=divContractDetails.ClientID%>" href="#<%=divContractTypeContent.ClientID%>">
                    <div class="col-lg-8 col-max collapse-title remove-background-title">
                        <asp:Literal ID="litContractTypeTitle" Text="<%$FrontEndResources:ContractDetails,ContractTypeTitle%>" runat="server"></asp:Literal>
                        <span class="collapse-subtitle">
                            <asp:Literal ID="litContractTypeSubtitle" runat="server"></asp:Literal>
                        </span>
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
                <div id="divPackage" class="panel-heading collapsed" data-toggle="collapse" data-parent="#<%=divContractDetails.ClientID%>" href="#<%=divPackageContent.ClientID%>">
                    <div class="col-lg-8 col-max collapse-title remove-background-title">
                        <asp:Literal ID="litPackageTitle" Text="<%$FrontEndResources:ContractDetails,PackageTitle%>" runat="server"></asp:Literal>
                        <span class="collapse-subtitle">
                            <asp:Literal ID="litPackageSubtitle" runat="server"></asp:Literal>
                        </span>
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
                                    <img id="imgPackage" src="<%$ebFile:~/Content/currenttheme/images/contract_package.png%>" alt="" class="img-profile img-circle" runat="server" />
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
                                                <asp:LinkButton ID="lnkPackageFeatures" runat="server">
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
                        <asp:Literal ID="litContractAccountsTitle" Text="<%$FrontEndResources:ContractDetails,ContractAccountsTitle%>" runat="server"></asp:Literal>
                        <span class="collapse-subtitle">
                            <asp:Literal ID="litContractAccountsSubtitle" runat="server"></asp:Literal>
                        </span>
                        <div class="step-muc-actions">
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
                    {  %>

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
                                    </a>
                                    </td>

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
                        <asp:Literal ID="litContractTrustreesTitle" Text="<%$FrontEndResources:ContractDetails,Trustees%>" runat="server"></asp:Literal>
                        <span class="collapse-subtitle">
                            <asp:Literal ID="litContractTrustreesSubitle" runat="server"></asp:Literal>
                        </span>
                        <div class="step-muc-actions">
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
                <div id="divPermissionGroup" class="panel-heading collapsed" data-toggle="collapse" data-parent="#<%=divContractDetails.ClientID%>" href="#<%=divPermissionGroupContent.ClientID%>">
                    <div class="col-lg-8 col-max collapse-title remove-background-title">
                        <asp:Literal ID="litPermGroupsTitle" Text="<%$FrontEndResources:ContractDetails,PermGroupsTitle%>" runat="server"></asp:Literal>
                        <span class="collapse-subtitle">
                            <asp:Literal ID="litPermGroupsSubtitle" runat="server"></asp:Literal>
                        </span>
                        <div class="step-muc-actions">
                            <asp:LinkButton ID="LinkButton4" runat="server" data-toggle="tooltip" TabIndex="0" data-placement="top" data-container="body" ToolTip="<%$FrontEndResources:ContractDetails,Expand%>" data-original-title="" CssClass="muc-exp-col muc-details-expand "></asp:LinkButton>
                        </div>

                    </div>
                </div>
                <div id="divPermissionGroupContent" runat="Server" class=" col-lg-8 col-max panel-collapse collapse">
                    <div class="collapse-content row">
                        <div class="col-xs-12 bs-reduced bs-head-metro">
                            <h3 class="head">
                                <asp:Literal ID="litPermGroupsTitle2" Text="<%$FrontEndResources:ContractDetails,PermGroupsTitle%>" runat="server"></asp:Literal>
                            </h3>
                            <hr class="no-margin" />
                            <div class="ebankit-accordion-list grid-contract-items" id="divPermGroupList" runat="server">
                                <asp:Repeater ID="rptPermissionGroups" runat="server" OnItemDataBound="RPTPermissionGroups_ItemDataBound">
                                    <HeaderTemplate>
                                        <div id="divPerminissionHeader" class="row table-div-header">
                                            <div class="col-xs-6">
                                                <asp:Literal ID="litPermGroupsNameTitle" Text="<%$FrontEndResources:ContractDetails,TrustreeName%>" runat="server"></asp:Literal>
                                            </div>
                                            <div class="col-xs-6">
                                                <asp:Literal ID="Literal1" Text="<%$FrontEndResources:ContractDetails,TrustreeNumber%>" runat="server"></asp:Literal>
                                            </div>
                                        </div>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <div class="panel">
                                            <div id="divPermHeading" runat="server" class="panel-heading collapsed" data-toggle="collapse">
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
                                                            <%-- <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important" HeaderText="<%$FrontEndResources:ContractDetails,UserId%>">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblResponsivePermGroupUserID" runat="server" Text="<%$FrontEndResources:ContractDetails,UserId%>" CssClass="lblContractResponsive marginRight10" />
                                                                    <asp:Label ID="lblUserId" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>--%>
                                                            <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important" HeaderText="<%$FrontEndResources:ContractDetails,Name%>">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblResponsivePermGroupName" runat="server" Text="<%$FrontEndResources:ContractDetails,Name%>" CssClass="lblContractResponsive marginRight10" />
                                                                    <asp:Label ID="lblName" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important" HeaderText="<%$FrontEndResources:ContractDetails,Username%>">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblResponsivePermGroupUsername" runat="server" Text="<%$FrontEndResources:ContractDetails,Username%>" CssClass="lblContractResponsive marginRight10" />
                                                                    <asp:Label ID="lblUserName" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                            <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important" HeaderText="<%$FrontEndResources:ContractDetails,AlternativeUsername%>">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblResponsivePermGroupAlternativeUsername" runat="server" Text="<%$FrontEndResources:ContractDetails,AlternativeUsername%>" CssClass="lblContractResponsive marginRight10" />
                                                                    <asp:Label ID="lblAlternativeUserName" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>

                                                            <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important" HeaderText="<%$FrontEndResources:ContractDetails,SignType%>">
                                                                <ItemTemplate>
                                                                    <asp:Label ID="lblResponsivePermGroupSignType" runat="server" Text="<%$FrontEndResources:ContractDetails,SignType%>" CssClass="lblContractResponsive marginRight10" />
                                                                    <asp:Label ID="lblSignType" runat="server" />
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </it:GridViewControl>
                                                </div>
                                                <h3 class="head">
                                                    <asp:Literal ID="litRules" Text="<%$FrontEndResources:ContractDetails,Rules%>" runat="server"></asp:Literal>
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
                        <asp:Literal ID="litContractSignaturesTitle" Text="<%$FrontEndResources:ContractDetails,ContractSignaturesTitle%>" runat="server"></asp:Literal>
                        <span class="collapse-subtitle">
                            <asp:Literal ID="litContractSignaturesSubtitle" Text="<%$FrontEndResources:ContractDetails,ContractSignaturesSubtitle%>" runat="server"></asp:Literal>
                        </span>
                        <div class="step-muc-actions">
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
                                <it:GridViewControl ID="gvLimits" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow no-margin contractTableResponsive" EmptyDataText="<%$FrontEndResources:ContractDetails,NoLimits%>"
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
                                        <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important" HeaderText="<%$FrontEndResources:ContractDetails,LimitPerTransaction%>">
                                            <ItemTemplate>
                                                <asp:Label ID="lblResponsiveLimitPerTransaction" runat="server" Text="<%$FrontEndResources:ContractDetails,LimitPerTransaction%>" CssClass="lblContractResponsive marginRight10" />
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
                                <it:GridViewControl ID="gvSignatureRules" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow no-margin  contractTableResponsive" EmptyDataText="<%$FrontEndResources:ContractDetails,NoSignatureRules%>"
                                    GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="GVSignatureRules_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important" HeaderText="<%$FrontEndResources:ContractDetails,Account%>">
                                            <ItemTemplate>
                                                <asp:Label ID="lblResponsiveSignatureAccount" runat="server" Text="<%$FrontEndResources:ContractDetails,Account%>" CssClass="lblContractResponsive marginRight10" />
                                                <asp:Label ID="lblAccount" runat="server" />
                                                <asp:Label ID="lblTooltip" class="img-info account-tooltip" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important" HeaderText="<%$FrontEndResources:ContractDetails,Transaction%>">
                                            <ItemTemplate>
                                                <asp:Label ID="lblResponsiveSignatureTransaction" runat="server" Text="<%$FrontEndResources:ContractDetails,Transaction%>" CssClass="lblContractResponsive marginRight10" />
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
                                                <asp:Label ID="lblResponsiveSignatureMinAmount" runat="server" Text="<%$FrontEndResources:ContractDetails,MinAmount%>" CssClass="lblContractResponsive marginRight10" />
                                                <asp:Label ID="lblMinAmount" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-CssClass="formatTableData padding8Important" HeaderText="<%$FrontEndResources:ContractDetails,MaxAmount%>">
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

        </div>
        <it:FlowInnerContainer ID="flwHasPendingOperations" Title="<%$FrontEndResources:ContractDetails,CancelOperations%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" Visible="false" runat="server">

            <div style="clear: both;" class="divContentMessagesPending">
                <table>
                    <tr>
                        <td>
                            <asp:Label ID="CheckboxPending" runat="server" Text="<%$FrontEndResources:EditPermission,CheckboxPending%>" />
                        </td>
                        <td>
                            <asp:Label ID="chkPendingValue" CssClass="chkPendingValue" runat="server" />
                        </td>
                    </tr>
                </table>

            </div>
        </it:FlowInnerContainer>
    </section>

    <script>
        var textForExpand = '<%= this.translateExpand %>';
        var textForCollapse = '<%= this.translateCollapse %>';
    </script>

    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/Services/Transactions/TRX01902-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
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
    </style>

</div>
