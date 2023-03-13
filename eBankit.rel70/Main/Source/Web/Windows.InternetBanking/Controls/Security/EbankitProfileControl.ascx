<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EbankitProfileControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.EbankitProfileControl" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divProfileChangeContainer" class="profile-selector-container" visible="false" runat="server" tabindex="0">
    <div class="profile-selector">
        <div class="img-container">
            <img id="imgCurrentProfile" src="<%$ebFile:~/Content/currenttheme/images/user-icon.png%>" class="img-profile img-circle img-alt-empty" runat="server" />
        </div>
        <div class="text-container">
            <p class="profile-name">
                <asp:Literal ID="litProfileNameTop" runat="server"></asp:Literal>
            </p>
            <p id="pChangeCommand" class="profile-change" runat="server">
                <asp:Literal ID="litChangeProfileTop" Text="Change profile" runat="server"></asp:Literal>
                <img id="changeProfileIcon" src="<%$ebFile:~/Content/currenttheme/images/icon/ico_arrow_dropdown.png%>" class="img-dropdown img-alt-empty" runat="server" />
            </p>
        </div>
    </div>
    <div class="profile-search">
        <div class="search-container">
            <p class="text-responsive-1-3">
                <asp:Label ID="lbProfileSelector" Text="<%$FrontEndResources:Login,ProfileSelectionList%>" runat="server"></asp:Label>
            </p>
            <asp:PlaceHolder ID="phSelectControl" runat="server"></asp:PlaceHolder>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(".img-alt-empty").each(function () {
        if ($(this).attr("alt") === undefined) {
            $(this).attr("alt", "");
        }
    });
</script>
