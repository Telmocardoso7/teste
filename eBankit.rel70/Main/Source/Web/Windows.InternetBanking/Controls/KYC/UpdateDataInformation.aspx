<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="UpdateDataInformation.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Controls.KYC.UpdateDataInformation" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TransactionFeaturedContent" runat="server">
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("KYC.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto">
        <h3 class="head head-top">
            <asp:Literal ID="litTitle" Text="<%$FrontEndResources:KYC,TitleUpdateData%>" runat="server"></asp:Literal>
        </h3>
    </div>
    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="TransactionMainContent" runat="server">
    <div id="divMainContent" runat="server">
        <div id="divContent" class="transaction-content" runat="server">
            <div class=" grayContainer col-xs-12 col-sm-12 col-md-12 col-lg-12 col-max divInformational ebankit-accordion-list bottomBorderInfoTopMessage" style="padding: 20px; margin-bottom: 40px;">
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto; text-align: left !important">
                    <span class="infoTopMessage">
                        <asp:Literal ID="Literal3" runat="server" Text="<%$FrontEndResources:KYC,InformationUpdateData%>" /></span>
                </div>
            </div>

            <it:FlowInnerContainer ID="flwUserData" Title="<%$FrontEndResources:KYC,Address%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <div>
                    <it:DropDownListControl_v2 ID="selectCountry" IsRequired="true" Label="<%$FrontEndResources:KYC,Country%>" runat="server" />
                    <it:TextBoxControl_v2 ID="txtPostCode" MaxLength="8" autocomplete="off" IsRequired="true" Label="<%$FrontEndResources:KYC,PostCode%>" runat="server" />
                    <it:TextBoxControl_v2 ID="txtAddressLine1" MaxLength="120" autocomplete="off" IsRequired="true" Label="<%$FrontEndResources:KYC,AddressLine1%>" runat="server" />
                    <it:TextBoxControl_v2 ID="txtAddressLine2" MaxLength="120" autocomplete="off" IsRequired="false" Label="<%$FrontEndResources:KYC,AddressLine2%>" runat="server" />
                    <it:TextBoxControl_v2 ID="txtCity" MaxLength="120" autocomplete="off" IsRequired="true" Label="<%$FrontEndResources:KYC,City%>" runat="server" />
                </div>
            </it:FlowInnerContainer>
            <it:FlowInnerContainer ID="flwContacts" Title="<%$FrontEndResources:KYC,Contacts%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <div>
                    <it:PhoneTextBoxControl ID="txtPhone" MinValue="9" CssClass="metro field phone_field_v2 break fnumber" IsRequired="true" autocomplete="off" MinLength="9" Label="<%$FrontEndResources:KYC,Phone%>" runat="server" TextMode="Phone" Watermark="xxxxxxxxx" DropDownLabel="<%$FrontEndResources:TRX01005,CountryCode%>" />
                    <it:EmailTextBoxControl_v2 ID="txtEmail" autocomplete="off" IsRequired="true" CssClass="metro field field_v2 break" Label="<%$FrontEndResources:KYC,Email%>" Watermark="xxx@xxx.xx" runat="server" />
                </div>
            </it:FlowInnerContainer>
            <it:FlowInnerContainer ID="flwExtendedProperties" IsVisible="false" Title="<%$FrontEndResources:EditDelegate,ExtendedPropertiesInfo%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <div>
                    <asp:Repeater ID="rptExtendedProperties" runat="server" OnItemDataBound="rptExtendedProperties_ItemDataBound">
                        <ItemTemplate>
                            <it:TextBoxControl_v2 ID="txtExtendedProperty" MaxLength="120" IsRequired="false" autocomplete="off" runat="server" />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </it:FlowInnerContainer>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max trs_buttons">
            <div class="trs_buttons-action">
                <asp:LinkButton ID="btnCancel" runat="server" OnClick="BtnCancel_Click" CssClass="btn btn-default">
                    <asp:Literal ID="litBtnGoBack" Text="<%$FrontEndResources:KYC,ButtonCancel%>" runat="server"></asp:Literal>
                </asp:LinkButton>
                <asp:LinkButton ID="btnSave" ClientIDMode="Static" runat="server" OnClick="BtnSave_Click" CssClass="btn btn-primary btSaveDataInformation">
                    <asp:Literal ID="litBtnSave" Text="<%$FrontEndResources:KYC,ButtonSave%>" runat="server"></asp:Literal>
                </asp:LinkButton>
            </div>
        </div>
    </div>
    <asp:HiddenField ID="resourceRequerid" ClientIDMode="Static" Value="<%$FrontEndResources:muc,fieldRequiredJs%>" runat="server" />
    <asp:HiddenField ID="fieldRequiredEmailJs" ClientIDMode="Static" Value="<%$FrontEndResources:muc,fieldRequiredEmailJs%>" runat="server" />
    <asp:HiddenField ID="fieldRequiredMobileJs" ClientIDMode="Static" Value="<%$FrontEndResources:muc,fieldRequiredMobileJs%>" runat="server" />
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("updateDataInformation.js".ResolveJsUrl("Services/KYC"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
</asp:Content>
