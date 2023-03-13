<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TermsAndConditions.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Controls.AccountOpening.Steps.Documents.TermsAndConditions" %>
<%@ Register Src="~/Modules/Subscription/Controls/AccountOpening/TermsDocumentsControl.ascx" TagPrefix="it" TagName="TermsDocumentsControl" %>

<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-left clearPadding">
    <p>
        <asp:Label ID="lblTerms" runat="server" Text="<%$FrontEndResources:AccountOpening,lblTerms%>"></asp:Label>
    </p>
    <it:flowinnercontainer id="flwDownloadDocuments" title="<%$FrontEndResources:AccountOpening,flwTermDocuments%>" customcssclass="col-max bs-reduced bs-head-metro bs-reduced-transaction transaction-collapse-itens document-flowinner" runat="server">
    <div>
        <asp:PlaceHolder ID="phDocuments" runat="server">
            <it:TermsDocumentsControl id="documentContainer" runat="server" />
        </asp:PlaceHolder>
        <div class="row no-margin">
            <div id="checkTerm" class="col-xs-12 checkbox-container">
                <asp:CheckBox ID="ckbAcceptTerms" runat="server" />
                <asp:Label ID="lblAcceptTerms" tabindex="0" runat="server" AssociatedControlID="ckbAcceptTerms" Text="<%$FrontEndResources:AccountOpening,Contracting_AcceptTerms %>" />
                <label id="lblCheckError" class="label-error" style="display: none;">
                    <asp:Literal ID="litCheckError" Text="<%$FrontEndResources:AccountOpening,ckbAcceptTermsEmptyError %>" runat="server"></asp:Literal></label>
            </div>
        </div>
    </div>
    </it:flowinnercontainer>
</div>
