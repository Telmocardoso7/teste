<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="AlertsExternalGroupControl.ascx.cs" Inherits="eBankit.UI.Modules.Web.Alerts.AlertsExternalGroupControl" %>

<asp:UpdatePanel ID="UpdatePanel" runat="server">
    <ContentTemplate>
        <it:flowcontainer visible="true" id="fcGrid" hidetitle="false" runat="server">
            <div class="div-alerts">
             
        <asp:Repeater ID="rptAlertsExternal" runat="server" OnItemDataBound="AlertsDataBound">
            <HeaderTemplate>
                <table class="table hovered nowrap table-alerts">
                    <tbody>
                        <tr>
                            <th style="width:25%">
                                <asp:Literal ID="litAlertTypeDescription" Text="<%$FrontEndResources:Notifications,AlertTypeDescription%>" runat="server"></asp:Literal></th>
                            <asp:Repeater ID="rptHeader" runat="server" OnItemDataBound="HeaderDataBound">
                                <ItemTemplate>
                                    <th class="alignCenter"  >
                                        <asp:Literal ID="litHeaderTitle" runat="server"></asp:Literal></th>
                                </ItemTemplate>
                            </asp:Repeater>

                             <th id="columnFrequencyHeader" class="alignCenter" style="width:25%" runat="server">
                                <asp:Literal ID="litAlertFrequencyDescription" Text="<%$FrontEndResources:Notifications,AlertFrequencyDescription%>" runat="server"></asp:Literal>
                             </th>
                        </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <asp:HiddenField ID="hiddenAlertTypeID" runat="server" />
                <tr class="tdNotification">
                    <asp:HiddenField EnableViewState="true" ID="hdnNumberChannelsCheckedByAlertType" runat="server"/>
                    <td class="alignCenter " style="width:25%; vertical-align:middle">
                        <asp:HiddenField EnableViewState="true" ID="hdfalertTypeID" runat="server" />
                         <asp:HiddenField ID="hdfalertTypeIsMandatory" runat="server" />
                        <asp:Label ID="lblAlertTypeName" runat="server" />
                         <asp:Label ID="lblReqAlert" runat="server">*</asp:Label> 
                    </td>
                    <asp:Repeater ID="rptChannels" runat="server" OnItemDataBound="ChannelsDataBound">
                        <ItemTemplate>
                            <td class="alignCenter channel">
                                <it:checkboxswitchcontrol_v2 id="chkChannel" OnClientClick="CheckOrUncheckChannel(this);" runat="server"></it:checkboxswitchcontrol_v2>
                                <asp:HiddenField ID="hdnChannelId" runat="server" />
                                <asp:HiddenField ID="hdnChannelChecked" runat="server" />
                            </td>
                        </ItemTemplate>
                    </asp:Repeater>
                    <td id="columnFrequencyCell" class="alignCenter frequencies"  style="width:25%; vertical-align:middle" runat="server">
                        <it:dropdownlistcontrol_v2 showlabel="false" cssclass="field field_v2 field-full" id="ddlFrequency" runat="server" Label="<%$FrontEndResources:Notifications,AlertFrequencyDescription%>"/>
                     </td>
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
                </table>
            </FooterTemplate>
        </asp:Repeater>
                </div>
            </it:flowcontainer>
    </ContentTemplate>
</asp:UpdatePanel>
<style type="text/css">
    .centerField-wrapper label {
        margin-right: 50%;
    }
</style>

<script language="javascript" type="text/javascript">
    function CheckOrUncheckChannel(elem) {
        var array = [];
        var numberOfChecked = 0;

        //var alertTypeId = elem.closest('tr').getElementsByTagName('input')[0].id;
        var hdnNumberChecked = elem.closest('tr').getElementsByTagName('input')[1];
        var hdnIsMandatory = elem.closest('tr').getElementsByTagName('input')[3];

        array.push(elem.checked);
        var closestTD = elem.closest('td');

        if (hdnIsMandatory.value == 'False') {

            $(closestTD).siblings('.channel').each(function () {
                var chks = $(this).find('.onoffswitch-checkbox');
                $(chks).each(function () {
                    array.push(this.checked);
                });

            });

            for (var i = 0; i < array.length; i++) {
                if (array[i] == true)
                    numberOfChecked++;
            }

            hdnNumberChecked.value = numberOfChecked;

            var frequenciesElem = $(closestTD).siblings('.frequencies');

            if (numberOfChecked > 0) {
                frequenciesElem.find('select').removeAttr("disabled");
            } else {
                frequenciesElem.find('select').attr('disabled', 'disabled');
                $(frequenciesElem.find('select')).val(0);
            }
        }
    }

</script>
