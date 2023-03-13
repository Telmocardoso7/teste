
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01530_01.ascx.cs" Inherits="TRX01530_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
	<asp:Panel ID="pnControls" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" runat="server">
		<it:FlowInnerContainer ID="flwContainer" CustomCssClass="col-max bs-reduced bs-head-metro" runat="server">
			<div>
                <asp:UpdatePanel ID="updPanel" runat="server" UpdateMode="Conditional">
    <ContentTemplate>
                      <div style="padding-top:30px;">
                <div class="saving-title2">
                    <div class="jss">
                    <asp:Literal ID="TitleInsurance" runat="server" Text="<%$FrontEndResources:TRX01530,litDataContainer%>"></asp:Literal></div>
<div class="metro" style="float: right; display: inline-block; font-size: 15px;">
                <it:CheckBoxControl ID="chkSettlement" value="0"  Label="<%$FrontEndResources:TRX001530,chckss%>" AllowOnOff="true" runat="server" />
            </div>
                </div>
                </div>
        <div id="panel" style="padding-top:10px;" >
                <div style="width:300%;background-color:#eeeeee;margin-left: -30%; height:150px; padding-top: 20px;">
                    <div style="width:37%; display:inline-block; margin-left:300px;">
                        <div class="contentBox box-blue" style="width:25%; display:inline-block;" runat="server">
                            <span class="numAcc cosinnego">
                                <asp:Literal runat="server" Text="<%$FrontEndResources:TRX001530,Amount%>"></asp:Literal></span>
                            <span class="costam">
<it:TextBoxControl_v2 ID="txtAmount"  MaxLength="18" MinLength="6" runat="server" /></span>
                        </div>
           <div  class="contentBox box-blue" runat="server" style="width:25%; display:inline-block;" >
                            <span class="numAcc cosinnego">
                                <asp:Literal runat="server" Text="<%$FrontEndResources:TRX001530,Currency%>"></asp:Literal></span>
                            <span class="costam">
<it:AutoCompleteDropDownList_v2 ID="ddlOwnAccounts" IsRequired="true" runat="server" /></span>
                        </div>
                        <div class="contentBox box-blue" style="width:25%; display:inline-block;"  runat="server">
                            <span class="numAcc cosinnego">
                                <asp:Literal runat="server" Text="<%$FrontEndResources:TRX001530,Duration%>"></asp:Literal></span>
                            <span class="costam" >
                               <it:AutoCompleteDropDownList_v2 ID="AutoCompleteDropDownList_v1" IsRequired="true" runat="server" /></span>
                        </div>
<asp:Button ID="btnLogin" CssClass="btn btn-primary btn-margin" Style="margin-bottom: 30px;" Text="<%$FrontEndResources:TRX00151,filters %>" runat="server"  />
                        <div style="clear:both;"></div>
                    </div>
                </div>
            <div>
                <it:FlowContainerDetail ID="FlowContainerDetail1" CssClass="saving-title panel panel-detail title-table-insurances" runat="server" Title="">
                    <div class="table-grid-border">
                        <div class="col-lg-12 clearPadding">
                            <div class="metro">
                                <it:GridViewControl ID="gridSavings" runat="server" ShowHeader="false" AutoGenerateColumns="false" CssClass="table hovered table-resp-to1199 noarrow saving-grid col-lg-12" IsResponsive="true" GridLines="None" AllowsTopAnchor="true" EnableRowClicks="false" OnRowDataBound="gvSaving_RowDataBound" >
                                    <Columns>
                                        <asp:TemplateField ItemStyle-Width="30%">
                                            <ItemTemplate>
                                                <div id="divAccountType" class="contentBox box-blue" runat="server">
                                                    <div class="scroll-item-top accountNameOverflow">
                                                        <h4 style="font-size: 20px;">
                                                            <asp:Literal ID="litSavingName" runat="server"></asp:Literal></h4>
                                                        <span class="numAcc">
                                                            <asp:Literal ID="litSavingDescription" runat="server" ></asp:Literal></span>
                                                    </div>
                                                    <div class="clearBoth"></div>
                                                    
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="10%">
                                            <ItemTemplate>
                                                <div id="Div1" class="contentBox box-blue" runat="server">
                                                    <span class="numAcc">
                                                        <asp:Literal ID="Literal3" runat="server" Text="<%$FrontEndResources:TRX001530,MinAm%>"></asp:Literal></span>
                                                    <span class="insur-values" style="display: block;">
                                                        <asp:Literal ID="litSavingMoney" runat="server"></asp:Literal></span>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="30%">
                                            <ItemTemplate>
                                                <div id="Div2" class="contentBox box-blue" runat="server">
                                                    <span class="numAcc">
                                                        <asp:Literal ID="Literal4" runat="server" Text="<%$FrontEndResources:TRX001530,HowToCon%>"></asp:Literal></span>
                                                    <span class="insur-values" style="display: block;">
                                                        <asp:Literal ID="litConstituteWay" runat="server" ></asp:Literal></span>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-CssClass="visible-md visible-lg visible-sm" ItemStyle-Width="10%">
                                            <ItemTemplate>
                                                <div id="Div3" class="contentBox box-blue" runat="server">
                                                    <span class="numAcc">
                                                        <asp:Literal runat="server" Text="<%$FrontEndResources:TRX001530,Currency%>"></asp:Literal></span>
                                                    <span class="insur-values" style="display: block;">
                                                        <asp:Literal ID="litCurrency" runat="server" Text="Active"></asp:Literal></span>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                                                                <asp:TemplateField ItemStyle-CssClass="visible-md visible-lg visible-sm" ItemStyle-Width="10%">
                                            <ItemTemplate>
                                                <div class="contentBox box-blue" runat="server">
                                                    <span class="numAcc">
                                                        <asp:Literal runat="server" Text="<%$FrontEndResources:TRX001530,Period%>"></asp:Literal></span>
                                                    <span class="insur-values" style="display: block;">
                                                        <asp:Literal ID="litPeriod" runat="server" Text="Active"></asp:Literal></span>
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-Width="7.5%">
                                            <ItemTemplate>
                                                <div>
                                                    <img id="Img2" src="<%$ebFile:~/Content/currenttheme/images/dashboard/ico_dashboard_payments.png%>"  class="pict-insurance-opts" runat="server" />
                                                </div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </it:GridViewControl>
                            </div>
                        </div>
                    </div>
                </it:FlowContainerDetail>
                </div>
            </div>
    </ContentTemplate>
</asp:UpdatePanel>
			</div>
		</it:FlowInnerContainer>
		<div class="clearBoth"></div>
				
	</asp:Panel>
	<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01530-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01530-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
