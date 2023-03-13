<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BreadcrumbsControl.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Controls.BreadcrumbsControl" %>

<div id="dvCrumbs" runat="server">
    <div class="breadcrumbs-container">
        <div class="breadcrumbsRepeater">
            <asp:Repeater ID="rptShowSteps" runat="server" OnItemDataBound="rptShowSteps_ItemDataBound">
                <ItemTemplate>
                    <div id="grouperBC" runat="server">
                        <img id="iconStepPosition" visible="false" runat="server" />
                        <div class="groupNumber" id="groupNumber" runat="server"></div>
                    </div>
                    <div id="separateCrumbsIcons" class="breadcrumbs-divider separateCrumbsIcons" runat="server"></div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</div>
