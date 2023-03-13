<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ResultControl.ascx.cs" Inherits="ResultControl" %>

<div class="proof-inner">
	<asp:PlaceHolder ID="phProofInner" runat="server"></asp:PlaceHolder>
</div>
<asp:Panel ID="pnStoreAndForward" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" Visible="false" runat="server">
	<it:FlowInnerContainer ID="flwData" Title="<%$FrontEndResources:StoreAndForward,StoreAndForwardContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction transaction-collapse-itens" runat="server">
		<div>
			<it:FormRadioList_v3 ID="frlStoreAndForward" runat="server" CssClass="big-radioButton" LabelText="<%$FrontEndResources:StoreDandForward,Options %>" RepeatDirection="Horizontal" HideLabel="false" />
			<div id="divExecutionDate" style="display: none;" runat="server">
				<it:DatePickerTextBoxMetroControl_v3 ID="dtExecuteDate" runat="server" Width="100px"
					Label="<%$FrontEndResources:StoreAndForward,dtExecuteDate%>"
					ValidationMinDateMessage="<%$FrontEndResources:StoreAndForward,dtExecuteMinDateMessage %>"
					ValidationRequiredMessage="<%$FrontEndResources:StoreAndForward,dtExecuteRequiredMessage %>"
					ValidationMessage="<%$FrontEndResources:StoreAndForward,dtExecuteValidationMessage %>" />
				<div class="clearBoth"></div>
			</div>
		</div>
	</it:FlowInnerContainer>
</asp:Panel>
<asp:Panel ID="pnControls" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" runat="server">
	<div class="clearBoth"></div>
</asp:Panel>
<asp:Panel ID="pnSchedules" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" runat="server">
	<div class="clearBoth"></div>
</asp:Panel>
<div class="inprint" style="margin-top: 20px;">
	<asp:Label ID="lblOperationID" runat="server"></asp:Label>
	<asp:Label ID="lblPrintDate" Style="display: block; margin-top: 10px;" runat="server"></asp:Label>
</div>


<div class="clearBoth"></div>
<div ID="pnSurvey" class="proof-survey">
	<asp:PlaceHolder ID="phSurveyTransactionInner" runat="server"></asp:PlaceHolder>
</div>

<asp:HiddenField ID="hdnFavoritImageId" runat="server" />
<asp:HiddenField ID="hdnFavoritBenef" runat="server" />
<asp:Button ID="btnHdnRefreshProfile" ClientIdMode="Static" CssClass="hidden" runat="server" OnClick="btnHdnRefreshProfile_Click" />

<script type="text/javascript">
eBankit.Presentation.ResultControl = {};

eBankit.Presentation.ResultControl.ToogleExecuteType = function(divId,status){
		var div = $("#" + divId);
		if(status==1){
			div.show();
		}
		else {
			div.hide();
		}
    }


    //LogoutFunction = function () {
    //    $("#btnHdnLogout").click();
    //}

    RefreshProfileFunction = function () {
        $("#btnHdnRefreshProfile").click();
    }

</script>
