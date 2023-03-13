<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AssociateAccountsControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.Controls.PSD2.AssociateAccountsControl" %>


    <asp:Repeater ID="rptAssociatedAccounts" runat="server" OnItemDataBound="rptAssociatedAccounts_ItemDataBound">
            <ItemTemplate>
                <div class="containerWrapper">
                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max listItemContainerLarge">
                        <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 content-body fullWidth ">
                            <section>
                                <div class="col-lg-12 col-left clearPadding">
                                    <span>
                                        <div class="trx-container">
                                            <div class="product-list">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding">

                                                    <div class=" account">
                                                        <asp:HiddenField ID="hidCreditAccountNumber" runat="server" />
                                                        <div class="pull-left col-xs-6 col-sm-5 col-md-4 col-lg-4 content-accounts flLeft clearPadding">
                                                            <div class="scroll-item-icon">
                                                                <asp:Image class="bankLogo" runat="server" ID="BankImage" CssClass="bank-logo"></asp:Image>
                                                            </div>
                                                            <h4 class="accounts-name">
                                                                <asp:Literal ID="litAccountName" runat="server"></asp:Literal></h4>
                                                            <p class="accountNumber marginTop10 noMarginLeft">
                                                                <asp:Literal ID="litAccountNumber" runat="server"></asp:Literal>
                                                            </p>
                                                        </div>
                                                        <div class="pull-left  col-md-3 col-lg-3 favorit-first_v2">
                                                            <p class="accounts-panel-p">
                                                                <asp:Literal ID="litBalance" Text="<%$FrontEndResources:TRX00131,litBalance2%>" runat="server"></asp:Literal>
                                                            </p>
                                                            <h3 class="favorit-center accounts-panel-h field-tooltip" data-toggle="tooltip" data-placement="top" id="hBalance" runat="server">
                                                                <asp:Literal ID="litRemainingBalance" runat="server"></asp:Literal>
                                                                <asp:Label ID="litAvailableBalanceValueCurrency" CssClass="CurrencyValue" runat="server"></asp:Label>
                                                            </h3>
                                                        </div>
                                                        <div class="pull-left hidden-xs hidden-sm col-md-2 col-lg-2 favorit-first_v2 statusAssociateAccounts">
                                                            
                                                                <div class="bulletStatus" id="bankConsentStatusBullet" style="margin-right: 4px;" runat="server" visible="true"></div>
                                                            <div style="display:inline-block"> <asp:Literal ID="litStatus" runat="server"></asp:Literal></div>
                                                               
                                                            <p class="accounts-panel-p textAlignLeft"></p>
                                                            <h3 class="favorit-center accounts-panel-h field-tooltip" data-toggle="tooltip" data-placement="top" id="hAvailableBalance" runat="server">
                                                                <asp:Literal ID="litNextPaymentDate" runat="server"></asp:Literal>
                                                            </h3>
                                                        </div>
                                                        <div class="col-xs col-sm col-md-3 col-lg-3 account-details" style="text-align: right;position: relative;float:right">
                                                            <%--<asp:LinkButton NavigateUrl="#" ID="aRenewAcc" runat="server" CssClass="accountRenew-icon-associate"></asp:LinkButton>--%>
                                                            <asp:LinkButton NavigateUrl="#" ID="aRemoveAcc" runat="server" CssClass="accountRemove-icon-associate" ToolTip="<%$FrontEndResources:TRX00131,Delete%>"></asp:LinkButton>
                                                            

                                                            <asp:LinkButton NavigateUrl="#" ID="aOpenTableAA" runat="server" CssClass="statements-expand-icon-associate" ToolTip="<%$FrontEndResources:TRX00131158,OpenTable%>"></asp:LinkButton>
                                                            <asp:LinkButton NavigateUrl="#" ID="aOpenDetail" runat="server" CssClass="accountExpandicon" ToolTip="<%$FrontEndResources:TRX00131158,OpenDetail%>"></asp:LinkButton>
                                                        </div>
                                                        <div class="clearBoth"></div>
                                                        <div id="accountIntegrationData" runat="server" class="last-statements-table hidden">
                                                            <asp:PlaceHolder ID="phWidgetMovs" runat="server" Visible="false"></asp:PlaceHolder>    
                                                        </div>
                                                        <div class="clearBoth"></div>
                                   
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </span>
                                </div>
                            </section>
                        </div>
                    </div>
                </div>
                <div class="clearBoth"></div>
            </ItemTemplate>
        </asp:Repeater>
        


        <script type="text/javascript">

            $(document).ready(function () {
                $("img[id*='_BankImage_']").each(function () {
                    if ($(this).attr("alt") === undefined)
                        $(this).attr("alt", "");
                });
            });
            
            var cIDs = new Array;

            function tryIt(val)
            {
                debugger; 

                //var id = $(this).data('id');
                var id = val;
                var table = $('.last-statements-table[data-id=' + id + ']');
                $(".last-statements-table").slideUp('fast'); //Hidding tables
                
                if ($('[id*=aOpenTable]').length > 0)
                    $('[id*=aOpenTable]').removeClass().addClass("statements-expand-icon");
                if ($('[id*=aOpenSATable]').length > 0)
                    $('[id*=aOpenSATable]').removeClass().addClass("statements-expand-icon");
                if ($('[id*=btnCAOpenTableDD]').length > 0)
                    $('[id*=btnCAOpenTableDD]').removeClass().addClass("statements-expand-icon");
                if ($('[id*=btnCAOpenTableCC]').length > 0)
                    $('[id*=btnCAOpenTableCC]').removeClass().addClass("statements-expand-icon");

                $("[data-widget-account-id]").each(function (index) {
                    if ($(this).data('widget-p2') == val)
                    {
                        eBankit.Presentation.Dashboard.loadControlMovs($(this));
                    }
                });
                
                if (table.length > 0 && !table.is(':visible')) {
                    table.slideDown('fast');
                    table.removeClass('hidden');
                    $('a[data-id=' + id + ']').toggleClass("statements-expand-icon statements-collapse-icon");
                    if (!include(cIDs, id)) {
                        cIDs.push(id);

                        
                    }
                }
    
                return false;
            }

            /*
            function showHideTable_AssocAccount(event, productType)
            {
                debugger;

                var id = $(this).data('id');

                var table = $('.last-statements-table[data-id=' + id + ']');

                //var account = $('.statements-expand-icon[account-id=' + id + ']');
                //var bank = $('.statements-expand-icon[bank-id=' + id + ']');

                $(".last-statements-table").slideUp('fast'); //Hidding tables

                if ($('[id*=aOpenTableAA]').length > 0)
                    $('[id*=aOpenTableAA]').removeClass().addClass("statements-expand-icon");
            
                //if ($('[id*=aOpenSATable]').length > 0)
                //    $('[id*=aOpenSATable]').removeClass().addClass("statements-expand-icon");
                //if ($('[id*=btnCAOpenTableDD]').length > 0)
                //    $('[id*=btnCAOpenTableDD]').removeClass().addClass("statements-expand-icon");
                //if ($('[id*=btnCAOpenTableCC]').length > 0)
                //    $('[id*=btnCAOpenTableCC]').removeClass().addClass("statements-expand-icon");
            
                if (table.length > 0 && !table.is(':visible')) {
                    table.slideDown('fast');
                    table.removeClass('hidden');
                    $('a[data-id=' + id + ']').toggleClass("statements-expand-icon statements-collapse-icon");
                    if (!include(cIDs, id)) {
                        cIDs.push(id);
         
                        return true;
                    }
                }

                event.preventDefault();
                cIDs.push(id);
                
                return false;
            }*/
        </script>