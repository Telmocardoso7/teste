<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="AddUsersToContractExistingCustomer.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Controls.Contract.AddUsersToContractExistingCustomer" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TransactionFeaturedContent" runat="server">
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("SignatureEditCombination.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto">
        <h3 class="head head-top">
            <asp:Literal ID="litTitle" Text="<%$FrontEndResources:AddUsersToContractExistingCustomer,Title%>" runat="server"></asp:Literal>
        </h3>
    </div>
    <%--Top disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
    <asp:Literal ID="literalGenericTop" runat="server"></asp:Literal>
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-max divInformational" style="margin: 20px auto">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto">
            <asp:Literal ID="Literal3" Text="<%$FrontEndResources:AddUsersToContractExistingCustomer,Informational%>" runat="server"></asp:Literal>
        </div>
    </div>
    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="TransactionMainContent" runat="server">
    <div id="divMainContent" runat="server">
        <section class="muc costumer-contract-details">
            <div class="ebankit-accordion-list" id="divContractDetails" runat="server">
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro">
                    <h3 class="head">
                        <asp:Literal ID="Literal1" Text="<%$FrontEndResources:AddUsersToContractExistingCustomer,Head%>" runat="server"></asp:Literal>
                    </h3>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro overflowHidden">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 metro content-accounts overflowHidden divList">
                        <div class="contentBoxCorporate box-blue pend-row gridBorderOver">
                            <div class="col-xs-11 col-sm-11 col-md-11 col-lg-11">
                                <label style="cursor: default;">
                                    <asp:Literal ID="Literal2" Text="<%$FrontEndResources:AddUsersToContractExistingCustomer,ExistingCustomer%>" runat="server"></asp:Literal>
                                    <p class="fileTypeDescription">
                                        <asp:Literal ID="Literal4" Text="<%$FrontEndResources:AddUsersToContractExistingCustomer,ExistingCustomerDetails%>" runat="server"></asp:Literal>
                                    </p>
                                </label>
                            </div>
                            <div class="clearBoth"></div>
                        </div>
                    </div>
                </div>

                <div class="clearBoth"></div>

                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro">
                    <h3 class="head">
                        <asp:Literal ID="Literal6" Text="<%$FrontEndResources:AddUsersToContractExistingCustomer,PersonalInformation%>" runat="server"></asp:Literal>
                    </h3>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro">
                    <asp:Literal ID="Literal5" Text="<%$FrontEndResources:AddUsersToContractExistingCustomer,PersonalInformationDetail%>" runat="server"></asp:Literal>
                </div>
                <div class="clearBoth"></div>
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro bs-reduced-transaction  transp">
                    <div>
                        <it:TextBoxControl_v2 ID="AddUserName" IsRequired="True" autocomplete="off" Label="<%$FrontEndResources:AddUsersToContractExistingCustomer,AddUserName%>" runat="server" />
                        <it:DatePickerTextBoxMetroControl_v3 ID="AddUserBirthDate" runat="server" Width="100px" CssClass="field field_v2 metro break datepicker-borderless"
                            Label="<%$FrontEndResources:AddUsersToContractExistingCustomer,AddUserBirthDate%>"
                            IsRequired="true"
                            ValidationMinDateMessage="<%$FrontEndResources:AddUsersToContractExistingCustomer,AddUserBirthDate%>"
                            ValidationRequiredMessage="<%$FrontEndResources:AddUsersToContractExistingCustomer,AddUserBirthDate%>"
                            ValidationMessage="<%$FrontEndResources:AddUsersToContractExistingCustomer,AddUserBirthDate%>" />
                        <it:DropDownListControl_v2 Label="<%$FrontEndResources:AddUsersToContractExistingCustomer,AddUserDocumentType%>" ID="ddlAddUserDocumentType" runat="server" IsRequired="True" AutoPostBack="false" />
                        <it:TextBoxControl_v2 ID="AddUserDocumentNumber" IsRequired="True" autocomplete="off" Label="<%$FrontEndResources:AddUsersToContractExistingCustomer,AddUserDocumentNumber%>" runat="server" />
                    </div>
                </div>
                <br />
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max trs_buttons">
                    <div class="trs_buttons-action">
                        <asp:LinkButton ID="btnContractGoBack" runat="server" OnClick="BtnContractGoBack_Click" CssClass="btn btn-default">
                            <asp:Literal ID="litBtnGoBack" Text="<%$FrontEndResources:AddUsersToContractExistingCustomer,ButtonBack%>" runat="server"></asp:Literal>
                        </asp:LinkButton>
                        <asp:LinkButton ID="btnAddUser" runat="server" OnClick="BtnAddUser_Click" CssClass="btn btn-primary">
                            <asp:Literal ID="litBtnTrusteeSave" Text="<%$FrontEndResources:AddUsersToContractExistingCustomer,ButtonSave%>" runat="server"></asp:Literal>
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <%--Bottom disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
    <asp:Literal ID="literalGenericBottom" runat="server"></asp:Literal>
    <style>
        .gridBorderOver {
            border: 1px solid #EDEDED;
            margin-bottom: 10px;
            padding-top: 20px;
            padding-bottom: 20px;
        }

        .divList {
            padding-right: 0px;
            padding-left: 0px;
            background-color: #f9f9f9;
        }
    </style>
</asp:Content>
