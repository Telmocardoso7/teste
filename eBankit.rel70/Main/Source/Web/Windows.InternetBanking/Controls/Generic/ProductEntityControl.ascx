<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductEntityControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.ProductEntityControl" %>

<div id="divContainerProducts" class="scrollContainerEntities scrollContainerProducts">
    <ul class="bxsliderprods">
        <asp:Repeater ID="rptProductEntities" runat="server" OnItemDataBound="rptProductEntities_ItemDataBound">
            <ItemTemplate>
                <li>
                    <div id="divProductEntity" class="entityContent entityContent-prod" runat="server">
                        <asp:Label ID="lblProductEntityName" CssClass="neg-bot-text-prod" runat="server" />
                        <asp:Label ID="lblProductEntityDescription" CssClass="neg-bot-text-prod-bot" runat="server" />
                    </div>
                </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
</div>


<asp:HiddenField ID="hdnSelectedProductEntityId" runat="server" />
<asp:HiddenField ID="hdnSelectedCurrentEntity" runat="server" />

<asp:HiddenField ID="hdnScrollContentLenght" runat="server" />
<asp:Button ID="btnSelectedEntityChanged" runat="server" CausesValidation="false" CssClass="hidden" />
