<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="EntityDetailsData.ascx.cs" Inherits="eBankit.UI.Modules.Web.AccountOpening.EntityDetailsData" %>
<it:FlowInnerContainer ID="flwContainerIdentification" runat="server" CustomCssClass="panel-login-inputs accountopening-panel">
    <asp:Label ID="Label1" runat="server" class="title-product-account" Text="<%$FrontEndResources:AccountOpening,TitleIdentificationDoc %>"></asp:Label>
    <it:DropDownListControl_v2 ID="ddlDocumentType" runat="server" TextMode="SingleLine" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,DocumentType %>" Watermark="<%$FrontEndResources:AccountOpening,NationalityWatermark %>" />
    <it:TextBoxControl_v2 ID="txtDocNumber" IsRequired="true" ShowLabel="true" TextMode="SingleLine" Label="<%$FrontEndResources:AccountOpening,DocumentNumber %>" runat="server" Watermark="<%$FrontEndResources:AccountOpening,DocumentNumberWatermark %>" />
    <it:TextBoxControl_v2 ID="txtCheckDigitDocument" ShowLabel="true" TextMode="SingleLine" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,CheckDigitDocument %>" runat="server" />
    <it:DatePickerTextBoxMetroControl_v3 ID="dtEmmisionDocument" runat="server" Width="100px" CssClass="field field_v2 metro break datepicker-borderless"
        Label="<%$FrontEndResources:AccountOpening,DateEmission%>"
        IsRequired="true" 
        ValidationMinDateMessage="<%$FrontEndResources:AccountOpening,dtDocumentIDValidateMinDateMessage %>"
        ValidationRequiredMessage="<%$FrontEndResources:AccountOpening,dtDocumentIDValidateRequiredMessage %>"
        ValidationMessage="<%$FrontEndResources:AccountOpening,dtDocumentIDValidateMessage %>" />
    <it:DatePickerTextBoxMetroControl_v3 ID="DateExpiredDocument" runat="server" Width="100px" CssClass="field field_v2 metro break datepicker-borderless"
        Label="<%$FrontEndResources:AccountOpening,DateExpired%>"
        IsRequired="true" 
        ValidationMinDateMessage="<%$FrontEndResources:AccountOpening,dtDocumentIDValidateMinDateMessage %>"
        ValidationRequiredMessage="<%$FrontEndResources:AccountOpening,dtDocumentIDValidateRequiredMessage %>"
        ValidationMessage="<%$FrontEndResources:AccountOpening,dtDocumentIDValidateMessage %>" />
    <it:TextBoxControl_v2 ID="placeOfDocument" ShowLabel="true" TextMode="SingleLine" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,PlaceOfDocument %>" runat="server" Watermark="<%$FrontEndResources:AccountOpening,PlaceOfDocumentWatermark %>" />
</it:FlowInnerContainer>
<it:FlowInnerContainer ID="flwContainerFiscalIdentification" runat="server" CustomCssClass="panel-login-inputs accountopening-panel">
    <asp:Label ID="Label2" runat="server" class="title-product-account" Text="<%$FrontEndResources:AccountOpening,TitleIdentificationNum %>"></asp:Label>
    <it:TextBoxControl_v2 ID="txtNifNumber" ShowLabel="true" TextMode="SingleLine" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,NifNumber %>" runat="server" Watermark="<%$FrontEndResources:AccountOpening,NifNumberWatermark %>" />
    <it:DropDownListControl_v2 ID="ddlTypeNif" runat="server" TextMode="SingleLine" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,TypeNif %>" Watermark="<%$FrontEndResources:AccountOpening,PostalCodeWatermark %>" /> 
    <it:DropDownListControl_v2 ID="ddlFiscalCategory" runat="server" TextMode="SingleLine" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,FiscalCategory%>" Watermark="<%$FrontEndResources:AccountOpening,PostalCodeWatermark %>" /> 
    <it:DropDownListControl_v2 ID="ddlFiscalDepartment" runat="server" TextMode="SingleLine" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,FiscalDepartment%>" Watermark="<%$FrontEndResources:AccountOpening,PostalCodeWatermark %>" /> 
</it:FlowInnerContainer>
<it:FlowInnerContainer ID="flwContainerFiscalAddress" runat="server" CustomCssClass="panel-login-inputs accountopening-panel">
    <asp:Label ID="Label3" runat="server" class="title-product-account" Text="<%$FrontEndResources:AccountOpening,FiscalAddressTitle %>"></asp:Label>
    <it:TextBoxControl_v2 ID="txtFiscalAddress" ShowLabel="true" TextMode="SingleLine" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,Address %>" runat="server" Watermark="<%$FrontEndResources:AccountOpening,AddressWatermark %>" />
    <it:DropDownListControl_v2 ID="ddlFiscalPostalCode" runat="server" TextMode="SingleLine" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,PostalCode %>" Watermark="<%$FrontEndResources:AccountOpening,PostalCodeWatermark %>" /> 
</it:FlowInnerContainer>
<it:FlowInnerContainer ID="flwContainerProfessional" runat="server" CustomCssClass="panel-login-inputs accountopening-panel">
    <asp:Label ID="Label4" runat="server" class="title-product-account" Text="<%$FrontEndResources:AccountOpening,ProfessionalActivityTitle %>"></asp:Label>
    <it:DropDownListControl_v2 ID="ddlJobActivity" runat="server" TextMode="SingleLine" Label="<%$FrontEndResources:AccountOpening,JobActivity %>" Watermark="<%$FrontEndResources:AccountOpening,JobActivityWatermark %>" /> 
    <it:TextBoxControl_v2 ID="txtEmployer" ShowLabel="true" TextMode="SingleLine" Label="<%$FrontEndResources:AccountOpening,Employer %>" runat="server" Watermark="<%$FrontEndResources:AccountOpening,EmployerWatermark %>" />
    <it:DropDownListControl_v2 ID="ddlJob" runat="server" TextMode="SingleLine" Label="<%$FrontEndResources:AccountOpening,Job %>" Watermark="<%$FrontEndResources:AccountOpening,JobWatermark %>" /> 
    <it:TextBoxControl_v2 ID="txtRole" ShowLabel="true" TextMode="SingleLine" Label="<%$FrontEndResources:AccountOpening,Role %>" runat="server" Watermark="<%$FrontEndResources:AccountOpening,RoleWatermark %>" />
</it:FlowInnerContainer>
<it:FlowInnerContainer ID="flwContainerPublicPosition" runat="server" CustomCssClass="panel-login-inputs accountopening-panel">
    <asp:Label ID="Label5" runat="server" class="title-product-account" Text="<%$FrontEndResources:AccountOpening,PublicPosition %>"></asp:Label>
    <asp:Label ID="lblPublicPositionDescription" CssClass="accountopening-field-description" runat="server" Text="<%$FrontEndResources:AccountOpening,PublicPositionDescription%>" />
    <asp:HiddenField ID="hdnPublicPosition" runat="server" />
    <it:FormRadioList_v3 ID="rdlPublicPosition" runat="server" CssClass="big-radioButton accountopening-radiopanel-center" RepeatDirection="Horizontal" HideLabel="true" />
</it:FlowInnerContainer>