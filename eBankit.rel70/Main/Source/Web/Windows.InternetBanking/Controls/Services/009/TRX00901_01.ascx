<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX00901_01.ascx.cs" Inherits="TRX00901_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">

    <script type="text/javascript">
        var ebkTheme = "<%=ConfigurationManager.AppSettings["Theme"] %>";

        function confirmDelete(currentMessage) {
            top.confirmDeleteHandler = function () {
                eval(currentMessage.href);
            }
            itcore_ui.ShowTopPopupConfirm("<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX00901", "PopupConfirmation").Replace("\"","&quot;") %>", '<%=eBankit.Common.Globalization.Translate.GetTransactionString("TRX01110", "TitleConfirm") %>', 'top.confirmDeleteHandler();');
        }
    </script>
    <div class="tabSelectorBackground noMarginTopImportant">
        <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 col-lg-8 col-max fullWidth">
            <section>
                <div class="col-lg-12 col-left noprint clearPadding paddingBottom5">
                    <ul>
                        <li runat="server">
                            <asp:LinkButton ID="tabReceived" OnClick="ClickInbox" Text="<%$FrontEndResources:Custom,tabInbox%>" runat="server"></asp:LinkButton>
                        </li>
                        <li runat="server">
                            <asp:LinkButton ID="tabSent" OnClick="ClickOutbox" Text="<%$FrontEndResources:Custom,tabOutbox%>" runat="server"></asp:LinkButton>
                        </li>
                        <li runat="server">
                            <asp:LinkButton ID="tabDeleted" OnClick="ClickDeletedTab" Text="<%$FrontEndResources:Custom,tabDeleted%>" runat="server"></asp:LinkButton>
                        </li>
                        <li runat="server">
                            <asp:LinkButton ID="tabNewMessage" OnClick="ClickNewMessage" Text="<%$FrontEndResources:TRX00901,NewMessage%>" runat="server"></asp:LinkButton>
                        </li>
                    </ul>
                </div>
            </section>
        </div>
    </div>
    <div class="clearBoth"></div>
    <div class="col-left col-transaction messagesContainer transaction-content" runat="server" id="rightTransaction">
        <asp:Panel ID="panelMessages" runat="server" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding bgWhite">
            <div id="myTabContent" class="tab-content borderRgtTransparent">
                <div class="noMarginLeft">
                    <asp:Panel runat="server" CssClass="panel searchCriteria collapsed noMarginBottom" data-role="panel" ID="divFilter" Style="background-color: rgb(247, 246, 246);">
                        <div class="panel panel-detail noBottomMargin" id="flwSearch">
                            <div>
                                <div id="divSearchCriteria">
                                    <div class="metro noMarginLeft">
                                        <div class="panel" data-role="panel" id="divTesteaver">
                                            <div class="listHeader">
                                                <div class="col-lg-8 col-max panel-header panel-header-3 bgOverride" id="idSearchHeader" runat="server" tabindex="0"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearBoth"></div>
                                </div>
                            </div>
                        </div>

                        <asp:Panel CssClass="col-lg-8 col-max panel-content panel-search bgMainColor" runat="server" ID="searchCriteriaOptions">
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 paddingTop10">
                                <it:DatePickerTextBoxRangeMetroControl_v3 ID="datepicker" Label="<%$FrontEndResources:DATALIST,From%>" LabelTo="<%$FrontEndResources:DATALIST,To%>" runat="server" ValidationRequiredMessage="<%$FrontEndResources:DATALIST,RequiredDateMessage%>" CssClass="field field_v2 field-full metro" ToolTip="<%$FrontEndResources:DATALIST,From%>" ToolTipTo="<%$FrontEndResources:DATALIST,To%>" />
                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 paddingTop10">
                                <it:DropDownListControl_v2 ID="dropMessageType" Label="<%$FrontEndResources:TRX00901,MessageType%>" runat="server" BreakLine="true" CssClass="field field_v2 field-full metro" />
                            </div>

                            <div class="clearBoth"></div>
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-right">
                                <asp:Button ID="btnSearch" CssClass="btn btn-primary btn-margin btn-search-filter" OnClientClick="return FilterSearch();" runat="server" OnClick="ClickSearch" Text="<%$FrontEndResources:TRX00901,btnSearch%>" />
                            </div>
                            <div class="clearBoth"></div>
                        </asp:Panel>
                    </asp:Panel>
                    <asp:HiddenField ID="searchOpen" ClientIDMode="Static" runat="server" Value="0" />
                </div>

                <div class="tab-pane fade active in" id="tabInbox">
                    <div class="metro messagesContainer">
                        <div class="headerVisibleCollapse col-lg-8 col-max">
                            <asp:Panel ID="panelUnreadMessages" runat="server" Visible="false" class="metro panel-info btn-ebankit-info-inner user-commands pRelative">
                                <asp:Label ID="labelInfo" runat="server"></asp:Label>
                            </asp:Panel>
                        </div>
                        <div class="metro">
                            <div id="divWarningMessage" runat="server" class="panel-top" visible="false">
                                <section class="content-message metro" style="background-color: #FBB040;">
                                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-8 col-max">
                                        <div id="MainContent_TransactionMainContent_divMessage" class="alert alert-warning_v2 fade in">
                                            <h4 class="alert-heading div-warning_v2">
                                                <asp:Literal ID="litTitleWarning" runat="server" Text="<%$FrontEndResources:TRX00901,NoMessagesInfo%>" /></h4>
                                            <div class="clearBoth"></div>
                                        </div>
                                    </div>
                                </section>
                                <div class="clearBoth"></div>
                            </div>
                        </div>
                        <asp:Repeater ID="rptRecievedMessages" runat="server" OnItemDataBound="GridRowDataBound" OnItemCommand="GridRowCommand">
                            <HeaderTemplate>
                                <div class="headerContainer">
                                    <div class="col-lg-8 col-max">
                                        <div class="headerFld width133"></div>
                                        <div class="headerFld Width150">
                                            <asp:Literal Text="<%$FrontEndResources:Custom,Date%>" runat="server"></asp:Literal>
                                        </div>
                                        <div class="headerFld" style="width: 175px;">
                                            <asp:Literal Text="<%$FrontEndResources:TRX00901,MessageType%>" runat="server"></asp:Literal>
                                        </div>
                                        <div class="headerFld">
                                            <asp:Literal Text="<%$FrontEndResources:Custom,Subject%>" runat="server"></asp:Literal>
                                        </div>

                                        <div class="headerFld flRight width62">
                                            <asp:Literal Text=" " runat="server"></asp:Literal>
                                        </div>
                                    </div>
                                </div>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <div class="lineContainer borderBottom3" id="lineContainer" runat="server">
                                    <div class="col-lg-8 col-max paddingTop10Important paddingBottom10Important">
                                        <div class="lineFld width133">
                                            <asp:Image ID="imgReadMode" runat="server" ImageUrl="<%$ebFile:~/Content/currenttheme/images/messages/ico_message_read.png%>"/>
                                        </div>
                                        <div class="lineFld paddingTop20 paddingBottom20 Width150" style="line-height:56px">
                                            <asp:Label ID="litData" runat="server" CssClass="message-hover" />
                                        </div>
                                        <div class="lineFld paddingTop20 paddingBottom20" style="width: 175px; line-height:56px">
                                            <asp:Label ID="litMessageType" runat="server" CssClass="message-hover" />
                                        </div>
                                        <div class="lineFld paddingTop20 paddingBottom20" style="line-height:56px">
                                            <asp:Label ID="litSubject" runat="server" CssClass="message-hover" />
                                        </div>
                                        <div class="lineFld width62 paddingTop11">
                                            <asp:LinkButton ID="LinkButton1" OnClientClick="if(!confirmDelete(this)) return false;" CommandArgument='<%#Eval("MessageID") %>' CommandName="MessageDelete" CssClass="imgButton" runat="server">
                                                <asp:Image ID="labelIcon" runat="server" CssClass="messagesImgDelete imgPadding imgMargin" />
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>

                        <div class="col-lg-8 col-max">
                            <it:Pager ID="pager" runat="server" PageSize="10" PagerType="NumericPages" OnPageChanged="ClickPageChanged" />
                        </div>
                    </div>
                    <div class="clearBoth"></div>
                    <div class="panel-header newMessage collapsedVisibility hidden" id="pnNavigationHeader">
                        <asp:LinkButton ID="linkNew" runat="server" OnClick="ClickNewMessage" Text="<%$FrontEndResources:TRX00901,NewMessage%>" />
                    </div>
                </div>
            </div>
        </asp:Panel>
        <div class="clearBoth"></div>

        <asp:Panel ID="panelNewMessage" runat="server" Visible="false">
            <it:FlowInnerContainer ID="FlowInnerContainer1" CustomCssClass="bs-reduced bs-head-metro bs-reduced-transaction col-lg-8 col-max" Title="<%$FrontEndResources:TRX00901,NewMessage%>" runat="server">
                <div>
                    <it:DropDownListControl_v2 ID="ddlTopLevelMsgType" IsRequired="true" runat="server" Label="<%$FrontEndResources:TRX00901,MessageType%>" BreakLine="true" OnSelectedChanged="textMessageType_SelectedChanged" AutoPostBack="True" />
                    <it:DropDownListControl_v2 ID="ddlSndLvlMsgType" IsRequired="true" IsVisible="false" runat="server" Label="<%$FrontEndResources:TRX00901,ClaimType%>" BreakLine="true" OnSelectedChanged="ddlSndLevel_SelectedChanged" AutoPostBack="True" />
                    <it:DropDownListControl_v2 ID="ddlTrdLvlMsgType" IsRequired="true" IsVisible="false" runat="server" Label="<%$FrontEndResources:TRX00901,ClaimSubtype%>" BreakLine="true" AutoPostBack="True" />
                    <it:TextBoxControl_v2 ID="tbcAnswerType" Label="<%$FrontEndResources:TRX00901,MessageType%>" Enabled="false" Visible="false" runat="server" />
                    <it:TextBoxControl_v2 ID="textMessageSubject" IsRequired="true" MaxLength="50" Label="<%$FrontEndResources:TRX00901,Subject%>" OnBlur="eBankit.Presentation.TRX00901.ValidateSubject();" runat="server" />
                    <it:RichTextBox_V2 ID="textMessageContent" IsRequired="true" ShowToolbarLabels="true" Rows="10" Label="<%$FrontEndResources:TRX00901,Message%>" runat="server" />
                </div>
            </it:FlowInnerContainer>
            <asp:Panel ID="pnWrapper" runat="server"></asp:Panel>
            <div class="trs_buttons col-lg-8 col-max">
                <it:LinkButtonControl ID="LinkButtonControl2" ActionType="Back" CustomCssClass="btn-default" OnClick="ClickBack" Text="<%$FrontEndResources:TRX00901,Back%>" runat="server" />
                <it:LinkButtonControl ID="LinkButtonControl3" ActionType="Conclusion" OnClick="ClickMessageSend" Text="<%$FrontEndResources:TRX00901,Send%>" runat="server" OnClientClick="return eBankit.Presentation.TRX00901.ValidateSendMessageFields();" />
            </div>
        </asp:Panel>

        <asp:Panel ID="panelViewMessage" runat="server" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" Visible="false">
            <%--Title="<%$FrontEndResources:TRX00901,MessageDetail%>"--%>
            <it:FlowInnerContainer ID="flwContainer" CustomCssClass="table hovered table-resp-to1199 messagePreviewContainer" runat="server">
                <div class="col-lg-8 col-max fullHeight dspTable">
                    <div id="row" class="messagePreviewTableHeader">
                        <asp:HiddenField ID="flowId" runat="server" />
                        <div class="messageIcon col-xs">
                            <img id="icoMessageDetails" runat="server" class="square52 messageDetails" />
                        </div>

                        <div class="col-sm-3 col-xs-3 ViewMessageMarginTop messagePreviewDate">
                            <p>
                                <strong>
                                    <asp:Literal ID="Literal2" runat="server" Text="<%$FrontEndResources:TRX00901,Date%>" /></strong>
                            </p>
                            <p class="dateValue">
                                <asp:Literal ID="flowCreated" runat="server" />
                            </p>
                        </div>
                        <div class="col-sm-3 col-xs-3 ViewMessageMarginTop messagePreviewMessageType">
                            <p>
                                <strong>
                                    <asp:Literal ID="Literal1" runat="server" Text="<%$FrontEndResources:TRX00901,MessageType%>" /></strong>
                            </p>
                            <p class="messageTypeValue">
                                <asp:Literal ID="flowMessageType" runat="server" />
                            </p>
                        </div>
                        <div class="col-sm-5 ViewMessageMarginTop messagePreviewSubject">
                            <p>
                                <strong>
                                    <asp:Literal ID="Literal3" runat="server" Text="<%$FrontEndResources:TRX00901,Subject%>" /></strong>
                            </p>
                            <p class="subjectValue">
                                <asp:Literal ID="flowSubject" runat="server" />
                            </p>
                        </div>
                        <div class="col-sm-1 messagePreviewDeleteIcon">
                            <asp:LinkButton ID="linkDelete" runat="server" CssClass="messagesIcon" OnClick="ClickDeleted">
                                <asp:Image ID="imgDel" ImageUrl="<%$ebFile:~/Content/currenttheme/images/messages/delete.png%>" runat="server" />
                            </asp:LinkButton>
                        </div>
                        <div class="clearBoth"></div>
                    </div>
                </div>
            </it:FlowInnerContainer>
            <br />
            <it:FlowInnerContainer ID="FlowInnerContainer2" runat="server" CustomCssClass="col-max">
                <div class="col-lg-8 col-max messagePreviewDetail">
                    <div class="messagePreviewDetailRow col-lg-12">
                        <div class="col-sm-3 col-xs col-lg-12 col-max titleDivWithMargin noMarginLeft">
                            <p>
                                <strong>
                                    <asp:Literal ID="Literal4" runat="server" Text="<%$FrontEndResources:TRX00901,Message%>" /></strong>
                            </p>
                        </div>
                    </div>
                    <div class="messagePreviewDetailRow col-lg-12">
                        <div class="col-sm-3 col-xs col-lg-12 col-max contentDivWithMargin noMarginLeft secureMessageLabel marginTop0">
                            <p>
                                <asp:Literal ID="flowMessage" runat="server" />
                            </p>
                        </div>
                    </div>
                    <div class="clearBoth"></div>
                </div>
            </it:FlowInnerContainer>
            <div class="trs_buttons newMessageButtons">
                <div class="col-lg-8 col-max">
                    <it:LinkButtonControl ID="Button2" ActionType="Back" CustomCssClass="btn-default" OnClick="ClickBack" Text="<%$FrontEndResources:TRX00901,Back%>" runat="server" />
                    <it:LinkButtonControl ID="linkReply" ActionType="Conclusion" OnClick="ClickReply" Text="<%$FrontEndResources:TRX00901,Reply%>" runat="server" />
                </div>
            </div>
        </asp:Panel>
        <script type="text/javascript">
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_endRequest(function () {
                //$('.input-control.text.field').datepicker();
                $(".searchCriteria").panel();
                $("#Div1").on("click", function () {
                    var v = $("#searchOpen").val();
                    $("#searchOpen").val(Math.abs(v - 1));
                });
            });
        </script>
    </div>
    <asp:HiddenField runat="server" ID="CustomerType" />
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX00901-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
    
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("~/Scripts/Services/Transactions/TRX00901-01.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>

</div>
