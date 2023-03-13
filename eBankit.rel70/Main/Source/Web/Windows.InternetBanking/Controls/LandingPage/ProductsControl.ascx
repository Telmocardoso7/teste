<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductsControl.ascx.cs" Inherits="eBankit.UI.Modules.Web.Onboarding.Controls.LandingPage.ProductsControl" %>


<div class="clearBoth"></div>
<div class="products-container widgets-container col-xs-12 col-lg-8 col-max">
    <h3 class="products-title">
        <asp:Literal ID="productsTitle" Text='<%$FrontEndResources:AccountOpening,ProductsTitle %>' runat="server"></asp:Literal>
    </h3>
    <asp:Literal ID="productsDescription" Text='<%$FrontEndResources:AccountOpening,ProductsDescription %>' runat="server"></asp:Literal>
    <div>
        <h4>
            <asp:Literal ID="productTitle" runat="server" Text="<%$FrontEndResources:AccountOpening,ProductTitle %>"></asp:Literal>
        </h4>
        <asp:Repeater ID="rptProducts" runat="server" OnItemDataBound="rptProducts_ItemDataBound">
            <ItemTemplate>
                <div id="productContainer" class="row product-container" runat="server">
                    <div class="col-sm-2 product-image hidden-xs">
                        <asp:Image id="imageProduct" runat="server" />

                    </div>
                    <div class="col-xs-12 col-sm-10 product-description-container">
                        <div class="col-xs-12 col-sm-9 product-description">
                            <asp:Literal ID="productDescription" runat="server" Text="<%$FrontEndResources:AccountOpening,ProductDescription %>"></asp:Literal>
                        </div>
                        <div class="col-xs-6 col-xs-offset-3 col-sm-3 col-sm-offset-0 product-btn">
                            <asp:HyperLink ID="productBtn" CssClass="btn btn-primary" runat="server" Text="<%$FrontEndResources:AccountOpening,ProductBtnDescription %>"></asp:HyperLink>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
<div class="clearBoth"></div>
