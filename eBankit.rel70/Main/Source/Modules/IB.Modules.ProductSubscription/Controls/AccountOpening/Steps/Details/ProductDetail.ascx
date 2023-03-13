<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductDetail.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Controls.AccountOpening.Steps.Details.ProductDetail" %>

<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-left clearPadding">
    <p>
        <asp:Label Text="<%$FrontEndResources:AccountOpening,ProductDetailDescription%>" runat="server" />
    </p>
    <div class="bs-head-metro ">
        <h3 class="head">
            <asp:Label Text="<%$FrontEndResources:AccountOpening,SelectedProductTitle%>" runat="server" />
        </h3>
    </div>

    <div id="productItem" class="col-xs-12 no-padding product-item-container product-introduction-item" runat="server">
                            <div class="col-xs-12 clearPadding product-list-item">
        <div class="col-xs-12 product-item-content clearPadding">
            <h3 class="col-xs-12 col-sm-8">
                <asp:Literal ID="ltrProductTitle"  Text="<%$FrontEndResources:AccountOpening,ProductListPlaceholderTitle%>" runat="server"></asp:Literal></h3>
            <span class="col-xs-12 col-sm-8">
                <asp:Literal ID="ltrProductDescription" Text="<%$FrontEndResources:AccountOpening,ProductListPlaceholderDescription%>" runat="server"></asp:Literal></span>
            <div class="col-xs-12 col-sm-8 btn-more product-conditions-link">
                <asp:LinkButton ID="btnChangeProduct" OnClick="btnChangeProduct_Click" runat="server" Text="<%$FrontEndResources:AccountOpening,ChangeProductBtn %>"></asp:LinkButton>
            </div>
            </div>
        </div>
    </div>
    <div class="clearBoth"></div>
    <div class="transaction-content">
        <it:flowinnercontainer id="flwData" title="<%$FrontEndResources:AccountOpening,ProductDetailTitle %>" customcssclass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
    <div>
        <it:TextBoxControl_v2 ID="txtAccountName" autocomplete="off"  IsRequired="true" Label="<%$FrontEndResources:AccountOpening,txtAccountName%>"
            ValidationRequiredMessage="<%$ FrontEndResources:AccountOpening,txtAccountNameEmptyError %>" runat="server" />
        <it:FlowLabel_v3 ID="flbAccountName" Label=" " Text="<%$FrontEndResources:AccountOpening,AccountNameTip%>" runat="server" />
    </div>
    </it:flowinnercontainer>
    </div>
</div>
