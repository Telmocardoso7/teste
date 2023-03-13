<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX02101_01.ascx.cs" Inherits="TRX02101_01" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<%@ Import Namespace="eBankit.Common" %>
<%@ Import Namespace="eBankit.Common.Extensions" %>

<div id="divAssociateAccounts" class="divAssociateAccounts" runat="server">
    <div id="steps">
        <div id="stepIntroduction" runat="server" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
            <asp:UpdatePanel ID="upControls" runat="server">
                <ContentTemplate>
                    <asp:Panel ID="pnControls" CssClass="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max" runat="server">
                        <div id="divSelect" class="associateAccounts">
                            <div id="divSelectInfo" class="associateAccountsInfo">
                                <div id="divSelectText" class="associateAccountsText">
                                    <div id="divSelectTextTitle" class="associateAccountsTitleText">
                                        <img id="imgSelectTextTitle" src="<%$ebSegmentFile:~/Content/currenttheme/images/associate_accounts/associate_account_1select.png%>" alt="select" runat="server" />
                                        <asp:Literal ID="litSelectTextTitle" runat="server" Text="<%$FrontEndResources:TRX02101,SelectTextTitle%>"></asp:Literal>
                                    </div>
                                    <br />
                                    <div id="divSelectTextSubTitle" class="associateAccountsSubTitleText">
                                        <asp:Literal ID="litSelectTextSubTitle" runat="server" Text="<%$FrontEndResources:TRX02101,SelectTextSubTitle%>"></asp:Literal>
                                    </div>
                                </div>
                                <div id="divImgSelect" class="associateAccountsImg">
                                    <img id="imgSelect" class="imgIntro" src="<%$ebFile:~/Content/currenttheme/images/associate_accounts/associate_account_select.png%>" alt="select" runat="server" />
                                </div>
                                <div class="clearBoth"></div>
                            </div>
                        </div>
                        <br />
                        <div id="divConfirm" class="associateAccounts">
                            <div id="divConfirmInfo" class="associateAccountsInfo">
                                <div id="divConfirmText" class="associateAccountsText">
                                    <div id="divConfirmT extTitle" class="associateAccountsTitleText">
                                        <img id="imgConfirmTextTitle" src="<%$ebSegmentFile:~/Content/currenttheme/images/associate_accounts/associate_account_2confirm.png%>" alt="confirm" runat="server" />
                                        <asp:Literal ID="litConfirmTextTitle" runat="server" Text="<%$FrontEndResources:TRX02101,ConfirmTextTitle%>"></asp:Literal>
                                    </div>
                                    <br />
                                    <div id="divConfirmTextSubTitle" class="associateAccountsSubTitleText">
                                        <asp:Literal ID="litConfirmTextSubTitle" runat="server" Text="<%$FrontEndResources:TRX02101,ConfirmTextSubTitle%>"></asp:Literal>
                                    </div>
                                </div>
                                <div id="divImgConfirm" class="associateAccountsImg">
                                    <img id="imgConfirm" class="imgIntro" src="<%$ebFile:~/Content/currenttheme/images/associate_accounts/associate_account_bank_authentication.png%>" alt="confirm" runat="server" />
                                </div>
                                <div class="clearBoth"></div>
                            </div>
                        </div>
                        <br />
                        <div id="divCheck" class="associateAccounts">
                            <div id="divCheckInfo" class="associateAccountsInfo">
                                <div id="divCheckText" class="associateAccountsText">
                                    <div id="divCheckTextTitle" class="associateAccountsTitleText">
                                        <img id="imgCheckTextTitle" src="<%$ebSegmentFile:~/Content/currenttheme/images/associate_accounts/associate_account_3laststep.png%>" alt="last step" runat="server" />
                                        <asp:Literal ID="litCheckTextTitle" runat="server" Text="<%$FrontEndResources:TRX02101,CheckTextTitle%>"></asp:Literal>
                                    </div>
                                    <br />
                                    <div id="divCheckTextSubTitle" class="associateAccountsSubTitleText">
                                        <asp:Literal ID="litCheckTextSubTitle" runat="server" Text="<%$FrontEndResources:TRX02101,CheckTextSubTitle%>"></asp:Literal>
                                    </div>
                                </div>
                                <div id="divImgCheck" class="associateAccountsImg">
                                    <img id="imgCheck" class="imgIntro" src="<%$ebFile:~/Content/currenttheme/images/associate_accounts/associate_account_validation.png%>" alt="last step" runat="server" />
                                </div>
                                <div class="clearBoth"></div>
                            </div>
                        </div>
                        <br />
                        <div class="introActions">
                            <asp:Button runat="server" ID="btnStart" CausesValidation="false" CssClass="btn btn-primary btnStart" OnClientClick="Consents();return false;" Text="<%$FrontEndResources:TRX02101,AssociateAccountsStart%>" />
                            <asp:Button ID="btnTransactions" Text="AccountTRX" Style="display: none;" runat="server" OnClick="btnTransactions_Click" />
                            <asp:Button ID="btnDelete" Text="DeleteConsents" Style="display: none;" runat="server" OnClick="btnDeleteConsents_Click" />
                        </div>
                    </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div id="stepConsents" runat="server" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
            <asp:PlaceHolder ID="phConsentControl" runat="server"></asp:PlaceHolder>
        </div>

        <asp:Panel ID="pnSelectBanks" runat="server">
            <asp:Panel CssClass="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max " runat="server">
                <div id="BankInfoMsg" class="banksInfoMessage">
                    <asp:Literal ID="banksInfoMessage" Text="<%$FrontEndResources:TRX02101,banksInfoMessage%>" runat="server"></asp:Literal>
                    <div class="clearBoth"></div>
                </div>
                <br />
                <div id="SelectBanksInfoMsg" class="selectBanksInfoMessage">
                    <asp:Literal ID="Literal1" Text="<%$FrontEndResources:TRX02101,banksSelectMessage%>" runat="server"></asp:Literal>
                    <div class="clearBoth"></div>
                </div>
                <br />
            </asp:Panel>
            <asp:Panel ID="pnSearch" runat="server">
                <div class="panel">
                    <div id="divSearchCriteria" runat="server">
                        <div class="metro" style="margin-left: 0px;">
                            <div class="panel" data-role="panel" id="divTesteaver" style="border: none; margin-bottom: 2px;">
                                <asp:UpdatePanel runat="server" ID="updatePanel1">
                                    <ContentTemplate>
                                        <div class="listHeader">
                                            <div class="col-lg-8 col-max panel-header panel-header-3 pnSearchHeader" id="pnSearchHeader">
                                                <div class="img-search-panel">
                                                    <img class="panel-search-toggle" id="Img1" src="<%$ebFile:~/content/currenttheme/images/products/ico_search_transactions.png%>" style="margin-top: -12px;"
                                                        runat="server" alt="search"/>
                                                </div>
                                            </div>
                                        </div>
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <div class="col-lg-12 col-max panel-content panel-search" style="background-color: rgb(247, 246, 246); width: 100%; height: 120px; margin-bottom:2%;">
                                    <asp:Panel CssClass="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max " runat="server">
                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                            <asp:TextBox ID="banksSearch" runat="server" CssClass="trx-field" Enabled="true" ></asp:TextBox>
                                        </div>
                                        <div class="clearBoth"></div>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
            <asp:UpdatePanel runat="server" ID="updatePanelBanks">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="btnSearch" EventName="Click" />
                    <asp:PostBackTrigger ControlID="btnSelectBank" />
                </Triggers>
                <ContentTemplate>
                    <div id="emptySearchContainer" visible="false" runat="server" class="col-lg-12 col-max panel-content emptySearchContainer" style="background-color: rgb(247, 246, 246); width: 100%; height: 120px">
                        <asp:Panel CssClass="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max " runat="server">
                            <div class="emptySearchContainerMessage">
                                <asp:Literal ID="Literal2" Text="<%$FrontEndResources:TRX02101,emptyContainerMessage%>" runat="server"></asp:Literal>
                            </div>
                            <div class="clearBoth"></div>
                        </asp:Panel>
                    </div>
                    <asp:Panel CssClass="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max pnBanksList" ID="pnBanksList" runat="server">
                        <div id="divupdatePanelBanks" style="width: 100%; ">

                            <asp:Repeater ID="rptBanks" runat="server" OnItemDataBound="rptBanks_ItemDataBound">
                                <ItemTemplate>
                                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6">
                                        <div id="divBankBox" class="bankBox" style="display: flex; margin: 7px 0px 7px 0; border: 0.72px solid #D9D9D9; min-height: 55px;" runat="server">
                                            <asp:Image class="bankLogo" runat="server" ID="BankImage" CssClass="bankLogo"></asp:Image>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </asp:Panel>

                    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max " id="buttons" runat="server">
                        <div class="content-accounts overflowHidden">
                            <asp:Panel ID="divItemRow" runat="server">
                                <div class="col-xs-12" style="padding: 0px">
                                    <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6"></div>
                                    <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                                        <asp:HyperLink NavigateUrl="/Security/Transactions/DashboardTemplates/DynamicLandingPage.aspx" runat="server" Text="<%$FrontEndResources:TRX02101,Cancel%>" CssClass="btn btn-default btn-block"></asp:HyperLink>
                                    </div>
                                    <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
                                        <asp:Button ID="btnSelectBank" CausesValidation="false" Enabled="false" CssClass="btn btn-primary btn-block disabled" runat="server" Text="<%$FrontEndResources:TRX02101,Continue%>" OnClick="btnSelectBank_Click" />
                                    </div>
                                </div>
                                <div class="clearBoth"></div>
                            </asp:Panel>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </asp:Panel>

        <div id="stepConnection" runat="server" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max divConnection">
            <asp:UpdatePanel ID="connection" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="divConnectionImg">
                        <img id="imgConnection" src="<%$ebFile:~/Content/currenttheme/images/associate_accounts/associate_account_connection.png%>" alt="" runat="server" />
                    </div>
                    <div class="divConnectionTitleInfo">
                        <asp:Label ID="lblConnectionTitleInfo" runat="server"></asp:Label>
                    </div>
                    <div class="divConnectionSubTitleInfo">
                        <asp:Label ID="lblConnectionSubTitleInfo" Text="<%$FrontEndResources:TRX02101,ConnectionSubTitle%>" runat="server"></asp:Label>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>

        <div id="stepConclusion" runat="server" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
            <div class="divConclusion">
                <div class="divConclusionImg">
                    <img id="imgConclusion" src="<%$ebFile:~/Content/currenttheme/images/associate_accounts/associate_account_conclusion.png%>" alt="" runat="server" />
                </div>
                <div class="divConclusionTitleInfo">
                    <asp:Label ID="lblConclusionTitleInfo" Text="<%$FrontEndResources:TRX02101,ConclusionTitle%>" CssClass="lblConclusionTitle" runat="server"></asp:Label>
                </div>
                <div class="divConclusionSubTitleInfo">
                    <asp:Label ID="lblConclusionSubTitleInfo" CssClass="lblConclusionSubTitle" runat="server"></asp:Label>
                </div>
                <div class="divConclusionInfoRenew">
                    <img id="imgRenew" class="imagesConclusionCheck" src="<%$ebFile:~/Content/currenttheme/images/associate_accounts/associate_account_check.png%>" alt="" runat="server" />&nbsp&nbsp<asp:Label ID="lblConclusionInfoRenew" Text="<%$FrontEndResources:TRX02101,ConclusionInfoRenew%>" CssClass="lblConclusionInfo" runat="server"></asp:Label>
                &nbsp;</div>
                <div class="divConclusionInfoManage">
                    <img id="imgManage" class="imagesConclusionCheck" src="<%$ebFile:~/Content/currenttheme/images/associate_accounts/associate_account_check.png%>" alt="" runat="server" />&nbsp&nbsp
                    <asp:Label ID="lblConclusionInfoManage" Text="<%$FrontEndResources:TRX02101,ConclusionInfoManage%>" CssClass="lblConclusionInfo" runat="server"></asp:Label>
                </div>
                <div class="conclusionActions">
                    <a runat="server" id="btnAddAnotherAccount" class="buttonAddAnotherAccount">
                        <asp:Literal ID="litAddAnotherAccount" Text="<%$FrontEndResources:TRX02101,ConclusionAddAnotherAccount%>" runat="server"></asp:Literal>
                    </a>
                    <a runat="server" id="btnContinueAccount" class="buttonContinueAccount">
                        <asp:Literal ID="litContinueAccount" Text="<%$FrontEndResources:TRX02101,ConclusionContinue%>" runat="server"></asp:Literal>
                    </a>
                </div>
            </div>
        </div>

        <div id="errorPage" runat="server" class="errorContainer">
            <div class="divErrorContainer">
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                    <div class="divErrorImg">
                        <img id="imgError" src="<%$ebFile:~/Content/currenttheme/images/associate_accounts/warning_alert_ass_accounts.png%>" alt="" runat="server" />
                    </div>
                    <div class="divErrorTitleInfo">
                        <asp:Label ID="lblErrorTitleInfo" Text="<%$FrontEndResources:TRX02101,ErrorTitleInfo%>" CssClass="associatesAccountslblErrorTitle" runat="server"></asp:Label>
                    </div>
                    <div class="divErrorSubTitleInfo">
                        <asp:Label ID="lblErrorSubTitleInfo" Text="<%$FrontEndResources:TRX02101,ErrorSubTitleInfo%>" CssClass="associatesAccountslblErrorTitle" runat="server"></asp:Label>
                    </div>

                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max errorActions">
                <asp:LinkButton runat="server" ID="btnErrorLeave" CssClass="btnErrorLeave" Text="<%$FrontEndResources:TRX02101,ErrorLeave%>" />
                <asp:LinkButton runat="server" ID="btnErrorTryAgain" CssClass="btnErrorTryAgain" Text="<%$FrontEndResources:TRX02101,ErrorTryAgain%>" />
            </div>
        </div>
    </div>

    <asp:HiddenField ID="HdnSelectedBank" runat="server" Visible="true" />
    <asp:HiddenField ID="hdnSelectedBankName" runat="server" Visible="true" />
    <asp:HiddenField ID="hdnConsentID" runat="server" />
    <asp:HiddenField ID="hdnTokenID" runat="server" />
    <asp:HiddenField ID="hdnUrlConsentStatus" runat="server" />



    <asp:Button ID="btnConsentStatus" UseSubmitBehavior="false" Text="Status" Style="display: none;" runat="server" OnClick="btnConsentStatus_Click" />
    <asp:Button ID="btnConsents" Style="display: none;" runat="server" OnClick="btnConsents_Click" />
    <asp:Button ID="btnSearch" Style="display: none;" runat="server" OnClick="btnSearch_Click" />

    <script type="text/javascript">


</script>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("/Scripts/Services/Transactions/TRX02101-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX02101-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />

    <script type="text/javascript">

        var txtSearch = $('#<%=banksSearch.ClientID%>');

        function Consents() {
            var btnHidden = $('#<%= btnConsents.ClientID %>');
            if (btnHidden != null) {
                btnHidden.click();
            }
        }

        

 

        txtSearch.on("keyup", function () {
            var btnHiddenSearch = $('#<%= btnSearch.ClientID %>');
            if (btnHiddenSearch != null && txtSearch.val().length >= 3 || txtSearch.val().length == 0) {
                $(".panel-search").slideToggle();
                btnHiddenSearch.click();
            }
        });

    </script>

</div>
