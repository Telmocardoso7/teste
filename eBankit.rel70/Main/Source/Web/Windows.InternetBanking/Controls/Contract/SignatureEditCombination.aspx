<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="SignatureEditCombination.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Controls.Contract.SignatureEditCombination" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<asp:Content ID="FeaturedContent" ContentPlaceHolderID="TransactionFeaturedContent" runat="server">
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("SignatureEditCombination.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/custom-plugins/multi-select/bootstrap-multiselect.css", eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/custom-plugins/multi-select/bootstrap-multiselect.js",eBankit.Common.Sites.Utils.CacheVersionKey.JScript)%>"></script>
    <script>
        $(document).ready(function () {
            var groups = {};
            $("select option[data-category]").each(function () {
                groups[$.trim($(this).attr("data-category"))] = true;
            });
            $.each(groups, function (c) {
                $("select option[data-category='" + c + "']").wrapAll('<optgroup label="' + c + '">');
            });
            $('.ddlAccountTest').multiselect();
            $('select.ddlAccountTest').attr("tabindex", "-1");
            $('#divMultiSelectAccount button.ddlAccountTest').attr("tabindex", "0");
            $('#divMultiSelectTransactions button.ddlAccountTest').attr("tabindex", "0");

            //Sequences of whitespace will collapse into a single whitespace. Text will wrap when necessary.
            $('li > a > span.checkbox-label').css("white-space", "normal");
        });

    </script>
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto">
        <h3 class="head head-top">
            <asp:Literal ID="litTitle" Text="<%$FrontEndResources:GroupEditSgnature,TitleNew%>" runat="server"></asp:Literal>
        </h3>
    </div>
    <%--Top disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
    <asp:Literal ID="literalGenericTop" runat="server"></asp:Literal>
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-max divInformational" style="margin: 20px auto">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto">
            <asp:Literal ID="Literal3" Text="<%$FrontEndResources:GroupEditSgnature,Informational%>" runat="server"></asp:Literal>
        </div>
    </div>

    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="TransactionMainContent" runat="server">
    <div id="divMainContent" runat="server">
        <section class="muc costumer-contract-details">
            <div class="ebankit-accordion-list col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro muc-no-border-top" id="divContractDetails" runat="server">
                <it:FlowInnerContainer ID="flwImpact" Title="<%$FrontEndResources:GroupEditSgnature,SubTitleImpact%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                    <div class="container">
                        <div class="col-xs-12" id="divMultiSelectAccount">
                            <div class="col-xs-3 multiselect-label-component">
                                <asp:Label runat="server" ID="lblAccId" Text="<%$FrontEndResources:GroupEditRule,ddlAccount%>"></asp:Label>
                            </div>
                            <div class="col-xs-6">
                                <asp:ListBox runat="server" TabIndex="-1" ID="ddlAccount" CssClass="ddlAccountTest" SelectionMode="Multiple" multiple></asp:ListBox>
                                <p class="account-select-description">
                                    <asp:Literal ID="AccountDescription" runat="server"></asp:Literal>
                                </p>
                            </div>
                        </div>
                        <div class="col-xs-12" id="divMultiSelectTransactions">
                            <div class="col-xs-3 multiselect-label-component">
                                <asp:Label runat="server" ID="lblTrx" Text="<%$FrontEndResources:GroupEditRule,ddlTransaction%>"></asp:Label>
                            </div>
                            <div class="col-xs-6">
                                <asp:ListBox runat="server" TabIndex="-1" ID="ddlTransactions" CssClass="ddlAccountTest" SelectionMode="Multiple" multiple></asp:ListBox>
                            </div>
                        </div>
                        <input type="hidden" runat="server" id="hdnCanBeDeleted" />
                    </div>
                </it:FlowInnerContainer>
                <it:FlowInnerContainer ID="flwType" Title="<%$FrontEndResources:GroupEditSgnature,SubTitleType%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                    <div class="border">
                        <div id="divCombinationOne">
                            <div class="row">
                                <it:DropDownListControl_v2 ID="ddlOne1" IsRequired="true" Label="<%$FrontEndResources:GroupEditSgnature,lblCombination1%>" runat="server" DataValueField="ProfileTypeId" DataTextField="ProfileValue" />
                                <it:DropDownListControl_v2 ID="ddlOne2" IsRequired="true" ShowLabel="false" Label="<%$FrontEndResources:GroupEditSgnature,lblCombination1%>" runat="server" DataValueField="ProfileTypeId" DataTextField="ProfileValue" CssClass="field field_v2 metro break hideRequiredCheckMark" />
                                <it:DropDownListControl_v2 ID="ddlOne3" IsRequired="true" ShowLabel="false" Label="<%$FrontEndResources:GroupEditSgnature,lblCombination1%>" runat="server" DataValueField="ProfileTypeId" DataTextField="ProfileValue" CssClass="field field_v2 metro break hideRequiredCheckMark" />
                                <it:DropDownListControl_v2 ID="ddlOne4" IsRequired="true" ShowLabel="false" Label="<%$FrontEndResources:GroupEditSgnature,lblCombination1%>" runat="server" DataValueField="ProfileTypeId" DataTextField="ProfileValue" CssClass="field field_v2 metro break hideRequiredCheckMark" />
                                <it:DropDownListControl_v2 ID="ddlOne5" IsRequired="true" ShowLabel="false" Label="<%$FrontEndResources:GroupEditSgnature,lblCombination1%>" runat="server" DataValueField="ProfileTypeId" DataTextField="ProfileValue" CssClass="field field_v2 metro break hideRequiredCheckMark" />
                            </div>
                        </div>
                        <div id="divCombinationTwo">
                            <div class="row">
                                <it:DropDownListControl_v2 ID="ddlTwo1" Label="<%$FrontEndResources:GroupEditSgnature,lblCombination2%>" runat="server" />
                                <it:DropDownListControl_v2 ID="ddlTwo2" ShowLabel="false" Label="<%$FrontEndResources:GroupEditSgnature,lblCombination2%>" runat="server" DataValueField="ProfileTypeId" DataTextField="ProfileValue" CssClass="field field_v2 metro break hideRequiredCheckMark" />
                                <it:DropDownListControl_v2 ID="ddlTwo3" ShowLabel="false" Label="<%$FrontEndResources:GroupEditSgnature,lblCombination2%>" runat="server" DataValueField="ProfileTypeId" DataTextField="ProfileValue" CssClass="field field_v2 metro break hideRequiredCheckMark" />
                                <it:DropDownListControl_v2 ID="ddlTwo4" ShowLabel="false" Label="<%$FrontEndResources:GroupEditSgnature,lblCombination2%>" runat="server" DataValueField="ProfileTypeId" DataTextField="ProfileValue" CssClass="field field_v2 metro break hideRequiredCheckMark" />
                                <it:DropDownListControl_v2 ID="ddlTwo5" ShowLabel="false" Label="<%$FrontEndResources:GroupEditSgnature,lblCombination2%>" runat="server" DataValueField="ProfileTypeId" DataTextField="ProfileValue" CssClass="field field_v2 metro break hideRequiredCheckMark" />
                            </div>
                        </div>
                        <div id="divCombinationThree">
                            <div class="row">
                                <it:DropDownListControl_v2 ID="ddlThree1" Label="<%$FrontEndResources:GroupEditSgnature,lblCombination3%>" runat="server" />
                                <it:DropDownListControl_v2 ID="ddlThree2" ShowLabel="false" Label="<%$FrontEndResources:GroupEditSgnature,lblCombination3%>" runat="server" DataValueField="ProfileTypeId" DataTextField="ProfileValue" CssClass="field field_v2 metro break hideRequiredCheckMark" />
                                <it:DropDownListControl_v2 ID="ddlThree3" ShowLabel="false" Label="<%$FrontEndResources:GroupEditSgnature,lblCombination3%>" runat="server" DataValueField="ProfileTypeId" DataTextField="ProfileValue" CssClass="field field_v2 metro break hideRequiredCheckMark" />
                                <it:DropDownListControl_v2 ID="ddlThree4" ShowLabel="false" Label="<%$FrontEndResources:GroupEditSgnature,lblCombination3%>" runat="server" DataValueField="ProfileTypeId" DataTextField="ProfileValue" CssClass="field field_v2 metro break hideRequiredCheckMark" />
                                <it:DropDownListControl_v2 ID="ddlThree5" ShowLabel="false" Label="<%$FrontEndResources:GroupEditSgnature,lblCombination3%>" runat="server" DataValueField="ProfileTypeId" DataTextField="ProfileValue" CssClass="field field_v2 metro break hideRequiredCheckMark" />
                            </div>
                        </div>
                    </div>
                </it:FlowInnerContainer>
                <it:FlowInnerContainer ID="flwAmount" Title="<%$FrontEndResources:GroupEditSgnature,SubTitleAmount%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                    <div>
                        <it:TextBoxControl_v2 ID="txtMinimum" autocomplete="off" Label="<%$FrontEndResources:GroupEditSgnature,txtMinimum%>" runat="server" />
                        <it:TextBoxControl_v2 ID="txtMaximum" autocomplete="off" Label="<%$FrontEndResources:GroupEditSgnature,txtMaximum%>" runat="server" />
                        <asp:Label ID="lblMessageAmount" runat="server" Text="<%$FrontEndResources:GroupEditSgnature,MessageAmount%>" CssClass="lblContractResponsive marginRight10" />
                    </div>
                </it:FlowInnerContainer>
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max trs_buttons">
                    <div class="trs_buttons-action">
                        <asp:LinkButton ID="btnGoBack" runat="server" OnClick="BtnGoBack_Click" CssClass="btn btn-default">
                            <asp:Literal ID="litBtnGoBack" Text="<%$FrontEndResources:GroupEditSgnature,ButtonBack%>" runat="server"></asp:Literal>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnSave" runat="server" OnClick="BtnSave_Click" CssClass="btn btn-primary">
                            <asp:Literal ID="litBtnSave" Text="<%$FrontEndResources:GroupEditSgnature,ButtonSave%>" runat="server"></asp:Literal>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <%--Bottom disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
    <asp:Literal ID="literalGenericBottom" runat="server"></asp:Literal>
</asp:Content>
