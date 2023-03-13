<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Conclusion.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Controls.AccountOpening.Steps.Conclusion.Conclusion" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<%@ Register TagPrefix="it" Namespace="eBankit.UI.Modules.Web.ProductSubscription.Orchestration.BaseControls.DocumentList" Assembly="eBankit.UI.Modules.Web.ProductSubscription" %>

<it:PS_OutputMessageControl id="outputMessageControl" runat="server" />



<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-left clearPadding">
    <h3>
        <asp:Label Text="<%$FrontEndResources:AccountOpening,ConclusionSubTitle%>" runat="server" /></h3>
    <p>
        <asp:Label ID="conclusionDescriptionResource" runat="server" />
    </p>
</div>

<div class="proof-inner" id="aoProofControl" runat="server">
    <div class="printcmmds noprint">
        <asp:Repeater ID="rptAOProofControl" runat="server" OnItemDataBound="rptAOProofControl_ItemDataBound">
            <HeaderTemplate>
                <ul class="col-lg-8 col-max">
            </HeaderTemplate>
            <ItemTemplate>
                <li id="liTabContainer" runat="server">
                    <asp:Image ID="aoProofImage" runat="server" ImageAlign="Middle" />
                    <a><span>
                        <asp:Literal ID="litTabTitle" runat="server"></asp:Literal>
                    </span></a>
                </li>
            </ItemTemplate>
            <FooterTemplate>
                </ul>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</div>

<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-left clearPadding">
    <div class="tab-content">
        <div id="divDocumentsToDownload" class="tab-pane" runat="server">
            <asp:PlaceHolder ID="phDocuments" runat="server">
                <%@ Register Src="~/Modules/Subscription/Controls/AccountOpening/TermsDocumentsControl.ascx" TagPrefix="it" TagName="TermsDocumentsControl" %>
                <it:termsdocumentscontrol id="documentContainer" runat="server" />
            </asp:PlaceHolder>
        </div>
        <div id="divNavigateToAO" class="tab-pane" runat="server">
            <asp:Repeater ID="rptNavigate" runat="server" OnItemDataBound="rptAONavigateTo_ItemDataBound">
                <ItemTemplate>
                    <div id="repeaterDiv" runat="server" class="ao-proof-panel-conclusion">
                        <asp:Image ID="aoNavigateImage" runat="server" ImageAlign="Middle" />
                        <a><span>
                            <asp:Literal ID="litNavigateTitle" runat="server"></asp:Literal>
                        </span></a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
            <hr />
        </div>
    </div>

    <div id="div_Details" runat="server">
        <asp:Panel ID="pnControls" CssClass="clearPadding" runat="server">
            <it:flowinnercontainer id="flw_Details_AccountDetails" customcssclass="col-max bs-reduced bs-head-metro bs-reduced-transaction" title="<%$FrontEndResources:AccountOpening,AccountDetails %>" runat="server">
                <div>
                    <it:FlowLabel_v3 ID="flw_product" runat="server" Label="<%$FrontEndResources:AccountOpening,Product%>" />
                    <it:FlowLabel_v3 ID="flw_accountname" runat="server" Label="<%$FrontEndResources:AccountOpening,AccountName%>" />
                    <it:FlowLabel_v3 ID="flw_accountnumber" runat="server" Visible="false" Label="<%$FrontEndResources:AccountOpening,AccountNumber%>" />
                </div>
            </it:flowinnercontainer>
            <it:flowinnercontainer id="flw_Details_PersonalInfo" customcssclass="col-max bs-reduced bs-head-metro bs-reduced-transaction" title="<%$FrontEndResources:AccountOpening,PersonalInformation %>" runat="server">
                <div>
                    <it:FlowLabel_v3 ID="flw_firstname" runat="server" Label="<%$FrontEndResources:AccountOpening,FirstName%>" />
                    <it:FlowLabel_v3 ID="flw_lastname" runat="server" Label="<%$FrontEndResources:AccountOpening,LastName%>" />
                    <it:FlowLabel_v3 ID="flw_birthdate" runat="server" Label="<%$FrontEndResources:AccountOpening,BirthDate%>" />
                    <it:FlowLabel_v3 ID="flw_nationality" runat="server" Label="<%$FrontEndResources:AccountOpening,Nationality%>" />
                </div>
            </it:flowinnercontainer>
            <it:flowinnercontainer id="flw_Details_Address" customcssclass="col-max bs-reduced bs-head-metro bs-reduced-transaction" title="<%$FrontEndResources:AccountOpening,Address %>" runat="server">
                <div>
                    <it:FlowLabel_v3 ID="flw_country_region" runat="server" Label="<%$FrontEndResources:AccountOpening,CountryAndRegion%>" />
                    <it:FlowLabel_v3 ID="flw_postcode" runat="server" Label="<%$FrontEndResources:AccountOpening,Postcode%>" />
                    <it:FlowLabel_v3 ID="flw_streetaddress" runat="server" Label="<%$FrontEndResources:AccountOpening,StreetAddress%>" />
                    <it:FlowLabel_v3 ID="flw_towncity" runat="server" Label="<%$FrontEndResources:AccountOpening,TownCity%>" />
                </div>
            </it:flowinnercontainer>
        </asp:Panel>
    </div>
</div>
