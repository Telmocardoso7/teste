<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Transaction.Master" AutoEventWireup="true" CodeBehind="EditDelegate.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Controls.Contract.EditDelegate" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TransactionFeaturedContent" runat="server">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto">
        <h3 class="head head-top">
            <asp:Literal ID="litTitle" Text="<%$FrontEndResources:EditDelegate,Title%>" runat="server"></asp:Literal>
        </h3>
    </div>
    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="TransactionMainContent" runat="server">
    
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("editdelegate.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" /> 

    <div id="divMainContent" runat="server" class="transaction-content">

        <it:FlowInnerContainer ID="flwMandatoryData" Title="<%$FrontEndResources:EditDelegate,PersonalInfo%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction trx-container" runat="server">
            <div>
                <it:TextBoxControl_v2 ID="txtName" autocomplete="off" IsRequired="true" Label="<%$FrontEndResources:EditDelegate,txtName%>" runat="server" ShowRequired="true" />
                <it:TextBoxControl_v2 ID="txtEmail" autocomplete="off" IsRequired="true" Label="<%$FrontEndResources:EditDelegate,txtEmail%>" runat="server" />
                <it:PhoneTextBoxControl ID="txtPhone" IsRequired="true" MinLength="9" CssClass="metro field phone_field_v2 break" autocomplete="off" Label="<%$FrontEndResources:EditDelegate,txtPhoneNumber%>" runat="server" TextMode="Phone" Watermark="xxxxxxxxx" />
                <it:DropDownListControl_v2 ID="ddlDocumentType" runat="server" Label="<%$FrontEndResources:EditDelegate,ddlDocumentType%>" />
                <div id="divTxtDocumentNumber" runat="server">
                    <it:TextBoxControl_v2 ID="txtDocumentNumber" autocomplete="off" IsRequired="true" Label="<%$FrontEndResources:EditDelegate,txtDocumentNumber%>" runat="server" />
                </div>
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
        <br />
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max trs_buttons">
            <div class="trs_buttons-action">
                <asp:LinkButton ID="btnGoBack" runat="server" OnClick="btnGoBack_Click" CssClass="btn btn-default">
                    <asp:Literal ID="litBtnGoBack" Text="<%$FrontEndResources:EditDelegate,ButtonBack%>" runat="server"></asp:Literal>
                </asp:LinkButton>
                <asp:LinkButton ID="btnSave" runat="server" OnClick="btnSave_Click" CssClass="btn btn-primary">
                    <asp:Literal ID="litBtnSave" Text="<%$FrontEndResources:EditDelegate,ButtonSave%>" runat="server"></asp:Literal>
                </asp:LinkButton>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/Services/MUC/delegate-edit-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>   

</asp:Content>
