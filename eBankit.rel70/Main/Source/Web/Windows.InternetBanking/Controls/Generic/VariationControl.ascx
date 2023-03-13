<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="VariationControl.ascx.cs" Inherits="VariationControl" %>

<asp:Button ID="btnChangeLanguage" CssClass="hidden" runat="server" OnClick="btnChangeLanguage_Click" /><asp:HiddenField ID="hdnToAddCode" runat="server" />
<asp:Repeater ID="rptVariations" OnItemDataBound="rptVariations_ItemDataBound" runat="server">
    <HeaderTemplate>
    </HeaderTemplate>
    <ItemTemplate>
        <a id="aVariation" class="a-primary" href="#" onclick="eBankit.Presentation.ChangeLanguage('en');return false;" runat="server"></a>
        <span id="spanSeparator" class="line-separator" runat="server"></span>
    </ItemTemplate>
</asp:Repeater>
<script type="text/javascript">
    var hdnToAddCode = $("#<%=hdnToAddCode.ClientID %>");
    var btnChangeLanguageId = "<%=btnChangeLanguage.UniqueID %>";
</script>
