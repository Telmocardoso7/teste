<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OutputMessageControl.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Controls.OutputMessageControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<section id="outputMessageSection" class="output-message-wrapper content-message metro">
    <div id="divMessage" runat="server">
        <div class="img-container">
            <i id="outputImageIcon" class="message-icon" runat="server" />
        </div>
        <div class="text-container">
            <h4><%=HeaderMessage%></h4>
            <span><%=Message%></span>
            <div class="clearBoth"></div>
        </div>
    </div>
</section>

