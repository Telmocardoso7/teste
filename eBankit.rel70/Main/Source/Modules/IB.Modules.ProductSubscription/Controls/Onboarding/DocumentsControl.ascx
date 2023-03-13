<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DocumentsControl.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Controls.Onboarding.DocumentsControl" %>

<%@ Register TagPrefix="it" Namespace="eBankit.UI.Modules.Web.ProductSubscription.Orchestration.BaseControls.DocumentList" Assembly="eBankit.UI.Modules.Web.ProductSubscription" %>

<it:DocumentRepeater id="DownloadDocumentsContainer" Visible="false" DisplayDescription="false" ItemIsButton="true"  runat="server" />
<it:DocumentRepeater id="UploadDocumentsContainer" Visible="false" runat="server" />