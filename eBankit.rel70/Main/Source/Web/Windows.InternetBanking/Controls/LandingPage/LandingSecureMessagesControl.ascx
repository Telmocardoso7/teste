<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LandingSecureMessagesControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.LandingSecureMessagesControl" %>

<%@ Import Namespace="eBankit.Business.Entities" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div class="landingSecureMessages">

    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts">
        <a id="landingSecureMessagesTitle" runat="server" class="dashboardSliderTitle">
            <asp:Label ID="lblSecureMessages" Text="<%$FrontEndResources:LandingSecureMessages,Title%>" runat="server"></asp:Label>
        </a>
    </div>

    <asp:Repeater ID="rptSecureMessages" runat="server" OnItemDataBound="rptSecureMessages_ItemDataBound">
        <ItemTemplate>
            <div class="secure-messages-container">
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max" id="lineContainer" runat="server">
                    <div class="landing-secure-messages row">
                        <div class="col-md-1 col-sm-1 col-xs-1 " style="padding-right: 0;">
                            <div id="transactionIcon" runat="server" class="messages-icon unread-messages" style="margin-right: 0; padding-right: 0;">
                                <div style="height: 40px; width: 40px; background: url(<%# getIcon("message_counter.png") %>) no-repeat scroll center top transparent;">
                                </div>
                            </div>
                        </div>
                        <div class="col-md-8 col-sm-8 col-xs-8 text-truncate ">
                            <p class="key">
                                <asp:Label ID="labelMessageType" CssClass="<%# getDynamicClass() %>" runat="server" />
                            </p>
                            <p>
                                <asp:Label ID="labelSubject" runat="server" />
                            </p>
                        </div>
                        <div class="col-md-2 col-sm-2 col-xs-2 col-xs-offset-0 col-sm-offset-0 col-md-offset-0 text-truncate ">
                            <div class="col-xs-6">
                                <p class="secure-message-date">
                                    <asp:Label ID="labelDate" runat="server" />
                                </p>

                            </div>
                        </div>
                        <div class="col-md-1 col-sm-1 col-xs-1 col-xs-offset-2 col-sm-offset-1 col-md-offset-0 ">
                            <p class="action-buttons">
                                <asp:LinkButton ID="btnDetail" runat="server"
                                    MessageId="<%# ((CoreMessageItem)Container.DataItem).MessageID %>"
                                    CssClass="messages-icon message-details"
                                    ToolTip="<%$FrontEndResources:LandingSecureMessages,TooltipDetailsButton%>">
                                    <asp:Image ID="imgDetailMessage" AlternateText="<%$FrontEndResources:LandingSecureMessages,TooltipDetailsButton%>" ImageUrl='<%# getIcon("action_view_details.png") %>' runat="server" />
                                </asp:LinkButton>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <div class="secure-messages-container">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max" id="emptyMessagesContainer" runat="server">
            <div class="landing-secure-messages row">
                <div class="col-md-1 col-sm-1 col-xs-1 " style="padding-right: 0;">
                    <div id="transactionIcon" runat="server" class="messages-icon unread-messages" style="margin-right: 0; padding-right: 0;">
                        <asp:Image ID="imgUnReadNoMessages" AlternateText="Unread No Messages"  ImageUrl='<%# getIcon("message_counter.png") %>' runat="server" />
                    </div>
                </div>
                <div class="col-md-10 col-sm-10 col-xs-10 text-truncate ">
                    <p id="messageTypeNoMessage" runat="server">
                        <asp:Label ID="labelNoMessagesMessageType" runat="server" />
                    </p>
                    <p>
                        <asp:Label ID="labelNoMessagesSubject" CssClass="subject-no-message" runat="server" />
                    </p>
                </div>
                <div class="col-xs-offset-2 col-sm-offset-1 col-md-offset-0 ">
                    <p class="action-buttons">
                        <asp:LinkButton ID="btnDetailFooter" runat="server"
                            CssClass="messages-icon no-messages"
                            ToolTip="<%$FrontEndResources:LandingSecureMessages,TooltipDetailsNoMessagesButton%>">
                            <asp:Image ID="imgDetailNoMessage" AlternateText="<%$FrontEndResources:LandingSecureMessages,TooltipDetailsNoMessagesButton%>" runat="server" />
                        </asp:LinkButton>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>
<link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("LandingSecureMessages-1.0.css".ResolveCssUrl("services/widgets"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />

<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("LandingSecureMessages.js".ResolveJsUrl("Services/Widgets"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
<script type="text/javascript">
    var projId = "<%=ConfigurationManager.AppSettings["projectId"].ToString() %>";
</script>