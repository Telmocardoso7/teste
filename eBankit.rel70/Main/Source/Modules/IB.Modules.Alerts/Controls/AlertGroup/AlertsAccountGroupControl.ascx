<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="AlertsAccountGroupControl.ascx.cs" Inherits="eBankit.UI.Modules.Web.Alerts.AlertsAccountGroupControl" %>
<asp:UpdatePanel ID="UpdatePanel" runat="server">
    <ContentTemplate>
        <it:flowcontainer visible="true" id="fcGrid" hidetitle="false" runat="server">
            <div>
                 <div style="overflow-x:auto">
                    <asp:Repeater ID="rptAlerts" runat="server" OnItemDataBound="AlertsDataBound">
                        <HeaderTemplate>
                            <div class="div-alerts">
                            <table class="table hovered nowrap table-alerts">
                                <tbody>
                                    <tr>
                                        
                                        <th style="width:25%;">
                                            <asp:Literal ID="litAlertTypeDescription" Text="<%$FrontEndResources:Notifications,AlertTypeDescription%>" runat="server"></asp:Literal>

                                        </th>
                                            <asp:Repeater ID="rptHeader" runat="server" OnItemDataBound="HeaderDataBound">
                                                <ItemTemplate>
                                                    <th class="alignCenter thChannel">
                                                        <asp:Literal ID="litHeaderTitle" runat="server"></asp:Literal></th>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <th class="alignCenter"  style="width:15%;min-width:120px;">
                                                <asp:Literal ID="litAlertOperationDescription" Text="<%$FrontEndResources:Notifications,AlertOperationDescription%>" runat="server"></asp:Literal></th>
                                            <th class="alignCenter" style="width:10%;min-width:80px;" >
                                                <asp:Literal ID="litAlertValueDescription" Text="<%$FrontEndResources:Notifications,AlertValueDescription%>" runat="server"></asp:Literal>
                                            </th>
                                            <th class="alignCenter" style="width:1%;">
                                            </th>
                                        <th id="columnFrequencyHeader" class="alignCenter" style="width:20%;min-width:170px;" runat="server">
                                                <asp:Literal ID="litAlertFrequencyDescription" Text="<%$FrontEndResources:Notifications,AlertFrequencyDescription%>" runat="server"></asp:Literal>
                                            </th>
                                        </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr class="tdNotification">
                                <asp:HiddenField EnableViewState="true" ID="hdnNotifID" runat="server" />                                 
                                <asp:HiddenField EnableViewState="true" ID="hdnNumberChannelsCheckedByAlertType" runat="server"/>
                                <td style="width:25%; vertical-align:middle;">
                                    <asp:HiddenField EnableViewState="true" ID="hdfalertTypeID" runat="server" />
                                    <asp:HiddenField ID="hdfalertTypeIsMandatory" runat="server" />
                                    <asp:Label ID="lblAlertTypeName" runat="server" />
                                    <asp:Label ID="lblReqAlert" runat="server">*</asp:Label>
                                </td>
                                <asp:Repeater ID="rptChannels" runat="server" OnItemDataBound="ChannelsDataBound">
                                    <ItemTemplate>
                                        <td class="alignCenter channel">
                                            <it:checkboxswitchcontrol_v2 id="chkChannel" runat="server" OnClientClick="CheckOrUncheckChannel(this);"></it:checkboxswitchcontrol_v2>
                                            <asp:HiddenField ID="hdnChannelId" runat="server" />
                                            <asp:HiddenField ID="hdnChannelChecked" runat="server" />
                                        </td>
                                    </ItemTemplate>
                                </asp:Repeater>
                                 
                   
                                <td class="alignCenter notificationsVerticalAlign limits" style="width:15%;">
                                    <it:dropdownlistcontrol_v2 id="ddlOperatorTypes" runat="server" ShowLabel="false" Label="<%$FrontEndResources:Notifications,AlertOperationDescription%>" cssclass="field field_v2 field-full" />
                                </td>
                                <td class="alignCenter notificationsVerticalAlign amount"  style="width:10%;">
                                    <it:CurrencyTextBoxControlAuto id="txtValue" runat="server" ShowLabel="false" Label="<%$FrontEndResources:Notifications,AlertValueDescription%>" isrequired="true" allowvaluesunderone="true" breakline="false" />
                                </td>
                                <td class="alignCenter"  style="width:1%;padding-left: 0px !important;padding-right: 0px !important;">
                                    <div class="field field_v2 field-full" style="margin-top:10px;">
                                     <asp:Literal ID="litCurrency" runat="server"></asp:Literal>
                                    </div>
                                </td>
                                
                                <td id="columnFrequencyCell" class="alignCenter frequencies notificationsVerticalAlign"  style="width:20%; min-width:170px;" runat="server">
                                    <it:dropdownlistcontrol_v2 id="ddlFrequency" runat="server" ShowLabel="false" Label="<%$FrontEndResources:Notifications,AlertFrequencyDescription%>" cssclass="field field_v2 field-full" />
                                </td>
                    
                            </tr>    
                           
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                            </table>
                            </div>
                        </FooterTemplate>
                    </asp:Repeater>
                     </div>
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

    $(document).ready(function () {
        ariaLabelFuncs();
    });

    function pageLoad() {
        ariaLabelFuncs();
    }

    function ariaLabelFuncs() {
        // add amount to input aria label 
        var listOfAmountInputs = $("input[id*='txField'].fnumber");
        listOfAmountInputs.each(function (idx, val) {
            var currency = $(this).parents().eq(3).next().first()[0].innerText;
            var $td = $(this).closest('td');
            var tableRowIndex = $td.parent().children("td").index($td);
            var amount = $(this).parents().eq(6).children(':first').find('th')[tableRowIndex].innerText;
            val.ariaLabel = amount + ". " + currency;

        });
    }

    Sys.Application.add_load(function () {
        var x = document.getElementsByClassName("curr_v2");
        for (var i = 0; i < x.length; i++) {
            x[i].style.display = 'none';
        }


    });


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

            var amountElem = $(closestTD).siblings('.amount');
            var limitsElem = $(closestTD).siblings('.limits');
            var frequenciesElem = $(closestTD).siblings('.frequencies');

            if (numberOfChecked > 0) {
                amountElem.find('input').removeAttr("disabled");
                limitsElem.find('select').removeAttr("disabled");
                frequenciesElem.find('select').removeAttr("disabled");
            } else {
                amountElem.find('input').attr('disabled', 'disabled');
                limitsElem.find('select').attr('disabled', 'disabled');
                frequenciesElem.find('select').attr('disabled', 'disabled');
                $(amountElem.find('input')).val(parseFloat(0).toFixed(2));
                $(limitsElem.find('select')).val(0);
                $(frequenciesElem.find('select')).val(0);
                eBankit.Presentation.RemoveValidateMsg($(amountElem.find('input')));
                eBankit.Presentation.RemoveValidateMsg($(limitsElem.find('select')));
            }
        }

    }




</script>
