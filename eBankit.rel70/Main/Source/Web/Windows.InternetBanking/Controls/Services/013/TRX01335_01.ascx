
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01335_01.ascx.cs" Inherits="TRX01335_01" %>

<div id="divContent" runat="server" class="transaction-content">
    <div class="products-container widgets-container col-xs-12 col-lg-8 col-max" runat="server">
	    <asp:Panel ID="pnControls" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" runat="server">

		    <it:FlowInnerContainer ID="flwContainer" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
			    
                <div class="headerSubTitleOperations">
                    <span  runat="server" id="titleBeforeOperations"></span>
                    <span  runat="server" id="titleNumberOperations" style="font-weight: bold;"></span>
                    <span  runat="server" id="titleAfterOperations"></span>
                </div>
                
			        <asp:Repeater runat="server" ID="rptProducts" OnItemDataBound="rptProducts_ItemDataBound">
                        <ItemTemplate>
                            <div id="itemWrapper" class="col-xs-12 pending-product-container pending-page" runat="server">
                                <div class="col-xs-2 col-sm-2 wrapper-pending-icon"><div class="pending-icon"></div></div>
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
                                        
                                        <input type="hidden" runat="server" id="hdnProcessId" />
                                        <asp:Button runat="server" ID="btnProductCancelProcess" CssClass="btnCancelProcess" OnClick="btnCancel_Click" style="display:none;" />
                                        <a id="productBtnCancel" runat="server" ><div></div></a>

                                    </div>
                                    <div class="btn-wrapper">
                                        <a id="productBtnContinue" runat="server"><div></div></a>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

		    </it:FlowInnerContainer>
		    <div class="clearBoth"></div>
				
	    </asp:Panel>
    </div>
	<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/Services/Transactions/TRX01335-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
 

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


</div>


