<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00141_01.ascx.cs" Inherits="TRX00141_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
        <asp:UpdatePanel runat="server" ID="updatePanelOperations" UpdateMode="Always">
            <ContentTemplate>
                 <asp:Panel ID="pnControls" CssClass="clearPadding" runat="server">
                <it:FlowContainerDetail ID="flwData" CssClass="panel panel-detail" runat="server">
                    <div class="table-grid-border">
                        <div class="col-lg-12 clearPadding">
                            <div class="metro">
                                <it:GridViewControl ID="gridCheques" runat="server" AutoGenerateColumns="false" CssClass="table hovered table-resp-to1199 noarrow" IsResponsive="true"
                                    GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" RecordCounterComplementarText="<%$FrontEndResources:TRX00141,checksBookListTitle %>" OnRowDataBound="gvCheques_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00110,lblFirstCheckValue%>">
                                            <ItemTemplate>
                                                <div id="lblFirstCheckContainer" runat="server" class="hasBlueLabelPhone">
                                                    <asp:Label ID="lblFirstCheckValue" runat="server" />
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00110,lblLastGroupCheque%>">
                                            <ItemTemplate>
                                                <div id="lblLastGroupChequeContainer" runat="server" class="hasBlueLabelPhone">
                                                    <asp:Label ID="lblLastGroupCheque" runat="server" />
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00110,lblEmissionDateValue%>">
                                            <ItemTemplate>
                                                <asp:Label ID="lblEmissionDateValue" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField Visible="False" HeaderText="<%$FrontEndResources:TRX00110,lblFirstOwnerRelation%>">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFirstOwnerRelation" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-CssClass="visible-md visible-lg visible-sm" HeaderText="<%$FrontEndResources:TRX00110,lblFirstOwnerName%>">
                                            <ItemTemplate>
                                                <asp:Label ID="lblFirstOwnerName" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="<%$FrontEndResources:TRX00110,lblCurrency%>" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblCurrency" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-CssClass="visible-md visible-lg visible-sm" HeaderText="<%$FrontEndResources:TRX00110,lblChequeType%>">
                                            <ItemTemplate>
                                                <asp:Label ID="lblChequeType" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField Visible="True" ItemStyle-CssClass="visible-md visible-lg visible-sm" HeaderText="<%$FrontEndResources:TRX00110,lblValidDate%>">
                                            <ItemTemplate>
                                                <asp:Label ID="lblValidDate" runat="server" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderStyle-Width="30" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <a id="btnDelete" href="#" runat="server" visible="false">
                                                    <img id="img1" src="<%$ebFile:~/Content/currenttheme/images/icon/td_icon_delete.png%>" runat="server" /></a>
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                    </Columns>
                                </it:GridViewControl>
                            </div>
                        </div>
                    </div>
                </it:FlowContainerDetail>
                <asp:Button ID="btnGoTo" Style="display: none" runat="server" />
                <asp:HiddenField ID="hdnChequeId" runat="server" />
                <asp:HiddenField ID="hdnFirstCheckNumber" runat="server" />
                <asp:HiddenField ID="hdnLastCheckNumber" runat="server" />
                <asp:HiddenField ID="hdnCurrency" runat="server" />
                <asp:HiddenField ID="hdnCheque" runat="server" />
                <asp:HiddenField runat="server" ID="hdnCancelReasonId" />
                <div class="clearBoth"></div>
                <div id="proofContainer" class="proof-container" runat="server">
                    <div class="proof-inner">
                        <asp:PlaceHolder ID="phProofInner" runat="server"></asp:PlaceHolder>
                    </div>
                </div>
                     </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
            
    </div>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00141-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>

<script type="text/javascript">
    GoToDetails = function (firstCheck, lastCheck, Currency) {
        eBankit.Presentation.SetBlockPageCommon();
        $('body').block();
        var selReasonVal = itcore_ui.GetSelectedReasonValue();
        hdnFirstCheckNumber.val(firstCheck);
        hdnLastCheckNumber.val(lastCheck);
        hdnCurrency.val(Currency);
        hdnCancelReasonId.val(selReasonVal);
        var btnGoTo = $('[id$=btnGoTo]');
        btnGoTo.click();
    }

    ReasonSelectionChanged = function () {
        var selReasonVal = itcore_ui.GetSelectedReasonValue();
        if (selReasonVal != null) {
            itcore_ui.HideModal();
            hdnChequeId.val(checkNumber);
            hdnCheckNumberAcc.val(checkAcc);
            hdnCancelReasonId.val(selReasonVal);
            __doPostBack(btnDeleteId, '');
        }
    }

</script>
