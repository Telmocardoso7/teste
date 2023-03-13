<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Base.Master" CodeBehind="DigitalDocument.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.DigitalDocument" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="col-lg-12" style="text-align: center; height: 200px; margin-bottom: 10px; padding-top: 30%;">
       <img src="<%= eBankit.Common.Sites.Utils.GetCacheVersion(eBankit.Common.InternetBanking.InternetBankingSettings.ResolveImagePath("loading-blue.gif"), eBankit.Common.Sites.Utils.CacheVersionKey.Image) %>" alt="loading" />
    </div>
</asp:Content>
