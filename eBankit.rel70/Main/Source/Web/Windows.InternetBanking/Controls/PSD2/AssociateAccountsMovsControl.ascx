<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AssociateAccountsMovsControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.Controls.PSD2.AssociateAccountsMovsControl" %>
<div id="divAssociateAccountsMov" runat="server">
    <asp:HiddenField ID="hdnConsentId" runat="server"></asp:HiddenField>
    <asp:HiddenField ID="hdnAcountId" runat="server"></asp:HiddenField>
    <asp:HiddenField ID="hdnBankId" runat="server"></asp:HiddenField>

    <div class="metro inner-table">
        <it:GridViewControl ID="gridData" runat="server" AutoGenerateColumns="false" CssClass="table hovered inside-table" IsResponsive="true" EmptyDataText="<%$FrontEndResources:DATALIST,NoMovementsInfo%>"
            GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" RecordCounterComplementarText="<%$FrontEndResources:DATALIST,gridDataecordCounterComplementarText %>">
            <Columns>
                <asp:TemplateField HeaderStyle-Width="15%" HeaderText="<%$FrontEndResources:ExternalAccounts,Date%>">
                    <ItemTemplate>
                        <asp:Label ID="lblDate" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderStyle-Width="15%" HeaderText="<%$FrontEndResources:ExternalAccounts,DateValue%>">
                    <ItemTemplate>
                        <asp:Label ID="lblDateValue" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-Width="40%" HeaderText="<%$FrontEndResources:ExternalAccounts,Description%>">
                    <ItemTemplate>
                        <asp:Label ID="lblDescription" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField  HeaderStyle-Width="15%" HeaderText="<%$FrontEndResources:ExternalAccounts,Value%>">
                    <ItemTemplate>
                        <asp:Label ID="lblValue" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField  HeaderStyle-Width="10%" HeaderText="<%$FrontEndResources:ExternalAccounts,Currency%>">
                    <ItemTemplate>
                        <asp:Label ID="lblCurrency" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </it:GridViewControl>
    </div>
</div>
