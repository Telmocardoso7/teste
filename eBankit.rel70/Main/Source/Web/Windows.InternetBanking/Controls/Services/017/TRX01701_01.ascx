<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01701_01.ascx.cs" Inherits="TRX01701_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <div class="col-left col-transaction messagesContainer transaction-content" runat="server" id="rightTransaction">
        <asp:UpdatePanel runat="server" ID="upCreateTicket">
            <ContentTemplate>
                <asp:Panel ID="panelNewTicket" runat="server" Visible="true">
                    <it:FlowInnerContainer ID="FlowInnerContainer1" CustomCssClass="bs-reduced bs-head-metro bs-reduced-transaction col-lg-8 col-max" Title="<%$FrontEndResources:TRX01701,NewTicket%>" runat="server">
                        <div>
                            <it:TextBoxControl_v2 ID="textTicketTitle" IsRequired="true" MaxLength="250" Label="<%$FrontEndResources:TRX01701,Title_summary%>" OnBlur="eBankit.Presentation.TRX01701.ValidateTitle();" runat="server" />
                            <it:TextBoxControl_v2 ID="textTicketDescription" IsRequired="true" Label="<%$FrontEndResources:TRX01701,Description%>" runat="server" TextMode="MultiLine" Rows="10" OnBlur="eBankit.Presentation.TRX01701.ValidateDescription();" />

                        </div>
                    </it:FlowInnerContainer>
                    <asp:Panel ID="pnWrapper" runat="server"></asp:Panel>
                    <div class="trs_buttons col-lg-8 col-max">
                        <it:LinkButtonControl ID="LinkButtonControl2" ActionType="Back" CustomCssClass="btn-default" Text="<%$FrontEndResources:TRX01701,Back%>" runat="server" />
                        <it:LinkButtonControl ID="LinkButtonControl3" ActionType="Conclusion" OnClick="CreateNewTicket" Text="<%$FrontEndResources:TRX01701,Create%>" runat="server" OnClientClick="return eBankit.Presentation.TRX01701.ValidateCreateTicketFields();" />
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <script type="text/javascript">
        var idg = '<%=this.CurrentContext.SessionGUID %>';
        var interactionid = '<%=this.CurrentContext.InteractionContext.Interaction.InteractionId %>';

        eBankit.Presentation.TRX01701 = {};

        $(document).ready(function () {
            eBankit.Presentation.TRX01701.ValidateDescription = function () {
                var ret = true;
                var description = $('[id$=textTicketDescription_txField]');
                if (description.val() == null || description.val() == '') {
                    ret = false;
                    eBankit.Presentation.InsertValidateMsg_V2(description, top.eBankit.Presentation.GetResource("txtTicketDescriptionInvalidFormat"));
                } else {
                    eBankit.Presentation.RemoveValidateMsg(description);
                }
                return ret;
            };
            eBankit.Presentation.TRX01701.ValidateTitle = function () {
                var ret = true;
                var title = $('[id$=textTicketTitle_txField]');
                if (title.val() == null || title.val() == '') {
                    ret = false;
                    eBankit.Presentation.InsertValidateMsg_V2(title, top.eBankit.Presentation.GetResource("txtTicketTitleInvalidFormat"));
                } else {
                    eBankit.Presentation.RemoveValidateMsg(title);
                }
                return ret;
            };
            eBankit.Presentation.TRX01701.ValidateCreateTicketFields = function () {
                var ret = true;
                var validDescription = eBankit.Presentation.TRX01701.ValidateDescription();
                var validTitle = eBankit.Presentation.TRX01701.ValidateTitle();
                if (!validDescription || !validTitle) {
                    ret = false;
                }
                return ret;
            };
        });



    </script>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01701-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01701-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
