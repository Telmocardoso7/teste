
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01520_01.ascx.cs" Inherits="TRX01520_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
	<asp:UpdatePanel ID="updContent" runat="server" UpdateMode="Always">
        <ContentTemplate>

<div style="height:100px; background-color:white; padding-top:5%; margin-bottom:50px; padding-right:15%; padding-left:15%;">
    <asp:Label runat="server" CssClass="currency-slider-title" Text="<%$FrontEndResources:TRX01520,sliderTitle%>"></asp:Label>
<div style="clear:both;"></div>
     <div style=" background-color:#eeeeee; height:3px; margin-left:-30%;"></div>
                <div style="clear: both; background-color: white; margin-bottom: 20px; position: relative;">
                    <div class="search-currency-title">
                        <asp:Literal ID="Literal2" runat="server" Text="<%$FrontEndResources:TRX00151,Search%>"></asp:Literal>
                        <div class="strip"></div>
                    </div><div class="dropGniot2"><asp:DropDownList runat="server" ID="ddlSearchCurrency" CssClass="dropGniot"></asp:DropDownList></div>
                </div>
</div>
<it:CurrencyControl ID="CurrencySlider" runat="server"></it:CurrencyControl>
			<it:FlowInnerContainer ID="flwData1" Title="<%$FrontEndResources:TRX01520,TitleDataContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction exchange-title" runat="server">

				<div>


		<it:NumberTextBoxControl_v3 ID="txtamount" IsRequired="false" MaxLength="0" MinLength="0" Label="<%$FrontEndResources:TRX01520,txtamount%>" runat="server" />
    <div class="stripsep"></div>
		<it:FormRadioList_v3 ID="ctlfrequency" runat="server" LabelText="<%$FrontEndResources:TRX01520,ctlfrequency %>" ToolTip="" CssClass="big-radioButton" RepeatDirection="Horizontal" HideLabel="false" />
		<it:DatePickerTextBoxMetroControl_v3 ID="dttransferDate" IsRequired="false" runat="server" Width="85px"
        Label="<%$FrontEndResources:TRX01520,dttransferDate%>" ValidationMinDateMessage="<%$FrontEndResources:TRX01520,dttransferDateValidationMinDateMessage %>"
        ValidationRequiredMessage="<%$FrontEndResources:TRX01520,dttransferDateValidationRequiredMessage %>"
        ValidationMessage="<%$FrontEndResources:TRX01520,dttransferDateValidationMessage %>" />
                    <div class="stripsep"></div>
		<it:TextBoxControl_v2 ID="txtdescription" IsRequired="false" MaxLength="60" MinLength="0" Label="<%$FrontEndResources:TRX01520,txtdescription%>" TextMode="MultiLine" Rows="4" runat="server" />			
				</div>
			</it:FlowInnerContainer>
                <it:FlowInnerContainer ID="FlowInnerContainer2" Title="<%$FrontEndResources:TRX00121,NotificationContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction exchange-title" runat="server">
        <div style="margin-bottom: 10px;">

            <asp:UpdatePanel ID="UpdatePanelNotificationContainer" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <div class="formatTextEmailPhone" style="box-shadow: none; background-color: transparent;">
		<it:TextBoxControl_v2 ID="txtmail" IsRequired="false" MaxLength="0" MinLength="0" Label="<%$FrontEndResources:TRX01520,txtmail%>" runat="server" />	
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="clearBoth"></div>
        </div>

    </it:FlowInnerContainer>
		</ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01520-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01520-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />

</div>
