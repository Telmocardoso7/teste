<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="AlertsBusinessConfiguration.ascx.cs" Inherits="eBankit.UI.Modules.Web.Alerts.AlertsBusinessConfiguration" %>

<%@ Register TagPrefix="it" TagName="AlertsBusinessGroupControl" Src="../AlertGroup/AlertsBusinessGroupControl.ascx" %>

<asp:UpdatePanel ID="updatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
    <ContentTemplate>
    </ContentTemplate>
</asp:UpdatePanel>
<br />
<asp:UpdatePanel runat="server" ID="updatePanelConfiguration" UpdateMode="Conditional" ChildrenAsTriggers="true" RenderMode="Block">
    <ContentTemplate>
        <div class="alert-notifications-container">
            <asp:Repeater ID="rptAlertBusinessGroups" runat="server" OnItemDataBound="OnAlertsDataBound">
                <ItemTemplate>
                    <it:alertsbusinessgroupcontrol id="alertsBusinessGroupControl" runat="server" />
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <it:flowcommandscontainer id="fccActionButtons" runat="server">
            <RightButtons>
                <it:LinkButtonControl ID="btnSubscribe" runat="server" ActionType="Conclusion" CustomCssClass="btn-small" Text="<%$FrontEndResources:Notifications,SubscribeButton%>" OnCommand="OnSubscribeCommand"  />
            </RightButtons>
        </it:flowcommandscontainer>
    </ContentTemplate>
</asp:UpdatePanel>

<script type="text/javascript">
    Sys.WebForms.PageRequestManager.getInstance().add_pageLoaded(scrollTop);

    var tdNotifications = document.getElementsByClassName('tdNotification');

    function scrollTop() {
        $("html, body").animate({ scrollTop: 0 }, 600);

        $(tdNotifications).each(function () {
            var tdChannels = this.getElementsByClassName('channel');
            if (this.getElementsByTagName('td')[0].children[1].value == 'True') {

                var chks = $(tdChannels).find('.onoffswitch-checkbox');
                $(chks).each(function () {
                    $(this).on("click", function () { return verifyOneChannelForMandatory(tdChannels); });
                });
            }
        });     
    }

    function verifyOneChannelForMandatory(tdChannels) {
        var array = [];
        var numberOfChecked = 0;

        var chks = $(tdChannels).find('.onoffswitch-checkbox');
        $(chks).each(function () {
            array.push(this.checked);
        });

        for (var i = 0; i < array.length; i++) {
            if (array[i] == true)
                numberOfChecked++;
        }

        if (numberOfChecked == 0) {
            return false;
        }
        return true;
    }

</script>

