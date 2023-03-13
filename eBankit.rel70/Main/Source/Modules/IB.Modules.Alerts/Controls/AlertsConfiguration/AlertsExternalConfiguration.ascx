<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="AlertsExternalConfiguration.ascx.cs" Inherits="eBankit.UI.Modules.Web.Alerts.AlertsExternalConfiguration" %>

<%@ Register TagPrefix="it" TagName="AlertsExternalGroupControl" Src="../AlertGroup/AlertsExternalGroupControl.ascx" %>


<asp:UpdatePanel ID="updatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
    <ContentTemplate>
    </ContentTemplate>
</asp:UpdatePanel>
<br />
<asp:UpdatePanel runat="server" ID="updatePanelConfiguration" UpdateMode="Conditional" ChildrenAsTriggers="true" RenderMode="Block">
    <ContentTemplate>
        <div class="alert-notifications-container">
            <asp:Repeater ID="rptAlertExternalGroups" runat="server" OnItemDataBound="OnAlertsDataBound">
                <ItemTemplate>
                    <it:alertsexternalgroupcontrol id="alertsExternalGroupControl" runat="server" />
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <it:flowcommandscontainer id="fccActionButtons" runat="server">
            <RightButtons>
                <it:LinkButtonControl ID="btnSubscribe" runat="server" ActionType="Conclusion" CustomCssClass="btn-small" Text="<%$FrontEndResources:Notifications,SubscribeButton%>" OnCommand="OnSubscribeCommand" />
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
            if($($(this).find('input')[2]).val()=='False')
            {
                verifyActivateChannels(tdChannels);
            }
        });

        $(tdNotifications).each(function () {
            var tdChannels2 = this.getElementsByClassName('channel');
            if (this.getElementsByTagName('td')[0].children[1].value == 'True') {

                var chks = $(tdChannels2).find('.onoffswitch-checkbox');
                $(chks).each(function () {
                    $(this).on("click", function () { return verifyOneChannelForMandatory(tdChannels2,this); });
                });
            }
        });     
    }
    
    function verifyActivateChannels(tdChannels) {
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

        var frequenciesElem = $(tdChannels).siblings('.frequencies');

        if (numberOfChecked > 0) {            
            frequenciesElem.find('select').removeAttr("disabled");
        } else {
            frequenciesElem.find('select').attr('disabled', 'disabled');
        }
    }

    function verifyOneChannelForMandatory(tdChannels,obj) {
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
            this.checked = true;
            return false;
        }
        return true;
    }



</script>
