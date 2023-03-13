<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AccountsControlUpdateCP.ascx.cs" Inherits="AccountsControlUpdateCP" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("_AccountsControlUpdateCP.css".ResolveCssUrl("components"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />

<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("metro.min.js".ResolveJsUrl("metro"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max controlsShowHide metro content-accounts overflowHidden">
    <div class="CorpSearchText">
        <asp:TextBox ID="txtSearchText" CssClass="txtSearchText" runat="server" AutoPostBack="true" OnTextChanged="txtSearchText_TextChanged" ></asp:TextBox>
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
                                <p class="CorpAccBalance">
                                    <asp:Literal ID="litBalanceValue" runat="server"></asp:Literal>
                                </p>
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
            <div id="divExpandIcon" runat="server" class="CorpExpandButton" onclick="ResizeAccountsControl(); CorpExpandButtonLabel();" 
                tabindex="0" onkeypress="if(event.keyCode === 32){this.click();event.preventDefault();}"></div>
        </div>
    </ContentTemplate>
</asp:UpdatePanel>

<div class="clearBoth"></div>

<asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Always" runat="server">
    <ContentTemplate>
        <asp:HiddenField ID="displayTransactionContent" runat="server" />
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

    function CorpExpandButtonLabel() {
        var corpExpandButtonLabel = "<%=eBankit.Common.Globalization.Translate.GetTransactionString("AccountsControl","Expand") %>";
        var corpCollapseButtonLabel = "<%=eBankit.Common.Globalization.Translate.GetTransactionString("AccountsControl","Collapse") %>";

        if ($(".scrollContainerAccountsCorp").css("height") == "170px") {
            $(".CorpExpandButton").attr("aria-label", corpExpandButtonLabel);
        }
        else {
            $(".CorpExpandButton").attr("aria-label", corpCollapseButtonLabel);
        }
    };

</script>
<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("accounts-control-update-cp.js".ResolveJsUrl("ebankitControls"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
