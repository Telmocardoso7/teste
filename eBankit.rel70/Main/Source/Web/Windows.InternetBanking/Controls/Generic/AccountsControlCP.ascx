<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AccountsControlCP.ascx.cs" Inherits="AccountsControlCP" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("metro.min.js".ResolveJsUrl("metro"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts overflowHidden">
    <div class="CorpSearchText">
        <asp:TextBox ID="txtSearchText" CssClass="txtSearchText" runat="server" AutoPostBack="true" OnTextChanged="txtSearchText_TextChanged"></asp:TextBox>
    </div>
    <div class="CorpComboBox">
        <asp:DropDownList ID="ddlCurrency" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCurrency_SelectedIndexChanged" />
    </div>
</div>
<div class="clearBoth"></div>
<asp:UpdatePanel ID="flwContainerAccounts" UpdateMode="Always" runat="server">
    <Triggers>
        <asp:AsyncPostBackTrigger ControlID="btnSelectedAccountChanged" />
        <asp:AsyncPostBackTrigger ControlID="ddlCurrency" EventName="SelectedIndexChanged" />
        <asp:AsyncPostBackTrigger ControlID="txtSearchText" EventName="TextChanged" />
    </Triggers>
    <ContentTemplate>
        <div id="scrollContainer" class="scrollContainerAccountsCorp" runat="server">
            <div id="scroolContentCorporate" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts overflowHidden">
                <asp:Repeater ID="rptCurrentAccounts" runat="server" OnItemDataBound="rptCurrentAccounts_ItemDataBound">
                    <ItemTemplate>
                        <div id="divAccountType" class="contentBoxCorporate box-red" runat="server" tabindex="0" role="button" onkeydown="eBankit.Presentation.AccountsControl.AccountTypeKeydownHandler(this, event);" onkeyup="eBankit.Presentation.AccountsControl.AccountTypeKeyupHandler(this, event);">
                            <span id="icoFavoriteAccount" class="icon-star-selector CorpSmallIcon" visible="false" runat="server"></span>
                            <div class="scroll-item-top accountNameOverflow">
                                <h4 class="CorpAlwaysVisible">
                                    <asp:Literal ID="litAccountName" runat="server"></asp:Literal></h4>
                                <h5 class="numAcc CorpAccNumber">
                                    <asp:Literal ID="litAccountNumber" runat="server"></asp:Literal></h5>
                            </div>
                            <div class="formatCurrency CorpFormatCurrency">
                                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                            </div>
                            <div class="clearBoth"></div>
                            <div id="divBalance" class="scroll-item-value positive hidden" runat="server">
                                <h3 class="CorpAccBalance">
                                    <asp:Literal ID="litBalanceValue" runat="server"></asp:Literal>
                                </h3>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                <asp:HiddenField ID="hdnAllAccountsArray" runat="server" />
                <asp:HiddenField ID="hdnAccountsArray" runat="server" />
                <asp:HiddenField ID="hdnSelectedAccountId" runat="server" />
                <asp:HiddenField ID="hdnSelectedAccount" runat="server" />
                <asp:HiddenField ID="hdnSelectedCurrentAccount" runat="server" />
                <asp:HiddenField ID="hdnSelectedCurrentAccountMessages" runat="server" />
                <asp:HiddenField ID="hdnScrollContentLenght" runat="server" />
                <asp:HiddenField ID="hdnCount" runat="server" />
            </div>
            <div id="divExpandIcon" runat="server" class="CorpExpandButton" onclick="ResizeAccountsControl();"></div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>

<div class="clearBoth"></div>

<asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Always" runat="server">
    <ContentTemplate>
        <asp:HiddenField ID="hdnShowTrsButtons" runat="server" />
        <it:TabSelectorControl
            id="TabSelector"
            ControlName="AccountControl"
            visible="false"
            runat="server"
            titleOperations="<%$FrontEndResources:TRX00106,titleOperations%>"
            titleFavorits="<%$FrontEndResources:TRX00106,titleFavorits%>" />
    </ContentTemplate>
</asp:UpdatePanel>
<div id="divHiddenTabSelector" class="tab_hidden" runat="server"></div>

<div class="clearBoth"></div>

<asp:Button ID="btnSelectedAccountChanged" runat="server" CausesValidation="false" CssClass="hidden" />
<script type="text/javascript">

    eBankit.Presentation.AccountsControl = {}
    eBankit.Presentation.AccountsControl.AccClk = function (accountId) {

        $("#benefsTabContent #operations").hide();
        $("#benefsTabContent #favorit").hide();
        $(".col-transaction").show();

        //
        var hdnSelectedAccount = $("#<%=hdnSelectedAccountId.ClientID %>");
        var btnSelectedAccountChangedID = "<%=btnSelectedAccountChanged.UniqueID %>";

        hdnSelectedAccount.val(accountId).show();
        __doPostBack(btnSelectedAccountChangedID, '');
    }

    eBankit.Presentation.AccountsControl.ShowScroll = function () {
        //
    }

    eBankit.Presentation.AccountsControl.AccountTypeKeydownHandler = function (elem, event) {
        if (event.keyCode === 32) {
            event.preventDefault();
        }
        else if (event.keyCode === 13) {
            event.preventDefault();
            $(elem).click();
        }
    }

    eBankit.Presentation.AccountsControl.AccountTypeKeyupHandler = function (elem, event) {
        if (event.keyCode === 32) {
            event.preventDefault();
            $(elem).click();
        }
    }

    METRO_AUTO_REINIT = true;

    $(document).ready(function () {
        $(".txtSearchText").val($(".txtSearchText").attr('title'));
    });

    function ResizeAccountsControl() {
        if ($(".scrollContainerAccountsCorp").css("height") == "170px") {
            $("#scroolContentCorporate").css("height", "auto");
            $(".scrollContainerAccountsCorp").css("height", "auto");
            $("#scroolContentCorporate").slideDown();
            $(".scrollContainerAccountsCorp").slideDown();
            $(".CorpExpandButton").css("background-image", 'url("/content/themes/ebankit/images/icon/ico_arrow_dropdown_close.png")');
        }
        else {
            $(".scrollContainerAccountsCorp").css("height", "170px");
            $("#scroolContentCorporate").css("height", "120px");
            $(".scrollContainerAccountsCorp").slideDown();
            $("#scroolContentCorporate").slideDown();
            $(".CorpExpandButton").css("background-image", 'url("/content/themes/ebankit/images/icon/ico_arrow_dropdown.png")');
        }
    };

    $(".txtSearchText").on('keydown', function (e) {
        if (e.keyCode == 13) {
            $(".txtSearchText").blur();
        }
    });

    $(".txtSearchText").blur(function () {
        if ($(this).val() == '' && $(this).attr('title') != '') {
            $(this).val($(this).attr('title'));
        }
    });

    function WebForm_TextBoxKeyHandler(event) {
        return true;
    }
</script>

<style type="text/css">
    .CorpSearchText {
        float: left;
        margin-bottom: 5px;
    }

        .CorpSearchText input[type=text],
        .CorpSearchText input[type=password], .CorpSearchText select,
        .CorpSearchText textarea {
            border: none !important;
            font-size: 13px !important;
            color: #009999 !important;
            width: 400px !important;
            min-height: 30px;
            border-bottom: 1px solid #009999 !important;
            outline: none;
        }

    .CorpComboBox {
        float: right;
        margin-bottom: 5px;
    }

        .CorpComboBox input[type=text],
        .CorpComboBox input[type=password], .CorpComboBox select,
        .CorpComboBox textarea {
            border: none !important;
            font-size: 13px !important;
            color: #009999 !important;
            min-height: 30px;
            outline: none;
        }

    .CorpAccNumber {
        font-size: 11px !important;
    }

    .CorpAccBalance {
        font-size: 14px !important;
        font-weight: bold !important;
    }

    .CorpSmallIcon {
        background-size: 50%;
        width: 50px !important;
        height: 50px !important;
        margin-top: -5px !important;
    }

    .CorpAlwaysVisible {
        white-space: normal !important;
    }

    .CorpFormatCurrency {
        font-size: 12px !important;
        margin-top: -5px !important;
    }

    .CorpExpandButton {
        background-image: url("/content/themes/ebankit/images/icon/ico_arrow_dropdown.png");
        background-repeat: no-repeat;
        background-position: center;
        cursor: pointer;
        height: 20px;
        margin-bottom: 20px;
        margin-top: 10px;
    }

    .box-blue .scroll-item-top h4 {
        height: 32px;
    }

    .scrollContainerAccountsCorp {
        padding: 20px 20px 0px 20px;
        background-color: #eeeeee;
        height: 170px;
    }

    #scroolContentCorporate {
        height: 120px;
        position: relative;
        display: block;
        overflow: hidden !important;
    }

        #scroolContentCorporate .contentBoxCorporate {
            background-color: #fff;
            position: relative;
            float: left;
            display: block;
            height: 110px;
            width: 155px;
            padding: 10px;
            margin: 5px !important;
            margin-right: 20px;
            /* If you don't want the images in the scroller to be selectable, try the following
            block of code. It's just a nice feature that prevent the images from
            accidentally becoming selected/inverted when the user interacts with the scroller. */
            -webkit-user-select: none;
            -khtml-user-select: none;
            -moz-user-select: none;
            -o-user-select: none;
            user-select: none;
            border: 2px solid #FFF;
        }

            #scroolContentCorporate .contentBoxCorporate:hover, #scroolContentCorporate .contentBoxCorporate.selected {
                /* background-color: #cef4ff; */
                cursor: pointer;
                border: 2px solid #58595B !important;
            }

            #scroolContentCorporate .contentBoxCorporate img {
                margin-bottom: 10px;
            }

            #scroolContentCorporate .contentBoxCorporate p {
                font-size: 10px;
            }
</style>
