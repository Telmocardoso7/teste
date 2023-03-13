<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DocumentListControl.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Controls.DocumentListControl" %>

<%@ Register TagPrefix="it" Namespace="eBankit.UI.Modules.Web.ProductSubscription.Orchestration.BaseControls.DocumentList" Assembly="eBankit.UI.Modules.Web.ProductSubscription" %>

<it:flowinnercontainer id="flwDownloadDocuments" title="<%$FrontEndResources:ProductSubscription,flwUDownloadDocument%>" visible="false" customcssclass="col-max bs-reduced bs-head-metro bs-reduced-transaction transaction-collapse-itens document-flowinner" runat="server">
        <div>
            <it:DocumentRepeater id="DownloadDocumentsContainer" runat="server" />
        </div>
    </it:flowinnercontainer>


<it:flowinnercontainer id="flwUploadDocuments" title="<%$FrontEndResources:ProductSubscription,flwUploadDocument %>" visible="false" customcssclass="col-max bs-reduced bs-head-metro bs-reduced-transaction transaction-collapse-itens document-flowinner" runat="server">
    <asp:Label ID="lblUploadValidationInfo" runat="server" Visible="false"></asp:Label>
        <div id="validationContainer" class="validation-file-container">
            <it:DocumentRepeater id="UploadDocumentsContainer" runat="server" />
        </div>
    </it:flowinnercontainer>
