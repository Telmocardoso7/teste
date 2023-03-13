<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PendingProductControl.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.LandingPage.PendingProductControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<%@ Import Namespace="eBankit.Common.Sites" %>

<div class="clearBoth"></div>
<div class="products-container widgets-container col-xs-12 col-lg-8 col-max" runat="server">
    <div class="products-title">
        <h3>
            <asp:Literal ID="pendingProductsTitle" Text='<%$FrontEndResources:AccountOpening,PendingProductsTitle %>' runat="server"></asp:Literal>
        </h3>
        <h4>
            <asp:Literal ID="pendingProductTitle" Text='<%$FrontEndResources:AccountOpening,PendingProductTitle %>' runat="server"></asp:Literal>
        </h4>
    </div>
    <asp:Repeater ID="rptPendingProcesses" runat="server" EnableViewState="true" OnItemDataBound="rptPendingProcesses_ItemDataBound">
        <ItemTemplate>
            <div id="itemWrapper" class="col-xs-12 pending-product-container" runat="server">
                <div class="col-xs-2 col-sm-2"><div class="pending-icon"></div></div>
                <div class="col-xs-6 col-sm-8 pending-product">
                    <div class="col-xs-12 col-sm-4 ">
                        <div>
                            <h5><asp:Literal ID="productNameLbl" Text='<%$FrontEndResources:AccountOpening,PendingProductLbl %>' runat="server"></asp:Literal></h5>
                            <h4 class="product-name"><asp:Literal ID="productName" runat="server"></asp:Literal></h4>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4">
                        <div>
                            <h5><asp:Literal ID="productDateLbl" Text='<%$FrontEndResources:AccountOpening,PendingProductDateLbl %>' runat="server"></asp:Literal></h5>
                            <h4><asp:Literal ID="productDate" runat="server"></asp:Literal></h4>
                        </div>
                    </div>
                    <div class="col-xs-12 col-sm-4 pending-product">
                        <div>
                            <h5><asp:Literal ID="productStatusLbl" Text='<%$FrontEndResources:AccountOpening,PendingProductStatusLbl %>' runat="server"></asp:Literal></h5>
                            <h4><asp:Literal ID="productStatus" runat="server"></asp:Literal></h4>
                        </div>
                    </div>
                </div>
                <div class="col-xs-4 col-sm-2 btn-container">
                    <div class="btn-wrapper">
                        <a id="productBtnCancel" runat="server" tabindex="0" title="<%$FrontEndResources:AccountOpening,DeleteProcess %>"><div></div></a>
                    </div>
                    <div class="btn-wrapper">
                        <a id="productBtnContinue" runat="server" title="<%$FrontEndResources:AccountOpening,ContinueProcess %>"><div></div></a>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <div class="clearBoth"></div>

    

    <div class="link-view-all">
        <asp:HyperLink runat="server" ID="litShow" Text="<%$FrontEndResources:AccountOpening,ProcessExistsViewAllLink%>"></asp:HyperLink>
    </div>
       
</div>
<div class="clearBoth"></div>
<script type="text/javascript" src="<%= Utils.GetCacheVersion("ebankitControls/dashboard/pending-product-widget.js".ResolveJsUrl(), Utils.CacheVersionKey.JScript) %>"></script>
<script type="text/javascript">
    var eBankit = eBankit || {};
    eBankit.pendingProductWidget = eBankit.pendingProductWidget || {};
    eBankit.pendingProductWidget.ConfirmTitle = '<%=eBankit.Common.Globalization.Translate.GetJSTransactionString("AccountOpening","ProcessDeleteTitle").Replace(System.Environment.NewLine, "<br>") %>';
    eBankit.pendingProductWidget.ConfirmMsg = '<%=eBankit.Common.Globalization.Translate.GetJSTransactionString("AccountOpening","ProcessDeleteDescription").Replace(System.Environment.NewLine, "<br>") %>';
    eBankit.pendingProductWidget.ConfirmButton = '<%=eBankit.Common.Globalization.Translate.GetJSTransactionString("AccountOpening","ProcessDeleteConfirmButton") %>';
    eBankit.pendingProductWidget.CancelButton = '<%=eBankit.Common.Globalization.Translate.GetJSTransactionString("AccountOpening","ProcessDeleteCancelButton") %>';
    eBankit.pendingProductWidget.ShowMore = '<%=eBankit.Common.Globalization.Translate.GetJSTransactionString("AccountOpening","ProcessExistsViewAll") %>';
    eBankit.pendingProductWidget.ShowLess = '<%=eBankit.Common.Globalization.Translate.GetJSTransactionString("AccountOpening","ProcessExistsViewFew") %>';
</script>