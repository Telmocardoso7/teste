<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PersonalInformation.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Controls.AccountOpening.Steps.PersonalInformation.PersonalInformation" %>

<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-left clearPadding">
    <p>
        <asp:Label Text="<%$FrontEndResources:AccountOpening,PersonalInformationDescription%>" runat="server" />
    </p>

    <div class="transaction-content">
        <it:flowinnercontainer id="flwData" title="<%$FrontEndResources:AccountOpening,PersonalInformationTitle %>" customcssclass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
    <div id="dataformm">
        <it:TextBoxControl_v2 ID="txtFirstName" autocomplete="off" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,txtFirstName%>" RegexExpression="CONSTANT_NAME"
            ValidationRequiredMessage="<%$ FrontEndResources:AccountOpening,txtFirstNameEmptyError %>" ValidationInvalidInputMessage="<%$ FrontEndResources:AccountOpening,txtFirstNameValidationError %>" runat="server" />

         <it:TextBoxControl_v2 ID="txtLastName" autocomplete="off" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,txtLastName%>" RegexExpression="CONSTANT_NAME"
            ValidationRequiredMessage="<%$ FrontEndResources:AccountOpening,txtLastNameEmptyError %>" ValidationInvalidInputMessage="<%$ FrontEndResources:AccountOpening,txtLastNameValidationError %>" runat="server" />

        <it:DatePickerTextBoxMetroControl_v3 ID="dtBirthDate" IsRequired="true" Width="100px" Label="<%$FrontEndResources:AccountOpening,dtBirthDate%>" CssClass="field field_v2 metro"  runat="server" 
            ValidationMessage="<%$ FrontEndResources:AccountOpening,dtBirthDateValidationError %>" 
            ValidationMaxDateMessage="<%$ FrontEndResources:AccountOpening,dtBirthDateValidationError %>" ValidationRequiredMessage="<%$ FrontEndResources:AccountOpening,dtBirthDateEmptyError %>" />

         <it:DropDownListControl_v2 ID="ddlNationality" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,ddlNationality%>" 
            ValidationRequiredMessage="<%$ FrontEndResources:AccountOpening,ddlNationalityEmptyError %>" runat="server" />
    </div>
    </it:flowinnercontainer>
    </div>
</div>
