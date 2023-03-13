<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="GroupEdit.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Controls.Contract.GroupEdit" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Content ID="FeaturedContent" ContentPlaceHolderID="TransactionFeaturedContent" runat="server">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto">
        <h3 class="head head-top">
            <asp:Literal ID="litTitle" Text="<%$FrontEndResources:GroupEdit,Title%>" runat="server"></asp:Literal>
        </h3>
    </div>
    <%--Top disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
    <asp:Literal ID="literalGenericTop" runat="server"></asp:Literal>
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-max divInformational border-bottom-brand-terciary" style="margin: 20px auto">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro text-brand-terciary" style="margin: 20px auto">
            <asp:Literal ID="litInformatinalMessage" Text="<%$FrontEndResources:GroupEdit,Informational%>" runat="server"></asp:Literal>
        </div>
    </div>

    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="TransactionMainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("GroupEdit.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />


    <div id="divMainContent" runat="server" class="col-lg-8 col-max grid-contract-items grid-no-pagination">

        <section class="costumer-contract-details">

            <!-- Name -->
            <div class="ebankit-accordion-list" id="div1" runat="server">
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro">
                    <h3 class="head boldText">
                        <asp:Literal ID="Literal5" Text="<%$FrontEndResources:GroupEdit,TitleTextName%>" runat="server"></asp:Literal>
                    </h3>
                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro groupNameDiv">
                        <div class="metro field field_v2 break width100percent">
                            <it:TextBoxControl_v2 ID="txtGroupName" autocomplete="off" Label="<%$FrontEndResources:GroupEdit,TextGroupName%>" runat="server"></it:TextBoxControl_v2>
                        </div>
                    </div>

                </div>
            </div>

            <!-- Trustees -->
            <div class="ebankit-accordion-list" runat="server">
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro">
                    <h3 class="head boldText">
                        <asp:Literal ID="Literal2" Text="<%$FrontEndResources:GroupEdit,GridTitleTrustee%>" runat="server"></asp:Literal>
                    </h3>
                </div>

                <it:GridViewControl ID="gvTrustrees" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow no-margin contractTableResponsive"
                    EmptyDataText="<%$FrontEndResources:GroupEdit,NoTrustees%>"
                    GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="GVTrustrees_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderStyle-CssClass="col-lg-3 col-md-3 col-sm-3 formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary" HeaderText="<%$FrontEndResources:GroupEdit,TrustreeName%>">
                            <ItemTemplate>
                                <asp:Label ID="lblResponsiveOwnerName" runat="server" Text="<%$FrontEndResources:GroupEdit,TrustreeName%>" CssClass="lblContractResponsive marginRight10" />
                                <asp:Label ID="lblTrustreeName" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias textAlignLeft" />
                                <asp:Label ID="lblCustomerNumber" runat="server" Text="" Visible="false" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="col-lg-3 col-md-3 col-sm-3 formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary" HeaderText="<%$FrontEndResources:GroupEdit,Username%>">
                            <ItemTemplate>
                                <asp:Label ID="lblResponsiveOwnerUsername" runat="server" Text="<%$FrontEndResources:GroupEdit,Username%>" CssClass="lblContractResponsive marginRight10" />
                                <asp:Label ID="lblTrustreeAlias" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias textAlignLeft" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="col-lg-3 col-md-3 col-sm-3 formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary" HeaderText="<%$FrontEndResources:GroupEdit,AlternativeUsername%>">
                            <ItemTemplate>
                                <asp:Label ID="lblResponsiveOwnerAlternativeUsername" runat="server" Text="<%$FrontEndResources:GroupEdit,AlternativeUsername%>" CssClass="lblContractResponsive marginRight10" />
                                <asp:Label ID="lblTrustreeAlternativeAlias" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias textAlignLeft" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="col-lg-2 col-md-2 col-sm-2 formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary" HeaderText="<%$FrontEndResources:GroupEdit,ProfileType%>">
                            <ItemTemplate>
                                <it:DropDownListControl_v2 ID="ddlProfileType" runat="server" CssClass="align-left" ShowLabel="false" Label="<%$FrontEndResources:GroupEdit,ProfileType%>" DataTextField="Description" DataValueField="Id"></it:DropDownListControl_v2>
                                <asp:Label For="ddlProfileType" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="col-md-1 col-sm-1 col-xs-1">
                            <ItemTemplate>
                                <p class="action-buttons">
                                    <asp:LinkButton ID="btnDeleteTrusteeRow" runat="server" ToolTip="<%$FrontEndResources:GroupEdit,ToolTipButtonDeleteTrustee%>"
                                        CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' data-modal="yes" OnClick="btnDeleteTrustee_Click" data-delete-singular=""
                                        CssClass="btn-delete"></asp:LinkButton>
                                </p>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </it:GridViewControl>

                <!-- Button Add Trustee -->
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max trs_buttons">
                    <div class="trs_buttons-action">
                        <asp:LinkButton ID="btnAddTrustee" runat="server" OnClick="BtnAddTrustee_Click" CssClass="btn btn-default">
                            <asp:Literal ID="litBttnAddTrustee" Text="<%$FrontEndResources:GroupEdit,ButtonAddTrustee%>" runat="server"></asp:Literal>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>

            <!-- Limite Rules -->
            <div class="ebankit-accordion-list" id="divUsersIncluded" runat="server">
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro">
                    <h3 class="head boldText">
                        <asp:Literal ID="Literal3" Text="<%$FrontEndResources:GroupEdit,GridTitleLimits%>" runat="server"></asp:Literal>
                    </h3>
                </div>

                <it:GridViewControl ID="gvLimits" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow no-margin contractTableResponsive"
                    EmptyDataText="<%$FrontEndResources:GroupEdit,NoLimitRules%>"
                    GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="GVLimits_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderStyle-CssClass="col-lg-2 col-md-2 col-sm-2 formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary truncate" HeaderText="<%$FrontEndResources:GroupEdit,LimitAccount%>" ItemStyle-CssClass="truncate">
                            <ItemTemplate>
                                <asp:Label ID="lblAccountLimit" runat="server" CssClass="isAlias textAlignLeft" />
                                <asp:Label ID="lblTooltip" class="img-info account-tooltip" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="col-lg-2 col-md-2 col-sm-2 formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary truncate" HeaderText="<%$FrontEndResources:GroupEdit,ChannelName%>" ItemStyle-CssClass="truncate">
                            <ItemTemplate>
                                <asp:Label ID="lblChannel" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="col-lg-2 col-md-2 col-sm-2 formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary truncate" HeaderText="<%$FrontEndResources:GroupEdit,Transaction%>" ItemStyle-CssClass="truncate">
                            <ItemTemplate>
                                <asp:Label ID="lblTransactionLimit" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias textAlignLeft" Width="100%" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="col-lg-2 col-md-2 col-sm-2 formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary truncate" HeaderText="<%$FrontEndResources:GroupEdit,Permission%>" ItemStyle-CssClass="truncate">
                            <ItemTemplate>
                                <asp:Label ID="lblPermission" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="col-lg-2 col-md-2 col-sm-2 formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary truncate" HeaderText="<%$FrontEndResources:GroupEdit,LimitType%>" ItemStyle-CssClass="truncate">
                            <ItemTemplate>
                                <asp:Label ID="lblLimitType" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="col-lg-2 col-md-2 col-sm-2 formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary truncate" HeaderText="<%$FrontEndResources:GroupEdit,Limit%>" ItemStyle-CssClass="truncate">
                            <ItemTemplate>
                                <asp:Label ID="lblLimit" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="col-lg-1 col-md-1 col-sm-1 formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary" HeaderText="<%$FrontEndResources:GroupEdit,Periodicity%>" ItemStyle-CssClass="truncate">
                            <ItemTemplate>
                                <asp:Label ID="lblPeriodicity" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="col-md-2 col-sm-6 col-xs-1 col-xs-offset-2 col-sm-offset-1 col-md-offset-0 ">
                            <ItemTemplate>
                                <p class="action-buttons align-buttons-right">
                                    <asp:LinkButton ID="btnEditLimit" runat="server" ToolTip="<%$FrontEndResources:GroupEdit,ToolTipButtonEditLimit%>" data-container="body" CommandArgument='<%# Eval("AccountNumber") + ";" + Eval("ChannelId") + ";" + Eval("RuleIndexId") %>' data-modal="yes" OnClick="btnEditLimit_Click" CssClass="btn-edit"></asp:LinkButton>
                                    <asp:LinkButton ID="btnDeleteLimitRow" runat="server" ToolTip="<%$FrontEndResources:GroupEdit,ToolTipButtonDeleteTrustee%>" data-container="body" CommandArgument='<%# Eval("RuleIndexId") %>' data-modal="yes" OnClick="btnDeleteLimit_Click" data-delete-second="" CssClass="btn-delete"></asp:LinkButton>
                                </p>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </it:GridViewControl>

                <!-- Button New Limit -->
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max trs_buttons">
                    <div class="trs_buttons-action">
                        <asp:LinkButton ID="btnNewLimit" runat="server" OnClick="BtnNewLimit_Click" CssClass="btn btn-default btn-add-rule">
                            <asp:Literal ID="litBtnNewLimit" Text="<%$FrontEndResources:GroupEdit,ButtonNewLimit%>" runat="server"></asp:Literal>
                        </asp:LinkButton>
                    </div>
                </div>

            </div>

            <!-- Signature Rules -->
            <div class="ebankit-accordion-list" id="div2" runat="server">
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro">
                    <h3 class="head boldText">
                        <asp:Literal ID="litSignature" Text="<%$FrontEndResources:GroupEdit,GridTitleSignatures%>" runat="server"></asp:Literal>
                    </h3>
                </div>

                <it:GridViewControl ID="gvSignatures" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow no-margin contractTableResponsive"
                    EmptyDataText="<%$FrontEndResources:ContractDetails,NoPermissionGroupSignatures%>"
                    GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="GVSignatures_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary" HeaderText="<%$FrontEndResources:GroupEdit,SignatureAccount%>">
                            <ItemTemplate>
                                <asp:Label ID="lblAccountSignature" runat="server" CssClass="isAlias textAlignLeft" />
                                <asp:Label ID="lblTooltip" class="img-info account-tooltip" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary" HeaderText="<%$FrontEndResources:GroupEdit,Transaction%>">
                            <ItemTemplate>
                                <asp:Label ID="lblTransactionSignature" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias textAlignLeft" Width="100%" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary" HeaderText="<%$FrontEndResources:GroupEdit,Rule%>">
                            <ItemTemplate>
                                <asp:Label ID="lblRule" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias textAlignLeft" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary" HeaderText="<%$FrontEndResources:GroupEdit,MinimumAmount%>">
                            <ItemTemplate>
                                <asp:Label ID="lblMinimumAmount" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2 text-brand-terciary" HeaderText="<%$FrontEndResources:GroupEdit,MaximumAmount%>">
                            <ItemTemplate>
                                <asp:Label ID="lblMaximumAmount" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="col-md-2 col-sm-6 col-xs-1 col-xs-offset-2 col-sm-offset-1 col-md-offset-0 text-brand-terciary">
                            <ItemTemplate>
                                <p class="action-buttons align-buttons-right">
                                    <asp:LinkButton ID="btnEditSignature" runat="server" ToolTip="<%$FrontEndResources:GroupEdit,ToolTipButtonEditSignature%>" CommandArgument='<%# Eval("CombinationGroupIndex") %>' data-modal="yes" OnClick="btnEditSignature_Click" CssClass="btn-edit"></asp:LinkButton>
                                    <asp:LinkButton ID="btnDeleteSignatureRow" runat="server" ToolTip="<%$FrontEndResources:GroupEdit,ToolTipButtonDeleteSignature%>" CommandArgument='<%# Eval("CombinationGroupIndex") %>' data-modal="yes" OnClick="btnDeleteSignature_Click" data-delete-second="" CssClass="btn-delete"></asp:LinkButton>
                                </p>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </it:GridViewControl>

                <!-- Button New Signature -->
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max trs_buttons">
                    <div class="trs_buttons-action">
                        <asp:LinkButton ID="btnNewSignature" runat="server" OnClick="BtnNewSignature_Click" CssClass="btn btn-default btn-add-signature">
                            <asp:Literal ID="litBtnNewSignature" Text="<%$FrontEndResources:GroupEdit,ButtonNewLimit%>" runat="server"></asp:Literal>
                        </asp:LinkButton>
                    </div>
                </div>

            </div>

            <!-- Buttons -->
            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max trs_buttons">
                <div class="trs_buttons-action">
                    <asp:LinkButton ID="btnContractGoBack" runat="server" OnClick="BtnContractGoBack_Click" CssClass="btn btn-default">
                        <asp:Literal ID="litBtnGoBack" Text="<%$FrontEndResources:GroupEdit,ButtonBack%>" runat="server"></asp:Literal>
                    </asp:LinkButton>
                    <asp:LinkButton ID="btnLimitSave" runat="server" OnClick="BtnSave_Click" CssClass="btn btn-primary btn-save">
                        <asp:Literal ID="litBtnLimitSave" Text="<%$FrontEndResources:GroupEdit,ButtonSave%>" runat="server"></asp:Literal>
                    </asp:LinkButton>
                </div>
            </div>

        </section>

    </div>
    <%--Bottom disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
    <asp:Literal ID="literalGenericBottom" runat="server"></asp:Literal>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/Services/MUC/group-edit.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>

    <style>
        .truncate {
            width: 100px !important;
            white-space: nowrap !important;
            overflow: hidden !important;
            text-overflow: ellipsis !important;
        }

        .align-buttons-right {
            text-align: right;
        }

        .align-left {
            text-align: left;
        }
    </style>
</asp:Content>
