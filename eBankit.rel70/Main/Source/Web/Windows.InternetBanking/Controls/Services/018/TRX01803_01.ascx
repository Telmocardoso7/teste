<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01803_01.ascx.cs" Inherits="TRX01803_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<%@ Import Namespace="eBankit.Common" %>
<%@ Import Namespace="eBankit.Common.Extensions" %>


<div class="clearBoth"></div>


<div id="divContent" runat="server" class="transaction-content">
    <asp:Panel ID="pnControls" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" runat="server">
        <section class="grayContainer infoGrayContainer costumer-data-container" style="margin: 0;">
            <div class="col-lg-8 col-max info-top-message">
                <asp:Literal ID="litInfoTopText" runat="server" Text="<%$FrontEndResources:TRX01803,lblAddCGInfoTopText%>"></asp:Literal>
            </div>
        </section>
        <section>
            <asp:UpdatePanel runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <div class="col-xs-12 groups-and-accounts-counter" id="infoDivPendingCounterMessage" runat="server">
                        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                            <div class="pull-left pending-operation-literal accountGroupsCounter">
                                <asp:Literal runat="server" ID="litInfoCountMessage"></asp:Literal>
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </section>
        <asp:HiddenField ID="hdnIsAddOrEdition" runat="server" Value="false" />
        <asp:HiddenField ID="hdnBackToAddEdit" runat="server" Value="false" />

        <asp:Panel runat="server" ID="pnlMainPage">
            <div runat="server" id="divMainPage" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro bs-reduced-transaction  transp">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" style="padding-right: 0px">
                    <div class="input-group-search" runat="server" id="divSearchContainer">
                        <asp:TextBox runat="server" ID="searchGroup" class="form-control-box"></asp:TextBox>
                        <span class="input-group-addon" id="searchgrp"></span>
                        <span class="input-group-addon clear" id="cleargrp" tabindex="0" style="display: none"></span>

                    </div>
                    <div class="col-xs-12 emptySearchResult" runat="server" id="divEmptySearchResults">
                        <div class="lineContainer"></div>
                        <asp:Literal ID="litEmptyNoResults" runat="server" Text="<%$FrontEndResources:TRX01803,litEmptyNoResults%>"></asp:Literal>
                    </div>
                    <div class="marginTop20" id="divGroupsContainer" runat="server">
                        <div class="col-xs-12" id="divGroupsHeaders" runat="server">
                            <div class="col-xs-1"></div>
                            <div class="col-xs-3"></div>
                            <div class="col-xs-3 litShareHeader">
                                <asp:Literal ID="litShareHeader" runat="server" Text="<%$FrontEndResources:TRX01803,litShareHeader%>"></asp:Literal>
                                <asp:Label runat="server" ID="lblImgSharedHeader" class="img-info" TabIndex="0"
                                    ToolTip="<%$FrontEndResources:TRX01803,SharedHeaderTooltip%>"
                                    data-toggle="tooltip" data-placement="top" data-container="body" data-original-title=""></asp:Label>
                            </div>
                            <div class="col-xs-3 litVisibleHeader">
                                <asp:Literal ID="litVisibleHeader" runat="server" Text="<%$FrontEndResources:TRX01803,litVisibleHeader%>"></asp:Literal>
                                <asp:Label runat="server" ID="Label1" class="img-info" TabIndex="0"
                                    ToolTip="<%$FrontEndResources:TRX01803,VisibleHeaderTooltip%>"
                                    data-toggle="tooltip" data-placement="top" data-container="body" data-original-title=""></asp:Label>
                            </div>
                            <div class="col-xs-2"></div>
                        </div>
                        <div class="lineContainer" id="divLineContainerHeader" runat="server"></div>
                        <div class="clearBoth"></div>
                        <asp:UpdatePanel runat="server" UpdateMode="Always" ID="dragGroups" ClientIDMode="Static">
                            <ContentTemplate>
                                
                                <asp:HiddenField ID="hdnGroupNames" runat="server" />
                                <asp:HiddenField ID="hdnGroupNamesIDs" runat="server" />
                                <asp:HiddenField ID="hdnCurrentAccSelected" runat="server" />
                                <asp:Repeater ID="rptCorpGroups" runat="server" OnItemDataBound="rptCorpGroups_ItemDataBound">
                                    <ItemTemplate>
                                        <div>
                                            <div id="divGroup" runat="server" class="input-group accounts groups groupInfo" tabindex="0">

                                                <div class="col-xs-1 icons orderDiv">
                                                    <asp:Image ID="icoOrder" ImageUrl="<%$ebFile:~/Content/currenttheme/images/icon/Corporate/corp_action_order.png%>" runat="server" CssClass="imgGroup" TabIndex="0" />
                                                </div>

                                                <div class="col-xs-3 infoGroupName" runat="server" id="divInfoGroupName">
                                                    <asp:Literal ID="litGroupName" runat="server"></asp:Literal>
                                                </div>

                                                <div id="shareGroupContrainer" runat="server" class="col-xs-3 iconShare">
                                                    <label class="onoffswitch accountNumber">
                                                        <input id="ckbShare" runat="server" type="checkbox" class="onoffswitch-checkbox" value="1" />
                                                        <asp:Label ID="lblDescription" runat="server" class="onoffswitch-label">
                                                                        <span class="onoffswitch-inner"></span>
                                                                        <span class="onoffswitch-switch"></span>
                                                                        <span class="check marginRightHard"></span>
                                                                        <div class="onoffswitch-divOn"></div>
                                                                        <div class="onoffswitch-divOff"></div>
                                                        </asp:Label>
                                                    </label>
                                                </div>

                                                <div class="col-xs-3 iconVisible" id="groupVisibilityContainer" runat="server">
                                                    <label class="onoffswitch accountNumber">
                                                        <input id="ckbVisible" runat="server" type="checkbox" class="onoffswitch-checkbox" value="1" onchange="showSaveWarningMessage()" />
                                                        <asp:Label ID="lblDescriptionVisible" runat="server" class="onoffswitch-label">
                                                                        <span class="onoffswitch-inner"></span>
                                                                        <span class="onoffswitch-switch"></span>
                                                                        <span class="check marginRightHard"></span>
                                                                        <div class="onoffswitch-divOn"></div>
                                                                        <div class="onoffswitch-divOff"></div>
                                                        </asp:Label>
                                                    </label>
                                                </div>

                                                <div class="col-xs-2 icons buttonsContainer">
                                                    <div runat="server" id="divIcoEdit" class="col-xs-4">
                                                        <asp:Image ID="edit" ImageUrl="<%$ebFile:~/Content/currenttheme/images/icon/Corporate/ico_corp_action_edit.png%>" runat="server" CssClass="imgGroup" ToolTip="<%$FrontEndResources:TRX01803,Edit%>" TabIndex="0" />
                                                    </div>
                                                    <div runat="server" id="divIcoDelete" class="col-xs-4">
                                                        <asp:Image ID="delete" ImageUrl="<%$ebFile:~/Content/currenttheme/images/icon/Corporate/delete.png%>" runat="server" CssClass="imgGroup" ToolTip="<%$FrontEndResources:TRX01803,Delete%>" TabIndex="0" />
                                                    </div>
                                                    <div class="col-xs-4">
                                                        <asp:ImageButton ID="icoDown" ImageUrl="<%$ebFile:~/Content/currenttheme/images/icon/Corporate/action_expand.png%>" OnClick="icoDown_Click" OnClientClick="showHideTable_custom.call(this,event);" runat="server" CssClass="imgGroup icoDown" />
                                                        <asp:Image ID="icoUp" ImageUrl="<%$ebFile:~/Content/currenttheme/images/icon/Corporate/action_collapse.png%>" runat="server" CssClass="imgGroup icoUp hidden" />
                                                    </div>

                                                </div>


                                            </div>
                                            <%--<div id="divEdit" runat="server" class="input-group accounts groups edit hidden">
                                                <div class="col-xs-9">
                                                    <asp:TextBox runat="server" ID="editName" class="form-control-box editGroupNameBox"></asp:TextBox>
                                                </div>
                                                <div class="col-xs-1 icons">
                                                    <asp:Image ID="closeEdit" ImageUrl="<%$ebFile:~/Content/currenttheme/images/icon/action_close.png%>" runat="server" CssClass="imgGroup" />
                                                </div>
                                                <div class="col-xs-1 icons">
                                                    <asp:Image ID="approveEdit" ImageUrl="<%$ebFile:~/Content/currenttheme/images/icon/ico_approve_btn_corp.png%>" runat="server" CssClass="imgGroup" />
                                                </div>
                                            </div>--%>
                                            <div id="dropAccounts" class="input-group accounts dropAccounts" runat="server" style="display: none; margin: 0px; border: none">

                                                <asp:UpdatePanel runat="server" ID="groupAccounts" class="sort" UpdateMode="Conditional">
                                                    <Triggers>
                                                        <asp:AsyncPostBackTrigger ControlID="icoDown" EventName="Click" />
                                                    </Triggers>
                                                    <ContentTemplate>

                                                        <div>
                                                            <div id="divNoAccountsMessage" class="alert-accounts alert-warning-no-accounts fade in widthInherit" role="alert" aria-atomic="true" runat="server" style="display:none;">
                                                                <h4 class="alert-accounts-heading" id="divNoAccountsMessageH4" runat="server"></h4>
                                                                <div class="clearBoth"></div>
                                                            </div>
                                                        </div>

                                                        <asp:Repeater ID="rptGroupAccounts" runat="server" OnItemDataBound="rptGroupAccounts_ItemDataBound">
                                                            <ItemTemplate>
                                                                <div class="input-group accounts groupAcc" style="position: relative; top: auto; left: auto;" tabindex="0">
                                                                    <div class="col-xs-1 icons orderDivAccount" style="height: 80px;">
                                                                        <asp:Image ID="order" ImageUrl="<%$ebFile:~/Content/currenttheme/images/icon/Corporate/corp_action_order.png%>" runat="server" class="imgGroup orderAccount" AlternateText="<%$FrontEndResources:TRX01803,OrderButtonAltText%>" TabIndex="0" />
                                                                    </div>

                                                                    <div class="col-xs-5">
                                                                        <div class="col-12 accountDetailsCustomer">
                                                                            <asp:Label ID="accountCustomerName" runat="server">Customer</asp:Label>
                                                                        </div>
                                                                        <div class="col-12 accountDetailsName">
                                                                            <asp:Label ID="accountName" runat="server" CssClass="accountName"></asp:Label>
                                                                        </div>

                                                                    </div>
                                                                    <div class="col-xs-5 accountDetailsNumber">
                                                                        <asp:Label ID="accountNumber" runat="server" CssClass="accountNumber"></asp:Label>
                                                                    </div>

                                                                    <div class="accountOrder">
                                                                        <asp:HiddenField ID="accountOrder" runat="server" />
                                                                    </div>

                                                                </div>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </ContentTemplate>
                                                </asp:UpdatePanel>

                                                <div class="hdnGroupAccounts">
                                                    <asp:HiddenField ID="hdnGroupAccounts" runat="server" />
                                                </div>
                                            </div>
                                            <div class="groupOrder">
                                                <asp:HiddenField ID="groupOrder" runat="server" />
                                            </div>
                                            <asp:HiddenField ID="groupId" runat="server" />
                                            <asp:HiddenField ID="isOwnerGroup" runat="server" />

                                        </div>

                                    </ItemTemplate>
                                </asp:Repeater>
                            </ContentTemplate>
                        </asp:UpdatePanel>

                    </div>
                    <div class="clearBoth"></div>
                </div>
                <div class="clearBoth"></div>
                <div class="trs_buttons col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro transp">
                    <div class="trs_buttons-action">


                        <asp:LinkButton ID="btnSaveOrder" CssClass="noDisplay" runat="server" OnClick="btnSaveOrder_Click" AutoPostBack="false"></asp:LinkButton>
                        <asp:LinkButton ID="btnSaveOrderAccounts" CssClass="noDisplay" runat="server" OnClick="btnSaveOrderAccounts_Click"></asp:LinkButton>
                        <asp:LinkButton ID="btnSaveVisibility" CssClass="noDisplay" runat="server" OnClick="btnSaveVisibility_Click"></asp:LinkButton>
                        <asp:LinkButton ID="btnEditGroup" CssClass="noDisplay" runat="server" OnClick="btnEditGroup_Click"></asp:LinkButton>


                        <asp:LinkButton ID="btnAddNewGroup" runat="server" Text="<%$FrontEndResources:TRX01803,AddNewGroupBtn%>" CssClass="btn btn-default btnSaveAccountGroups" OnClick="btnAddNewGroup_Click"></asp:LinkButton>

                    </div>
                    <asp:HiddenField ID="hdnCGAccounts" runat="server" />
                    <asp:HiddenField ID="hdnGroupName" runat="server" />
                    <asp:HiddenField ID="hdnGroupId" runat="server" />
                    <asp:HiddenField ID="hdnSharedValue" runat="server" />
                    <asp:HiddenField ID="hdnGroupIdToShare" runat="server" />
                    <asp:HiddenField ID="hdnGroupsOrder" runat="server" />
                    <asp:HiddenField ID="hdnGroupsVisible" runat="server" />
                    <asp:HiddenField ID="hdnGroupsUnVisible" runat="server" />
                    <asp:HiddenField ID="hdnGroupsOwner" runat="server" />
                    <asp:HiddenField ID="hdnGroupsNotOwner" runat="server" />
                    <asp:HiddenField ID="hdnShowGroupArray" runat="server" />

                    <asp:HiddenField ID="hdnSelectedGroupOrderAccount" runat="server" />

                    <asp:Button ID="btnSearchGroups" class="noDisplay" runat="server" OnClick="btnSearchGroups_Click" />
                    <asp:Button ID="btnDeleteGroup" class="noDisplay" runat="server" OnClick="btnDeleteGroup_Click" />
                    <asp:Button ID="btnShareGroup" class="noDisplay" runat="server" OnClick="btnShareGroup_Click" />
                    <asp:Button ID="btnLoadGroupAccounts" class="noDisplay" runat="server" OnClick="btnLoadGroupAccounts_Click" />

                </div>


            </div>
        </asp:Panel>
        <!-- ADD OR EDIT  -->
        <div runat="server" id="divAddAndEditGroup">
            <div class="bs-reduced bs-head-metro title-grid col-max bs-reduced-transaction col-lg-8 col-max">
            <h3 class="head">
                <asp:Literal ID="LiteralGroupTitleContainer" Text="<%$FrontEndResources:TRX01803,litDataContainerGroupTxtBox%>" runat="server"></asp:Literal>
            </h3>
                </div>

            <it:FlowInnerContainer ID="flwContainerGrpNameEdition" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction groupNameContainer"  HideTitle="true" runat="server">
                <div>
                    <asp:Button ID="btnVerifyUserName" runat="server" CssClass="hidden" OnClick="btnVerifyUserName_Click" />
                    <asp:UpdatePanel ID="udpAvailableGroupName" UpdateMode="Always" runat="server">
                        <Triggers>
                            <asp:AsyncPostBackTrigger ControlID="btnVerifyUserName" EventName="Click" />
                        </Triggers>

                        <ContentTemplate>
                            <div class="textbox-available">
                                <span id="spnGroupNameActive" class="not-available-icon hidden" runat="server">
                                    <asp:Literal ID="txtGroupNameActive" Text="no" runat="server"></asp:Literal></span>
                                <it:TextBoxControl_v2 ID="txtBoxControlGrpName" ValidationRequiredMessage="<%$FrontEndResources:TRX01803,ValidateGroupName%>" IsRequired="true" Label="<%$FrontEndResources:TRX01803,lblGroupName%>" runat="server" />
                                <asp:HiddenField ID="hdnExistGroupName" runat="server" ClientIDMode="Static" />
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </div>
            </it:FlowInnerContainer>
            <div class="clearBoth"></div>
            <section class="account-groups-details">
                <div class="ebankit-accordion-list" id="divListAccounts" runat="server">
                    <asp:UpdatePanel runat="server" ID="upTransactions" UpdateMode="Always" ClientIDMode="Static" class="ebankit-accordion-list col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro muc-no-border-top">
                        <ContentTemplate>
                            <div class="bs-reduced bs-head-metro title-grid">
                                <h3 class="head">
                                    <asp:Literal ID="litAccountsListTitle" Text="<%$FrontEndResources:TRX01803,AccountsListTitle%>" runat="server"></asp:Literal>
                                </h3>
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced metro text-brand-terciary infoTopText">
                                <asp:Literal ID="litAddAccountsV2Info" Text="<%$FrontEndResources:TRX01803,AccountsListSubtitle%>" runat="server"></asp:Literal>
                            </div>

                            <div runat="server" id="divContainerAccounts" class="grid-accounts-items grid-no-pagination ">
                                <table class="table hovered table-resp-to1199 noarrow  no-margin ebankit-accordion-list">
                                    <asp:Repeater runat="server" ID="rptAcountsGroups" OnItemDataBound="rptAcountsGroups_ItemDataBound">
                                        <HeaderTemplate>
                                            <tbody>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr class="panel-heading">
                                                <td class="col-xs-1">
                                                    <div class="cbcontainer ">
                                                        <asp:CheckBox ID="chkAllSelectActive" runat="server" />
                                                        <div class="checkmark select-all custom-muc-chk" data-toggle="tooltip" data-placement="bottom" data-container="body"></div>
                                                        <asp:Label ID="lblActive" runat="server" Text="<%$FrontEndResources:TRX01803,AccountNameHeader%>" CssClass="lblContractResponsive marginRight10" />
                                                        <asp:HiddenField ID="hdnEntityIsEdited" runat="server" Value="False" />
                                                    </div>

                                                </td>
                                                <td>
                                                    <asp:Label ID="lblEntityName" runat="server"></asp:Label>
                                                    <asp:Label ID="lblEntityId" runat="server" Visible="false"></asp:Label>
                                                </td>
                                                <td class="detail-group-head " style="width: 60px;">
                                                    <div class="step-accountGroups-actions" style="position: inherit !important">
                                                        <asp:ImageButton ID="icoDownAddEdit" ImageUrl="<%$ebFile:~/Content/currenttheme/images/icon/Corporate/action_expand.png%>" OnClick="icoDownAddEdit_Click" OnClientClick="showHideEntities_custom.call(this,event);" runat="server" CssClass="imgGroup icoDown" />
                                                        <asp:Image ID="icoUpAddEdit" ImageUrl="<%$ebFile:~/Content/currenttheme/images/icon/Corporate/action_collapse.png%>" runat="server" CssClass="imgGroup icoUp hidden" />
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr class="separator">
                                              
                                            </tr> 
                                            <asp:UpdatePanel runat="server" ID="updPanelAccounts" UpdateMode="Conditional">
                                                <Triggers>
                                                    <asp:AsyncPostBackTrigger ControlID="icoDownAddEdit" EventName="Click" />
                                                </Triggers>
                                                <ContentTemplate>
                                                    <div id="pnCorporateGroupsAccounts" runat="server" class="pnCorporateGroupsAccounts-container">
                                                        <tr id="listaccounts-<%# Eval("EntityId") %>" style="width: 100%; display: none; margin: 0px; border: none">
                                                            <td class="container" colspan="3" style="border:none;padding-top:0px !important">
                                                                <div class="input-account-search" id="divAccountSearch" runat="server">
                                                                    <asp:TextBox runat="server" ID="searchAccount" class="form-control-box" onKeyUp="searchAccountOnGroup(this)"></asp:TextBox>
                                                                    <span class="input-account-addon input-group-addon" id="searchacc"></span>
                                                                    <span class="input-account-addon input-group-addon clear" id="clearacc" onclick="clearSearch(this)" onkeypress="clearSearchKeyboard(this)" tabindex="0" style="display: none"></span>
                                                                </div>                                                                
                                                                <div class="container-accounts" id="group-<%# Eval("Name") %>">
                                                                    <!-- Accounts -->
                                                                    <asp:Repeater runat="server" ID="rptAccount" OnItemDataBound="rptAccount_ItemDataBound">
                                                                        <HeaderTemplate>
                                                                            <table class="table hovered table-resp-to1199 noarrow  no-margin ebankit-accordion-list">
                                                                                <thead>
                                                                                    <tr class="table-header">
                                                                                        <th class="formatTableData padding8Important visible-md visible-lg visible-sm col-xs-1 text-brand-terciary"></th>
                                                                                        <th class="formatTableData padding8Important visible-md visible-lg visible-sm text-brand-terciary">

                                                                                            <asp:Label runat="server" CssClass="lblSubtitleAccountsGrid" Text="<%$FrontEndResources:TRX01803,AccountNameHeader%>"></asp:Label>

                                                                                        </th>
                                                                                        <th class="formatTableData padding8Important visible-md visible-lg visible-sm text-brand-terciary">

                                                                                            <asp:Label runat="server" CssClass="lblSubtitleAccountsGrid" Text="<%$FrontEndResources:TRX01803,AccountNumberHeader%>"></asp:Label>

                                                                                        </th>
                                                                                    </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <tr class="account-wrapper infoAccount item">
                                                                                <td class="col-xs-1">
                                                                                    <div class="cbcontainer">
                                                                                        <asp:CheckBox ID="chkSelectActive" runat="server" />
                                                                                        <div class="checkmark single custom-muc-chk"></div>
                                                                                    </div>
                                                                                </td>
                                                                                <td class="col-xs-5 accName" style="text-align: left;">
                                                                                    <asp:Label runat="server" ID="lblAccountName" CssClass="accountName"></asp:Label>
                                                                                </td>
                                                                                <td class="col-xs-5" style="text-align: left;">
                                                                                    <asp:Label runat="server" ID="lblAccountNumber" CssClass="accountNumber"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </ItemTemplate>
                                                                        <FooterTemplate>
                                                                            </tbody>
                                                                </table>
                                                                        </FooterTemplate>
                                                                    </asp:Repeater>
                                                                </div>
                                                                <div class="accounts-empty-search-results col-xs-12 emptySearchResult">
                                                                    <div class="lineContainer"></div>
                                                                    <asp:Literal ID="litEmptyNoResultsAddEdit" runat="server" Text="<%$FrontEndResources:TRX01803,litEmptyNoResults%>"></asp:Literal>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </div>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </tbody>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </table>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </section>

            <div class="trs_buttons col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro transp">
                <div class="trs_buttons-action">
                    <asp:LinkButton ID="btnCancelAddEdit" runat="server" Text="<%$FrontEndResources:TRX01803,btnCancelChanges%>" CssClass="btn btn-default"></asp:LinkButton>
                    <asp:LinkButton ID="btnSaveAddEdit" runat="server" Text="<%$FrontEndResources:TRX01803,btnSaveChanges%>" CssClass="btn btn-primary btnSaveAccountGroups" OnClientClick="return saveAccounts();return false;" OnClick="btnSaveAddEdit_Click"></asp:LinkButton>
                </div>
                <asp:Button ID="hdnBtnCancelChanges" Style="display: none;" runat="server" OnClick="hdnBtnCancelChanges_Click" />
            </div>
            <asp:HiddenField ID="hdnListGroupAccounts" runat="server" />
            <asp:HiddenField ID="hdnAccountsActive" runat="server" />
            <asp:HiddenField ID="hdnCheckAllSelectedAccounts" runat="server" />
            <asp:HiddenField ID="hdnAccountsExpand" runat="server" />
            <asp:HiddenField ID="hdnEntitiesInitCheck" runat="server" />


        </div>
    </asp:Panel>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01803-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    <script type="text/javascript">
        var idg = '<%=this.CurrentContext.SessionGUID %>';
        var interactionid = '<%=this.CurrentContext.InteractionContext.Interaction.InteractionId %>';
    </script>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/Services/Transactions/TRX01803-1.0.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <script type="text/javascript">
        var textForExpand = '<%= this.translateExpand %>';
        var textForCollapse = '<%= this.translateCollapse %>';
        var textForRequeiredGroupName = '<%= this.translateRequiredGroupName %>';
        var textForGroupNameExists = '<%= this.translateGroupNameExists %>';
        var groupName = document.getElementById('<%= hdnGroupName.ClientID %>');
        var searchGroup = $('#<%=searchGroup.ClientID%>');

        var hdnGroupNames = $('#<%=hdnGroupNames.ClientID%>');
        var hdnGroupNamesIDs = $('#<%=hdnGroupNamesIDs.ClientID%>');
        var hdnCurrentAccSelected = $('#<%=hdnCurrentAccSelected.ClientID%>');
        var hdnSharedValue = $('#<%=hdnSharedValue.ClientID%>');
        var hdnGroupIdToShare = $('#<%=hdnGroupIdToShare.ClientID%>');
        var hdnGroupId = $('#<%=hdnGroupId.ClientID%>');
        var hdnGroupsOrder = $('#<%=hdnGroupsOrder.ClientID%>');
        var hdnGroupsVisible = $('#<%=hdnGroupsVisible.ClientID%>');
        var hdnGroupsUnVisible = $('#<%=hdnGroupsUnVisible.ClientID%>');
        var hdnGroupsOwner = $('#<%=hdnGroupsOwner.ClientID%>');
        var FlagCorporateGroupKeepEntitiesOpen = '<%= this.CorporateGroupKeepEntitiesOpen %>';
        var hdnGroupsNotOwner = $('#<%=hdnGroupsNotOwner.ClientID%>');



        Sys.Application.add_load(keyboarGroupSortable);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(keyboarGroupSortable);

        Sys.Application.add_load(fnSortSortable);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(fnSortSortable);





        $(document).ready(function () {
            $('[id$=divEmptySearchResults]').hide();
            showHideNotOwnerButtonsAccount();
            searchGroup.keyup();
            //searchAccounts.keyup();
            var duplicated = false;
            $(".accountDrop").draggable({
                connectToSortable: ".dropAccounts",
                helper: "clone",
                hoverClass: 'highlight',
                cursor: 'move'
            });

            $('.accountDrop').each(function () {
                keyboardDragDropEvent(this);
            })

            $('.divInheritGroupName').each(function () {
                if (this.offsetWidth < this.scrollWidth) {
                    $(this).attr('title', this.textContent.trim());
                }
            });


            $('.infoGroupName').each(function () {
                if (this.offsetWidth < this.scrollWidth) {
                    $(this).attr('title', this.textContent.trim());
                }
            });

            $(".ui-sortable-handle").droppable({
                accept: ".accountDrop",
                tolerance: 'pointer',
                greedy: true,
                hoverClass: 'highlight',
                drop: function (ev, ui) {



                    var isOwnerElem = $(this).find('.dropAccounts').siblings('input').eq(1);
                    if ($(isOwnerElem).length > 0) {
                        var isOwner = $(isOwnerElem).val().toLocaleLowerCase() == "true" ? true : false;
                    }

                    var groupToFocus = $(this).children('.groupInfo').focus();

                    if ($(this).children().find('.accountDetailsNumber').length > 0) {
                        eBankit.Presentation.RemoveValidateMsg($(this).children('.groupInfo'));
                        for (i = 0; i < $(this).children().find('.accountDetailsNumber').length; i++) {
                            var line = $(this).children().find('.accountDetailsNumber')[i];
                            if ($(line).text().trim() == $(ui.draggable).find(".accountDetailsNumber").text().trim()) {
                                duplicated = true;
                                break;
                            }
                            duplicated = false;
                        }
                        if (!duplicated && isOwner) {
                            $(ui.draggable).children().eq(0).removeClass('col-xs-9');
                            $(ui.draggable).children().eq(0).addClass('col-xs-7');
                            $(ui.draggable).children().eq(2).addClass('orderDivAccount');
                            var teste = $(ui.draggable).clone(true).off().detach().removeClass('accountDrop ui-draggable ui-draggable-handle').addClass('groupAcc ui-sortable-handle ui-ui-droppable').css({
                                position: 'relative',
                                top: 'auto',
                                left: 'auto'
                            }).appendTo($(this).find(".sort")).find(".icons").toggleClass("hidden").siblings(".accountOrder").children().val($(this).find(".accountDrop").length - 1);

                            $(groupToFocus).focus();

                            if ($(groupToFocus).siblings('.dropAccounts').css('display') == 'none') {
                                $(groupToFocus).siblings('.dropAccounts').slideDown();
                                $(groupToFocus).children().eq(0).children().eq(0).toggleClass('hidden');
                                $(groupToFocus).children().eq(0).children().eq(1).toggleClass('hidden');
                            }
                            duplicated = false;
                        }
                    }
                    else {
                        if (isOwner) {
                            $(ui.draggable).children().eq(0).removeClass('col-xs-9');
                            $(ui.draggable).children().eq(0).addClass('col-xs-7');
                            $(ui.draggable).children().eq(2).addClass('orderDivAccount');
                            $(ui.draggable).clone(true).detach().removeClass('accountDrop ui-draggable ui-draggable-handle').addClass('groupAcc ui-sortable-handle ui-ui-droppable').off().css({
                                position: 'relative',
                                top: 'auto',
                                left: 'auto'
                            }).appendTo($(this).find(".sort")).find(".icons").toggleClass("hidden").siblings(".accountOrder").children().val($(this).find(".accountDrop").length - 1);


                            $(groupToFocus).focus();

                            if ($(groupToFocus).siblings('.dropAccounts').css('display') == 'none') {
                                $(groupToFocus).siblings('.dropAccounts').slideDown();
                                $(groupToFocus).children().eq(0).children().eq(0).toggleClass('hidden');
                                $(groupToFocus).children().eq(0).children().eq(1).toggleClass('hidden');
                            }
                            $('[id$=infoDivUnsavedChangesMessage]').removeClass("hidden");


                        }
                    }
                }
            });
        });

        function ShareGroup(checkBoxID, hdnShareID, btnShareID) {

            if (event.keyCode == "13") {
                event.preventDefault();
            } else if (event.keyCode == "32") {
                event.preventDefault();
            } else {
                $(hdnSharedValue).val($(checkBoxID).is(":checked"));
                $(hdnGroupId).val($(checkBoxID).val());
                $(btnShareID).click();
            }

        }
        function showAdd() {
            $("#addGroup").show();
            $("#addGroup").find('input').focus();

        }



        function showAddGroupKey(evt) {
            if (evt.keyCode == "13") {
                showAdd();

            } else if (evt.keyCode == "32") {
                evt.preventDefault();
            }
        }

        function closeAddKey() {
            if (event.keyCode == "13") {
                $("#groupName").val("");
                $("#addGroup").hide();
            } else if (event.keyCode == "32") {
                event.preventDefault();
            }
        }

        function closeAdd() {
            $("#groupName").val("");
            $("#addGroup").hide();
            event.preventDefault();

        }


        function deleteGroupKeyPress(btnDeleteGroupIID) {
            if (event.keyCode == "13") {
                $(btnDeleteGroupIID).click();
            } else if (event.keyCode == "32") {
                event.preventDefault();
            }
        }

        function showHideEditKeyPress(groupId) {
            if (event.keyCode == "13") {
                editGroupEvent(groupId);
            } else if (event.keyCode == "32") {
                event.preventDefault();
            }
        }

        function showHideKeypress(dropAccountsID, iconDownID, iconUpID) {
            if (event.keyCode == "13") {
                $(iconUpID).focus();
                $(iconUpID).attr('tabindex', '0');
                $(iconDownID).trigger('click');
            } else if (event.keyCode == "32") {
                event.preventDefault();
            }
        }

        //function approveEditKeypress(btnApproveEditGroupID) {
        //    if (event.keyCode == "13") {
        //        $(btnApproveEditGroupID).click();

        //    } else if (event.keyCode == "32") {
        //        event.preventDefault();
        //    }
        //}



        searchGroup.on("keyup", function () {

            if (searchGroup.val().length < 1) {
                $('#searchgrp').show();
                $('#cleargrp').hide();
            } else {
                $('#searchgrp').hide();
                $('#cleargrp').show();
                $('#cleargrp').attr('title', top.eBankit.Presentation.GetResource("clearIconTooltip"));
            }
            if (searchGroup.val().length < 3) {
                $('.groupInfo').each(function () {

                    $(this).parent().show();

                });
            }

            if (searchGroup.val().length >= 3) {
                var countFound = 0;
                $('.groupInfo').each(function () {
                    var grpName = '';
                    if ($(this).siblings('input').eq(1).val().toLocaleLowerCase() === 'false') {
                        grpName = $(this).find('.divInheritGroupName').html().trim();
                    } else {
                        grpName = $(this).find(".infoGroupName").html().trim();
                    }



                    if (grpName.toLocaleLowerCase().indexOf(searchGroup.val().toLocaleLowerCase()) >= 0) {
                        $(this).parent().show();
                        countFound++;
                    }
                    else {
                        $(this).parent().hide();
                    }
                });

                if (countFound > 0) {
                    $('[id$=divEmptySearchResults]').hide();
                    $('[id$=divGroupsContainer]').show();

                } else {
                    $('[id$=divGroupsContainer]').hide();
                    $('[id$=divEmptySearchResults]').show();
                }
            } else {
                $('[id$=divGroupsContainer]').show();
                $('[id$=divEmptySearchResults]').hide();
            }
        });

        $('#cleargrp').on("click", function () {

            searchGroup.val("");
            searchGroup.keyup();
            $('#searchgrp').show();
            $('#cleargrp').hide();

        });

        $('#cleargrp').on("keypress", function (evt) {
            if (evt.keyCode == '13') {
                searchGroup.val("");
                searchGroup.keyup();
                $('#searchgrp').show();
                $('#cleargrp').hide();
                evt.preventDefault();
            } else if (event.keyCode == "32") {
                event.preventDefault();
            }
        });

        /*

        searchAccounts.on("keyup", function () {
            if (searchAccounts.val().length == 0) {
                $('.accountDrop').each(function () {
                    $(this).show();

                });
                $('#searchacc').show();
                $('#clearacc').hide();
            }
            else {
                $('#searchacc').hide();
                $('#clearacc').show();
                $('#clearacc').attr('title', top.eBankit.Presentation.GetResource("clearIconTooltip"));
            }
            if (searchAccounts.val().length >= 3) {
                $('.accountDrop').each(function () {
                    var accountName = $(this).find(".accountName").html();
                    var accountNumber = $(this).find(".accountNumber").html();

                    if (accountName.toLocaleLowerCase().indexOf(searchAccounts.val().toLocaleLowerCase()) >= 0 || accountNumber.indexOf(searchAccounts.val()) >= 0) {
                        $(this).show();
                    }
                    else {
                        $(this).hide();
                    }
                });
            }



        });*/

        $('#clearacc').on("click", function () {
            //searchAccounts.val("");
            //searchAccounts.keyup();
            $('#searchacc').show();
            $('#clearacc').hide();
        });

        $('#clearacc').keypress(function (evt) {
            if (evt.keyCode == "13") {
                //searchAccounts.val("");
                //searchAccounts.keyup();
                $('#searchacc').show();
                $('#clearacc').hide();
                event.preventDefault();
            } else if (event.keyCode == "32") {
                event.preventDefault();
            }
        });

        $("#dragGroups").sortable({
            stop: function (event, ui) {
                var $items = $(ui.item).parent().children().find(".groupOrder").children();
                $items.each(function (index) {
                    $(this).val(index)
                });
                $('[id$=infoDivUnsavedChangesMessage]').removeClass("hidden");

                submitOrderChanges(1);
            }
        });



        function fnSortSortable() {
            $(".sort").sortable({
                stop: function (event, ui) {

                    var $items = $(ui.item).parent().children().find(".accountOrder").children();
                    $items.each(function (index) {
                        $(this).val(index)
                    });
                    $('[id$=infoDivUnsavedChangesMessage]').removeClass("hidden");

                    var grpID = $(ui.item).parents(5).siblings('[id*=groupId]').val();

                    submitAccountOrderChanges(grpID);
                }
            });
        }



        function keyboarGroupSortable() {
            $("#dragGroups .orderDiv").keydown(function (e) {

                if (e.keyCode == 40) { /* Focus Down */
                    $(this).parent().parent().insertAfter($(this).parent().parent().next());
                    submitOrderChanges(1);

                } else if (e.keyCode == 38) { /* Focus Up */
                    $(this).parent().parent().insertBefore($(this).parent().parent().prev());
                    submitOrderChanges(1);
                }

                $(this).children().focus();


            });
        };

        function keyboarAccountsSortable(elem) {

            if (event.keyCode == 40) {
                /* Focus Down */
                $(elem).parent().parent('.groupAcc').insertAfter($(elem).parent().parent('.groupAcc').next());
                var grpID = $(elem).parents(5).siblings('[id*=groupId]').val();
                $(elem).focus();
                submitAccountOrderChanges(grpID);

            } else if (event.keyCode == 38) {
                /* Focus Up */
                $(elem).parent().parent('.groupAcc').insertBefore($(elem).parent().parent('.groupAcc').prev());
                var grpID = $(elem).parents(5).siblings('[id*=groupId]').val();
                $(elem).focus();
                submitAccountOrderChanges(grpID);
            }


        };

        function showHideNotOwnerButtonsAccount() {
            $(".deleteAccount").each(function () {
                var deleteValue = $(this).parent().parent().parent().parent().siblings('input').eq(1).val();
                if (deleteValue === 'false') {
                    $(this).hide();
                }

            });

            $(".orderDivAccount").each(function () {
                var isOwnerValue = $(this).parent().parent().parent().siblings('input').eq(1).val();
                if (isOwnerValue === 'false') {
                    $(this).css("visibility", "hidden");;
                    $(this).parent().parent().sortable("disable")
                }
            });

        }


        $(".deleteAccount").on("click", function () {
            $(this).parents(".groupAcc").remove();
            $('[id$=infoDivUnsavedChangesMessage]').removeClass("hidden");
        });

        $(".deleteAccount").on("keypress", function () {
            if (event.keyCode == "13") {
                $(this).parents(".groupAcc").remove();
                $('[id$=infoDivUnsavedChangesMessage]').removeClass("hidden");

            } else if (event.keyCode == "32") {
                event.preventDefault();
            }

        });


        function submitOrderChanges(sourceType) {
            var groups = $('#dragGroups').find('.groupInfo');
            var itemsOrderGroups = [];
            var itemsOwnerArray = [];

            $(groups).each(function () {
                itemsOrderGroups.push($(this).siblings('input').first().val());
            });

            hdnGroupsOrder.val(itemsOrderGroups.join(";"));

            var itemsVisibleGroups = [];
            var itemsUnVisibleGroups = [];

            $('.iconVisible input').each(function () {
                if ($(this).is(':checked')) {
                    itemsVisibleGroups.push($(this).attr('value'));
                }
                else {
                    itemsUnVisibleGroups.push($(this).attr('value'));
                }
                if (hdnGroupsVisible) {
                    hdnGroupsVisible.val(itemsVisibleGroups.join(";"));
                }
                if (hdnGroupsUnVisible) {
                    hdnGroupsUnVisible.val(itemsUnVisibleGroups.join(";"));
                }
            });



            if (sourceType == 1) {
                __doPostBack('<%= btnSaveOrder.UniqueID %>', '');

            }
            else {
                __doPostBack('<%= btnSaveVisibility.UniqueID %>', '');
            }
        }

        function submitAccountOrderChanges(grpId) {
            $(".dropAccounts").each(function () {
                var items = new Array();
                $.map($(this).find(".groupAcc"), function (el) {
                    var accountName = $(el).find(".accountName").html();
                    var accountNumber = $(el).find(".accountNumber").html();
                    var accountOrder = $(el).find(".accountOrder").children().val();
                    items.push(accountName + "," + accountNumber + "," + accountOrder);
                });
                var hdnGroupAccounts = $(this).find(".hdnGroupAccounts").children();
                $(hdnGroupAccounts).val(items.join(";"));
            });
            var hdnSelectedGroupOrderAccount = $('#<%=hdnSelectedGroupOrderAccount.ClientID%>');

            hdnSelectedGroupOrderAccount.val(grpId);

            __doPostBack('<%= btnSaveOrderAccounts.UniqueID %>', '');
        }


        function submitChanges() {
            $(".dropAccounts").each(function () {
                var items = new Array();
                $.map($(this).find(".groupAcc"), function (el) {
                    var accountName = $(el).find(".accountName").html();
                    var accountNumber = $(el).find(".accountNumber").html();
                    var accountOrder = $(el).find(".accountOrder").children().val();
                    items.push(accountName + "," + accountNumber + "," + accountOrder);
                });
                var hdnGroupAccounts = $(this).find(".hdnGroupAccounts").children();
                $(hdnGroupAccounts).val(items.join(";"));
            });
            var groups = $('#dragGroups').find('.groupInfo');
            var itemsOrderGroups = [];
            var itemsOwnerArray = [];
            $(groups).each(function () {
                itemsOrderGroups.push($(this).siblings('input').first().val());

                if ($(this).siblings('input').eq(1).val().toLocaleLowerCase() === 'true') {
                    itemsOwnerArray.push($(this).siblings('input').first().val());
                }
            });
            hdnGroupsOrder.val(itemsOrderGroups.join(";"));
            hdnGroupsOwner.val(itemsOwnerArray.join(";"))

            var itemsVisibleGroups = [];
            var itemsUnVisibleGroups = [];

            $('.iconVisible input').each(function () {
                if ($(this).is(':checked')) {
                    itemsVisibleGroups.push($(this).attr('value'));
                }
                else {
                    itemsUnVisibleGroups.push($(this).attr('value'));
                }
                if (hdnGroupsVisible) {
                    hdnGroupsVisible.val(itemsVisibleGroups.join(";"));
                }
                if (hdnGroupsUnVisible) {
                    hdnGroupsUnVisible.val(itemsUnVisibleGroups.join(";"));
                }
            });


        }

        function saveAccounts() {
            var hdnExistsVal = $('#hdnExistGroupName').val();

            var elem = $('input[id*="_txtBoxControlGrpName_"]');
            if ($(elem).val().trim() != '' && (hdnExistsVal.toLowerCase() == 'true' || hdnExistsVal == '')) {
                var items = new Array();
                $('.account-wrapper [id^="MainContent_TransactionMainContent_txpTransactions_ctl01_rptAcountsGroups_rptAccount_"]:checked').each(function () {
                    $.map($(this).closest('tr'), function (el) {
                        var accountName = $(el).find(".accountName").html();
                        var accountNumber = $(el).find(".accountNumber").html();
                        items.push(accountName + "," + accountNumber);
                    });
                });
                var hdnListGroupAccounts = $('#MainContent_TransactionMainContent_txpTransactions_ctl01_hdnListGroupAccounts');
                $(hdnListGroupAccounts).val(items.join(";"));

                var items2 = new Array();
                $('.account-wrapper [id^="MainContent_TransactionMainContent_txpTransactions_ctl01_rptAcountsGroups_rptAccount_"]').each(function () {
                    $.map($(this).closest('tr'), function (el) {
                        var accountNumber = $(el).find(".accountNumber").html();
                        items2.push(accountNumber);
                    });
                });
                var hdnAccountsExpand = $('#MainContent_TransactionMainContent_txpTransactions_ctl01_hdnAccountsExpand');
                $(hdnAccountsExpand).val(items2.join(";"));

                return true;
            } else {
                if (hdnExistsVal.toLowerCase() == 'false') {
                    eBankit.Presentation.InsertValidateMsg_V2(elem, textForGroupNameExists);
                    return false;
                } else if ($(elem).val().trim() == '') {
                    eBankit.Presentation.InsertValidateMsg_V2(elem, textForRequeiredGroupName);
                    return false;
                }


            }
        }

        function VerifyGroupName() {

            var hdnExistsVal = $('#hdnExistGroupName').val();

            var elem = $('input[id*="_txtBoxControlGrpName_"]');

            var btnSave = $('[id*="_btnSaveAddEdit"]');
            if (hdnExistsVal.toLowerCase() == 'true' || hdnExistsVal == '') {
                $(btnSave).removeAttr('disabled');
                return true;
            } else {
                if (hdnExistsVal.toLowerCase() == 'false') {
                    eBankit.Presentation.InsertValidateMsg_V2(elem, textForGroupNameExists);
                    $(btnSave).attr('disabled', 'disabled');

                    return false;
                } else if ($(elem).val().trim() == '') {
                    eBankit.Presentation.InsertValidateMsg_V2(elem, textForRequeiredGroupName);
                    $(btnSave).attr('disabled', 'disabled');
                    return false;
                }
            }
        }

        function CancelChanges() {
            var hdnBackToAddEdit = $('[id$=hdnBackToAddEdit]');
            var hdnIsAddOrEdition = $('[id$=hdnIsAddOrEdition]');
            var hdnGroupId = $('[id$=hdnGroupId]');
            hdnBackToAddEdit.val("true");
            hdnIsAddOrEdition.val("false");
            hdnGroupId.val("");

            __doPostBack('<%= hdnBtnCancelChanges.UniqueID %>', '');
        }

        function showSaveWarningMessage() {
            $('[id$=infoDivUnsavedChangesMessage]').removeClass("hidden");
        }

        function editGroupEvent(groupdId) {
            __doPostBack('<%= btnEditGroup.UniqueID %>', groupdId);
        }



        function showHideTable_custom(event) {

            var id = $(this).data('id');


            if (GroupNotInArray(id))
                return true;

            event.preventDefault();

            var element = this;

            $('.icoUp').each(function () {
                var icoD = $(this).siblings('.icoDown');

                if ($(icoD).hasClass('hidden') && icoD.attr('id') != $(element).attr('id')) {
                    $(icoD).removeClass('hidden');
                    $(this).addClass('hidden');
                    $(icoD).parent().parent().parent().siblings('.dropAccounts').slideToggle();
                } else {
                    $(this).attr('tabindex', '0');
                }
            })


            return false;
        }


        function GroupNotInArray(obj) {
            var IDs = new Array;

            var hdnShowGroupArray = $('#<%=hdnShowGroupArray.ClientID%>').val();

            if (hdnShowGroupArray.length > 0) {
                IDs = hdnShowGroupArray.split(';');

                if (IDs.indexOf('' + obj) != -1) {
                    return false;
                }

                hdnShowGroupArray += ";" + obj;
                $('#<%=hdnShowGroupArray.ClientID%>').val(hdnShowGroupArray);
                return true;
            }
            else {
                $('#<%=hdnShowGroupArray.ClientID%>').val(obj)
                return true;
            }
            return false;
        }


        var IDsCustomer = new Array;
        var IdsKeepOpen = new Array();

        function showHideEntities_custom(event) {

            var id = $(this).data('id');

            if (!include(IdsKeepOpen, id)) {
                IdsKeepOpen.push(id);
            }

            if (!include(IDsCustomer, id)) {
                IDsCustomer.push(id);
                return true;
            }


            event.preventDefault();

            var element = this;

            if (FlagCorporateGroupKeepEntitiesOpen.toLocaleLowerCase() == 'false') {

                $('[id*="_icoUpAddEdit"]').each(function () {

                    var icoD = $(this).siblings('.icoDown');

                    if ($(icoD).hasClass('hidden') && icoD.attr('id') != $(element).attr('id')) {
                        $(icoD).removeClass('hidden');
                        $(this).addClass('hidden');

                        $(icoD).parent().parent().parent().siblings('#listaccounts-' + $(icoD).data('id')).slideToggle();
                    } else {
                        $(this).attr('tabindex', '0');
                    }
                })
            }
            return false;


        }

        function include(arr, obj) {
            return (arr.indexOf(obj) != -1);
        }


    </script>



</div>


