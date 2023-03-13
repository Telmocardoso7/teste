<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CustomLoginSecurityQuestions.ascx.cs" Inherits="CustomLoginSecurityQuestions" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div class="security-questions-container">

    <div class="panel-login-inputs">
        <div id="ValidationMessage" runat="server" visible="False" class="ValidationMessage"></div>
    </div>

    <asp:Panel ID="pnStepInit" EnableViewState="true" ViewStateMode="Enabled"  class="recover-panel" runat="server">
        <p class="text-responsive-1-3 loginWelcomeMessage login-security-image">
            <asp:Label ID="lblSecurityQuestions" Text="<%$FrontEndResources:Register,SecurityQuestionsTitle %>" runat="server"></asp:Label>
        </p>
         <div class="panel-login-inputs">
            <asp:Label ID="lblInfoSecurityQuestions" runat="server" class="panel-line-info-alert" Text="<%$FrontEndResources:Register,InfoSecurityQuestions%>"></asp:Label>
            <asp:HiddenField ID="hdnQuestions" runat="server" />
            <asp:HiddenField ID="hdnAnswers" runat="server" />
             <asp:Repeater ID="rptQuestions" runat="server" OnItemDataBound="rptQuestions_ItemDataBound">
                <ItemTemplate>
                    <div class="marginTop15">
                        <it:DropDownListControl_v2 ID="ddlQuestion" IsRequired="true" Label="<%$FrontEndResources:TRX01150,ddlQuestion%>" runat="server" />
                        <it:TextBoxControl_v2 ID="txtAnswer" IsRequired="true" TextMode="Password" Label="<%$FrontEndResources:TRX01150,txtAnswer%>" runat="server" />
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <div class="row marginTop15">
            <div class="col-lg-12">
                <asp:Button ID="btnNextStep1" CssClass="btn btn-success btn-margin btn-block" Text="<%$FrontEndResources:Login,Continue %>" OnClientClick="return eBankit.Presentation.LoginSecurityQuestions.ValidateQuestions();" runat="server" />
            </div>
            <div class="col-lg-12">
                <asp:Button ID="btnCancelStep1" CssClass="btn btn-cancel btn-margin btn-block" Text="<%$FrontEndResources:Login,Cancel %>" runat="server" />
            </div>
        </div>
    </asp:Panel>

	<asp:Panel ID="pnStep2" class="recover-panel" runat="server">
	    <asp:HiddenField ID="hdnSelectedImageId" runat="server" />
	    <asp:HiddenField ID="hdnHasImage" runat="server" />
	    <asp:HiddenField ID="hdnHasCaption" runat="server" />
        <p class="text-responsive-1-3 loginWelcomeMessage login-security-image">
            <asp:Label ID="lblSecurityImages" Text="<%$FrontEndResources:Register,SecurityImagesTitle %>" runat="server"></asp:Label>
        </p>
	    <div id="securityImagesList" runat="server" class="image-container-control">
            <asp:Label ID="lblInfoSecurityImages" runat="server" Text="<%$FrontEndResources:TRX01160,TitleDataContainer %>" CssClass="panel-line-info-alert" />
		    <div class="image-container-centered col-sm-12">
			    <asp:Repeater ID="rptSecurityImages" runat="server" OnItemDataBound="rptSecurityImages_ItemDataBound">
				    <ItemTemplate>
					    <div id="divImageContainer" runat="server" class="image-container-item" onclick="selectImage(this);">
						    <div id="divImageContainerImage" runat="server" class="image-container-image">
							    <div class="image-container-overlay">
							    </div>
							    <asp:Image ID="imageSecurity" runat="server" Height="136" Width="136" />
						    </div>
						    <div id="divSelector" runat="server" class="image-container-selector">
							    <div id="divSelectorFill" runat="server" class="image-container-selector-fill">
							    </div>
						    </div>
					    </div>
				    </ItemTemplate>
			    </asp:Repeater>
		    </div>
        </div>
        <div class="clearBoth"></div>
        <div id="securityCaption" runat="server" class="image-container-control marginTop15">
            <asp:Label ID="lblInfoSecurityCaption" runat="server" Text="<%$FrontEndResources:TRX01160,TitleCaptionContainer %>" CssClass="panel-line-info-alert" />
            <it:textboxcontrol_v2 id="txtImageCaption" maxlength="0" minlength="0" showlabel="true" Label="<%$FrontEndResources:Register,ImageCaption %>" textmode="SingleLine" isrequired="true" watermark="<%$FrontEndResources:Register,ImageCaption %>" runat="server" />
	    </div>
        <div class="row marginTop15">
            <div class="col-lg-12">
                <asp:Button ID="btnNextStep2" CssClass="btn btn-success btn-margin btn-block" Text="<%$FrontEndResources:Login,Continue  %>" OnClientClick="return eBankit.Presentation.LoginSecurityQuestions.ValidateImages();" runat="server" />
            </div>
            <div class="col-lg-12">
                <asp:Button ID="btnCancelStep2" CssClass="btn btn-cancel btn-margin btn-block" Text="<%$FrontEndResources:Login,Cancel %>" runat="server" />
            </div>
        </div>
    </asp:Panel>

    <asp:Panel ID="pnStep3" class="recover-panel" runat="server">
        <p class="text-responsive-1-3 loginWelcomeMessage login-security-image">
            <asp:Label ID="Label2" Text="<%$FrontEndResources:Register,AccessKeyTitle %>" runat="server"></asp:Label>
        </p>
        <div id="divNewUsername" runat="server" class="panel-login-inputs" visible="false">
            <it:TextBoxControl_v2 id="txtNewUsername" Label="<%$FrontEndResources:Register,NewUsername %>" showlabel="true" textmode="SingleLine" isrequired="true" watermark="<%$FrontEndResources:Register,Username %>" runat="server" />
        </div>
        <div class="panel-login-inputs">
            <asp:Label ID="lblNewKeyInfo" CssClass="panel-line-info-alert" Text="<%$FrontEndResources:Register,NextTimeMessage %>" runat="server"></asp:Label>
            <it:TextBoxControl_v2 ID="txtNewKey" MinLength="7" MaxLength="20" TextMode="Password" Label="<%$FrontEndResources:Register,NewKey %>" runat="server" Watermark="<%$FrontEndResources:Register,NewKeyWatermark %>" />
            <it:TextBoxControl_v2 ID="txtNewKeyConfirm" MinLength="7" MaxLength="20" TextMode="Password" Label="<%$FrontEndResources:Login,Confirm %>" runat="server" Watermark="<%$FrontEndResources:Register,NewKeyConfirmWatermark %>" />
        </div>

        <div class="row marginTop15">
            <div class="col-lg-12">
                <asp:Button ID="btnNextStep3" CssClass="btn btn-success btn-margin btn-block" Text="<%$FrontEndResources:Login,Confirm %>" OnClientClick="return eBankit.Presentation.LoginSecurityQuestions.ValidateNewAccessCode();"  runat="server" />
            </div>
            <div class="col-lg-12">
                <asp:Button ID="btnCancelStep3" CssClass="btn btn-cancel btn-margin btn-block" Text="<%$FrontEndResources:Login,Cancel %>" runat="server" />
            </div>
        </div>
    </asp:Panel>

	<asp:Panel ID="pnStep4" class="recover-panel" runat="server">
		
	</asp:Panel>
	<asp:Panel ID="pnStep5" class="recover-panel" runat="server">
		
	</asp:Panel>
	<asp:Panel ID="pnStep6" class="recover-panel" runat="server">
		
	</asp:Panel>
	<asp:Panel ID="pnStepLast" class="recover-panel" runat="server">
		
	</asp:Panel>
</div>

<script type="text/javascript">
    var hdnSecurityImage = $('#<%=this.hdnSelectedImageId.ClientID %>');
    var hdnHasImage = $("#<%=this.hdnHasImage.ClientID%>");
    var hdnHasCaption = $("#<%=this.hdnHasCaption.ClientID%>");
    var TextBoxNewKey = $('#<%=this.txtNewKey.TextBoxClientID %>');
    var LabelBoxNewKey = $('#<%=this.txtNewKey.LabelClientID %>');
    var TextBoxNewKeyConfirm = $('#<%=this.txtNewKeyConfirm.TextBoxClientID %>');
    var LabelBoxNewKeyConfirm = $('#<%=this.txtNewKeyConfirm.LabelClientID %>');
    var TextBoxNewUsername = $('#<%=this.txtNewUsername.TextBoxClientID%>');
    var TextBoxImageCaption = $('#<%=this.txtImageCaption.TextBoxClientID%>');
    var hdnQuestions = $("#<%=this.hdnQuestions.ClientID%>");
    var hdnAnswers = $("#<%=this.hdnAnswers.ClientID%>");
</script>

<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("loginSecurityQuestions-1.0.js".ResolveJsUrl("services"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>

