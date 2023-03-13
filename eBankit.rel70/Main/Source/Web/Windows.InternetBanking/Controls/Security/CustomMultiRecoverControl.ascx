<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomMultiRecoverControl.ascx.cs" Inherits="CustomMultiRecoverControl" %>

<%@ Register TagPrefix="it" Namespace="eBankit.UI.Controls.InternetBanking" Assembly="eBankit.UI.Controls.InternetBanking" %>

<%@ Register Src="~/Controls/Security/EbankitMultiRecoverQuestionsControl.ascx" TagPrefix="it" TagName="QuestionsControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div class="text-responsive">
	<h2>
		<asp:Literal ID="litRecoverTitle" runat="server" Text="<%$FrontEndResources:Recover,RecoverFormTitle %>"></asp:Literal>
	</h2>
</div>
<div style="clear: both;"></div>
<div class="recover-form" style="padding-bottom: 20px;">
	<div class="col-lg-12 clearPadding recover-message">
		<asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
	</div>
	<div class="clearBoth"></div>
	<p class="text-responsive-1-3 loginWelcomeMessage">
		<asp:Label ID="lblWellcomeTitle" Text="<%$FrontEndResources:Recover,RecoverData %>" runat="server"></asp:Label>
	</p>
	<div class="clearBoth"></div>
	<asp:Panel ID="pnStepInit" class="recover-panel" runat="server">
		<div class="panel-login-inputs">
				<asp:HiddenField ID="hdnRadio" runat="server" />
				<it:TextBoxControl_v2 ID="txtAlias" ShowLabel="false" TextMode="SingleLine" IsRequired="true" Label="<%$FrontEndResources:Recover,Alias %>" runat="server" Watermark="<%$FrontEndResources:Recover,AliasWatermark %>" />

				<div id="divOther" runat="server">
					<it:DropDownListControl_v2 ID="ddlIdentityType" Label="<%$FrontEndResources:Recover,ddlIdentityType%>" OnChange="eBankit.Presentation.Recover.ToogleOtherField();" runat="server" />
					<div id="divOtherValue" class="hidden" runat="server">
						<it:TextBoxControl_v2 ID="txtOtherKeyValue" ShowLabel="true" TextMode="SingleLine" IsRequired="true" Label="<%$FrontEndResources:Recover,OtherKey %>" runat="server" Watermark="<%$FrontEndResources:Recover,OtherKeyWatermark %>" />
					</div>
				</div>
		</div>
		<div class="row marginTop15">
			<div class="col-xs-1 visible-lg"></div>
			<div class="col-lg-5 col-xs-6">
				<asp:Button  ID="btnCancelStep1" CssClass="btn btn-default btn-margin btn-block" Text="<%$FrontEndResources:Recover,Cancel %>" runat="server"/>
			</div>
			<div class="col-lg-5 col-xs-6">
				<asp:Button  ID="btnNextStep1" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Recover,Next %>" runat="server" OnClientClick="return eBankit.Presentation.Recover.ValidateRecover();" />
			</div>
		</div> 
	</asp:Panel>
	<asp:Panel ID="pnStep2" class="recover-panel" runat="server">
		<it:QuestionsControl id="ebQuestions" runat="server" />
		<div class="row marginTop15">
			<div class="col-xs-1 visible-lg"></div>
			<div class="col-lg-5 col-xs-6">
				<asp:Button  ID="btnCancelStep2" ActionType="Back" CssClass="btn btn-default btn-margin btn-block" Text="<%$FrontEndResources:Recover,Cancel %>" runat="server"/>
			</div>
			<div class="col-lg-5 col-xs-6">
				<asp:Button  ID="btnNextStep2" ActionType="Next" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Recover,Next %>" runat="server" OnClientClick="return eBankit.Presentation.RecoverQuestions.ValidateQuestions();" />
			</div>
		</div>  
	</asp:Panel>
	<asp:Panel ID="pnStep3" class="recover-panel" runat="server">
		<div class="row marginTop15">
			<div class="col-xs-1 visible-lg"></div>
			<div class="col-lg-5 col-xs-6">
				<asp:Button  ID="btnCancelStep3" CssClass="btn btn-default btn-margin btn-block" Text="<%$FrontEndResources:Recover,Cancel %>" runat="server"/>
			</div>
			<div class="col-lg-5 col-xs-6">
				<asp:Button  ID="btnNextStep3" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Recover,Next %>" runat="server" OnClientClick="" />
			</div>
		</div>  
	</asp:Panel>
	<asp:Panel ID="pnStep4" class="recover-panel" runat="server">
		<div class="row marginTop15">
			<div class="col-xs-1 visible-lg"></div>
			<div class="col-lg-5 col-xs-6">
				<asp:Button  ID="btnCancelStep4" CssClass="btn btn-default btn-margin btn-block" Text="<%$FrontEndResources:Recover,Cancel %>" runat="server"/>
			</div>
			<div class="col-lg-5 col-xs-6">
				<asp:Button  ID="btnNextStep4" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Recover,Next %>" runat="server" OnClientClick="" />
			</div>
		</div>  
	</asp:Panel>
	<asp:Panel ID="pnStep5" class="recover-panel" runat="server">
		<div class="row marginTop15">
			<div class="col-xs-1 visible-lg"></div>
			<div class="col-lg-5 col-xs-6">
				<asp:Button  ID="btnCancelStep5" CssClass="btn btn-default btn-margin btn-block" Text="<%$FrontEndResources:Recover,Cancel %>" runat="server"/>
			</div> 
			<div class="col-lg-5 col-xs-6">
				<asp:Button  ID="btnNextStep5" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Recover,Next %>" runat="server" OnClientClick="" />
			</div>
		</div>  
	</asp:Panel>
	<asp:Panel ID="pnStep6" class="recover-panel" runat="server">
		<div class="panel-enrol-title">
			<asp:Literal ID="litTitleStep6" runat="server" Text="<%$FrontEndResources:Recover,TitleStep6 %>"></asp:Literal>
		</div>	
		<div class="row marginTop15">
			<div class="col-xs-1 visible-lg"></div>
			<div class="col-lg-5 col-xs-6">
				<asp:Button  ID="btnCancelStep6" CssClass="btn btn-default btn-margin btn-block" Text="<%$FrontEndResources:Recover,Cancel %>" runat="server"/>
			</div> 
			<div class="col-lg-5 col-xs-6">
				<asp:Button  ID="btnNextStep6" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Recover,Next %>" runat="server" />
			</div>
		</div>  
	</asp:Panel>
	<asp:Panel ID="pnStepLast" class="recover-panel" runat="server">
		<div class="">
			<it:FlowLabel_v2  CssClass="sucess-text" ID="flwNewAlias" runat="server"/>
			<div class="sucess-text" >
				<asp:Literal ID="conclusionMsg" Text="<%$FrontEndResources:Recover,ConclusionMsg %>" runat="server"></asp:Literal>
			</div>
		</div>
		<div class="row marginTop15">
		<div class="col-xs-1 visible-lg"></div>
			<div class="col-lg-5 col-xs-6 col-lg-offset-3">
				<asp:Button  ID="btnEnter" CssClass="btn btn-primary btn-margin btn-block" Text="<%$FrontEndResources:Recover,Recover %>" runat="server"/>
			</div>
		</div>  
	</asp:Panel>
</div>

<script type="text/javascript">
		var hdnRadio = $('#<%=hdnRadio.ClientID %>');
		var txtAlias = $('#<%=txtAlias.TextBoxClientID %>');
		var txtOtherKeyValue = $('#<%=txtOtherKeyValue.TextBoxClientID %>');
		var lblOtherKeyValue = $('#<%=txtOtherKeyValue.LabelClientID %>');
		var divOther = $('#<%=divOther.ClientID %>');
		var divOtherValue = $('#<%=divOtherValue.ClientID %>');
		var ddlIdentityType = $('#<%=ddlIdentityType.DropDown.ClientID %>');
		var waterMarkOtherKey = "";
</script>

<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("recover-1.0.js".ResolveJsUrl("services"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>
