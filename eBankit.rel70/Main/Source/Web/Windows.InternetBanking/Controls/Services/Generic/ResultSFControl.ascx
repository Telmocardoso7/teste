<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ResultSFControl.ascx.cs" Inherits="ResultSFControl" %>

<asp:Panel ID="pnControls" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 transaction-content clearPadding" runat="server">
    <div class="clearBoth"></div>
</asp:Panel>
<div class="proof-inner">
    <asp:PlaceHolder ID="phProofInner" runat="server"></asp:PlaceHolder>
</div>
<div class="inprint" style="margin-top: 20px;">
    <asp:Label ID="lblOperationID" runat="server"></asp:Label>
    <asp:Label ID="lblPrintDate" Style="display: block; margin-top: 10px;" runat="server"></asp:Label>
</div>
<div class="clearBoth"></div>
sdsdsdsdsdsdsdsdsdsdsdsddsd
<asp:HiddenField ID="hdnFavoritImageId" runat="server" />
<asp:HiddenField ID="hdnFavoritBenef" runat="server" />
