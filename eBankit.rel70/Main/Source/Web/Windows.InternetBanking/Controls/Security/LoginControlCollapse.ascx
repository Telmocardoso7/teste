<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LoginControlCollapse.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.LoginControlCollapse" %>
<asp:LoginView ID="logvLogin" runat="server" ViewStateMode="Disabled">
    <AnonymousTemplate>
    </AnonymousTemplate>
    <LoggedInTemplate>
      
    </LoggedInTemplate>
</asp:LoginView>
    <asp:LinkButton ID="btnLogoutLink" Text="<%$FrontEndResources:Login,Logout %>" OnClick="btnLogoutLink_Click" CausesValidation="false" runat="server"></asp:LinkButton>



