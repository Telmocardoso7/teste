<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="SignatureEdit.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Controls.Contract.SignatureEdit" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Content ID="Content2" ContentPlaceHolderID="TransactionFeaturedContent" runat="server">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto">
        <h3 class="head head-top">
            <asp:Literal ID="litTitle" Text="<%$FrontEndResources:SignatureEdit,Title%>" runat="server"></asp:Literal>
        </h3>
    </div>
    <%--Top disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
    <asp:Literal ID="literalGenericTop" runat="server"></asp:Literal>
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-max divInformational" style="margin: 20px auto">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto">
            <asp:Literal ID="Literal1" Text="<%$FrontEndResources:SignatureEdit,Informational%>" runat="server"></asp:Literal>
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
                    '<%=eBankit.Common.Globalization.Translate.GetTransactionString("SignatureEdit", "PopupDeteleLimitTitle")%>',
                    '<%=eBankit.Common.Globalization.Translate.GetTransactionString("SignatureEdit", "PopupDeteleLimitMessage")%>',
                    elem.attr("href"), '',
                    '<%=eBankit.Common.Globalization.Translate.GetTransactionString("SignatureEdit", "PopupBtnKeep")%>',
                    '<%=eBankit.Common.Globalization.Translate.GetTransactionString("SignatureEdit", "PopupBtnConfirmDelete")%>');

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
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("GroupEdit.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />


    <div id="divMainContent" runat="server" class="col-lg-8 col-max grid-contract-items grid-no-pagination">

        <section class="costumer-contract-details">

            <!-- Contract Limite -->
            <div class="ebankit-accordion-list" id="divUsersIncluded" runat="server">
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro">
                    <h3 class="head boldText">
                        <asp:Literal ID="Literal3" Text="<%$FrontEndResources:SignatureEdit,GridTitleLimits%>" runat="server"></asp:Literal>
                    </h3>
                </div>

                <it:GridViewControl ID="gvLimits" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow no-margin contractTableResponsive"
                    EmptyDataText="<%$FrontEndResources:SignatureEdit,NoLimitRules%>"
                    GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="GVLimits_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderStyle-CssClass="col-lg-2 col-md-2 col-sm-2 formatTableData whiteSpacePreLine padding8Important col-xs-2" HeaderText="<%$FrontEndResources:GroupEdit,LimitAccount%>">
                            <ItemTemplate>
                                <asp:Label ID="lblAccountLimit" runat="server" CssClass="isAlias textAlignLeft" />
                                <asp:Label ID="lblTooltip" class="img-info account-tooltip" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="col-lg-2 col-md-2 col-sm-2 formatTableData whiteSpacePreLine padding8Important col-xs-2" HeaderText="<%$FrontEndResources:GroupEdit,ChannelName%>">
                            <ItemTemplate>
                                <asp:Label ID="lblChannel" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias textAlignLeft" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="col-lg-2 col-md-2 col-sm-2 formatTableData whiteSpacePreLine padding8Important col-xs-2 truncate" HeaderText="<%$FrontEndResources:GroupEdit,Transaction%>" ItemStyle-CssClass="truncate">
                            <ItemTemplate>
                                <asp:Label ID="lblTransactionLimit" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias textAlignLeft" Width="100%" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="col-lg-2 col-md-2 col-sm-2 formatTableData whiteSpacePreLine padding8Important col-xs-2 truncate" HeaderText="<%$FrontEndResources:GroupEdit,LimitType%>" ItemStyle-CssClass="truncate">
                            <ItemTemplate>
                                <asp:Label ID="lblLimitType" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="col-lg-2 col-md-2 col-sm-2 formatTableData whiteSpacePreLine padding8Important col-xs-2 truncate" HeaderText="<%$FrontEndResources:GroupEdit,Limit%>" ItemStyle-CssClass="truncate">
                            <ItemTemplate>
                                <asp:Label ID="lblLimit" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="col-lg-1 col-md-1 col-sm-1 formatTableData whiteSpacePreLine padding8Important col-xs-2 truncate" HeaderText="<%$FrontEndResources:GroupEdit,Periodicity%>" ItemStyle-CssClass="truncate">
                            <ItemTemplate>
                                <asp:Label ID="lblPeriodicity" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="col-md-2 col-sm-6 col-xs-1 col-xs-offset-2 col-sm-offset-1 col-md-offset-0 ">
                            <ItemTemplate>
                                <p class="action-buttons">
                                    <asp:LinkButton ID="btnEditLimit" runat="server" ToolTip="<%$FrontEndResources:GroupEdit,ToolTipButtonEditLimit%>" data-container="body" CommandArgument='<%# Eval("AccountNumber") + ";" + Eval("ChannelId") + ";" + Eval("RuleIndexId") %>' data-modal="yes" OnClick="btnEditLimit_Click" CssClass="btn-edit"></asp:LinkButton>
                                    <asp:LinkButton ID="btnDeleteLimitRow" runat="server" ToolTip="<%$FrontEndResources:GroupEdit,ToolTipButtonDeleteTrustee%>" data-container="body" CommandArgument='<%# Eval("RuleIndexId") %>' data-modal="yes" OnClick="btnDeleteLimit_Click" data-delete-singular="" CssClass="btn-delete"></asp:LinkButton>
                                </p>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </it:GridViewControl>

                <!-- Button New Limit -->
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max trs_buttons">
                    <div class="trs_buttons-action">
                        <asp:LinkButton ID="btnNewLimit" runat="server" OnClick="BtnNewLimit_Click" CssClass="btn btn-default">
                            <asp:Literal ID="litBtnNewLimit" Text="<%$FrontEndResources:GroupEdit,ButtonNewLimit%>" runat="server"></asp:Literal>
                        </asp:LinkButton>
                    </div>
                </div>

            </div>

            <!-- Signature Rules -->
            <div class="ebankit-accordion-list" id="div2" runat="server">
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro">
                    <h3 class="head boldText">
                        <asp:Literal ID="litSignature" Text="<%$FrontEndResources:SignatureEdit,GridTitleSignatures%>" runat="server"></asp:Literal>
                    </h3>
                </div>

                <it:GridViewControl ID="gvSignatures" runat="server" AutoGenerateColumns="false" IsResponsive="true" CssClass="table hovered table-resp-to1199 noarrow no-margin contractTableResponsive"
                    EmptyDataText="<%$FrontEndResources:SignatureEdit,NoSignatureRules%>"
                    GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="GVSignatures_RowDataBound">
                    <Columns>
                        <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2 header-no-padding" HeaderText="<%$FrontEndResources:GroupEdit,SignatureAccount%>">
                            <ItemTemplate>
                                <asp:Label ID="lblAccountSignature" runat="server" CssClass="isAlias textAlignLeft header-no-padding" />
                                <asp:Label ID="lblTooltip" class="img-info account-tooltip" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2" HeaderText="<%$FrontEndResources:GroupEdit,Transaction%>" ItemStyle-CssClass="truncate">
                            <ItemTemplate>
                                <asp:Label ID="lblTransactionSignature" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias textAlignLeft" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2" HeaderText="<%$FrontEndResources:SignatureEdit,Rule%>">
                            <ItemTemplate>
                                <asp:Label ID="lblRule" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias textAlignLeft" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2" HeaderText="<%$FrontEndResources:GroupEdit,MinimumAmount%>">
                            <ItemTemplate>
                                <asp:Label ID="lblMinimumAmount" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="formatTableData whiteSpacePreLine padding8Important col-xs-2" HeaderText="<%$FrontEndResources:GroupEdit,MaximumAmount%>">
                            <ItemTemplate>
                                <asp:Label ID="lblMaximumAmount" runat="server" data-toggle="tooltip" data-placement="top" data-container="body" data-original-title="" CssClass="isAlias" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderStyle-CssClass="col-md-2 col-sm-6 col-xs-1 col-xs-offset-2 col-sm-offset-1 col-md-offset-0 ">
                            <ItemTemplate>
                                <p class="action-buttons">
                                    <asp:LinkButton ID="btnEditSignature" runat="server" ToolTip="<%$FrontEndResources:GroupEdit,ToolTipButtonEditSignature%>" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' data-modal="yes" OnClick="btnEditSignature_Click" CssClass="btn-edit"></asp:LinkButton>
                                    <asp:LinkButton ID="btnDeleteSignatureRow" runat="server" ToolTip="<%$FrontEndResources:GroupEdit,ToolTipButtonDeleteSignature%>" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>' data-modal="yes" OnClick="btnDeleteSignature_Click" data-delete-singular="" CssClass="btn-delete"></asp:LinkButton>
                                </p>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </it:GridViewControl>

                <!-- Button New Signature -->
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max trs_buttons">
                    <div class="trs_buttons-action">
                        <asp:LinkButton ID="btnNewSignature" runat="server" OnClick="BtnNewSignature_Click" CssClass="btn btn-default">
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
                    <asp:LinkButton ID="btnLimitSave" runat="server" OnClick="BtnSave_Click" CssClass="btn btn-primary">
                        <asp:Literal ID="litBtnSave" Text="<%$FrontEndResources:GroupEdit,ButtonSave%>" runat="server"></asp:Literal>
                    </asp:LinkButton>
                </div>
            </div>

        </section>

    </div>
    <%--Bottom disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
    <asp:Literal ID="literalGenericBottom" runat="server"></asp:Literal>
    <style>
        .custom-muc-chk {
            position: relative;
            display: inline-block;
        }

        .custom-muc-chk-descricption {
            display: inline-block;
            margin-left: 5px !important;
        }

        .lblSubtitleAccountsGrid {
            font-family: "Open Sans";
            font-size: 16px;
            letter-spacing: 0;
            line-height: 22px;
        }

        .truncate {
            width: 250px;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
    </style>

</asp:Content>
