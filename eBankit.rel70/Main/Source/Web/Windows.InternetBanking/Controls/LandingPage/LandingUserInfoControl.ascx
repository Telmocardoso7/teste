<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LandingUserInfoControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.LandingUserInfoControl" %>
<div class="panel-user">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max no-padding">
        <it:FlowContainerDetail ID="FlowContainerDetail1" CssClass="panel panel-detail panel-user-top" runat="server">
            <div class="field field_v2">
                <div id="divDemoProductsText" class="floating-message" runat="server">
                    <h5 class="overflowEllipsis">
                        <asp:Literal ID="Literal1" Text="<%$FrontEndResources:AccountsControls,DemoProductsText %>" runat="server"></asp:Literal></h5>
                </div>

                <div class="panelUserCenter-wrapper">
                    <div>
                        <div>
                            <div class="panelUserLeft-wrapper panelUserCenter-margins">
                                <img id="imgTop" src="<%$ebFile:~/Content/currenttheme/images/user-icon.png%>" alt="" class="img-user img-thumbnail img-circle img-user-left" runat="server" />
                            </div>
                            <div class="panel-user-data">
                                <h5 class="overflowEllipsis welcomeMessage">
                                    <asp:Literal ID="litClientNameTop" runat="server"></asp:Literal></h5>
                                <p class="pull-bottom field-col-3 overflowEllipsis lastAcess">
                                    <asp:Label ID="lblLastAccessTop" Text="" runat="server"></asp:Label>
                                </p>
                            </div>
                            <div id="pnOffline" class="offline-panel metro" runat="server">
                                <div class="offline-panel-div"><i class="icon-warning"></i></div>
                                <div class="offline-panel-div offline-panel-msg">
                                    <asp:Label ID="lblOfflineMessage" Text="<%$FrontEndResources:AccountsControls,OfflineMessage %>" runat="server"></asp:Label>
                                </div>
                                <div class="clearBoth"></div>
                            </div>
                            <div class="clearBoth"></div>
                        </div>
                    </div>
                </div>

                <div class="panelUserRight-wrapper">
                    <div class="custom-box">
                        <div>
                            <div class="mail-box">
                                <div id="divContracts" class="box-header" runat="server">
                                    <asp:LinkButton ID="lkbContracts" runat="server" CssClass="image-container" OnClick="lkbContracts_Click" ToolTip="<%$FrontEndResources:TRX01801,Title %>">
                                        <div class="contracts">
                                            <asp:Label ID="lblPendingContracts" CssClass="badgewarn" Text="0" runat="server"></asp:Label>
                                        </div>
                                    </asp:LinkButton>
                                </div>
                                <div class="box-header">
                                    <asp:LinkButton ID="lkbMessages" runat="server" CssClass="image-container" OnClick="lkbMessages_Click" ToolTip="<%$FrontEndResources:TRX00901,Title %>">
                                        <div class="mail">
                                            <asp:Label ID="lblMessagesNumber" CssClass="badge" Text="0" runat="server"></asp:Label>
                                        </div>
                                    </asp:LinkButton>
                                </div>
                                <div class="box-header">
                                    <asp:LinkButton ID="lkbFav" runat="server" CssClass="box-fav" OnClick="lkbFav_Click" ToolTip="<%$FrontEndResources:Custom,FavoriteManagementHeader %>">
                                        <div class="fav">
                                        </div>
                                    </asp:LinkButton>
                                </div>
                                <div class="box-header">
                                    <asp:LinkButton ID="lkbPend" runat="server" CssClass="box-pend" OnClick="lkbPend_Click" ToolTip="<%$FrontEndResources:TRX01811,Titlev2 %>">
                                        <div class="fav">
                                            <asp:Label ID="lblPendingOpNumber" CssClass="badge" Text="0" runat="server"></asp:Label>
                                        </div>
                                    </asp:LinkButton>
                                </div>
                            </div>
                            <div class="clearBoth"></div>
                        </div>
                        <div class="clearBoth"></div>
                    </div>
                    <div class="clearBoth"></div>
                </div>
                <div class="clearBoth"></div>
            </div>
        </it:FlowContainerDetail>
    </div>
</div>
<script type="text/javascript">
    Sys.Application.add_load(pageLoadDashboard);

    var spanField = $('[id$=lblPendingContracts]');

    function pageLoadDashboard(event, args) {
        spanField.tooltip({
            html: true
        });
    }

    $(document).ready(function () {
        $("img[id*='imgTop']").attr("alt", "");

        $(".badgewarn[data-toggle='popover']").each(function () {
            var elem = $(this);
            elem.popover({
                placement: 'bottom',
                template: '<div class="popover popupnews"><div class="arrow" style="left: 10%;"></div><div class="popover-content"></div></div>',
                content: '<div class="row popupnews">'
                    + '<p class="col-md-12 new-offer" > New Offer!  </p>'
                    + '<p class="col-md-12 receive-your-salary">'
                    + 'Deposit your salary with ebankIT and qualify for a 33% discount on a new vehicle insurance.  </p>'
                    + '<div class="col-md-12 col-sm-12 col-xs-12 text-center">'
                    + '<button class="btn knowmore"> Know more </button></div></div>',
                html: true
            }).popover('show');
        });
    });

</script>
