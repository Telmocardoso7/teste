<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="AlertsAccountConfiguration.ascx.cs" Inherits="eBankit.UI.Modules.Web.Alerts.AlertsAccountConfiguration" %>

<%@ Register TagPrefix="it" TagName="AlertsAccountGroupControl" Src="../AlertGroup/AlertsAccountGroupControl.ascx" %>

<asp:UpdatePanel ID="updatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
    <ContentTemplate>
    </ContentTemplate>
</asp:UpdatePanel>
<br />
<asp:UpdatePanel runat="server" ID="updatePanelConfiguration" UpdateMode="Conditional" ChildrenAsTriggers="true" RenderMode="Block">
    <ContentTemplate>
        <div class="alert-notifications-container">
            <asp:Repeater ID="rptAlertGroups" runat="server" OnItemDataBound="OnAlertsDataBound">
                <ItemTemplate>
                    <it:alertsaccountgroupcontrol id="alertsAccountGroupControl" runat="server" />
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <it:flowcommandscontainer id="fccActionButtons" runat="server">
            <RightButtons>
                <it:LinkButtonControl UseSubmitBehavior="false" ID="btnSubscribe" runat="server" ActionType="Conclusion" CustomCssClass="btn-small" Text="<%$FrontEndResources:Notifications,SubscribeButton%>" OnCommand="OnSubscribeCommand" OnClientClick="return validateForm();" />
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
            var tdChannels2 = this.getElementsByClassName('channel');
            if (this.getElementsByTagName('td')[0].children[1].value == 'True') {

                var chks = $(tdChannels2).find('.onoffswitch-checkbox');
                $(chks).each(function () {
                    $(this).on("click", function () { return verifyOneChannelForMandatory(tdChannels2,this); });
                });
            }
        });
        
        $(tdNotifications).each(function () {            
            var tdChannels = this.getElementsByClassName('channel');
               if(this.getElementsByTagName('td')[0].children[1].value=='False')
                {
                verifyActivateChannels(tdChannels);
                }
        });  
        
            
    }
    

    var errorMsgs = [];
  
    //ações do botão subscribe

    function validateForm() {       
        var isValid = true;     

        $(tdNotifications).each(function () {
            var tdChannels = this.getElementsByClassName('channel')
            if(this.getElementsByTagName('td')[0].children[1].value=='False')
            {
                verifyActivateChannels(tdChannels);
                ValidateAmountAndLimits(tdChannels);
            }
           
            
        });


        if (errorMsgs.length === 0) {
            isValid = true
            errorMsgs=[]
        } else {
            isValid = false;
            errorMsgs = []
        }
        return isValid;
    }

    function ValidateAmountAndLimits(tdChannels) {
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
        

        var amountElem = $(tdChannels).siblings('.amount');
        var limitsElem = $(tdChannels).siblings('.limits');
        var frequenciesElem = $(tdChannels).siblings('.frequencies');
        if ((typeof ($(amountElem.find('input')).val() != "undefined") && (typeof ($(limitsElem).find('select')).val() != "undefined"))) {
            if (numberOfChecked > 0) {

                if ((limitsElem.find('select').prop('selectedIndex') != 0) && (parseFormattedNumber($(amountElem.find('input')).val()) <= 0)) {
                    eBankit.Presentation.RemoveValidateMsg($(limitsElem.find('select')));
                    errorMsgs.push(top.eBankit.Presentation.GetResource("AlertsAmountError"));
                    eBankit.Presentation.InsertValidateMsg($(amountElem.find('input')), top.eBankit.Presentation.GetResource("AlertsAmountError"));
                } else if ((limitsElem.find('select').prop('selectedIndex') === 0) && (parseFormattedNumber($(amountElem.find('input')).val()) > 0)) {
                    eBankit.Presentation.RemoveValidateMsg($(amountElem.find('input')));
                    errorMsgs.push(top.eBankit.Presentation.GetResource("AlertsLimitsError"));
                    eBankit.Presentation.InsertValidateMsg($(limitsElem.find('select')), top.eBankit.Presentation.GetResource("AlertsLimitsError"));
                } else {
                    eBankit.Presentation.RemoveValidateMsg($(amountElem.find('input')));
                    eBankit.Presentation.RemoveValidateMsg($(limitsElem.find('select')));
                }

            }

            return errorMsgs;
        }
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
        
        var amountElem = $(tdChannels).siblings('.amount');
        var limitsElem = $(tdChannels).siblings('.limits');
        var frequenciesElem = $(tdChannels).siblings('.frequencies');

        if (numberOfChecked >0) {
            amountElem.find('input').removeAttr("disabled");
            limitsElem.find('select').removeAttr("disabled");
            frequenciesElem.find('select').removeAttr("disabled");           
        } else {
            amountElem.find('input').attr('disabled', 'disabled');
            limitsElem.find('select').attr('disabled', 'disabled');
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
            this.cheched = true;
            return false;
        }
        return true;
    }

   

</script>
