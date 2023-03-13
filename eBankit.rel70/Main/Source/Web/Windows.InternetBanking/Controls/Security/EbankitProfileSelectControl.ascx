<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EbankitProfileSelectControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.EbankitProfileSelectControl" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:UpdatePanel runat="server">
    <ContentTemplate>
        <div id="mainContainer" class="profile-control-container" runat="server">
            <p class="text-center">
                <asp:LinkButton ID="btnSwitchMode" runat="server" CssClass="btn-switch" Text="<%$FrontEndResources:Login,SwitchButtonList %>" />
            </p>

            <div id="listContainer" runat="server" visible="false">
                <div class="search-bar-container">
                    <it:TextBoxControl ID="txtSearch" ShowLabel="false" runat="server" Watermark="<%$FrontEndResources:Login,ProfileSearchMsg %>" Label="<%$FrontEndResources:Login,ProfileSearchMsg %>" />
                    <span class="search-icon"></span>
                    <span class="search-clear-icon"></span>
                </div>
                <asp:Label CssClass="output-message" runat="server" Text="<%$FrontEndResources:Login,ProfileNoResultsMsg%>" Style="display: none;" />
                <div class="profile-search-results">
                    <asp:Repeater ID="SelectList" OnItemDataBound="SelectList_ItemDataBound" runat="server">
                        <ItemTemplate>
                            <div class="profile-list-container" runat="server" tabindex="0" role="button" onkeydown="selectProfileControl.btnProfileKeydownHandler(this, event);" onkeyup="selectProfileControl.btnProfileKeyupHandler(this, event);">
                                <asp:ImageButton ID="imgProfile" runat="server" ImageUrl="<%$ebfile:~/Content/Themes/ebankit/images/user-icon.png%>" CssClass="select-icon changes-profile" OnClick="SelectProfile_Click" TabIndex="-1" />
                                <div class="profile-list-item">
                                    <asp:LinkButton ID="btnProfile" runat="server" CssClass="item-link changes-profile" OnClick="SelectProfile_Click" TabIndex="-1" />
                                    <div runat="server" id="ContractId" hidden="hidden" class="contract-id"></div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>

            <div id="slideContainer" runat="server">
                <div class="profile-slider-container">
                    <div class="profile-slider-slick">
                        <asp:Repeater ID="SelectSlider" OnItemDataBound="SelectSlider_ItemDataBound" runat="server">
                            <ItemTemplate>
                                <div class="profile-slider-item" runat="server">
                                    <div class="profile-slider-div-item">
                                        <div runat="server" id="ContractId" readonly="readonly" hidden="hidden" class="btn-switch item-link text-center"></div>
                                        <asp:Image runat="server" ID="ProfileImage" ImageUrl="<%$ebfile:~/Content/Themes/ebankit/images/user-icon.png%>" CssClass="select-icon"></asp:Image>
                                        <div runat="server" id="ProfileName" class="btn-switch item-link text-center"></div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>

                <div id="ValidationMessage" runat="server" class="text-center ValidationMessage" style="display: none;">Please select a profile</div>

                <asp:Button ID="btnSelect" CssClass="btn btn-primary test btn-margin btn-block changes-profile" Style="margin-bottom: 20px;" Text="<%$FrontEndResources:Login,Select %>" runat="server"
                    OnClientClick="javascript: return selectProfileControl.validateButton()" />
            </div>
        </div>
        <div id="errorContainer" runat="server" visible="false">
            <%=eBankit.Common.Globalization.Translate.GetTransactionString("Login","NoProfile") %>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>

<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/ebankitControls/selectProfile/control.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
<script type="text/javascript">
    Sys.Application.add_load(selectProfileControl.init);
    selectProfileControl.ConfirmTitle = '<%=eBankit.Common.Globalization.Translate.GetJSTransactionString("Login","ChangeProfileTitle").Replace(System.Environment.NewLine, "<br>") %>';
    selectProfileControl.ConfirmMsg = '<%=eBankit.Common.Globalization.Translate.GetJSTransactionString("Login","ChangeProfileMsg").Replace(System.Environment.NewLine, "<br>") %>';
</script>
