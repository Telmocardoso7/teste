<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01160_01.ascx.cs" Inherits="TRX01160_01" %>
<%@ Import Namespace="eBankit.Common.Extensions" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <asp:UpdatePanel ID="updContent" runat="server" UpdateMode="Always">
        <ContentTemplate>

            <div id="divContainerImages" runat="server">
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro bs-reduced-transaction  transp">
                    <h3 class="head"><asp:Literal runat="server" Text="<%$FrontEndResources:TRX01160,TitleDataContainer %>" /></h3>
                </div>
                <div class="grayContainer content-message metro security-image-without-margin">
                    <it:FlowInnerContainer ID="flwSecurityImage" HideTitle="true" CustomCssClass="col-max" runat="server">
                        <asp:HiddenField ID="hdnSelectedImageId" runat="server" />
                        <div id="securityImagesList" class="image-container-control">
                            <asp:Repeater ID="rptSecurityImages" runat="server" OnItemDataBound="rptSecurityImages_ItemDataBound">
                                <ItemTemplate>
                                    <div id="divImageContainer" runat="server" class="image-container-item" onclick="selectImage(this);">
                                        <div id="divImageContainerImage" runat="server" class="image-container-image">
                                            <div class="image-container-overlay">
                                            </div>
                                            <asp:Image ID="imageSecurity" runat="server" Height="136" Width="136"/>   
                                        </div>
                                        <div ID="divSelector" runat="server" class="image-container-selector">
                                            <div ID="divSelectorFill" runat="server" class="image-container-selector-fill">
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </it:FlowInnerContainer>
                </div>
            </div>

            <it:FlowInnerContainer ID="flwSecurityImageCaption" Title="<%$FrontEndResources:TRX01160,TitleCaptionContainer %>" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
                <div>
                    <it:TextBoxControl_v2 ID="txtSelectedImageCaption" IsRequired="True" MaxLength="0" MinLength="0" Label="<%$FrontEndResources:TRX01160,txtSelectedImage%>" runat="server" />
                </div>
            </it:FlowInnerContainer>

        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">
        var hdnSecurityImage = $("#<%=this.hdnSelectedImageId.ClientID%>");
    </script>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01160-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01160-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>