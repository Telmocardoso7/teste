<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="NewEntity.ascx.cs" Inherits="eBankit.UI.Modules.Web.AccountOpening.NewEntity" %>
<%@ Register TagPrefix="st" TagName="NewEntityData" Src="NewEntityData.ascx" %>

<asp:UpdatePanel ID="updatePanel" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
    <ContentTemplate>
        <div id="flwTabs" class="accountopening-tab-background" runat="server" visible="true">
            <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 col-lg-8 col-max fullWidth">
                <section>
                    <div class="col-lg-12 col-left noprint clearPadding paddingTop5 paddingBottom5">
                        <ul class="ActivityTabs_Wrapper row">
                            <asp:Repeater ID="repeaterHolders" runat="server">
                                <ItemTemplate>
                                    <li id="holderElem" runat="server">
                                        <asp:LinkButton runat="server" href="javascript:void(0);" ID="tabCollateralizedDetail" class="ActivityTabs All">
                                            <asp:UpdatePanel runat="server" ID="UpdatePanel3">
                                                <ContentTemplate>
                                                    <div class="ActivityTabs_Title">
                                                        <div class="ActivityTabs_Icon_Configuration">
                                                            <asp:Label runat="server" CssClass="lblHolder" ID="lblCounterName2"></asp:Label></div>
                                                        <div class="ActivityTabs_Counter">
                                                            <asp:Literal ID="litCounterValue2" runat="server"></asp:Literal>
                                                        </div>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </asp:LinkButton>
                                    </li>
                                </ItemTemplate>
                            </asp:Repeater>
                        </ul>
                    </div>
                </section>
            </div>
        </div>

        <asp:Repeater ID="repeaterHoldersContent" runat="server">
            <ItemTemplate>
                <div id="entityData<%# Container.DataItem %>" class="tab">
                    <st:NewEntityData ID="entityData" runat="server" />
                </div>
            </ItemTemplate>
        </asp:Repeater>

    </ContentTemplate>
</asp:UpdatePanel>

