<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="GroupEditRule.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Controls.Contract.GroupEditRule" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TransactionFeaturedContent" runat="server">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto">
        <h3 class="head head-top">
            <asp:Literal ID="litTitle" Text="<%$FrontEndResources:GroupEditRule,Title%>" runat="server"></asp:Literal>
        </h3>
    </div>
    <%--Top disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
    <asp:Literal ID="literalGenericTop" runat="server"></asp:Literal>
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-max divInformational" style="margin: 20px auto">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto">
            <asp:Literal ID="Literal3" Text="<%$FrontEndResources:GroupEditRule,Informational%>" runat="server"></asp:Literal>
        </div>
    </div>

    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="TransactionMainContent" runat="server">
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("GroupEditRule.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    <div id="divMainContent" runat="server" class="col-lg-8 col-max grid-contract-items grid-no-pagination">
        <section class="muc costumer-contract-details">
            <div class="ebankit-accordion-list col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro muc-no-border-top displayInlineBlock" id="divContractDetails" runat="server">
                <it:FlowInnerContainer ID="flwUserData" Title="<%$FrontEndResources:GroupEditRule,RuleSubTitle%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                    <div class="container">
                        <div class="col-xs-12">
                            <div class="col-xs-3 multiselect-label-component">
                                <asp:Label runat="server" ID="lblAccId" Text="<%$FrontEndResources:GroupEditRule,ddlAccount%>" CssClass="leftField-label"></asp:Label>
                            </div>
                            <div class="col-xs-6 marginBottom15px">
                                <asp:ListBox runat="server" ID="ddlAccount" CssClass="ddlAccountTest" SelectionMode="Multiple" multiple></asp:ListBox>
                                <p class="account-select-description">
                                    <asp:Literal ID="AccountDescription" runat="server"></asp:Literal>
                                </p>
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <div class="col-xs-3 multiselect-label-component">
                                <asp:Label runat="server" ID="Label1" Text="<%$FrontEndResources:GroupEditRule,ddlChannel%>" CssClass="leftField-label"></asp:Label>
                            </div>
                            <div class="col-xs-6">
                                <it:DropDownListControl_v2 ID="ddlChannel" runat="server" ShowLabel="false" Label="<%$FrontEndResources:GroupEditRule,ddlChannel%>" IsRequired="True" AutoPostBack="true" />
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <div class="col-xs-3 multiselect-label-component">
                                <asp:Label runat="server" ID="lblTrx" Text="<%$FrontEndResources:GroupEditRule,ddlTransaction%>" CssClass="leftField-label"></asp:Label>
                            </div>
                            <div class="col-xs-6 marginBottom15px">
                                <asp:ListBox runat="server" ID="ddlTransactions" CssClass="ddlAccountTest" SelectionMode="Multiple" multiple></asp:ListBox>
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <div class="col-xs-3 multiselect-label-component">
                                <asp:Label runat="server" ID="Label2" Text="<%$FrontEndResources:GroupEditRule,ddlPermission%>" CssClass="leftField-label"></asp:Label>
                            </div>
                            <div class="col-xs-6">
                                <it:DropDownListControl_v2 ID="ddlPermission" ShowLabel="false" Label="<%$FrontEndResources:GroupEditRule,ddlPermission%>" AutoPostBack="true" IsRequired="true" runat="server" />
                            </div>
                        </div>
                    </div>
                </it:FlowInnerContainer>
                <it:FlowInnerContainer ID="FlowLimtsData" Title="<%$FrontEndResources:GroupEditRule,LimitSubTitle%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                    <div class="container">
                        <div class="col-xs-12" id="divLimitTypes" runat="server">
                            <div class="col-xs-3 multiselect-label-component">
                                <asp:Label runat="server" ID="Label3" Text="<%$FrontEndResources:GroupEditRule,ddlLimitType%>" CssClass="leftField-label"></asp:Label>
                            </div>
                            <div class="col-xs-6">
                                <it:DropDownListControl_v2 ID="ddlLimitType" ShowLabel="false" Label="<%$FrontEndResources:GroupEditRule,ddlLimitType%>" AutoPostBack="true" IsRequired="true" runat="server" />
                            </div>
                        </div>
                        <div id="divLimits" runat="server">
                            <div id="divAmount" runat="server">
                                <div class="col-xs-12">
                                    <div class="col-xs-3 multiselect-label-component">
                                        <asp:Label runat="server" ID="Label4" Text="<%$FrontEndResources:GroupEditRule,txtAmount%>" CssClass="leftField-label"></asp:Label>
                                    </div>
                                    <div class="col-xs-7">
                                        <div class="col-xs-10 padding-left-initial txtAmount-width">
                                            <it:CurrencyTextBoxControlAuto ID="txtAmount" IsRequired="true" ShowLabel="false" Label="<%$FrontEndResources:GroupEditRule,txtAmount%>"
                                                ValidateWithAccountBalance="true"
                                                ShowCurrency="true" AllowValuesUnderOne="true" ShowLimitValidation="true" TransactionId="4" AssetImpactTypeId="1"
                                                MaxLength="0" Width="50%" MinValue="0.01" runat="server" />
                                        </div>

                                        <div class="col-xs-2 platform-currency">
                                            <asp:Label ID="lblPlatformCurrency" runat="server" ClientIDMode="Static" />
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xs-12">
                                    <div class="col-xs-3">&nbsp</div>

                                    <div class="col-xs-6">
                                        <asp:Label ID="lblMgsAccount1" runat="server" Text="<%$FrontEndResources:GroupEditRule,PermissionGroups_RuleLimitValue_MgsAccounts%>" CssClass="marginRight10 account-label-message" />
                                        <asp:Label ID="lblMessageAllAccounts" runat="server" ClientIDMode="Static" Text="<%$FrontEndResources:GroupEditRule,PermissionGroups_AllAccounts%>" CssClass="marginRight10 account-label-message" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-xs-12" id="divAmountPerTransaciotn" runat="server">
                                <div class="col-xs-3 multiselect-label-component">
                                    <asp:Label runat="server" ID="Label6" Text="<%$FrontEndResources:GroupEditRule,txtAmountPerTransaction%>" CssClass="leftField-label"></asp:Label>
                                </div>
                                <div class="col-xs-6 heightNumber">
                                    <it:TextBoxControl_v2 ShowLabel="false" Label="<%$FrontEndResources:GroupEditRule,txtAmountPerTransaction%>" IsNumber="true" ID="txtAmountPerTransaction" autocomplete="off" IsRequired="true" runat="server" />
                                    <asp:Label ID="lblMessageAllAccountsPerTransaction" runat="server" ClientIDMode="Static" Text="<%$FrontEndResources:GroupEditRule,PermissionGroups_AllAccounts%>" CssClass="marginRight10 account-label-message" />
                                </div>
                            </div>
                            <div class="col-xs-12">
                                <div class="col-xs-3 multiselect-label-component">
                                    <asp:Label runat="server" ID="Label5" Text="<%$FrontEndResources:GroupEditRule,ddlPeriodicity%>" CssClass="leftField-label"></asp:Label>
                                </div>
                                <div class="col-xs-6">
                                    <it:DropDownListControl_v2 ID="ddlPeriodicity" ShowLabel="false" Label="<%$FrontEndResources:GroupEditRule,ddlPeriodicity%>" IsRequired="true" runat="server" />
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-12">
                            <it:FlowLabel_v2 ID="lblLimitApplication" Label="<%$FrontEndResources:GroupEditRule,RuleLimitApplication %>" runat="server" />
                        </div>
                    </div>


                </it:FlowInnerContainer>

                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max trs_buttons">
                    <div class="trs_buttons-action">
                        <asp:LinkButton ID="btnGoBack" runat="server" OnClick="BtnGoBack_Click" CssClass="btn btn-default btn-save">
                            <asp:Literal ID="litBtnGoBack" Text="<%$FrontEndResources:GroupEditRule,ButtonCancel%>" runat="server"></asp:Literal>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnSave" runat="server" OnClick="BtnSave_Click" CssClass="btn btn-primary">
                            <asp:Literal ID="litBtnSave" Text="<%$FrontEndResources:GroupEditRule,ButtonSave%>" runat="server"></asp:Literal>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <%--Bottom disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
    <asp:Literal ID="literalGenericBottom" runat="server"></asp:Literal>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/custom-plugins/multi-select/bootstrap-multiselect.js",eBankit.Common.Sites.Utils.CacheVersionKey.JScript)%>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/custom-plugins/multi-select/bootstrap-multiselect.css", eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/Services/MUC/GroupEditRule.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>

    <style>
        .field input[type=text], .field input[type=tel], .field input[type=password], .field select, .field textarea {
            width: 100% !important;
        }

        div#FeaturedContent_TransactionFeaturedContent_divMessage {
            width: 100%;
        }

        .heightNumber input {
            min-height: 38px !important;
            border: solid 1px #c8c8c8;
            color: #000;
        }
    </style>
</asp:Content>
