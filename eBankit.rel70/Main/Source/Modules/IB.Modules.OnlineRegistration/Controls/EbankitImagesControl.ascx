<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EbankitImagesControl.ascx.cs" Inherits="eBankit.UI.Controls.InternetBanking.EbankitImagesControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<p class="text-responsive-1-3">
    <asp:Literal ID="litTitleStep4" runat="server" Text="<%$FrontEndResources:Register,TitleImage %>"></asp:Literal>
</p>

<div class="panel-login-inputs panel-register-unlabelled">
    <asp:HiddenField ID="hdnSelectedImageId" runat="server" />
    <asp:HiddenField ID="hdnHasImage" runat="server" />
    <asp:HiddenField ID="hdnHasCaption" runat="server" />
    <div id="securityImagesList" class="image-container-control">
        <div class="row">
            <div class="image-container-centered col-sm-12">
                <asp:Repeater ID="rptSecurityImages" runat="server">
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
                <br />
            </div>
        </div>
    <it:textboxcontrol_v2 id="txtImageCaption" maxlength="0" minlength="0" showlabel="true" textmode="SingleLine" visible="False" cssclass="field field-labeless" showtooltiplikehelp="true" isrequired="true" tooltipkey="txtImageCaption" watermark="<%$FrontEndResources:Register,ImageCaption %>" runat="server" onkeyup="eBankit.Presentation.RegisterImages.ValidateCaption(this.txtImageCaption)" />
</div>
</div>

<script type="text/javascript">
    var hdnSecurityImage = $("#<%=this.hdnSelectedImageId.ClientID%>");
    var hdnHasImage = $("#<%=this.hdnHasImage.ClientID%>");
    var hdnHasCaption = $("#<%=this.hdnHasCaption.ClientID%>");
    var txtImageCaption = $("#<%=this.txtImageCaption.ClientID%>");
</script>

<%: Scripts.Render(eBankit.Common.Sites.Utils.GetCacheVersion("registerImages-2.0.js".ResolveModuleScriptUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.JScript)) %>
