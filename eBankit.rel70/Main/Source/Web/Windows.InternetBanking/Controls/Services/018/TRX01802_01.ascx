<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01802_01.ascx.cs" Inherits="TRX01802_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<%@ Import Namespace="eBankit.Common" %>
<%@ Import Namespace="eBankit.Common.Extensions" %>

<div id="divCorpGroupsResponsiveMessage" class="col-lg-12 col-left col-transaction setPaddingTop-25 responsiveOnly" runat="server">
    <div id="updPanel">

        <section class="grayContainer content-message metro  ">
            <div class="col-lg-8 col-max">
                <div id="divMessage" class="alert alert-warning_v3 fade in  col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max" role="alert" aria-atomic="true">
                    <div class="div-icon-warning_v3">
                        <i class="icon-warning"></i>

                    </div>
                    <h4 class="alert-heading" runat="server" id="responsiveNotAvailableMessage"></h4>
                    <div class="clearBoth"></div>

                </div>

            </div>

        </section>
    </div>
</div>
<div class="clearBoth"></div>
<div runat="server" class="transaction-content pending-oper pending-corp marginBottom10 onlyDesktop">
    <div class="grayContainer bottomBorderInfoTopMessage AccountsGroupMessage" runat="server" id="divInfoMessageContainer">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
            <asp:Literal ID="pendOperationMsg" runat="server" Text="<%$FrontEndResources:TRX01802,litInfoMessage%>"></asp:Literal>
        </div>
    </div>
    <asp:UpdatePanel runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div class="col-xs-12 pending-operation-message" id="infoDivPendingCounterMessage" runat="server">
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                    <div class="pull-left pending-operation-literal accountGroupsCounter">
                        <asp:Literal runat="server" ID="litInfoCountMessage"></asp:Literal>
                    </div>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="col-xs-12 pending-operation-message hidden" id="infoDivUnsavedChangesMessage" runat="server">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
            <div class="pull-left pending-operation-literal accountGroupsCounter messageInfo">
                <asp:Literal runat="server" ID="litInfoUnsavedMessage" Text="<%$FrontEndResources:TRX01802,litInfoUnsavedMessage%>"></asp:Literal>
            </div>
        </div>
    </div>
    <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max" runat="server" id="divAccountsAndGroupsContainer">
        <div class="col-xs-5 col-sm-5 col-md-5 col-lg-5" style="padding-left: 0px;">
            <div class="col-xs-12 titleAccountGroups">
                <h4>
                    <asp:Literal runat="server" Text="<%$FrontEndResources:TRX01802,accountsTitle%>"></asp:Literal>
                </h4>
            </div>
            <div class="col-xs-12 infoAccountGroups">
                <asp:Literal ID="Literal1" runat="server" Text="<%$FrontEndResources:TRX01802,litInfoAccounts%>"></asp:Literal>
            </div>
            <div class="input-group-search">
                <asp:TextBox runat="server" ID="searchAccount" class="form-control-box"></asp:TextBox>
                <span class="input-group-addon" id="searchacc"></span>
                <span class="input-group-addon clear" id="clearacc" tabindex="0" style="display: none"></span>
            </div>
            <div class="overflowHidden">
                <asp:UpdatePanel runat="server" UpdateMode="Always">
                    <ContentTemplate>
                        <asp:Repeater ID="rptAccounts" runat="server" OnItemDataBound="rptAccounts_ItemDataBound">
                            <ItemTemplate>
                                <div class="input-group accounts accountDrop" tabindex="0">
                                    <div class="col-xs-9">
                                        <div class="col-12 accountDetailsCustomer">
                                            <asp:Label ID="accountCustomerName" runat="server">Customer</asp:Label>
                                        </div>
                                        <div class="col-12 accountDetailsName">
                                            <asp:Label ID="accountName" runat="server" CssClass="accountName"></asp:Label>
                                        </div>
                                        <div class="col-12 accountDetailsNumber">
                                            <asp:Label ID="accountNumber" runat="server" CssClass="accountNumber"></asp:Label>
                                        </div>
                                    </div>
                                    <div class="col-xs-1 icons hidden" style="height: 80px;">
                                        <img id="delete" src="<%$ebFile:~/Content/currenttheme/images/icon/Corporate/delete.png%>" runat="server" class="imgGroup deleteAccount" tabindex="0" />
                                    </div>
                                    <div class="col-xs-1 icons hidden" style="height: 80px;">
                                        <img id="order" src="<%$ebFile:~/Content/currenttheme/images/icon/Corporate/corp_action_order.png%>" runat="server" class="imgGroup order" />
                                    </div>
                                    <div class="accountOrder">
                                        <asp:HiddenField ID="accountOrder" runat="server" />
                                    </div>


                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="clearBoth"></div>
        </div>
        <div class="col-xs-7 col-sm-7 col-md-7 col-lg-7" style="padding-right: 0px">
            <div class="col-xs-12 titleAccountGroups">
                <h4>
                    <asp:Literal runat="server" Text="<%$FrontEndResources:TRX01802,groupsTitle%>"></asp:Literal>
                </h4>
            </div>
            <div class="col-xs-12 infoAccountGroups">
                <asp:Literal ID="Literal2" runat="server" Text="<%$FrontEndResources:TRX01802,litInfoGroups%>"></asp:Literal>
            </div>
            <div class="input-group-search">
                <asp:TextBox runat="server" ID="searchGroup" class="form-control-box"></asp:TextBox>
                <span class="input-group-addon" id="searchgrp"></span>
                <span class="input-group-addon clear" id="cleargrp" tabindex="0" style="display: none"></span>

            </div>
            <div class="overflowHidden">
                <div class="col-xs-12" id="divGroupsHeaders" runat="server">
                    <div class="col-xs-4" style="width: 32.7%;"></div>
                    <div class="col-xs-2 litShareHeader">
                        <asp:Literal ID="litShareHeader" runat="server" Text="<%$FrontEndResources:TRX01802,litShareHeader%>"></asp:Literal>
                    </div>
                    <div class="col-xs-1 litEditHeader">
                        <asp:Literal ID="litEditHeader" runat="server" Text="<%$FrontEndResources:TRX01802,litEditHeader%>"></asp:Literal>
                    </div>
                    <div class="col-xs-1 litDeleteHeader">
                        <asp:Literal ID="litDeleteHeader" runat="server" Text="<%$FrontEndResources:TRX01802,litDeleteHeader%>"></asp:Literal>
                    </div>
                    <div class="col-xs-3 litVisibleHeader">
                        <asp:Literal ID="litVisibleHeader" runat="server" Text="<%$FrontEndResources:TRX01802,litVisibleHeader%>"></asp:Literal>
                    </div>
                    <div class="col-xs-1"></div>
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
                                        <div class="col-xs-1 icons">
                                            <asp:Image ID="icoDown" ImageUrl="<%$ebFile:~/Content/currenttheme/images/icon/Corporate/action_expand.png%>" runat="server" CssClass="imgGroup icoDown" />
                                            <asp:Image ID="icoUp" ImageUrl="<%$ebFile:~/Content/currenttheme/images/icon/Corporate/action_collapse.png%>" runat="server" CssClass="imgGroup icoUp hidden" />
                                        </div>
                                        <div class="col-xs-1 iconNotOwner" id="divIconNotOwner" runat="server">
                                            <asp:Image ID="imgNotOwner" ImageUrl="<%$ebFile:~/Content/currenttheme/images/icon/action/corporate/action-shared.png%>" runat="server" CssClass="iconNotOwner" ToolTip="<%$FrontEndResources:TRX01802,SharedGroupTooltip%>" />
                                        </div>
                                        <div class="col-xs-5 divInfoInheritGroup" id="divInfoInheritGroup" runat="server">
                                            <div class="divInheritGroupName">
                                                <asp:Literal ID="inheritGroupName" runat="server" />
                                            </div>
                                            <div class="divInheritGroupOwnerName">
                                                <asp:Label ID="inheritGroupOwnerName" runat="server" />
                                            </div>
                                        </div>
                                        <div class="col-xs-3 infoGroupName" runat="server" id="divInfoGroupName">
                                            <asp:Literal ID="litGroupName" runat="server"></asp:Literal>
                                        </div>

                                        <div id="shareGroupContrainer" runat="server" class="col-xs-2 iconShare">
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

                                        <div class="col-xs-1 icons" style="padding-left: 0px;" runat="server" id="divIcoEdit">
                                            <asp:Image ID="edit" ImageUrl="<%$ebFile:~/Content/currenttheme/images/icon/Corporate/ico_corp_action_edit.png%>" runat="server" CssClass="imgGroup" ToolTip="<%$FrontEndResources:TRX01802,Edit%>" TabIndex="0" />
                                        </div>
                                        <div class="col-xs-1 icons" runat="server" id="divIcoDelete">
                                            <asp:Image ID="delete" ImageUrl="<%$ebFile:~/Content/currenttheme/images/icon/Corporate/delete.png%>" runat="server" CssClass="imgGroup" ToolTip="<%$FrontEndResources:TRX01802,Delete%>" TabIndex="0" />
                                        </div>
                                        <div class="col-xs-2 iconVisible" id="groupVisibilityContainer" runat="server">
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
                                        <div class="col-xs-1 icons orderDiv">
                                            <asp:Image ID="icoOrder" ImageUrl="<%$ebFile:~/Content/currenttheme/images/icon/Corporate/corp_action_order.png%>" runat="server" CssClass="imgGroup" TabIndex="0" />
                                        </div>
                                    </div>
                                    <div id="divEdit" runat="server" class="input-group accounts groups edit hidden">
                                        <div class="col-xs-9">
                                            <asp:TextBox runat="server" ID="editName" class="form-control-box editGroupNameBox"></asp:TextBox>
                                        </div>
                                        <div class="col-xs-1 icons">
                                            <asp:Image ID="closeEdit" ImageUrl="<%$ebFile:~/Content/currenttheme/images/icon/action_close.png%>" runat="server" CssClass="imgGroup" />
                                        </div>
                                        <div class="col-xs-1 icons">
                                            <asp:Image ID="approveEdit" ImageUrl="<%$ebFile:~/Content/currenttheme/images/icon/ico_approve_btn_corp.png%>" runat="server" CssClass="imgGroup" />
                                        </div>
                                    </div>
                                    <div id="dropAccounts" class="input-group accounts dropAccounts" runat="server" style="display: none; margin: 0px; border: none">
                                        <div class="sort" id="groupAccounts" runat="server">
                                            <div>
                                                <div id="divNoAccountsMessage" class="alert-accounts alert-warning-no-accounts fade in widthInherit" role="alert" aria-atomic="true" runat="server" style="display:none;">
                                                    <h4 class="alert-accounts-heading" id="divNoAccountsMessageH4" runat="server"></h4>
                                                    <div class="clearBoth"></div>
                                                </div>
                                            </div>

                                            <asp:Repeater ID="rptGroupAccounts" runat="server" OnItemDataBound="rptGroupAccounts_ItemDataBound">
                                                <ItemTemplate>
                                                    <div class="input-group accounts groupAcc" style="position: relative; top: auto; left: auto;" tabindex="0">
                                                        <div class="col-xs-7">
                                                            <div class="col-12 accountDetailsCustomer">
                                                                <asp:Label ID="accountCustomerName" runat="server">Customer</asp:Label>
                                                            </div>
                                                            <div class="col-12 accountDetailsName">
                                                                <asp:Label ID="accountName" runat="server" CssClass="accountName"></asp:Label>
                                                            </div>
                                                            <div class="col-12 accountDetailsNumber">
                                                                <asp:Label ID="accountNumber" runat="server" CssClass="accountNumber"></asp:Label>
                                                            </div>
                                                        </div>
                                                        <div class="col-xs-1 icons" style="height: 80px;">
                                                            <asp:Image ID="delete" ImageUrl="<%$ebFile:~/Content/currenttheme/images/icon/Corporate/delete.png%>" runat="server" CssClass="imgGroup deleteAccount" ToolTip="<%$FrontEndResources:TRX01802,Delete%>" TabIndex="0" />
                                                        </div>
                                                        <div class="col-xs-1 icons orderDivAccount" style="height: 80px;">
                                                            <asp:Image ID="order" ImageUrl="<%$ebFile:~/Content/currenttheme/images/icon/Corporate/corp_action_order.png%>" runat="server" class="imgGroup orderAccount" AlternateText="<%$FrontEndResources:TRX01802,OrderButtonAltText%>" TabIndex="0" />
                                                        </div>
                                                        <div class="accountOrder">
                                                            <asp:HiddenField ID="accountOrder" runat="server" />
                                                        </div>

                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>

                                        </div>
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
                <div id="addGroup" class="input-group accounts groups" style="display: none">
                    <div class="col-xs-9">
                        <%--<input id="groupName" type="text" class="form-control" placeholder="<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX01802", "groupName")%>" aria-describedby="basic-addon2">--%>
                        <it:TextBoxControl ID="groupName"  CssClass="flRight field metro entireWidth" runat="server" Watermark="<%$FrontEndResources:TRX01802,groupName %>" />

                    </div>
                    <div class="col-xs-1 icons">
                        <img id="close" src="<%$ebFile:~/Content/currenttheme/images/icon/action_close.png%>" runat="server" class="imgGroup" onclick="closeAdd()" onkeypress="closeAddKey()" tabindex="0" />
                    </div>
                    <div class="col-xs-1 icons">
                        <img id="approve" src="<%$ebFile:~/Content/currenttheme/images/icon/ico_approve_btn_corp.png%>" runat="server" class="imgGroup" onclick="addNewGroup()" onkeypress="addNewGroup()" tabindex="0" />
                    </div>
                </div>
                <div class="input-group accounts groups" style="line-height: 80px; padding: 0px;" onclick="showAdd()" onkeypress="showAddGroupKey(event)" tabindex="0">
                    <a runat="server" id="btnAddGroup">
                        <img id="imgAddGroup" src="<%$ebFile:~/Content/currenttheme/images/icon/Corporate/corp_new.png%>" runat="server" class="imgGroup" aria-label="" />
                        <asp:Literal ID="litAddGroup" Text="<%$FrontEndResources:TRX01802,AddGroup %>" runat="server"></asp:Literal>
                    </a>
                </div>
            </div>
            <div class="clearBoth"></div>
        </div>
        <div class="clearBoth"></div>
        <div class="trs_buttons col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-max bs-reduced bs-head-metro transp">
            <div class="trs_buttons-action">
                <asp:LinkButton ID="btnCancel" runat="server" Text="<%$FrontEndResources:TRX01802,CANCEL%>" CssClass="btn btn-default" href="/Security/Transactions/DashboardTemplates/DynamicLandingPage.aspx"></asp:LinkButton>
                <asp:LinkButton ID="btnSave" runat="server" Text="<%$FrontEndResources:TRX01802,SAVECHANGES%>" CssClass="btn btn-primary btnSaveAccountGroups" OnClientClick="submitChanges()" OnClick="btnSave_Click"></asp:LinkButton>

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
            <asp:Button ID="hdnButtonSubmit" Style="display: none;" runat="server" OnClick="hdnButtonSubmit_Click" />
            <asp:Button ID="btnSearchGroups" Style="display: none;" runat="server" OnClick="btnSearchGroups_Click" />
            <asp:Button ID="btnSearchAccounts" Style="display: none;" runat="server" OnClick="btnSearchAccounts_Click" />
            <asp:Button ID="btnDeleteGroup" Style="display: none;" runat="server" OnClick="btnDeleteGroup_Click" />
            <asp:Button ID="btnShareGroup" Style="display: none;" runat="server" OnClick="btnShareGroup_Click" />

        </div>
    </div>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01802-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01802-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <script type="text/javascript">
        var groupName = document.getElementById('<%= hdnGroupName.ClientID %>');
        var submitBtn = document.getElementById('<%= hdnButtonSubmit.ClientID%>');
        var searchGroup = $('#<%=searchGroup.ClientID%>');
        var searchAccounts = $('#<%=searchAccount.ClientID%>');
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
        var hdnGroupsNotOwner = $('#<%=hdnGroupsNotOwner.ClientID%>');


        Sys.Application.add_load(keyboarGroupSortable);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(keyboarGroupSortable);

        $(document).ready(function () {
            showHideNotOwnerButtonsAccount();
            searchGroup.keyup();
            searchAccounts.keyup();
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

        function addNewGroup() {
            if (event.type == 'click' || event.keyCode == 13) {
                groupName.value = $('[id$=groupName_txField]').val();

                var arrayGroupNames = [];
                arrayGroupNames = hdnGroupNames.val().split(';');
                var foundName = false;
                $.each(arrayGroupNames, function (i, val) {
                    if (val.trim() == groupName.value.toLocaleLowerCase().trim()) {
                        foundName = true;
                    }
                });


                if (groupName.value == '') {
                    eBankit.Presentation.InsertValidateMsg($('#<%=groupName.TextBoxClientID %>'), top.eBankit.Presentation.GetResource("RequiredField"));

                }
                else {
                    if (foundName == true) {
                        eBankit.Presentation.RemoveValidateMsg($('#<%=groupName.TextBoxClientID %>'));
                        eBankit.Presentation.InsertValidateMsg($('#<%=groupName.TextBoxClientID %>'), top.eBankit.Presentation.GetResource("InsertGroupNameError"));

                        return false;
                    }
                    else {
                        eBankit.Presentation.RemoveValidateMsg($('#<%=groupName.TextBoxClientID %>'));
                        $('[id$=groupName_txField]').val('');
                        submitBtn.click();
                    }
                }
            } else if (event.keyCode == "32") {
                event.preventDefault();
            }
        }
        function deleteGroupKeyPress(btnDeleteGroupIID) {
            if (event.keyCode == "13") {
                $(btnDeleteGroupIID).click();
            } else if (event.keyCode == "32") {
                event.preventDefault();
            }
        }



        function showHideEditKeyPress(divGroupID, divEdit) {
            if (event.keyCode == "13") {
                $(divGroupID).toggleClass('hidden');
                event.preventDefault();
                $(divEdit).toggleClass('hidden');
            } else if (event.keyCode == "32") {
                event.preventDefault();
            }
        }
        function showHideKeypress(dropAccountsID, iconDownID, iconUpID) {
            if (event.keyCode == "13") {
                $(dropAccountsID).slideToggle();
                $(iconDownID).toggleClass('hidden');
                $(iconUpID).toggleClass('hidden');
                $(iconUpID).focus();
                $(iconUpID).attr('tabindex', '0');
                $(iconDownID).focus();

            } else if (event.keyCode == "32") {
                event.preventDefault();
            }
        }

        function approveEditKeypress(btnApproveEditGroupID) {
            if (event.keyCode == "13") {
                $(btnApproveEditGroupID).click();

            } else if (event.keyCode == "32") {
                event.preventDefault();
            }
        }



        searchGroup.on("keyup", function () {
            if (searchGroup.val().length < 3) {
                $('.groupInfo').each(function () {
                    var icoDown = $(this).find('.icoDown');
                    var icoUp = $(this).find('.icoUp ');
                    $(this).parent().show();
                    $(this).siblings('.dropAccounts').slideUp();
                    if ($(this).siblings('.dropAccounts').find('.groupAcc').length > 0) {
                        $(this).siblings('.dropAccounts').find('.groupAcc').each(function () {
                            $(icoUp).addClass("hidden");
                            $(icoDown).removeClass("hidden");
                            $(this).show();
                        });
                    } else {
                        $(icoUp).addClass("hidden");
                        $(icoDown).removeClass("hidden");
                    }

                });
                $('#searchgrp').show();
                $('#cleargrp').hide();
            }
            else {
                $('#searchgrp').hide();
                $('#cleargrp').show();
                $('#cleargrp').attr('title', top.eBankit.Presentation.GetResource("clearIconTooltip"));
            }
            if (searchGroup.val().length >= 3) {
                $('.groupInfo').each(function () {
                    var grpName = '';
                    if ($(this).siblings('input').eq(1).val().toLocaleLowerCase() === 'false') {
                        grpName = $(this).find('.divInheritGroupName').html().trim();
                    } else {
                        grpName = $(this).find(".infoGroupName").html().trim();
                    }

                    var accountName = $(this).siblings('.dropAccounts').find(".accountName");
                    var accountNameArray = [];
                    var accountNumber = $(this).siblings('.dropAccounts').find(".accountNumber");
                    var accountNumberArray = [];
                    var icoDown = $(this).find('.icoDown');
                    var icoUp = $(this).find('.icoUp');

                    $(accountName).each(function () {
                        accountNameArray.push($(this).html().toLocaleLowerCase())
                    });

                    $(accountNumber).each(function () {
                        accountNumberArray.push($(this).html().toLocaleLowerCase())
                    });


                    var foundNumber = false;
                    var foundName = false;
                    $.each(accountNumberArray, function (i, val) {
                        if (val.indexOf(searchGroup.val()) >= 0) {
                            foundNumber = true;
                        }
                    });
                    $.each(accountNameArray, function (i, val) {
                        if (val.indexOf(searchGroup.val()) >= 0) {
                            foundName = true;
                        }
                    });



                    if (grpName.toLocaleLowerCase().indexOf(searchGroup.val().toLocaleLowerCase()) >= 0 || foundName == true || foundNumber == true) {
                        $(this).parent().show();

                        if (foundName == true || foundNumber == true) {
                            $(icoUp).removeClass("hidden");
                            $(icoDown).addClass("hidden");
                            $(this).siblings('.dropAccounts').slideDown();
                            $(this).siblings('.dropAccounts').find('.groupAcc').each(function () {
                                if ($(this).find('.accountName').html().toLocaleLowerCase().trim().indexOf(searchGroup.val().toLocaleLowerCase()) >= 0 || $(this).find('.accountNumber').html().indexOf(searchGroup.val().toLocaleLowerCase()) >= 0) {
                                    $(this).show();
                                } else {
                                    $(this).hide();
                                }
                            });
                        } else {
                            $(this).siblings('.dropAccounts').slideUp();
                        }

                    }
                    else {
                        if (foundName == false && foundNumber == false) {
                            $(this).siblings('.dropAccounts').slideUp();
                            $(this).parent().hide();
                            $(icoUp).addClass("hidden");
                            $(icoDown).removeClass("hidden");
                        } else {
                            $(icoUp).removeClass("hidden");
                            $(icoDown).addClass("hidden");
                            $(this).parent().show();
                        }

                    }
                });
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



        });

        $('#clearacc').on("click", function () {
            searchAccounts.val("");
            searchAccounts.keyup();
            $('#searchacc').show();
            $('#clearacc').hide();
        });

        $('#clearacc').keypress(function (evt) {
            if (evt.keyCode == "13") {
                searchAccounts.val("");
                searchAccounts.keyup();
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
            }
        });

        $(".sort").sortable({
            stop: function (event, ui) {
                var $items = $(ui.item).parent().children().find(".accountOrder").children();
                $items.each(function (index) {
                    $(this).val(index)
                });
                $('[id$=infoDivUnsavedChangesMessage]').removeClass("hidden");
            }
        });

        function keyboarGroupSortable() {
            $("#dragGroups .orderDiv").keydown(function (e) {
                if (e.keyCode == 40) { /* Focus Down */
                    $(this).parent().parent().insertAfter($(this).parent().parent().next());


                } else if (e.keyCode == 38) { /* Focus Up */
                    $(this).parent().parent().insertBefore($(this).parent().parent().prev());

                }

                $(this).children().focus();


            });
        };

        function keyboarAccountsSortable(elem) {

            if (event.keyCode == 40) { /* Focus Down */
                $(elem).parent().parent('.groupAcc').insertAfter($(elem).parent().parent('.groupAcc').next());


            } else if (event.keyCode == 38) { /* Focus Up */
                $(elem).parent().parent('.groupAcc').insertBefore($(elem).parent().parent('.groupAcc').prev());

            }

            $(elem).focus();

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
                    $(this).hide();
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

        function showSaveWarningMessage() {
            $('[id$=infoDivUnsavedChangesMessage]').removeClass("hidden");
        }

    </script>
</div>
