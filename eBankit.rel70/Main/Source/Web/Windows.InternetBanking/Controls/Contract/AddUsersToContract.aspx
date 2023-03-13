<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="AddUsersToContract.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Controls.Contract.AddUsersToContract" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TransactionFeaturedContent" runat="server">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto">
        <h3 class="head head-top">
            <asp:Literal ID="litTitle" Text="<%$FrontEndResources:AddUsersToContract,Title%>" runat="server"></asp:Literal>
        </h3>
    </div>
    <%--Top disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
    <asp:Literal ID="literalGenericTop" runat="server"></asp:Literal>
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-max divInformational" style="margin: 20px auto">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto">
            <asp:Literal ID="Literal3" Text="<%$FrontEndResources:AddUsersToContract,Informational%>" runat="server"></asp:Literal>
        </div>
    </div>
    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="TransactionMainContent" runat="server">
    <div id="divMainContent" runat="server">
        <section class="costumer-contract-details">
            <div class="ebankit-accordion-list" id="divContractDetails" runat="server">
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro">
                    <h3 class="head">
                        <asp:Literal ID="Literal1" Text="<%$FrontEndResources:AddUsersToContract,Head%>" runat="server"></asp:Literal>
                    </h3>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro overflowHidden">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 metro content-accounts overflowHidden divList">
                        <div class="contentBoxCorporate box-blue pend-row gridBorderOver">
                            <div class="col-xs-11 col-sm-11 col-md-11 col-lg-11">
                                <label style="cursor: default;">
                                    <asp:Literal ID="Literal2" Text="<%$FrontEndResources:AddUsersToContract,ExistingCustomer%>" runat="server"></asp:Literal>
                                    <p class="fileTypeDescription">
                                        <asp:Literal ID="Literal4" Text="<%$FrontEndResources:AddUsersToContract,ExistingCustomerDetails%>" runat="server"></asp:Literal>
                                    </p>
                                </label>
                            </div>
                            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 btn-container-list">
                                <a title="<%$FrontEndResources:AddUsersToContract,ExistingCustomer%>" runat="server" class="col-xs-3 icon-detail-btn icon-btn" href="/Controls/Contract/AddUsersToContractExistingCustomer.aspx"></a>
                            </div>
                            <div class="clearBoth"></div>
                        </div>
                    </div>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro overflowHidden">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 metro content-accounts overflowHidden divList">
                        <div class="contentBoxCorporate box-blue pend-row gridBorderOver">
                            <div class="col-xs-11 col-sm-11 col-md-11 col-lg-11">
                                <label style="cursor: default;">
                                    <asp:Literal ID="Literal5" Text="<%$FrontEndResources:AddUsersToContract,NonCustomers%>" runat="server"></asp:Literal>
                                    <p class="fileTypeDescription">
                                        <asp:Literal ID="Literal6" Text="<%$FrontEndResources:AddUsersToContract,NonCustomersDetails%>" runat="server"></asp:Literal>
                                    </p>
                                </label>
                            </div>
                            <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 btn-container-list">
                                <a title="<%$FrontEndResources:AddUsersToContract,NonCustomers%>" runat="server" class="col-xs-3 icon-detail-btn icon-btn" href="/Controls/Contract/AddUsersToContractDelegates.aspx"></a>
                            </div>
                            <div class="clearBoth"></div>
                        </div>
                    </div>
                </div>
                <div class="clearBoth"></div>
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max trs_buttons">
                    <div class="trs_buttons-action">
                        <a class="btn btn-default" href="/Controls/Contract/TrusteeEdit.aspx?edited=true">
                            <asp:Literal ID="Literal7" Text="<%$FrontEndResources:AddUsersToContract,Back%>" runat="server"></asp:Literal>
                        </a>
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
        }
    </style>
</asp:Content>
