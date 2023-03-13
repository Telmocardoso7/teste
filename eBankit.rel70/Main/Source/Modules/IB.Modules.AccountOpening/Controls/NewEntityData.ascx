<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="NewEntityData.aspx.cs" Inherits="eBankit.UI.Modules.Web.AccountOpening.NewEntityData" %>

<it:FlowInnerContainer ID="flwContainerPersonalData" runat="server" CustomCssClass="panel-login-inputs accountopening-panel">
    <asp:Label ID="Label2" runat="server" class="title-product-account" Text="<%$FrontEndResources:AccountOpening,PersonalDataTitle %>"></asp:Label>
    <it:TextBoxControl_v2 ID="txtName" ShowLabel="true" TextMode="SingleLine" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,EntityName %>" runat="server" Watermark="<%$FrontEndResources:AccountOpening,EntityNameWatermark %>" />
    
    <it:DatePickerTextBoxMetroControl_v3 ID="dtDateBirth" runat="server" Width="100px"
        CssClass="field field_v2 metro break datepicker-borderless"
        Label="<%$FrontEndResources:AccountOpening,DateBirth%>" IsRequired="true"
        ValidationMinDateMessage="<%$FrontEndResources:AccountOpening,dtDocumentIDValidateMinDateMessage %>"
        ValidationRequiredMessage="<%$FrontEndResources:AccountOpening,dtDocumentIDValidateRequiredMessage %>"
        ValidationMessage="<%$FrontEndResources:AccountOpening,dtDocumentIDValidateMessage %>" />

    <asp:HiddenField ID="hdnGenderRadio" runat="server" />
    <it:FormRadioList_v3 ID="rdlGender" runat="server" CssClass="big-radioButton" LabelText="<%$FrontEndResources:AccountOpening,Gender %>" RepeatDirection="Horizontal" HideLabel="false" />
        
    <asp:UpdatePanel ID="updatePanelMaritalStatus" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <Triggers>
             <asp:AsyncPostBackTrigger ControlID="ddlMaritalStatus" EventName="SelectedChanged" />
        </Triggers>
        <ContentTemplate>
            <it:DropDownListControl_v2 EnableViewState="true" ID="ddlMaritalStatus" AutoPostBack="true" OnSelectedChanged="ddlMaritalStatus_SelectedChanged" runat="server" TextMode="SingleLine" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,MaritalStatus%>" Watermark="<%$FrontEndResources:AccountOpening,MaritalStatusWatermark %>" />
            <it:DropDownListControl_v2 ID="ddlWeddingArrangement" runat="server" Visible="false" TextMode="SingleLine" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,WeddingArrangement %>" Watermark="<%$FrontEndResources:AccountOpening,WeddingArrangementWatermark %>" />
        </ContentTemplate>
    </asp:UpdatePanel>

    <it:DropDownListControl_v2 ID="ddlNationality" runat="server" TextMode="SingleLine" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,Nationality %>" Watermark="<%$FrontEndResources:AccountOpening,NationalityWatermark %>" />
    <it:TextBoxControl_v2 ID="txtNaturality" runat="server" ShowLabel="true" TextMode="SingleLine" Label="<%$FrontEndResources:AccountOpening,Naturality%>" IsRequired="True" Watermark="<%$FrontEndResources:AccountOpening,NaturalityWatermark %>" />
    <it:DropDownListControl_v2 ID="ddlHomeCountry" runat="server" TextMode="SingleLine" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,HomeCountry %>" Watermark="<%$FrontEndResources:AccountOpening,HomeCountryWatermark %>" />
    <it:TextBoxControl_v2 ID="txtFatherName" runat="server" ShowLabel="true" TextMode="SingleLine" Label="<%$FrontEndResources:AccountOpening,FatherName %>" IsRequired="True" Watermark="<%$FrontEndResources:AccountOpening,FatherNameWatermark %>" />
    <it:TextBoxControl_v2 ID="txtMotherName" runat="server" ShowLabel="true" TextMode="SingleLine" Label="<%$FrontEndResources:AccountOpening,MotherName %>" IsRequired="True" Watermark="<%$FrontEndResources:AccountOpening,MotherNameWatermark %>" />
    <it:DropDownListControl_v2 ID="ddlAcademicQualifications" runat="server" TextMode="SingleLine" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,AcademicQualifications %>" Watermark="<%$FrontEndResources:AccountOpening,AcademicQualificationsWatermark %>" />
    
    <it:DropDownListControl_v2 ID="ddlResidentialCode" runat="server" TextMode="SingleLine" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,ResidentialCode  %>" Watermark="<%$FrontEndResources:AccountOpening,ResidentialCodeWatermark %>" />
    <it:DropDownListControl_v2 ID="ddlSectorCode" Visible="false" runat="server" TextMode="SingleLine" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,SectorCode %>" Watermark="<%$FrontEndResources:AccountOpening,SectorCodeWatermark %>" />
    
    <asp:HiddenField ID="hdnSectorCode" runat="server" />
    <asp:HiddenField ID="hdnSelectedTab" runat="server" />
</it:FlowInnerContainer>
<it:FlowInnerContainer ID="flwContainerAddress" runat="server" CustomCssClass="panel-login-inputs accountopening-panel">
    <asp:Label ID="Label1" runat="server" class="title-product-account" Text="<%$FrontEndResources:AccountOpening,AddressTitle %>"></asp:Label>
    <it:TextBoxControl_v2 ID="txtAddress" ShowLabel="true" TextMode="SingleLine" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,Address %>" runat="server" Watermark="<%$FrontEndResources:AccountOpening,AddressWatermark %>" />
    <it:DropDownListControl_v2 ID="ddlPostalCode" runat="server" TextMode="SingleLine" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,PostalCode %>" Watermark="<%$FrontEndResources:AccountOpening,PostalCodeWatermark %>" /> 
</it:FlowInnerContainer>
<it:FlowInnerContainer ID="flwContainerContacts" runat="server" CustomCssClass="panel-login-inputs accountopening-panel">
    <asp:Label ID="Label3" runat="server" class="title-product-account" Text="<%$FrontEndResources:AccountOpening,ContactsTitle %>"></asp:Label>
    <it:TextBoxControl_v2 ID="txtEmail" MinLength="7" MaxLength="200" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,Email %>" Watermark="<%$FrontEndResources:AccountOpening,EmailWatermark %>" runat="server" />
    <it:NumberTextBoxControl_v3 ID="txtPhone" ShowToolTipLikeHelp="false" ToolTipKey="txtPhone" ToolTipPlacement="right" MaxLength="20" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,Phone %>" Watermark="<%$FrontEndResources:AccountOpening,PhoneWatermark%>" runat="server" />
    <it:NumberTextBoxControl_v3 ID="txtPhoneAlternative" ShowToolTipLikeHelp="false" ToolTipKey="txtPhoneAlternative" ToolTipPlacement="right" MaxLength="20" IsRequired="true" Label="<%$FrontEndResources:AccountOpening,PhoneAlternative %>" Watermark="<%$FrontEndResources:AccountOpening,PhoneAlternativeWatermark%>" runat="server" />
</it:FlowInnerContainer>
