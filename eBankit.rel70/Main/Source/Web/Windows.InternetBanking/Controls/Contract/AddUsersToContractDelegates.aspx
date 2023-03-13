<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="AddUsersToContractDelegates.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Controls.Contract.AddUsersToContractDelegates" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TransactionFeaturedContent" runat="server">
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("AddUsersToContractDelegates.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto">
        <h3 class="head head-top">
            <asp:Literal ID="litTitle" Text="<%$FrontEndResources:AddUsersToContractDelegates,Title%>" runat="server"></asp:Literal>
        </h3>
    </div>
    <%--Top disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
     <asp:Literal ID="literalGenericTop" runat="server"></asp:Literal>
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-max divInformational" style="margin: 20px auto">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto">
            <asp:Literal ID="Literal3" Text="<%$FrontEndResources:AddUsersToContractDelegates,Informational%>" runat="server"></asp:Literal>
        </div>
    </div>
    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="TransactionMainContent" runat="server">
    <div id="divMainContent" runat="server">
        <section class="muc costumer-contract-details">
            <div class="ebankit-accordion-list" id="divContractDetails" runat="server">
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro">
                    <h3 class="head">
                        <asp:Literal ID="Literal1" Text="<%$FrontEndResources:AddUsersToContractDelegates,Head%>" runat="server"></asp:Literal>
                    </h3>
                </div>
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro overflowHidden">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 metro content-accounts overflowHidden divList">
                        <div class="contentBoxCorporate box-blue pend-row gridBorderOver">
                            <div class="col-xs-11 col-sm-11 col-md-11 col-lg-11">
                                <label style="cursor: default;">
                                    <asp:Literal ID="Literal2" Text="<%$FrontEndResources:AddUsersToContractDelegates,AddDelegates%>" runat="server"></asp:Literal>
                                    <p class="fileTypeDescription">
                                        <asp:Literal ID="Literal4" Text="<%$FrontEndResources:AddUsersToContractDelegates,AddDelegatesDetails%>" runat="server"></asp:Literal>
                                    </p>
                                </label>
                            </div>
                            <div class="clearBoth"></div>
                        </div>
                    </div>
                </div>
                <div class="clearBoth"></div>
            </div>
        </section>
        <div id="divContent" class="transaction-content" runat="server">
            <it:FlowInnerContainer ID="flwUserData" Title="<%$FrontEndResources:AddUsersToContractDelegates,PersonalInformation%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <div>
                    <it:TextBoxControl_v2 ID="txtAdherentName" autocomplete="off" IsRequired="true" Label="<%$FrontEndResources:AddUsersToContractDelegates,Name%>" runat="server" />
                    <it:EmailTextBoxControl_v2 ID="txtEmail" autocomplete="off" IsRequired="true" CssClass="metro field field_v2 break" Label="<%$FrontEndResources:AddUsersToContractDelegates,Email%>" Watermark="xxx@xxx.xx" runat="server" />
                    <it:PhoneTextBoxControl ID="txtPhone" MinValue="9" CssClass="metro field phone_field_v2 break" IsRequired="true" autocomplete="off" MinLength="9" Label="<%$FrontEndResources:AddUsersToContractDelegates,Phone%>" runat="server" TextMode="Phone" Watermark="xxxxxxxxx" DropDownLabel="<%$FrontEndResources:TRX01005,CountryCode%>" />
                    <it:DropDownListControl_v2 ID="ddlDocumentType" Label="<%$FrontEndResources:AddUsersToContractDelegates,DocumentType%>" runat="server" />
                    <div id="divTxtDocumentNumber" runat="server">
                        <it:TextBoxControl_v2 ID="txtDocumentNumber" MaxLength="20" autocomplete="off" IsRequired="true" Label="<%$FrontEndResources:AddUsersToContractDelegates,DocumentNumber%>" runat="server" />
                    </div>
                </div>
            </it:FlowInnerContainer>
            <it:FlowInnerContainer ID="flwExternalUser" Title="<%$FrontEndResources:AddUsersToContractDelegates,flwExternalUser%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <asp:Literal ID="Literal8" Text="<%$FrontEndResources:AddUsersToContractDelegates,ExternalUserInformation%>" runat="server"></asp:Literal>
                <div>
                    <asp:UpdatePanel ID="updAvailableExternalUserKey" UpdateMode="Always" runat="server">
                        <ContentTemplate>
                            <div class="textbox-available">
                                <span id="spnExternalUserNameActive" class="not-available-icon hidden" runat="server">
                                    <asp:Literal ID="txtExternalUserKeyActive" Text="no" runat="server"></asp:Literal></span>
                                <it:TextBoxControl_v2 ID="txtExternalUserKey" CssClass="" autocomplete="off" IsRequired="true" ValidationRequiredMessage="<%$FrontEndResources:JS,ValidationRequiredInputChangeExternalUserKeyMessage%>" Label="<%$FrontEndResources:AddUsersToContractDelegates,txtExternalUserKey%>" runat="server" />
                                <asp:HiddenField runat="server" id="isInExternalBlackList" />
                                <asp:Button ID="btnVerifyExternalUserKey" runat="server" CssClass="hidden" OnClick="btnVerifyExternalUserKey_Click" />
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </it:FlowInnerContainer>
            <it:FlowInnerContainer ID="flwOmnichannelUser" Title="<%$FrontEndResources:AddUsersToContractDelegates,OmnichannelUser%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <asp:Literal ID="Literal5" Text="<%$FrontEndResources:AddUsersToContractDelegates,OmnichannelUserInformation%>" runat="server"></asp:Literal>
                <div>
                    <asp:UpdatePanel ID="udpAvailableUserName" UpdateMode="Always" runat="server">
                        <ContentTemplate>
                            <div class="textbox-available">
                                <span id="spnUserNameActive" class="not-available-icon hidden" runat="server">
                                    <asp:Literal ID="txtUserNameActive" Text="no" runat="server"></asp:Literal></span>
                                <it:TextBoxControl_v2 ID="txtUserName" CssClass="" autocomplete="off" IsRequired="true" ValidationRequiredMessage="<%$FrontEndResources:JS,ValidationRequiredInputChangeUsernameMessage%>" Label="<%$FrontEndResources:AddUsersToContractDelegates,UserName%>" runat="server" />
                                <asp:HiddenField runat="server" ID="regexPattern" />
                                <asp:HiddenField runat="server" ID="isInBlackList" />
                                <asp:Button ID="btnVerifyUserName" runat="server" CssClass="hidden" OnClick="btnVerifyUserName_Click" />
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </it:FlowInnerContainer>
            <it:FlowInnerContainer ID="flwAccessCodeDefinitions" Title="<%$FrontEndResources:AddUsersToContractDelegates,AccessCodeDefinitions%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <asp:Literal ID="Literal6" Text="<%$FrontEndResources:AddUsersToContractDelegates,AccessCodeDefinitionsformation%>" runat="server"></asp:Literal>
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
            <it:FlowInnerContainer ID="flwAccessCodesLogin" Title="<%$FrontEndResources:AddUsersToContractDelegates,AccessCodesLogin%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <asp:Literal ID="Literal7" Text="<%$FrontEndResources:AddUsersToContractDelegates,AccessCodesLoginformation%>" runat="server"></asp:Literal>
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
            <it:FlowInnerContainer ID="flwExtendedProperties" IsVisible="false" Title="<%$FrontEndResources:AddUsersToContractDelegates,AdditionalData%>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <div>
                    <asp:Repeater ID="rptExtendedProperties" runat="server" OnItemDataBound="rptExtendedProperties_ItemDataBound">
                        <ItemTemplate>
                            <it:TextBoxControl_v2 ID="txtExtendedProperty" MaxLength="120" autocomplete="off" runat="server" />
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </it:FlowInnerContainer>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max trs_buttons">
            <div class="trs_buttons-action">
                <asp:LinkButton ID="btnContractGoBack" runat="server" OnClick="BtnContractGoBack_Click" CssClass="btn btn-default">
                    <asp:Literal ID="litBtnGoBack" Text="<%$FrontEndResources:AddUsersToContractExistingCustomer,ButtonBack%>" runat="server"></asp:Literal>
                </asp:LinkButton>
                <asp:LinkButton ID="btnAddUser" ClientIDMode="Static" runat="server" OnClick="BtnAddUser_Click" CssClass="btn btn-primary btnAddUser">
                    <asp:Literal ID="litBtnTrusteeSave" Text="<%$FrontEndResources:AddUsersToContractExistingCustomer,ButtonSave%>" runat="server"></asp:Literal>
                </asp:LinkButton>
            </div>
        </div>
    </div>
    <%--Bottom disclaimer, represents the content in UMBRACO (or other CMS used on the project) in the ebankIT Publishing > LANGUAGE > INTERNETBANKING > CONTRACT--%>
     <asp:Literal ID="literalGenericBottom" runat="server"></asp:Literal>
    <asp:HiddenField ID="resourceRequerid" ClientIDMode="Static" Value="<%$FrontEndResources:muc,fieldRequiredJs%>" runat="server" />
    <asp:HiddenField ID="fieldRequiredEmailJs" ClientIDMode="Static" Value="<%$FrontEndResources:muc,fieldRequiredEmailJs%>" runat="server" />
    <asp:HiddenField ID="fieldRequiredMobileJs" ClientIDMode="Static" Value="<%$FrontEndResources:muc,fieldRequiredMobileJs%>" runat="server" />
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("AddUsersToContractDelegates.js".ResolveJsUrl("Services/MUC"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>?v2"></script>

</asp:Content>
