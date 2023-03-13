<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="Cart.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Security.Transactions.Cart.Cart" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="TransactionFeaturedContent">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max" style="min-height: 0px;">
        <section class="featured">
            <div class="content-wrapper">
                <hgroup class="title">
                    <h3><%: SubTitle %> Transactions Cart</h3>
                </hgroup>
            </div>
        </section>
    </div>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("jquery.editable.js".ResolveJsUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("metro.min.js".ResolveJsUrl("metro"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00701-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</asp:Content>
<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="TransactionMainContent">
    <asp:PlaceHolder ID="phHeader" runat="server"></asp:PlaceHolder>
    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
    <asp:PlaceHolder ID="phSelector" runat="server"></asp:PlaceHolder>
    <asp:PlaceHolder ID="phContainer1" runat="server" Visible="false"></asp:PlaceHolder>
    <div class="clearBoth"></div>
    <asp:PlaceHolder ID="phContainer2" runat="server" Visible="false"></asp:PlaceHolder>
    <div class="clearBoth"></div>
    <asp:PlaceHolder ID="phContainer3" runat="server" Visible="false"></asp:PlaceHolder>
    <div class="clearBoth"></div>
    <asp:PlaceHolder ID="phContainer4" runat="server" Visible="false"></asp:PlaceHolder>
    <div class="clearBoth"></div>

    <div class="cart-container">
        <div class=" panel-detail">
            <div>
                <div id="divSearchCriteria" runat="server">
                    <div class="metro">
                        <div class="panel" data-role="panel" id="divFilter">
                            <asp:UpdatePanel runat="server" ID="updatePanel1">
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="btnSearch" />
                                </Triggers>
                                <ContentTemplate>
                                    <div class="listHeader">
                                        <div class="col-lg-8 col-max panel-header panel-header-3">
                                            <asp:Literal ID="litSearchInfo" runat="server" Text="You have 0 transactions in your"></asp:Literal>
                                            <div class="img-search-panel">
                                                <img onclick="$('.panel-search').slideToggle();" src="<%$ebFile:~/Content/currenttheme/images/products/ico_search_transactions.png%>" runat="server" alt="search" />
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <div class="col-lg-8 col-max panel-content panel-search">
                                <asp:HiddenField runat="server" ID="displayFormat"></asp:HiddenField>

                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <it:DatePickerTextBoxRangeMetroControl_v3 ID="dpFromTo" Label="<%$FrontEndResources:DATALIST,From%>" LabelTo="<%$FrontEndResources:DATALIST,To%>" runat="server" ValidationRequiredMessage="<%$FrontEndResources:DATALIST,RequiredDateMessage%>" CssClass="field field_v2 field-full metro" />
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <it:DropDownListControl_v2 ID="ddlAccountNumber" Label="<%$FrontEndResources:TRX00701,AccontNumber%>" runat="server" CssClass="field field_v2 field-full" />
                                </div>
                                <div class="clearBoth"></div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <it:CurrencyTextBoxIntervalControl_v2 ID="txtAmountRange" Label="<%$FrontEndResources:TRX00701,Amount%>" LabelTo="<%$FrontEndResources:TRX00701,To%>" runat="server" CssClass="field field_v2 field-full metro" />
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <it:DropDownListControl_v2 ID="ddlState" Label="<%$FrontEndResources:TRX00701,State%>" runat="server" CssClass="field field_v2 field-full" />
                                </div>
                                <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                    <it:FormRadioList_v3 ID="rbShowLoginOperation" LabelText="<%$FrontEndResources:TRX00701,ShowLoginOperation%>" runat="server" CssClass="big-radioButton" RepeatDirection="Horizontal" />
                                </div>

                                <div class="clearBoth"></div>
                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                                    <asp:Button ID="btnSearch" CssClass="btn btn-primary btn-margin btn-search-datalist" Text="<%$FrontEndResources:TRX00701,btnSearch %>" runat="server" OnClientClick="return FilterSearch();" />
                                </div>

                                <div class="clearBoth"></div>
                            </div>
                        </div>
                    </div>
                    <div class="clearBoth"></div>
                </div>
            </div>
        </div>

        <asp:UpdatePanel runat="server" ID="upTransactions">
            <Triggers>
            </Triggers>
            <ContentTemplate>
                <asp:ListView ID="rptT" runat="server" ItemPlaceholderID="ItemsDiv" OnItemDataBound="rptT_ItemDataBound">
                    <EmptyDataTemplate>
                        <div class="cart-grid-empty">
                            <div class="cart-grid-empty-icon"><span class="glyphicon glyphicon-shopping-cart"></span></div>
                            <div class="cart-grid-empty-content">
                                <p class="cart-grid-empty-content">Your cart is empty</p>
                                <br />
                                You can add multiple transactions to your cart and eecute them all at once.
                                <br />
                                This will save you precious time since all the transactions will be authenticated at the same moment.
                            </div>
                        </div>
                    </EmptyDataTemplate>
                    <LayoutTemplate>
                        <div class="cart-header-container">
                            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">

                                <div class="cart-header-body row">
                                    <div class="col-xs-7">
                                        <div class="cbcontainer ">
                                            <asp:CheckBox ID="cbSelected" runat="server" />
                                            <div class="checkmark"></div>
                                        </div>
                                        <asp:Label runat="server" Text="Select All Transactions" />
                                    </div>
                                    <div class="col-xs-5">
                                        <div class="dropdown pull-right">
                                            <button class="btn btn-default btn-drop dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                Most recent
    <span class="caret"></span>
                                            </button>
                                            <ul class="dropdown-menu navbar-right" aria-labelledby="dropdownMenu1">
                                                <li><a href="#">Most recent</a></li>
                                                <li><a href="#">Oldest</a></li>
                                                <li><a href="#">Lowest amount</a></li>
                                                <li><a href="#">Highest amount</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <br />
                        <asp:panel ID="pnlNotifications" runat="server" CssClass="cart-header-notifications" Visible="false"> 
                            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">

                                <div class="cart-header-body  ">
                                     
                                  <asp:Literal ID="litNotificationMessage" runat="server" />
                                    
                                </div>

                            </div>
                        </asp:panel>
                        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                            <div runat="server" id="ItemsDiv">
                            </div>
                        </div>
                        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max trs_buttons">
                            <div class="trs_buttons-action">
                                <asp:LinkButton ID="LinkButton1" runat="server" Text="Delete all" OnClick="btnDeleteAll_Click" CssClass="aspNetDisabled disabled btn btn-default" />
                                <asp:LinkButton ID="btnExecute" runat="server" Text="Execute" OnClick="btnExecute_Click" CssClass="aspNetDisabled disabled btn btn-primary" />
                            </div>
                        </div>
                    </LayoutTemplate>
                    <ItemTemplate>
                        <div id="div1" runat="server" class="cart-item-header-group" visible='<%# ShowHeader(Convert.ToString(Eval("Created"))) %>'>
                            Added on the  
                                    <asp:Literal ID="Label1" runat="server" Text=' <%# Eval("Created") %>' />
                        </div>
                        <div class="cart-item-body row ">
                            <div class="col-md-2 col-sm-2 col-xs-3 ">
                                <div class="cbcontainer ">
                                    <asp:CheckBox ID="cbSelected" runat="server" />
                                    <div class="checkmark"></div>
                                </div>



                                <div class="cart-transaction-icon Transfer"></div>
                            </div>




                            <div class="col-md-3 col-sm-10 col-xs-9 text-truncate ">

                                <p class="key">
                                    <asp:Literal ID="Literal4" runat="server" Text='National transfer' />
                                </p>
                                <p>

                                    <asp:Literal ID="Literal6" runat="server" Text='Transfer to Daniell Williams' />
                                </p>
                            </div>
                            <div class="col-md-3 col-sm-6 col-sm-offset-0 col-xs-9 col-xs-offset-0 col-md-offset-0 text-truncate ">
                                <p class="key">
                                    <asp:Literal ID="Literal3" runat="server" Text='Source account' />
                                </p>
                                <p class="text-truncate">

                                    <asp:Literal ID="Literal5" runat="server" Text='Main account - 100000000000012345' />
                                </p>
                            </div>
                            <div class="col-md-2 col-sm-3 col-xs-9 col-xs-offset-0 col-sm-offset-0 col-md-offset-0 text-truncate ">
                                <p class="key">
                                    <asp:Literal ID="Literal2" runat="server" Text='Amount' />
                                </p>
                                <p>
                                    <asp:Literal ID="Label3" runat="server" Text='<%# Eval("TransactionValue") %>' />
                                    <asp:Literal ID="Literal1" runat="server" Text='GBP' />
                                </p>
                            </div>
                            <div class="col-md-2 col-sm-6 col-xs-9 col-xs-offset-2 col-sm-offset-1 col-md-offset-0 ">
                                <p class="action-buttons">
                                    <asp:LinkButton ID="btnDelete" runat="server" CommandArgument='<%# Eval("CartTransactionItemId") %>' Text="<span class='action-delete'></span>" OnClick="btnDelete_Click"></asp:LinkButton>

                                    <span class="action-edit"></span>
                                    <span class="action-view-details" onclick="itcore_ui.ShowTopPopupIframe(&quot;/Security/Transactions/DetailContainer.aspx?trxid=TRX00703158&amp;op=Transfer%c3%aancia+minhas+contas&amp;opt=4&amp;opstatus=Executado+&amp;opid=e5d0ac51-99da-4ae3-8dcf-b3f2d70419f3&amp;g=iwk53nwdoetxzro5vanqphgf&amp;InteractionId=7a2da2f0-7083-40d3-b577-b3e02fdf7805&quot;,&quot;Detalhe da operação&quot;,'',false);return false;"></span>
                                </p>
                            </div>

                        </div>


                    </ItemTemplate>

                </asp:ListView>

            </ContentTemplate>
        </asp:UpdatePanel>

    </div>



    <div class="cart-footer-container">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">

            <asp:UpdatePanel runat="server" ID="updatePanel2">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSearch" />
                </Triggers>
                <ContentTemplate>
                    <div class="cart-content-container">
                        For your convenience, you can add a list of transactions to your cart by uploading a CSV file. Click here to download a template file.
                         <br />
                        Its also possible to download the list of transactions in your cart to a CSV file.
                    </div>
                    <div class="cart-btn-container">
                        <asp:Button ID="btnDownloadCSV" CssClass="btn btn-secondary btn-margin" Text="<%$FrontEndResources:Cart,btnCartDownloadCSV %>" OnClick="btnDownloadCSV_Click" runat="server" />
                        <asp:Button ID="btnUploadCSV" CssClass="btn btn-secondary btn-margin" Text="<%$FrontEndResources:Cart,btnCartUploadCSV %>" OnClick="btnUploadCSV_Click" runat="server" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>

        </div>

    </div>
    <script type="text/javascript">
        //add update panel fix
        $(document).ready(function () {
            $(".checkmark").click(function () {
                $(this).prev().click();
                var cart = $(this).closest(".cart-item-body");
                cart.toggleClass("selected");
            });
        });
    </script>
    <style>
        .cart-header-notifications{
            background-color:#8DC63F;
            color:#fff;
            padding:15px;
        }
        .cart-transaction-icon {
            height: 40px;
            width: 40px;
            background-size: 40px 40px;
            float: left;
            margin-right: 10px;
            float: right;
        }

        .action-buttons {
            text-align: center;
            padding-top: 10px;
        }

            .action-buttons span {
                margin: 0 5px;
            }

        @media (min-width: 768px) {
            .action-buttons {
                top: 37px;
            }
        }

        @media (min-width: 992px) {
            .action-buttons {
                top: 6px;
            }
        }

        .action-view-details {
            height: 30px;
            width: 30px;
            display: inline-block;
            text-indent: -9999px;
            background: url(/Content/Themes/ebankIT/images/icon/action/action_view_details_svg.svg);
            background-size: 30px 30px;
        }

        .action-edit {
            height: 30px;
            width: 30px;
            display: inline-block;
            text-indent: -9999px;
            background: url(/Content/Themes/ebankIT/images/icon/action/action_edit_svg.svg);
            background-size: 30px 30px;
        }

        .action-delete {
            height: 30px;
            width: 30px;
            display: inline-block;
            text-indent: -9999px;
            background: url(/Content/Themes/ebankIT/images/icon/action/action_delete_svg.svg);
            background-size: 30px 30px;
        }

        .text-truncate {
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .cart-item-body.selected {
            background-color: #EEFAFB;
        }

        .cart-item-body {
            border: 1px solid #eeeeee;
            padding: 10px;
            margin: 10px 0;
        }

            .cart-item-body p {
                margin: 0;
            }

                .cart-item-body p.key {
                    color: #0173A7;
                }

        .cart-item-header-group {
            color: #0173A7;
            margin-top: 25px;
            font-size: 16px;
            font-weight: bold;
        }

        .cart-item-footer-group {
            margin-bottom: 10px;
        }

        .cart-container {
            padding: 20px 0;
            color: #636363;
        }

            .cart-container .img-search-panel {
                margin-top: -12px;
            }

        .cart-grid-empty {
        }

        .cart-grid-empty-icon {
            text-align: center;
            color: #ff8d00;
            font-size: 60pt;
        }

        .cart-grid-empty-content {
            text-align: center;
            font-size: 12pt
        }

        p.cart-grid-empty-content {
            font-weight: bold;
            font-size: 20pt;
        }

        .cart-footer-container {
            background-color: #eeeeee;
            color: #636363;
            padding: 20px 0;
            font-weight: 600;
            font-size: 17px;
        }

        .cart-header-container {
            background-color: #F9F9F9;
            color: #636363;
            font-weight: 600;
            font-size: 14px;
        }

            .cart-header-container .cart-header-body {
                padding-bottom: 5px;
                margin: 0px 10px 5px 10px;
                padding-top: 5px;
            }

            .cart-header-container .cbcontainer {
                margin-left: 1px;
                padding-top: 5px;
            }

            .cart-header-container .dropdown .btn-drop {
                background-color: #fff;
            }

        .cart-btn-container {
            text-align: right;
        }

        .cart-content-container {
            margin: 20px 0;
        }

        .btn-secondary {
            color: #0173A7;
            font-size: 16px;
            background-color: #fff;
            width: auto;
            padding: 10px 18px;
            text-align: center;
            border: 1px solid #0173A7;
        }

            .btn-secondary:hover {
                color: #0173A7;
            }

        .cbcontainer {
            display: block;
            position: relative;
            padding-left: 35px;
            cursor: pointer;
            font-size: 22px;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
        }

        .cart-header-container span {
            margin-top: 5px;
            margin-left: 55px;
            float: left;
        }

        /* Hide the browser's default checkbox */
        .cbcontainer input {
            position: absolute;
            opacity: 0;
            cursor: pointer;
            float: left;
        }

        /* Create a custom checkbox */
        .checkmark {
            position: absolute;
            left: 0;
            height: 30px;
            width: 30px;
            border: 1px solid #B0B0B0;
        }

        .cart-item-body .checkmark {
            top: 58px;
        }

        @media (min-width: 768px) {
            .cart-item-body .checkmark {
                top: 50px;
            }
        }

        .cart-item-body .cart-transaction-icon {
            margin-top: 52px;
        }

        @media (min-width: 768px) {
            .cart-item-body .cart-transaction-icon {
                margin-top: 45px;
            }
        }

        @media (min-width: 992px) {
            .cart-item-body .cart-transaction-icon {
                margin-top: 0px;
            }
        }

        @media (min-width: 992px) {
            .cart-item-body .checkmark {
                top: 6px;
            }
        }
        /* On mouse-over, add a grey background color */
        .cbcontainer:hover input ~ .checkmark {
            background-color: #ccc;
        }

        /* When the checkbox is checked, add a blue background */
        .cbcontainer input:checked ~ .checkmark {
            background-color: #fff;
        }

        /* Create the checkmark/indicator (hidden when not checked) */
        .checkmark:after {
            content: "";
            position: absolute;
            display: none;
        }

        /* Show the checkmark when checked */
        .cbcontainer input:checked ~ .checkmark:after {
            display: block;
        }

        /* Style the checkmark/indicator */
        .cbcontainer .checkmark:after {
            left: 9px;
            top: 4px;
            width: 9px;
            height: 15px;
            border: solid #0173A7;
            border-width: 0 2px 2px 0;
            -webkit-transform: rotate(45deg);
            -ms-transform: rotate(45deg);
            transform: rotate(45deg);
        }

        .disabled.btn-primary {
            background-color: #8DC63F;
        }
    </style>
</asp:Content>
