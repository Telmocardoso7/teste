<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="SummaryData.ascx.cs" Inherits="eBankit.UI.Modules.Web.AccountOpening.SummaryData" %>

<div style="clear:both"></div>
<it:FlowContainer ID="flwContainerSummaryPersonalDataTitle" runat="server" CustomCssClass="accountopening-summary-title-panel">
    <asp:Label ID="Label1" runat="server" class="accountopening-summary-title" Text="<%$FrontEndResources:AccountOpening,PersonalDataTitle %>" />
    <asp:LinkButton ID="lnkPersonalData" runat="server" OnClientClick="SelectTab(" CssClass="accountopening-summary-edit-btn" />
</it:FlowContainer>
<it:FlowInnerContainer ID="flwContainerSummaryPersonalData" runat="server" CustomCssClass="panel-login-inputs accountopening-panel accountopening-panel-summary">
    <it:FlowLabel_v3 ID="lblEntityName" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,EntityName %>" />
    <it:FlowLabel_v3 ID="lblDateBirth" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,DateBirth %>" />
    <it:FlowLabel_v3 ID="lblGender" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,Gender %>" />
    <it:FlowLabel_v3 ID="lblMaritalStatus" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,MaritalStatus %>" />
    <it:FlowLabel_v3 ID="lblWeddingArrangement" Visible="false" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,WeddingArrangement %>" />
    <it:FlowLabel_v3 ID="lblNationality" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,Nationality %>" />
    <%--<it:FlowLabel_v3 ID="lblSecondNationality" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,SecondNationality %>" /> --%>
    <it:FlowLabel_v3 ID="lblNaturality" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,Naturality%>" />
    <it:FlowLabel_v3 ID="lblHomeCountry" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,HomeCountry %>" />
    <it:FlowLabel_v3 ID="lblFatherName" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,FatherName %>" />
    <it:FlowLabel_v3 ID="lblMotherName" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,MotherName %>" />
    <it:FlowLabel_v3 ID="lblAcademicQualifications" CssClass="field break accountopening-field-summary-last" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,AcademicQualifications %>" />
    <it:FlowLabel_v3 ID="lblResidentialCode" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,ResidentialCode %>"/>
</it:FlowInnerContainer>
<div style="clear:both"></div>
<it:FlowContainer ID="flwContainerSummaryAddressTitle" runat="server" CustomCssClass="accountopening-summary-title-panel">
    <asp:Label ID="Label2" runat="server" class="accountopening-summary-title" Text="<%$FrontEndResources:AccountOpening,Address %>" />
    <asp:LinkButton ID="lnkAddress" runat="server" CssClass="accountopening-summary-edit-btn" />
</it:FlowContainer>
<it:FlowInnerContainer ID="flwContainerSummaryAddress" runat="server" CustomCssClass="panel-login-inputs accountopening-panel accountopening-panel-summary">
    <it:FlowLabel_v3 ID="lblAddress" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,AddressTitle %>" />
    <it:FlowLabel_v3 ID="lblPostalCode" CssClass="field break accountopening-field-summary-last" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,PostalCode %>" />
</it:FlowInnerContainer>
<div style="clear:both"></div>
<it:FlowContainer ID="flwContainerSummaryContactsTitle" runat="server" CustomCssClass="accountopening-summary-title-panel">
    <asp:Label ID="Label6" runat="server" class="accountopening-summary-title" Text="<%$FrontEndResources:AccountOpening,ContactsTitle %>" />
    <asp:LinkButton ID="lnkContacts" runat="server" CssClass="accountopening-summary-edit-btn" />
</it:FlowContainer>
<it:FlowInnerContainer ID="flwContainerSummaryContacts" runat="server" CustomCssClass="panel-login-inputs accountopening-panel accountopening-panel-summary">
    <it:FlowLabel_v3 ID="lblEmail" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,Email %>" />
    <it:FlowLabel_v3 ID="lblPhone" CssClass="field break accountopening-field-summary-last" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,Phone %>" />
    <it:FlowLabel_v3 ID="lblPhoneAlternative" CssClass="field break accountopening-field-summary-last" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,PhoneAlternative %>" />
</it:FlowInnerContainer>
<div style="clear:both"></div>
<it:FlowContainer ID="flwContainerSummaryIdentificationTitle" runat="server" CustomCssClass="accountopening-summary-title-panel">
    <asp:Label ID="Label3" runat="server" class="accountopening-summary-title" Text="<%$FrontEndResources:AccountOpening,TitleIdentificationDoc %>" />
    <asp:LinkButton ID="lnkDocumentation" runat="server" CssClass="accountopening-summary-edit-btn" />
</it:FlowContainer>
<it:FlowInnerContainer ID="flwContainerSummaryIdentification" runat="server" CustomCssClass="panel-login-inputs accountopening-panel accountopening-panel-summary">
    <it:FlowLabel_v3 ID="lblDocumentType" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,DocumentType %>" />
    <it:FlowLabel_v3 ID="lblDocumentNumber" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,DocumentNumber %>" />
    <it:FlowLabel_v3 ID="lblCheckDigitDocument" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,CheckDigitDocument %>" />
    <it:FlowLabel_v3 ID="lblDateEmission" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,DateEmission %>" />
    <it:FlowLabel_v3 ID="lblDateExpired" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,DateExpired %>" />
    <it:FlowLabel_v3 ID="lblPlaceOfDocument" CssClass="field break accountopening-field-summary-last" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,PlaceOfDocument %>" />
</it:FlowInnerContainer>
<div style="clear:both"></div>
<it:FlowContainer ID="flwContainerSummaryFiscalIdentificationTitle" runat="server" CustomCssClass="accountopening-summary-title-panel">
    <asp:Label ID="Label4" runat="server" class="accountopening-summary-title" Text="<%$FrontEndResources:AccountOpening,TitleIdentificationNum %>" />
    <asp:LinkButton ID="lnkFiscalInfo" runat="server" CssClass="accountopening-summary-edit-btn" />
</it:FlowContainer>
<it:FlowInnerContainer ID="flwContainerSummaryFiscalIdentification" runat="server" CustomCssClass="panel-login-inputs accountopening-panel accountopening-panel-summary">
    <it:FlowLabel_v3 ID="lblNifNumber" CssClass="field break accountopening-field-summary-last" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,NifNumber %>"  />
    <it:FlowLabel_v3 ID="lblTypeNif" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,TypeNif %>" />
    <it:FlowLabel_v3 ID="lblFiscalCategory" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,FiscalCategory %>" />
    <it:FlowLabel_v3 ID="lblFiscalDepartment" CssClass="field break accountopening-field-summary-last" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,FiscalDepartment %>" />        
</it:FlowInnerContainer>
<div style="clear:both"></div>
<it:FlowContainer ID="flwContainerSummaryFiscalAddressTitle" runat="server" CustomCssClass="accountopening-summary-title-panel">
    <asp:Label ID="Label8" runat="server" class="accountopening-summary-title" Text="<%$FrontEndResources:AccountOpening,FiscalAddressTitle %>" />
    <asp:LinkButton ID="lnkFiscalAddress" runat="server" CssClass="accountopening-summary-edit-btn" />
</it:FlowContainer>
<it:FlowInnerContainer ID="flwContainerSummaryFiscalAddress" runat="server" CustomCssClass="panel-login-inputs accountopening-panel accountopening-panel-summary">
    <it:FlowLabel_v3 ID="lblFiscalAddress" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,Address %>" />
    <it:FlowLabel_v3 ID="lblFiscalPostalCode" CssClass="field break accountopening-field-summary-last" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,PostalCode %>" />
</it:FlowInnerContainer>
<div style="clear:both"></div>
<it:FlowContainer ID="flwContainerSummaryProfessionalTitle" runat="server" CustomCssClass="accountopening-summary-title-panel">
    <asp:Label ID="Label10" runat="server" class="accountopening-summary-title" Text="<%$FrontEndResources:AccountOpening,ProfessionalActivityTitle %>" />
    <asp:LinkButton ID="lnkProfessionalActivity" runat="server" CssClass="accountopening-summary-edit-btn" />
</it:FlowContainer>
<it:FlowInnerContainer ID="flwContainerSummaryProfessional" runat="server" CustomCssClass="panel-login-inputs accountopening-panel accountopening-panel-summary">
    <it:FlowLabel_v3 ID="lblJobActivity" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,JobActivity %>" />
    <it:FlowLabel_v3 ID="lblEmployer" CssClass="field break accountopening-field-summary-last" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,Employer %>" />
    <it:FlowLabel_v3 ID="lblJob" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,Job %>" />
    <it:FlowLabel_v3 ID="lblRole" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,Role %>" />
</it:FlowInnerContainer>
<div style="clear:both"></div>
<it:FlowContainer ID="flwContainerSummaryAccountTypeTitle" runat="server" CustomCssClass="accountopening-summary-title-panel">
    <asp:Label ID="Label5" runat="server" class="accountopening-summary-title" Text="<%$FrontEndResources:AccountOpening,AccountType %>" />
    <asp:LinkButton ID="lnkAccountType" runat="server" CssClass="accountopening-summary-edit-btn" />
</it:FlowContainer>
<it:FlowInnerContainer ID="flwContainerSummaryAccountType" runat="server" CustomCssClass="panel-login-inputs accountopening-panel accountopening-panel-summary">
    <it:FlowLabel_v3 ID="lblAccountType" CssClass="field break accountopening-field-summary-last" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,AccountType  %>" />
</it:FlowInnerContainer>
<div id="divAccountProvisioning" runat="server" visible="true">
    <it:FlowContainer ID="flwContainerSummaryAccountProvisioningTitle" runat="server" CustomCssClass="accountopening-summary-title-panel">
        <asp:Label ID="Label7" runat="server" class="accountopening-summary-title" Text="<%$FrontEndResources:AccountOpening,AccountProvisioning %>" />
        <asp:LinkButton ID="lnkAccountProvisioning" runat="server" CssClass="accountopening-summary-edit-btn" />
    </it:FlowContainer>
    <it:FlowInnerContainer ID="flwContainerSummaryAccountProvisioning" runat="server" CustomCssClass="panel-login-inputs accountopening-panel accountopening-panel-summary">
        <it:FlowLabel_v3 ID="lblAccountProvisioningAmount" CssClass="field break accountopening-field-summary-last" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,AccountProvisioningAmount  %>" />
        <it:FlowLabel_v3 ID="lblAccountProvisioningType" CssClass="field break accountopening-field-summary-last" IsMultiline="true" runat="server" Label="<%$FrontEndResources:AccountOpening,AccountProvisioningType  %>" />
    </it:FlowInnerContainer>
</div>
