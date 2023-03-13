<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BeneficiariesControl.ascx.cs" Inherits="BeneficiariesControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Always">
    <ContentTemplate>
        <it:FlowContainerDetail ID="flwBeneficiaries" CssClass="panel panel-detail metro header-small panel-detail-noborder panel-small" Title="<%$FrontEndResources:Beneficiary,Title%>" runat="server">
            <div class="list-group metro">
                <asp:Repeater ID="rptBeneficiaries" runat="server" EnableViewState="true" OnItemDataBound="rptBeneficiaries_ItemDataBound">
                    <HeaderTemplate>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div style="padding: 5px;height: 275px;">
                        <a id="aBenef" href="javascript:void(0)" class="list-group-item list-group-item-inner list-group-item-inner-hover" runat="server">
                            <div>
                                <div class="list-group-item-heading list-group-item-img">
                                    <img id="imgBeneficiary1" src="<%$ebFile:~/Content/currenttheme/images/user_index.png %>" alt="" runat="server" />
                                </div>
                                <div class="list-group-item-text">
                                    <h6 style="margin-bottom:0px;color:#820000;"><asp:Literal ID="litName" Text='<%#Eval("Name")%>' runat="server"></asp:Literal></h6>
                                    <h6 style="margin-top:0px;"><asp:Literal ID="litSubTitle" runat="server"></asp:Literal></h6>
                                    <p style="margin-bottom:0px;"><asp:Literal Text="<%$FrontEndResources:Beneficiary,lblNibOrAccount%>" runat="server"></asp:Literal></p>
                                    <p style="font-size:1.2rem;"><asp:Literal ID="litNumber" Text='<%#Eval("Destin")%>' runat="server"></asp:Literal></p>
                                </div>
                            </div>
                        </a>
                            </div>
                    </ItemTemplate>
                    <FooterTemplate>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </it:FlowContainerDetail>
        <asp:Button ID="btnBeneficiarySelectedChanged" runat="server" CssClass="hidden" />
    </ContentTemplate>
</asp:UpdatePanel>
<asp:HiddenField ID="hdnBeneficiarySelectedIndex" Value="" runat="server" />
<asp:HiddenField ID="_hidSelectedBeneficiary" runat="server" />
<asp:HiddenField ID="_hidBeneficiaryArray" runat="server" />
<asp:HiddenField ID="hdnBeneficiaryAccountType" runat="server" />
<script type="text/javascript">
    var _hidBeneficiaryArray = $("#<%=_hidBeneficiaryArray.ClientID %>"); var _hidSelectedBeneficiary = $("#<%=_hidSelectedBeneficiary.ClientID %>");
    var hdnBeneficiarySelectedIndex = $("#<%=hdnBeneficiarySelectedIndex.ClientID %>"); var btnBeneficiarySelectedChanged = "<%=btnBeneficiarySelectedChanged.UniqueID %>"; var AutoPostBack_f = '<%=AutoPostBack %>';
    var hdnBeneficiaryAccountType = $("#<%=hdnBeneficiaryAccountType.ClientID %>");
    var projId = "<%=ConfigurationManager.AppSettings["projectId"].ToString() %>";
</script>
<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("beneficiary-1.0.js".ResolveJsUrl("Services"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>

