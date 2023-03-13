<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Address.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Controls.AccountOpening.Steps.PersonalInformation.Address" %>

<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-left clearPadding">
    <p>
        <asp:Label Text="<%$FrontEndResources:AccountOpening,AddressDescription%>" runat="server" />
    </p>

    <div class="transaction-content">
        <it:flowinnercontainer id="flwData" title="<%$FrontEndResources:AccountOpening,AddressTitle %>" customcssclass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
    <div id="dataaddress">
        <it:DropDownListControl_v2 ID="ddlCountry" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,ddlCountry%>"
            ValidationRequiredMessage="<%$ FrontEndResources:AccountOpening,ddlCountryEmptyError %>" runat="server" />

        <it:TextBoxControl_v2 ID="txtPostCode" autocomplete="off" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,txtPostCode%>"
            ValidationRequiredMessage="<%$ FrontEndResources:AccountOpening,txtPostCodeEmptyError %>" runat="server" />

        <it:TextBoxControl_v2 ID="txtAddressLine1" autocomplete="off" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,txtAddressLine1%>"
            ValidationRequiredMessage="<%$ FrontEndResources:AccountOpening,txtAddressLine1EmptyError %>" runat="server" />

        <it:TextBoxControl_v2 ID="txtAddressLine2" autocomplete="off" Label="<%$FrontEndResources:AccountOpening,txtAddressLine2%>" runat="server" />

        <it:TextBoxControl_v2 ID="txtTown" autocomplete="off" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,txtTown%>" runat="server"
            ValidationRequiredMessage="<%$ FrontEndResources:AccountOpening,txtTownEmptyError %>" runat="server" />
    </div>
    </it:flowinnercontainer>
    </div>
</div>
