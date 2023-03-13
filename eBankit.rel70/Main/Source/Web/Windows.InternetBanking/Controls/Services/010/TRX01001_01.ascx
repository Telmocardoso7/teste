<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01001_01.ascx.cs" Inherits="TRX01001_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <div id="divSuccess" runat="server" visible="false">
	    <section class="grayContainer content-message metro">
		    <div class="col-lg-8 col-max">
			    <div class="alert alert-success fade in col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
				    <div class="div-icon-success_v3"></div>
				    <h3 class="alert-heading">
					    <asp:Literal ID="Literal1" Text="<%$GenericFrontEndResources:SuccessTitle%>" runat="server" />

				    </h3>
				    <h4 class="alert-heading">
					    <asp:Literal ID="Literal2" Text="<%$GenericFrontEndResources:OperationSuccessfully%>" runat="server" />
				    </h4>
				    <div style="clear: both;"></div>
			    </div>
		    </div>

	    </section>
    </div>
    <div class="clearBoth"></div>

    <div class="metro" style="margin-left: 0;">
	    <div class="panel" data-role="panel" id="divTesteaver" style="border: none; margin-bottom: 0; background-color: rgb(247, 246, 246);">
		    <div class="listHeader">
			    <div class="col-lg-8 col-max panel-header panel-header-3" id="pnSearchHeader" onclick="$('.panel-search').slideToggle();">
				    <asp:Literal ID="lblFilterTitle" Text="<%$FrontEndResources:TRX01001,tituloFiltro%>" runat="server" />
				    <div class="img-search-panel">
					    <img src="/Content/Themes/ebankIT/images/icon/ico_menu_search.png" style="float: right; margin-top: -12px;">
				    </div>
			    </div>
		    </div>
		    <div class="col-lg-8 col-max panel-content panel-search" style="background-color: rgb(247, 246, 246);">
			    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
				    <div class="field field_v2 metro metro">
					    <asp:CheckBox ID="chkShowDeactivated" Text="<%$FrontEndResources:TRX01001,ShowInactives%>" CssClass="filterCheckBox" AllowOnOff="true" runat="server" />
				    </div>
				    <div class="clearBoth"></div>
			    </div>
			    <div class="clearBoth"></div>
			    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
				    <asp:Button ID="btnSearch" CssClass="btn btn-primary btn-margin btn-search-filter" OnClientClick="return FilterSearch();" onCLick="btnSearch_Click" runat="server" Text="<%$FrontEndResources:TRX00901,btnSearch%>" />
			    </div>
			    <div class="clearBoth"></div>
		    </div>
	    </div>
    </div>
    <div class="clearBoth"></div>

    <div id="divEmptyList" runat="server" visible="false">
	    <section class="grayContainer content-message metro">
		    <div class="col-lg-8 col-max">
			    <div id="MainContent_TransactionMainContent_divMessage" class="alert alert-info_v2 fade in col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
				    <div class="div-icon-info_v2"></div>
				    <h3 class="alert-heading">
					    <asp:Literal ID="lblEmptyListTitle" Text="<%$GenericFrontEndResources:AttentionTitle%>" runat="server" />

				    </h3>
				    <h4 class="alert-heading">
					    <asp:Literal ID="lblEmptyList" Text="<%$FrontEndResources:TRX01001,NoLoginAccounts%>" runat="server" />
				    </h4>
				    <div style="clear: both;"></div>
			    </div>
		    </div>

	    </section>
    </div>

    <div class="metro table-grid-border col-lg-8 col-max">
	    <div class="table-grid table-responsive table hovered inside-table table-resp-to1199 table-movements">
		    <asp:Repeater ID="rptCompanyLoginAccounts" runat="server" OnItemDataBound="rptCompanyLoginAccounts_ItemDataBound">
			    <HeaderTemplate>
				    <table class="table hovered inside-table table-resp-to1199">
					    <tbody>
						    <tr class="table-header">
							    <th>
								    <asp:Literal Text="<%$FrontEndResources:TRX01001,DescOperator%>" ID="lblDescOperator" runat="server" />
							    </th>
							    <th>
								    <asp:Literal Text="<%$FrontEndResources:TRX01001,ActivationDate%>" ID="lblActivationDate" runat="server" />
							    </th>
							    <th>
								    <asp:Literal Text="<%$FrontEndResources:TRX01001,ActivationTime%>" ID="lblActivationTime" runat="server" />
							    </th>
							    <th>
								    <asp:Literal Text="<%$FrontEndResources:TRX01001,StatusDate%>" ID="lblStatusDate" runat="server" />
							    </th>
							    <th>
								    <asp:Literal Text="<%$FrontEndResources:TRX01001,StatusTime%>" ID="lblStatusTime" runat="server" />
							    </th>
							    <th>
								    <asp:Literal Text="<%$FrontEndResources:TRX01001,Status%>" ID="lblStatus" runat="server" />
							    </th>
							    <th colspan="3"></th>
						    </tr>
			    </HeaderTemplate>
			    <ItemTemplate>
				    <tr>
					    <td>
						    <asp:Literal ID="valDescOperator" runat="server" />
					    </td>
					    <td>
						    <asp:Literal ID="valActivationDate" runat="server" />
					    </td>
					    <td>
						    <asp:Literal ID="valActivationTime" runat="server" />
					    </td>
					    <td>
						    <asp:Literal ID="valStatusDate" runat="server" />
					    </td>
					    <td>
						    <asp:Literal ID="valStatusTime" runat="server" />
					    </td>
					    <td>
						    <asp:Literal ID="valStatus" runat="server" />
					    </td>
					    <td>
						    <asp:LinkButton ID="btnActiveInactive" OnClick="btnActiveInactive_Click" runat="server"></asp:LinkButton>
					    </td>
					    <td>
						    <asp:LinkButton href="javascript:void(0);" ID="btnEdit" CssClass="magnifierGlassListing smallIcon" style="height: 40px; display: block; background-position: center center; background-size: 30px !important;" runat="server"></asp:LinkButton>
					    </td>
				    </tr>
			    </ItemTemplate>
			    <FooterTemplate>
				    </tbody>
				    </table>
			    </FooterTemplate>
		    </asp:Repeater>
	    </div>
    </div>
    <asp:HiddenField ID="hdnInactiveUserStatus" runat="server" />
    <asp:HiddenField ID="hdnInactiveUserId" runat="server" />
    <asp:Button ID="btnInactiveUser" CssClass="" runat="server" />
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01001-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
<script type="text/javascript">
	InactiveCompanyUser = function (id, status) {
		hdnInactiveUserId.val(id);
		hdnInactiveUserStatus.val(status);
		__doPostBack(btnInactiveUser, '');
	}

	FilterSearch = function () {
		return $("#aspnetForm").valid();
	};
</script>
