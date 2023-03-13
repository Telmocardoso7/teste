<%@ Control Language="C#" AutoEventWireup="true" EnableViewState="true" CodeBehind="AlertsSecurityGroupControl.ascx.cs" Inherits="eBankit.UI.Modules.Web.Alerts.AlertsSecurityGroupControl" %>

<asp:UpdatePanel ID="UpdatePanel" runat="server">
    <ContentTemplate>
        <it:flowcontainer visible="true" id="fcGrid" hidetitle="false" runat="server">
            <div class="div-alerts">
             
        <asp:Repeater ID="rptAlertsSecurity" runat="server" OnItemDataBound="AlertsDataBound">
            <HeaderTemplate>
                <table class="table hovered nowrap table-alerts">
                    <tbody>
                        <tr>
                            <th style="width:25%">
                                <asp:Literal ID="litAlertTypeDescription" Text="<%$FrontEndResources:Notifications,AlertTypeDescription%>" runat="server"></asp:Literal></th>
                            <asp:Repeater ID="rptHeader" runat="server" OnItemDataBound="HeaderDataBound">
                                <ItemTemplate>
                                    <th class="alignCenter"  >
                                        <asp:Literal ID="litHeaderTitle" runat="server"></asp:Literal></th>
                                </ItemTemplate>
                            </asp:Repeater>
                            </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr class="tdNotification">
                    <td class="alignCenter" style="width:25%; vertical-align:middle">
                        <asp:HiddenField EnableViewState="true" ID="hdfalertTypeID" runat="server" />
                         <asp:HiddenField ID="hdfalertTypeIsMandatory" runat="server" />
                         <asp:Label ID="lblAlertTypeName" runat="server" />
                         <asp:Label ID="lblReqAlert" runat="server">*</asp:Label> 
                        
                    </td>
                    <asp:Repeater ID="rptChannels" runat="server" OnItemDataBound="ChannelsDataBound">
                        <ItemTemplate>
                            <td class="alignCenter channel">
                                <it:checkboxswitchcontrol_v2 id="chkChannel" runat="server"></it:checkboxswitchcontrol_v2>
                                <asp:HiddenField ID="hdnChannelId" runat="server" />
                                <asp:HiddenField ID="hdnChannelChecked" runat="server" />
                            </td>
                        </ItemTemplate>
                    </asp:Repeater>
                    
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
                </table>
            </FooterTemplate>
        </asp:Repeater>
                </div>
            </it:flowcontainer>
    </ContentTemplate>
</asp:UpdatePanel>
<style type="text/css">
    .centerField-wrapper label {
        margin-right: 50%;
    }
</style>