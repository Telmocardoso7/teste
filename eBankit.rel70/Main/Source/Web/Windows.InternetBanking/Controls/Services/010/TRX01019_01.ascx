<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01019_01.ascx.cs" Inherits="TRX01019_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div id="divContent" runat="server" class="transaction-content">
    <asp:UpdatePanel ID="updContent" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:HiddenField ID="hddCountPendingOperations" runat="server" />
            <it:FlowInnerContainer ID="flwUserTrusteeInfo" Title="<%$FrontEndResources:EditPermission,TrusteeInfo %>" CustomCssClass="bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <div style="clear: both;">
                    <it:FlowLabel_v2 ID="lblTrusteeName" IsRequired="false" MaxLength="0" MinLength="0" Label="<%$FrontEndResources:EditPermission,TrusteeName%>" runat="server" />
                    <it:FlowLabel_v2 ID="lblTrusteeCustomerNumber" IsRequired="false" MaxLength="0" MinLength="0" Label="<%$FrontEndResources:EditPermission,TrusteeCustomerNumber%>" runat="server" />
                    <it:FlowLabel_v2 ID="lblTrusteeProfileType" IsRequired="false" MaxLength="0" MinLength="0" Label="<%$FrontEndResources:EditPermission,TrusteeProfileType%>" runat="server" />
                    <it:FlowLabel_v2 ID="lblTrusteePermissionGroup" IsRequired="false" MaxLength="0" MinLength="0" Label="<%$FrontEndResources:EditPermission,TrusteePermissionGroup%>" runat="server" />
                </div>
            </it:FlowInnerContainer>

            <it:FlowInnerContainer ID="flwAdherentTrusteeInfo" Title="<%$FrontEndResources:EditPermission,TrusteeInfo%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction trx-container" runat="server">
                <div>
                    <it:TextBoxControl_v2 ID="txtAdherentName" autocomplete="off" IsRequired="true" Label="<%$FrontEndResources:TRX01005,txtAdherentName%>" runat="server" />
                    <it:EmailTextBoxControl_v2 ID="txtEmail" autocomplete="off" IsRequired="true" CssClass="metro field field_v2 break" Label="<%$FrontEndResources:TRX01005,txtEmail%>" Watermark="xxx@xxx.xx" runat="server" />
                    <it:PhoneTextBoxControl ID="txtPhone"  CssClass="metro field phone_field_v2 break" IsRequired="true" autocomplete="off" MinLength="9" Label="<%$FrontEndResources:TRX01005,txtAdherentPhone%>" runat="server" TextMode="Phone" Watermark="xxxxxxxxx" DropDownLabel="<%$FrontEndResources:TRX01005,CountryCode%>" />
                    <it:DropDownListControl_v2 ID="ddlDocumentType" Label="<%$FrontEndResources:TRX01005,ddlDocumentType%>" runat="server" />
                    <div id="divTxtDocumentNumber" runat="server">
                        <it:TextBoxControl_v2 ID="txtDocumentNumber" MaxLength="20" autocomplete="off" IsRequired="true" Label="<%$FrontEndResources:TRX01005,txtDocumentNumber%>" runat="server" />
                    </div>
                </div>
            </it:FlowInnerContainer>

            <it:FlowInnerContainer ID="flwGroupInfo" Title="<%$FrontEndResources:EditPermission,GroupInfo%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <div style="clear: both;">
                    <it:DropDownListControl_v2 ID="ddlProfileType" IsRequired="true" Label="<%$FrontEndResources:EditPermission,ddlProfileType%>" runat="server" />
                    <it:DropDownListControl_v2 ID="ddlPermissionGroups" IsRequired="true" Label="<%$FrontEndResources:EditPermission,ddlPermissionGroups%>" runat="server" />
                </div>

            </it:FlowInnerContainer>

            <it:FlowInnerContainer ID="flwExtendedProperties" IsVisible="false" Title="<%$FrontEndResources:EditPermission,ExtendedPropertiesInfo%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <div>
                    <asp:Repeater ID="rptExtendedProperties" runat="server" OnItemDataBound="rptExtendedProperties_ItemDataBound">
                        <ItemTemplate>
                            <it:TextBoxControl_v2 ID="txtExtendedProperty" autocomplete="off" IsRequired="false" MaxLength="120" runat="server" />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </it:FlowInnerContainer>

            <it:FlowInnerContainer ID="flwHasPendingOperations" Title="<%$FrontEndResources:ContractDetails,Note%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" Visible="false" runat="server">
                <div class="alertMessagePending" runat="server" id="AlertMessagePending" />

                <div style="clear: both;" class="divContentMessagesPending">
                    <div>
                        <asp:Label runat="server" ID="lblPrimaryMessagePending" Text="<%$FrontEndResources:EditPermission,PrimaryMessagePending%>" />
                        </br> 
                        <asp:Label runat="server" ID="lblSecondaryMessagePending" Text="<%$FrontEndResources:EditPermission,SecondaryMessagePending%>"/>

                        <div class="metro">
                        </div>
                        <table>
                            <tr>
                                <td>
                                    <div class="checkbox-pending">
                                        <label>
                                            <asp:CheckBox ID="chkPending" runat="server" />
                                            <span class="box-check"></span>
                                        </label>
                                    </div>
                                </td>
                                <td>
                                    <asp:Label ID="CheckboxPending" runat="server" Text="<%$FrontEndResources:EditPermission,CheckboxPending%>" />
                                </td>

                            </tr>
                        </table>

                    </div>
                </div>

            </it:FlowInnerContainer>
        </ContentTemplate>
    </asp:UpdatePanel>

    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/Services/Transactions/TRX01019-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01019-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />    
</div>


