<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SessionControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.SessionControl" %>
<%@ Import Namespace="eBankit.Common.InternetBanking.Utils" %>

<div id="divRenewSessionContainer" Style="display: none">
    <%--<iframe id="ifRenewContainer" src="<%= SessionHelper.GetRenewSessionPage() %>"></iframe>--%>
</div>

<script type="text/javascript">
    eBankit = eBankit || {};
    eBankit.Presentation = eBankit.Presentation || {};
    eBankit.Presentation.SessionControl = eBankit.Presentation.SessionControl || {};
    eBankit.Presentation.SessionControl.Configuration = (function () {
        return {
            PopupText: "<%= GetPopupMessage() %>",
            PopupTime: <%= SessionHelper.GetPopupDisplayTimeConfiguration() %> * 1000,  //in miliseconds
            SessionRemainingTime: <%= GetRemaningSessionTime() %> * 1000,  //in miliseconds
            SessionExpiredUrl: <%= GetSessionExpiredUrl() %>,
            TimeBeforePopup: <%= GetTimeBeforePopup() %> * 1000, //in miliseconds
            RenewSessionPage: "<%= SessionHelper.GetRenewSessionPage() %>",
            ErrorMarginPopup: 5000,
            HasSlidingSession: "<%= SessionHelper.GetSlidingSessionConfiguration() %>",
            SessionTimeout: <%= GetSessionTimeoutConfiguration() %> * 1000 //in miliseconds
        }
    })();
</script>

<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/ebankitControls/session/session-control.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
