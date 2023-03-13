<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01172_01.ascx.cs" Inherits="TRX01172_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
	<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/Services/Transactions/TRX01172-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01172-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />

    <div id="deletePopup" style="display: none">
        <div class="tppPopupPadding alert-warning_v3">
            <div style="text-align: center" >
                <img id="img2" src="<%$ebFile:~/Content/currenttheme/images/icon/ic_generic_message_warning.png%>" alt="" runat="server" />
            </div>
            <h4 style="font-size: 20px; font-weight: bold;">
                <span ID="ltlDeleteAuthTitle"></span>
            </h4>
            <br />
            <h4 style="padding: 0px;">
                 <span ID="ltlDeleteAuthMsg"></span>
            </h4>
            <div class="clearBoth"></div>
        </div>
    </div>

    <div class="custom-accounts-panel tab-pane metro sortable-list ui-sortable">
        <div class="headerContainer" id="infoTopMessage" runat="server">
            <div class="metro info-bottom-text col-lg-8 col-max heavyMargin">
                <asp:Label ID="lblInfoMessageExternal" Text="<%$FrontEndResources:TRX01172,InfoTopMessage %>" CssClass="infoTopMessage" runat="server"></asp:Label>
                <br />
                <asp:Label ID="lblMandatoryInfo" Text="" CssClass="infoTopMessage" runat="server"></asp:Label>
            </div>
        </div>

        <div class="clearBoth marginBottom10"></div>
    </div>

    <div class="clearBoth"></div>

    <!-- Empty authorizations panel -->
    <div runat="server" id="EmptyContent" visible="false" style="text-align: center" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro">
        <img id="imgContract" src="<%$ebFile:~/Content/currenttheme/images/warning_consents.png%>" alt="" style="margin: 60px 0 50px 0;" runat="server" />
        <h4 style="font-size: 20px; font-weight: bold;">
            <asp:Literal ID="Literal3" Text="<%$FrontEndResources:TRX01172,EmptyListTitle%>" runat="server"></asp:Literal>
        </h4>
        <h4>
            <asp:Literal ID="Literal4" Text="<%$FrontEndResources:TRX01172,EmptyListText%>" runat="server"></asp:Literal>
        </h4>
    </div>

    <!-- Error loading authorizations panel -->
    <div runat="server" id="ErrorLoadingConsents" visible="false" style="text-align: center" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro">
        <img id="img1" src="<%$ebFile:~/Content/currenttheme/images/icon/ic_generic_message_warning.png%>" alt="" style="margin: 60px 0 50px 0;" runat="server" />

        <h4 style="font-size: 20px; font-weight: bold;">
            <asp:Literal ID="Literal2" Text="<%$FrontEndResources:TRX01172,ErrorLoadingListText%>" runat="server"></asp:Literal>
        </h4>
    </div>

    <div class="clearBoth"></div>

     <div class="col-left col-transaction messagesContainer transaction-content" runat="server" id="rightTransaction">
         <asp:Panel ID="panelMessages" runat="server" ClientIDMode="Static" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding bgWhite">
                <div class="noMarginLeft">
                    <!-- Search Panel Begin -->
                    <asp:Panel runat="server" CssClass="panel searchCriteria collapsed noMarginBottom" data-role="panel" ID="divFilter" Style="background-color: rgb(247, 246, 246);">
                        <div class="panel panel-detail noBottomMargin" id="flwSearch">
                            <div>
                                <div id="divSearchCriteria">
                                    <div class="metro noMarginLeft">
                                        <div class="panel" data-role="panel" id="divTesteaver">
                                            <div class="listHeader">
                                                <div class="col-lg-8 col-max panel-header panel-header-3 bgOverride" id="idSearchHeader" runat="server" onclick="$('.panel-search').slideToggle();" tabindex="0" onkeypress="$('.panel-search').slideToggle();"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearBoth"></div>
                                </div>
                            </div>
                        </div>

                        <asp:Panel CssClass="col-lg-8 col-max panel-content panel-search bgMainColor" runat="server" ID="searchCriteriaOptions">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 paddingTop10">
                                <it:DatePickerTextBoxRangeMetroControl_v3 ID="datepicker" Label="<%$FrontEndResources:DATALIST,From%>" LabelTo="<%$FrontEndResources:DATALIST,To%>" runat="server" CssClass="field field_v2 field-full metro" />
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 paddingTop10">
                                <it:DropDownListControl_v2 ID="dropAccountAccessType" Label="<%$FrontEndResources:TRX01172,MessageType%>" runat="server" BreakLine="true" CssClass="field field_v2 field-full metro" />
                            </div>

                            <div class="clearBoth"></div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                                <asp:Button ID="btnSearch" CssClass="btn btn-primary btn-margin btn-search-filter" OnClientClick="return eBankit.Presentation.TRX01172.FilterSearch();" runat="server" OnClick="ClickSearch" Text="<%$FrontEndResources:TRX01172,btnSearch%>" />
                            </div>
                            <div class="clearBoth"></div>
                        </asp:Panel>
                    </asp:Panel>
                    <!-- Search Panel End -->
                </div>
              
                <asp:Repeater ID="rptTPPS" runat="server" OnItemDataBound="rptTPPS_GridRowDataBound">
                    <HeaderTemplate>
                        <div class="tab-pane metro sortable-list ui-sortable tppMarginTop">
                            <ul class="tppList">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <li>
                            <div class="col-lg-8 col-max noPaddingLeftRight">
                                <div runat="server" id="accountNumberContainer" class="titleBorderBottom col-xs-12 col-sm-12 col-md-12 col-lg-12 col-principal noPaddingLeftRight">
                                    <p class="accountNumber  colHeader">
                                        <asp:Literal ID="litDescription" runat="server"></asp:Literal>
                                    </p>
                                </div>
                                                
                                <div runat="server" id="consents" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-principal noPaddingLeftRight">
                                    <asp:Repeater ID="rptConsents" runat="server" OnItemDataBound="rptConsents_GridRowDataBound" OnItemCommand="rptConsents_GridRowCommand">
                                        <HeaderTemplate>
                                            <ul class="tppList">
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <li>
                                                <asp:Repeater ID="rptAccounts" runat="server"   OnItemDataBound="rptAccounts_GridRowDataBound">
	                                                <HeaderTemplate>
						                                <div class="rowHeaderAccounts desktop-only tablet-only col-xs-12 col-sm-12 col-md-12 col-lg-12 noPaddingLeftRight">
							                                <div class="col-xs-7 col-sm-4 col-md-4 col-lg-4 noPaddingLeftRight">
							                                </div>
                                                            <!-- Consent Types Header-->
                                                            <div class="col-xs-12 col-sm-5 col-md-5 col-lg-5 alignCenter noPaddingLeftRight">
                                                                <div class="col-xs-2 col-sm-4 col-md-4 col-lg-4 alignCenter colHeader">
								                                    <asp:Literal Text="<%$FrontEndResources:TRX01172,Account%>" runat="server"></asp:Literal>
							                                    </div>

                                                                <div class="col-xs-2 col-sm-4 col-md-4 col-lg-4 alignCenter colHeader">
								                                    <asp:Literal Text="<%$FrontEndResources:TRX01172,Transactions%>" runat="server"></asp:Literal>
							                                    </div>

                                                                <div class="col-xs-2 col-sm-4 col-md-4 col-lg-4 alignCenter colHeader">
								                                    <asp:Literal Text="<%$FrontEndResources:TRX01172,Balance%>" runat="server"></asp:Literal>
							                                    </div>
                                                            </div>
                                                            <!-- Consent Dates Header -->
                                                            <div class="col-xs-12 col-sm-3 col-md-3 col-lg-3 alignCenter noPaddingLeftRight">
								                                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 alignCenter colHeader ">
								                                    <asp:Literal Text="<%$FrontEndResources:TRX01172,StartDate%>" runat="server"></asp:Literal>
							                                    </div>

                                                                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6 alignCenter colHeader">
								                                    <asp:Literal Text="<%$FrontEndResources:TRX01172,EndDate%>" runat="server"></asp:Literal>
							                                    </div>    
							                                </div>
						                                </div>	
                                                         <ul class="tppList">
	                                                </HeaderTemplate>
	                                                <ItemTemplate>                                                       
		                                                <li class="rowAccountMobile">
					                                        <div class="rowAccounts col-xs-12 col-sm-12 col-md-12 col-lg-12 noPaddingLeftRight">
                                                                <!-- Consent Account -->
							                                    <div id="divConsentAccount" runat="server" class="col-xs-9 col-sm-4 col-md-4 col-lg-4 noPaddingLeftRight gridRow paddingConsentAccount">
                                                                    <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 noPaddingLeftRight alignCenter">
                                                                        <img id="imgAccountType" src="<%$ebFile:~/Content/currenttheme/images/{0}%>" alt="" runat="server" class="iconTypeAccountSize"/>
                                                                    </div>
                                                                    <div class="col-xs-10 col-sm-10 col-md-10 col-lg-10 noPaddingLeftRight">
                                                                        <span class="accountDescriptionLabel"><asp:Literal ID="litAccountDescription" runat="server"></asp:Literal></span>
                                                                        <br />
                                                                        <span><asp:Literal ID="litReference" runat="server"></asp:Literal></span>
                                                                    </div>
							                                    </div>
                                                                <!-- Consent Types -->
                                                                <div id="divConsentTypes" runat="server" class="col-xs-12 col-sm-5 col-md-5 col-lg-5 alignCenter gridRow paddingConsentType">
                                                                    <div runat="server" id="accountContainer" class="col-xs-3 col-sm-4 col-md-4 col-lg-4 alignCenter noPaddingLeftRight">
                                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 alignCenter colHeaderMobile noPaddingLeftRight">
								                                            <asp:Literal Text="<%$FrontEndResources:TRX01172,Account%>" runat="server"></asp:Literal>
							                                            </div>
                                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 alignCenter noPaddingLeftRight">
									                                        <img id="imgAccount" src="<%$ebFile:~/Content/currenttheme/images/{0}%>" alt="" runat="server" style="float:none"/>
                                                                        </div>
							                                        </div>

                                                                    <div runat="server" id="transactionsContainer" class="col-xs-3 col-sm-4 col-md-4 col-lg-4 alignCenter noPaddingLeftRight">
                                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 alignCenter colHeaderMobile noPaddingLeftRight">
								                                            <asp:Literal Text="<%$FrontEndResources:TRX01172,Transactions%>" runat="server"></asp:Literal>
							                                            </div>
                                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 alignCenter noPaddingLeftRight">
									                                        <img id="imgTransactions" src="<%$ebFile:~/Content/currenttheme/images/{0}%>" alt="" runat="server" style="float:none"/>
                                                                        </div>
							                                        </div>

                                                                    <div runat="server" id="balanceContainer" class="col-xs-3 col-sm-4 col-md-4 col-lg-4 alignCenter noPaddingLeftRight">
                                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 alignCenter colHeaderMobile noPaddingLeftRight">
								                                            <asp:Literal Text="<%$FrontEndResources:TRX01172,Balance%>" runat="server"></asp:Literal>
							                                            </div>
                                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 alignCenter noPaddingLeftRight">
									                                        <img id="imgBalance" src="<%$ebFile:~/Content/currenttheme/images/{0}%>" alt="" runat="server" style="float:none" />
                                                                        </div>
							                                        </div>
                                                                </div>
                                                                <!-- Consent Dates -->
                                                                <div id="divConsentDates" runat="server" class="col-xs-6 col-sm-3 col-md-3 col-lg-3 alignCenter gridRow paddingConsentDate">
							                                        <div runat="server" id="startDateContainer" class="col-xs-6 col-sm-6 col-md-6 col-lg-6 alignCenter noPaddingLeftRight">
                                                                        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 alignCenter colHeaderMobile noPaddingLeftRight">
								                                            <asp:Literal Text="<%$FrontEndResources:TRX01172,StartDate%>" runat="server"></asp:Literal>
							                                            </div> 
                                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 alignCenter noPaddingLeftRight ">
									                                        <asp:Literal ID="litStartDate" runat="server"></asp:Literal>
                                                                        </div>
							                                        </div>
                                                                                                    
                                                                    <div runat="server" id="endDateContainer" class="col-xs-6 col-sm-6 col-md-6 col-lg-6 alignCenter  noPaddingLeftRight">
                                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 alignCenter colHeaderMobile noPaddingLeftRight">
								                                            <asp:Literal Text="<%$FrontEndResources:TRX01172,EndDate%>" runat="server"></asp:Literal>
							                                            </div>
                                                                        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 alignCenter noPaddingLeftRight">
									                                        <asp:Literal ID="litEndDate" runat="server"></asp:Literal>
                                                                        </div>
							                                        </div>
                                                                </div>
					                                        </div>
		                                                </li>
	                                                </ItemTemplate>
	                                                <FooterTemplate>
			                                                </ul>
	                                                </FooterTemplate>
                                                </asp:Repeater>
                                            </li>
                                            <li>
                                                <div class="col-lg-12 col-max noPaddingLeftRight btDeleteContainer">
                                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 btDelete">
                                                        <asp:LinkButton ID="lnkBtDelete" CommandName="DeleteConsent" runat="server">
                                                            <asp:Label ID="lblBtDelete" Text="<%$FrontEndResources:TRX01172,DELETE%>" runat="server"></asp:Label>
                                                        </asp:LinkButton>
                                                    </div>
                                                </div>
                                            </li>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </ul>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </div>
                                <div class="clearBoth"></div>
                            </div>
                        </li>
                    </ItemTemplate>
                    <FooterTemplate>
                            </ul>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>
        </asp:Panel>
    </div>
</div>
