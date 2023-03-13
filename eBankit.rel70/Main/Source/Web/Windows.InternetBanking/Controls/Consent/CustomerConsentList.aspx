<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Masters/Transaction.Master" CodeBehind="CustomerConsentList.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.CustomerConsentList" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<asp:Content runat="server" ID="FeaturedContent" ContentPlaceHolderID="TransactionFeaturedContent">
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro" style="margin: 20px auto">
        <h3 class="head head-top">
            <asp:Literal ID="litTitle" Text="<%$FrontEndResources:Consent,Title%>" runat="server"></asp:Literal>
        </h3>
    </div>
    <div class="custom-accounts-panel tab-pane metro sortable-list ui-sortable">
        <div class="headerContainer" id="infoTopMessage" runat="server">
            <div class="metro info-bottom-text col-lg-8 col-max heavyMargin">
                <asp:Label ID="lblInfoMessageExternal" Text="<%$FrontEndResources:Consent,InfoTopMessage %>" CssClass="infoTopMessage" runat="server"></asp:Label>
                <br />
                <asp:Label ID="lblMandatoryInfo" Text="" CssClass="infoTopMessage" runat="server"></asp:Label>
            </div>
        </div>

        <div class="clearBoth marginBottom10"></div>
    </div>
    <asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
</asp:Content>

<asp:Content runat="server" ID="BodyContent" class="consent" ContentPlaceHolderID="TransactionMainContent">
    <div runat="server" id="EmptyContent" style="text-align: center" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro">
        <img id="imgContract" src="<%$ebFile:~/Content/currenttheme/images/warning_consents.png%>" alt="" style="margin: 60px 0 50px 0;" runat="server" />

        <h4 style="font-size: 20px; font-weight: bold;">
            <asp:Literal ID="Literal3" Text="<%$FrontEndResources:Consent,EmptyListTitle%>" runat="server"></asp:Literal>
        </h4>
        <h4>
            <asp:Literal ID="Literal4" Text="<%$FrontEndResources:Consent,EmptyListText%>" runat="server"></asp:Literal>
        </h4>
    </div>
    <div runat="server" id="HasConsents" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro consent">
        <div runat="server" id="optionalConsents">
            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro">
                <h3 class="head" style="font-size: 22px">
                    <asp:Literal ID="Literal1" Text="<%$FrontEndResources:Consent,OptionalList%>" runat="server"></asp:Literal>
                </h3>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro">
                <table class="table tableConsents">
                    <asp:Repeater ID="rptOptionalList" runat="server" OnItemDataBound="rptMandatoryList_ItemDataBound">
                        <ItemTemplate>
                            <tr>
                                <td class="alignCenter">
                                    <span id="ConsentText" runat="server">
                                    <p id="ConsentContent" runat="server"></p>
                                    <p id="ConsentAccept" class="accept-text" runat="server"></p>
                                    <p id="ConsentDecline" class="accept-text" runat="server"></p>
                                    </span>
                                </td>
                                <td class="alignCenter channel button-consent">
                                    <label class="onoffswitch accountNumber">
                                        <input type="hidden" runat="server" id="consentId"/>
                                        <input type="hidden" runat="server" id="versionId"/>
                                        <it:CheckBoxSwitchControl_v2 ID="chkConsent" CssClass="save-consent" runat="server"></it:CheckBoxSwitchControl_v2>
                                    </label>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
        </div>
        <div runat="server" id="mandatoryConsents">
            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro">
                <h3 class="head" style="font-size: 22px">
                    <asp:Literal ID="Literal2" Text="<%$FrontEndResources:Consent,MandatoryList%>" runat="server"></asp:Literal>
                </h3>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro">
                <table class="table tableConsents">
                    <asp:Repeater ID="rptMandatoryList" runat="server" OnItemDataBound="rptMandatoryList_ItemDataBound">
                        <ItemTemplate>
                            <tr>
                                <td class="alignCenter">
                                    <span id="ConsentText" runat="server">
                                    <p id="ConsentDescription" runat="server"></p>
                                    <p id="ConsentContent" runat="server"></p>
                                    <p id="ConsentAccept" class="accept-text" runat="server"></p>
                                    <p id="ConsentDecline" class="accept-text" runat="server"></p>
                                    </span>
                                </td>
                                <td class="alignCenter channel button-consent">
                                    <label class="onoffswitch accountNumber">
                                        <input type="hidden" runat="server" id="mandatoryConsentId"/>
                                        <it:CheckBoxSwitchControl_v2 ID="chkConsent"  runat="server"></it:CheckBoxSwitchControl_v2>
                                    </label>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("/Scripts/Services/Transactions/CustomerConsentList.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
</asp:Content>

