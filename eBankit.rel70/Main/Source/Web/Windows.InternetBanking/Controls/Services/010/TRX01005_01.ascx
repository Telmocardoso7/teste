<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01005_01.ascx.cs" Inherits="TRX01005_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div id="divContent" class="transaction-content" runat="server">
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01005-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />

    <it:FlowInnerContainer ID="flwUserData" Title="<%$FrontEndResources:TRX01005,flwUserData%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
        <div>
            <it:TextBoxControl_v2 ID="txtAdherentName" autocomplete="off" IsRequired="true" Label="<%$FrontEndResources:TRX01005,txtAdherentName%>" runat="server" />
            <it:EmailTextBoxControl_v2 ID="txtEmail" autocomplete="off" IsRequired="true" CssClass="metro field field_v2 break" Label="<%$FrontEndResources:TRX01005,txtEmail%>" Watermark="xxx@xxx.xx" runat="server" />
            <it:PhoneTextBoxControl ID="txtPhone" CssClass="metro field phone_field_v2 break" IsRequired="true" autocomplete="off" MinLength="9" Label="<%$FrontEndResources:TRX01005,txtPhone%>" runat="server" TextMode="Phone" Watermark="xxxxxxxxx" DropDownLabel="<%$FrontEndResources:TRX01005,CountryCode%>" />
            <it:DropDownListControl_v2 ID="ddlDocumentType" Label="<%$FrontEndResources:TRX01005,ddlDocumentType%>" runat="server" />
            <div id="divTxtDocumentNumber" runat="server">
                <it:TextBoxControl_v2 ID="txtDocumentNumber" MaxLength="20" autocomplete="off" IsRequired="true" Label="<%$FrontEndResources:TRX01005,txtDocumentNumber%>" runat="server" />
            </div>
        </div>
    </it:FlowInnerContainer>


    <it:FlowInnerContainer ID="flwGroupInfo" Title="<%$FrontEndResources:TRX01005,flwGroupInfo%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
        <div>
            <it:DropDownListControl_v2 ID="ddlProfileType" IsRequired="true" Label="<%$FrontEndResources:TRX01005,ddlProfileType%>" runat="server" />
            <it:DropDownListControl_v2 ID="ddlPermissionGroups" IsRequired ="true" Label="<%$FrontEndResources:TRX01005,ddlPermissionGroups%>" runat="server" />
        </div>
    </it:FlowInnerContainer>

    <it:FlowInnerContainer ID="flwExternalUser" Title="<%$FrontEndResources:TRX01005,flwExternalUser%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
        <div>
            <asp:UpdatePanel ID="updAvailableExternalUserKey" UpdateMode="Always" runat="server">
                <ContentTemplate>
                    <div class="textbox-available">
                        <span id="spnExternalUserNameActive" class="not-available-icon hidden" runat="server">
                            <asp:Literal ID="txtExternalUserKeyActive" Text="no" runat="server"></asp:Literal></span>
                        <it:TextBoxControl_v2 ID="txtExternalUserKey" CssClass="" autocomplete="off" IsRequired="true" ValidationRequiredMessage="<%$FrontEndResources:JS,ValidationRequiredInputChangeExternalUserKeyMessage%>" Label="<%$FrontEndResources:TRX01005,txtExternalUserKey%>" runat="server" />
                        <asp:HiddenField runat="server" id="isInExternalBlackList" />
                        <asp:Button ID="btnVerifyExternalUserKey" runat="server" CssClass="hidden" OnClick="btnVerifyExternalUserKey_Click" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </it:FlowInnerContainer>

    <it:FlowInnerContainer ID="flwOmnichannelUser" Title="<%$FrontEndResources:TRX01005,flwOmnichannelUser%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
        <div>
            <asp:UpdatePanel ID="udpAvailableUserName" UpdateMode="Always" runat="server">
                <ContentTemplate>
                    <div class="textbox-available">
                        <span id="spnUserNameActive" class="not-available-icon hidden" runat="server">
                            <asp:Literal ID="txtUserNameActive" Text="no" runat="server"></asp:Literal></span>
                        <it:TextBoxControl_v2 ID="txtUserName" CssClass="" autocomplete="off" IsRequired="true" ValidationRequiredMessage="<%$FrontEndResources:JS,ValidationRequiredInputChangeUsernameMessage%>" Label="<%$FrontEndResources:TRX01005,txtUserName%>" runat="server" />
                        <asp:HiddenField  runat="server" id="regexPattern" />
                        <asp:HiddenField runat="server" id="isInBlackList" />
                        <asp:Button ID="btnVerifyUserName" runat="server" CssClass="hidden" OnClick="btnVerifyUserName_Click" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </it:FlowInnerContainer>


    <it:FlowInnerContainer ID="flwAccessCodeDefinitions" Title="<%$FrontEndResources:TRX01005,flwAccessCodeDefinitions%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
        <div>
            <asp:Repeater ID="rptAccessCodes" runat="server" OnItemDataBound="rptAccessCodes_ItemDataBound">
                <ItemTemplate>
                    <div id="divAccessCodeInputs" runat="server">
                        <it:CheckBoxSwitchControl_v2 ID="chkActive" Checked="false" Label="<%$FrontEndResources:TRX01005,chkActive%>" AllowOnOff="true" runat="server" />
                        <div id="divAccessCodeSettings" class="conditional-content" runat="server">
                            <it:CheckBoxSwitchControl_v2 ID="chkAutogenerated" Checked="false" Label="<%$FrontEndResources:TRX01005,chkAutogenerated%>" AllowOnOff="true" runat="server" />
                            <it:TextBoxControl_v2 ID="txtAccessCodeValue" autocomplete="off" IsRequired="true" CssClass="field field_v2 metro break conditional-content" runat="server" type="password" />
                            <it:DropDownListControl_v2 ID="ddlDeliveryType" Label="<%$FrontEndResources:TRX01005,ddlDeliveryType%>" IsRequired="true" CssClass="field field_v2 metro break conditional-content" runat="server" />
                            <asp:HiddenField ID="hdnAccessCodeIdData" runat="server" />
                        </div>
                        <br />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </it:FlowInnerContainer>


    <it:FlowInnerContainer ID="flwAccessCodesLogin" Title="<%$FrontEndResources:TRX01005,flwAccessCodesLogin%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
        <div>
            <asp:Repeater ID="rptAccessCodesLogin" runat="server" OnItemDataBound="rptAccessCodesLogin_ItemDataBound">
                <ItemTemplate>
                    <div id="divAccessCodeLoginSettings" runat="server">
                        <it:CheckBoxSwitchControl_v2 ID="chkActiveLogin" Checked="false" AllowOnOff="true" runat="server" />
                        <asp:HiddenField ID="hdnAccessCodeIdLogin" runat="server" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </it:FlowInnerContainer>

    <it:FlowInnerContainer ID="flwExtendedProperties" IsVisible="false" Title="<%$FrontEndResources:TRX01005,additionalData%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
        <div>        
                <asp:Repeater ID="rptExtendedProperties" runat="server" OnItemDataBound="rptExtendedProperties_ItemDataBound">
		            <ItemTemplate>
			            <it:TextBoxControl_v2 ID="txtExtendedProperty" autocomplete="off" MaxLength="120" IsRequired="false" runat="server"/>
		            </ItemTemplate>
	            </asp:Repeater>
        </div>
    </it:FlowInnerContainer>

    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01005-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
</div>
