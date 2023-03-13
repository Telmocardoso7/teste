<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00602_01.ascx.cs" Inherits="TRX00602_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
    <div id="divContent" runat="server" class="transaction-content">
        <asp:UpdatePanel ID="updContent" runat="server" UpdateMode="Always">
            <ContentTemplate>
                <it:FlowInnerContainer ID="flwData1" runat="server">
                    <div>
                        <it:ExtendedGridView
                            ID="grid"
                            runat="server"
                            AutoGenerateColumns="false"
                            CssClass="table hovered nowrap"
                            IsResponsive="true"
                            EnableViewState="True"
                            OnRowDataBound="GridRowDataBound"
                            GridLines="None"
                            EnableRowClicks="true"
                            AllowSorting="false">
                            <Columns>
                                <asp:TemplateField HeaderStyle-Width="1%" ItemStyle-CssClass="">
                                    <ItemTemplate>
                                        <asp:HiddenField EnableViewState="true" ID="hdnDigitalDocTypeId" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-Width="30%" HeaderText="<%$FrontEndResources:TRX00602,DigitalDocType%>">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDigitalDocType" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-Width="10%" HeaderText="<%$FrontEndResources:TRX00602,DigitalFormat%>" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 clearPadding">
                                            <label class="onoffswitch pull-right marginTop15">
                                                <input id="rbIdDigitalFormat" runat="server" type="checkbox" class="onoffswitch-checkbox" value="1" />
                                                <asp:Label ID="lblDescriptionDigitalFormat" runat="server" class="onoffswitch-label">
                                                <span class="onoffswitch-inner"></span>
                                                <span class="onoffswitch-switch"></span>
                                                <span class="check marginRight10 hidden"></span>
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderStyle-Width="10%" HeaderText="Email" HeaderStyle-CssClass="text-center">
                                    <ItemTemplate>
                                        <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 clearPadding">
                                            <label class="onoffswitch pull-right marginTop15">
                                                <input id="rbIdEmail" runat="server" type="checkbox" class="onoffswitch-checkbox rbEmail" value="1" />
                                                <asp:Label ID="lblDescriptionEmail" runat="server" class="onoffswitch-label">
                                                <span class="onoffswitch-inner"></span>
                                                <span class="onoffswitch-switch"></span>
                                                <span class="check marginRight10 hidden"></span>
                                                </asp:Label>
                                            </label>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <asp:Literal ID="Literal1" runat="server" Text="<%$FrontEndResources:TRX00602,DigitalDocsEmptyGrid%>"></asp:Literal>
                            </EmptyDataTemplate>
                        </it:ExtendedGridView>
                        <it:TextBoxControl_v2 ID="txtEmail" MaxLength="0" MinLength="0" Label="<%$FrontEndResources:TRX00602,Email%>" runat="server" />
                    </div>
                </it:FlowInnerContainer>
            </ContentTemplate>
        </asp:UpdatePanel>
        <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00602-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
        <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00602-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    </div>
</div>
