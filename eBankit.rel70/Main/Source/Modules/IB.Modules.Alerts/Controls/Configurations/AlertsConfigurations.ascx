<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AlertsConfigurations.ascx.cs" Inherits="eBankit.UI.Modules.Web.Alerts.Controls.Configurations.AlertsConfigurations" %>

<it:flowinnercontainer id="flwAlertsConfigurations" title="<%$FrontEndResources:AlertsConfigurations,flwTitle %>" customcssclass="col-max bs-reduced bs-head-metro bs-reduced-transaction bs-benef-to-hide" runat="server">
	<div>
		<it:DropDownListControl_v2 ID="ddlDefaultLanguage" runat="server" Label="<%$FrontEndResources:AlertsConfigurations,ddlDefaultLanguage%>" IsRequired="True"/>
	</div>
</it:flowinnercontainer>

<script>
    eBankit.AlertsConfigurations = {};
    
    eBankit.AlertsConfigurations.Validate = function () {
        var ddlDefaultLanguage = $('[id$=ddlDefaultLanguage_dlField]');
        var ret = true;
        if (ddlDefaultLanguage.find('option:selected').val() == '-1') {
            eBankit.Presentation.InsertValidateMsg(ddlDefaultLanguage, top.eBankit.Presentation.GetResource("ddlDefaultLanguage"));
            ret = false;
        } else {
            eBankit.Presentation.RemoveValidateMsg(ddlDefaultLanguage);
        }
        return ret;
    };
</script>