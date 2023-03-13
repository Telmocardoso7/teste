<%@ Page Title="" Language="C#" MasterPageFile="~/Masters/Base.Master" AutoEventWireup="true" CodeBehind="Enrollment.aspx.cs" Inherits="eBankit.UI.Web.InternetBanking.Enrolment" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="HeadContent">
	<link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion( "styles.css".ResolveModuleCssUrl(), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
	<div class="panel-user marginTop15" >
		<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max no-padding">
			<it:flowcontainerdetail id="FlowContainerDetail1" cssclass="panel panel-detail panel-user-top" runat="server">
				<div class="field field_v2">
					<div class="panelUserCenter-wrapper">
						<div>
							<div>
								<div class="panelUserLeft-wrapper panelUserCenter-margins">
									<img id="imgTop" src="<%$ebFile:~/Content/currenttheme/images/user-icon.png %>" alt="" class="img-user img-thumbnail img-circle img-user-left" runat="server" />
								</div>
								<div class="panel-user-data">
									<h5 class="overflowEllipsis welcomeMessage">
										<asp:Literal ID="litClientNameTop" runat="server"></asp:Literal></h5>
									<p class="pull-bottom field-col-3 overflowEllipsis lastAcess">
										<asp:Label ID="lblLastAccessTop" Text="" runat="server"></asp:Label>
									</p>
								</div>
								<div class="clearBoth"></div>
							</div>
						</div>
					</div>
					<div class="clearBoth"></div>
				</div>
			</it:flowcontainerdetail>
		</div>
	</div>
	<asp:Panel CssClass="register" runat="server" ID="registerPanel">
		<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-centered">
			<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-centered fullWidth clearPadding">
				<h2 class="register-title">
					<asp:Literal ID="Literal6" Text="<%$FrontEndResources:Register,RegisterFormTitle %>" runat="server" />
				</h2>
				<asp:PlaceHolder ID="phMessage" runat="server"></asp:PlaceHolder>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-8 col-lg-8 fullHeight clearPadding">
				<div class="enrollment">
					<asp:Panel ID="pnNewKey" runat="server">

						<div class="panel-login-inputs">
							<p>
								<asp:Literal ID="l" runat="server" Text="<%$FrontEndResources:Subscription,ContractInfo %>"></asp:Literal>
							</p>
							<p class="enrollment-contract">
								<asp:Literal ID="Literal1" Text="<%$FrontEndResources:Subscription,Contract %>" runat="server" />
								<asp:LinkButton ID="linkDownloadContract" Text="<%$FrontEndResources:Subscription,RegisterFormTitle %>" runat="server" />
							</p>

							<div class="panel panel-default">
								<div class="panel-body noPaddingRight">
									<asp:Repeater ID="requiredDoc" runat="server" OnItemDataBound="requiredDoc_ItemDataBound">
										<HeaderTemplate>
											<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding nMarginLeft15">
												<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 clearPadding ">
													<span class="documents-title">
														<asp:Literal ID="Literal5" Text="<%$FrontEndResources:Subscription,DocumentInProcess %>" runat="server" /></span>
												</div>
												<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 clearPadding ">
													<span class="documents-item" style="display: inline-block;">
														<asp:Literal ID="litStep_1" Text="<%$FrontEndResources:Register,StateTitle %>" runat="server"></asp:Literal></span>
												</div>
												<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 clearPadding ">
													<span class="documents-item" style="display: none;">
														<asp:Literal ID="Literal10" Text="<%$FrontEndResources:Register,DetailTitle %>" runat="server" Visible="false"></asp:Literal></span>
												</div>
												<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 clearPadding ">
													<span class="documents-item" style="display: none;">
														<asp:Literal ID="Literal11" Text="<%$FrontEndResources:Register,PrintTitle %>" runat="server" Visible="false"></asp:Literal></span>
												</div>
										</HeaderTemplate>
										<ItemTemplate>
											<asp:HiddenField ID="docType" runat="server" />
											<asp:LinkButton ID="linkFile" runat="server"></asp:LinkButton>
											<div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" style="border-bottom: solid 1px #eaeaea;">
												<div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 clearPadding enrollment-bord paddingRight10">
													<strong>
														<asp:Label ID="lbl" runat="server" Text="" /></strong>
													<asp:Label ID="lblNoFile" runat="server" Text="<%$FrontEndResources:Subscription,DocIsrequired %>"></asp:Label>
												</div>
												<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 clearPadding enrollment-bord">
													<span id="alertPanel" runat="server"></span>
												</div>
												<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 clearPadding enrollment-bord" style="display: none;">
													<span class="detail" runat="server"></span>
												</div>
												<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1 clearPadding enrollment-bord" style="display: none;">
													<span class="print" runat="server"></span>
												</div>
												<div class="clearBoth"></div>
											</div>
											<div class="clearBoth"></div>
										</ItemTemplate>
										<FooterTemplate>
											</div>
										</FooterTemplate>
									</asp:Repeater>
								</div>
							</div>

							<div class="panel panel-default">
								<span class="documents-title">
									<asp:Literal ID="Literal2" Text="<%$FrontEndResources:Subscription,AddDocumentToProcess %>" runat="server" />
								</span>
								<div class="panel-body" style="padding-left: 0px; padding-right: 0px;">
									<div class="col-sm-6 col-xs-12 clearPadding">

										<div id="photoPanel" class="photoPanel" draggable="true" ondragstart="OnDragStart" ondrop="OnDrop" runat="server">
											<asp:Label ID="btnSelectFile" Text="" AssociatedControlID="fuTest" Style="background-color: rgb(245,245,245); border: dashed 2px #ddd; height: 100px; margin: auto; width: 100%; text-align: center; cursor: pointer;" runat="server">
												<img id="imgUser" alt="" src='<%$ebFile:ContentModule,currenttheme/images/operations/transfers_in.png %>' style="margin-top: 8%;" runat="server" />
												<span>
													<asp:Literal ID="Literal12" Text="<%$FrontEndResources:Register,ClickToSelect %>" runat="server"></asp:Literal></span>
											</asp:Label>
										</div>
										<div style="display: none">
											<asp:FileUpload ID="fuTest" CssClass="rpt-btnimg-add" AllowMultiple="false" runat="server" ClientIDMode="Predictable" />
											<asp:HiddenField ID="hiddenField" runat="server" />
										</div>

									</div>
									<div class="col-sm-5 col-xs-10 uploaddrop">
										<asp:DropDownList ID="dropDocTypes" CssClass="drop" OnChange="ShowOther();" runat="server"></asp:DropDownList>
									</div>
									<div class="col-sm-1 col-xs-1 uploadbutton">
										<asp:ImageButton ID="uploadedFile" CssClass="upload" ImageUrl='<%$ebFile:,~/currentmodule/content/currenttheme/images/icon/ico_upload.png %>'  OnClientClick="return ValidateOther();" OnClick="uploadFile_Click" runat="server" />
										<%--<asp:Button runat="server" ID="uploadedFile" Text="<%$FrontEndResources:Subscription,Upload %>" OnClick="uploadFile_Click" />--%>
									</div>
									<div class="clearBoth"></div>
									<div id="divOther" class="col-xs-12" style="display: none; margin-top: 20px;" runat="server">
										<it:TextBoxControl_v2 id="txtOtherName" showlabel="true" textmode="SingleLine" label="<%$FrontEndResources:Register,OtherName %>" runat="server" watermark="<%$FrontEndResources:Register,OtherNameWatermark %>" />
									</div>
									<div class="clearBoth"></div>
									<div class="col-xs-12 clearPadding" style="margin-top: 20px;">
										<a href="#" onclick="LogoutEnvolement();return false;" class="btn btn-primary btn-margin btn-block">
											<asp:Literal Text="<%$FrontEndResources:Register,Exit%>" runat="server"></asp:Literal></a>
										 <asp:Button ID="btnLogoutEnrolment" Style="display: none;" OnClick="btnLogoutEnrolment_Click" runat="server" />
   
									</div>
								</div>
							</div>
						</div>
					</asp:Panel>
				</div>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-4 visible-lg visible-md visible-sm">
				<div class="register-steps">
					<ul>
						<li id="liSetp1" class="step"><span>
							<asp:Literal ID="litStep_1" Text="<%$FrontEndResources:Register,Step_1 %>" runat="server"></asp:Literal></span></li>
						<li id="liSetp2" class="step"><span>
							<asp:Literal ID="Literal3" Text="<%$FrontEndResources:Register,Step_2 %>" runat="server"></asp:Literal></span></li>
						<li id="liSetp3" class="step step-selected"><span>
							<asp:Literal ID="Literal4" Text="<%$FrontEndResources:Register,Step_3 %>" runat="server"></asp:Literal></span></li>
					</ul>
				</div>
				<div class="register-help">
					<h2>
						<asp:Literal ID="Literal7" Text="<%$FrontEndResources:Register,NeedHelp %>" runat="server"></asp:Literal></h2>
					<div class="help-item">
						<h3>
							<asp:Literal ID="Literal8" Text="<%$FrontEndResources:Register,CallUs %>" runat="server"></asp:Literal></h3>
						<span class="register-phone">
							<asp:Literal ID="Literal5" Text="<%$FrontEndResources:Register,CellPhoneNumber %>" runat="server"></asp:Literal></span>
						<span class="register-text">
							<asp:Literal ID="Literal9" Text="<%$FrontEndResources:Register,RegisterInfo %>" runat="server"></asp:Literal></span>
					</div>
				</div>
			</div>
			<div class="clearBoth"></div>
		</div>
		<div class="clearBoth"></div>
	</asp:Panel>
	<div class="clearBoth"></div>

	<asp:HiddenField ID="hdnInputTextField" runat="server" />
	<asp:HiddenField ID="hdnPanelVisible" runat="server" />

	<script type="text/javascript">
	  
		function LogoutEnvolement() {
			var btnLogoutEnrolmentid = '<%=btnLogoutEnrolment.UniqueID %>';
			__doPostBack(btnLogoutEnrolmentid, '');
		}

		function ShowOther() {
			var divother = $('[id$=divOther]');
			var dropDocTypes = $('[id$=dropDocTypes]');
			if (dropDocTypes.val() == '5') {
				divother.show();
			}
			else {
				divother.hide();
			}
		}

		function ValidateOther() {
			var txtOtherName = $('[id$=txtOtherName_txField]');
			var dropDocTypes = $('[id$=dropDocTypes]');

			//alert("txtOtherName.val(): " + txtOtherName.val() + "\ndropDocTypes.val(): " + dropDocTypes.val());

			if (txtOtherName.val() == '' && dropDocTypes.val() == '5') {
				eBankit.Presentation.InsertValidateMsg(txtOtherName, top.eBankit.Presentation.GetResource("txtOtherNameRequired"));
				return false;
			}
			else {
				eBankit.Presentation.RemoveValidateMsg(txtOtherName);
				return true;
			}
		}
		$(document).ready(function () {
			ShowOther();
			var txtOtherName = $('[id$=txtOtherName_txField]');
			txtOtherName.val('');
		});
	</script>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
