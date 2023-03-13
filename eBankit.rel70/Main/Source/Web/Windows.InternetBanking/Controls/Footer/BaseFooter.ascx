<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BaseFooter.ascx.cs" Inherits="BaseFooter" %>
<style type="text/css">
    footer {
        margin: 4em 0 0 0;
    }

    @media (max-width: 770px) {

        footer {
            margin: 4em 0 0 0;
        }
    }
</style>
<footer class="noprint">
    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
        <div class="row footer-menus-container">
            <div class="col-xs-12 col-sm-11 col-md-10 col-lg-8 col-max col-centered main-resize">
                <div class="bottomLinks">
                    <asp:Literal ID="litBottomMenu" runat="server"></asp:Literal>
                </div>
                <div class="bottomSocial">
                    <asp:Literal ID="litBottomLinks" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
        <div class="row text-center footer-credits">
            <span>
                <asp:Literal ID="lblMasterCredits" Text="2015 &copy; EBANKIT" runat="server"></asp:Literal></span>
        </div>
    </div>
    <div class="clearBoth"></div>

     <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/policies.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>

        <script>
            Policies.PrivacyPolicyURL = '<%= ConfigurationManager.AppSettings["PrivacyPolicyURL"] %>';
            Policies.CookiesPolicyURL  = '<%= ConfigurationManager.AppSettings["CookiesPolicyURL"] %>';
        </script>
</footer>
