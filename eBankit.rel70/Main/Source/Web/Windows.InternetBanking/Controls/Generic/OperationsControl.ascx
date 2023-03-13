<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OperationsControl.ascx.cs" Inherits="OperationsControl" %>

<%@ Import Namespace="eBankit.Common.InternetBanking" %>

<div class="col-lg-8 col-max">
    <div class="metro noprint" style="padding-left: 15px;">
        <div class="panel" style="border: none; padding-top: 10px; box-shadow: none;">
            <%--<div id="pnCommand" class="panel-arrow" style="margin-right: -5px" runat="server" onclick="changeIcon('all');eBankit.Presentation.Beneficiary.CloseTabOptionV2(false);"><i id="iconArrow" class="icon-arrow-up"></i></div>--%>
            <ul class="nav nav-tabs nav-tabs-selectors" style="border: 0; display: none; padding-left: 0px; margin-left: 0px;">
                <li id="liOperations" onclick="eBankit.Presentation.Beneficiary.ChangeTabTitle_v2('operations');" runat="server"><a href="#operations" onclick="changeIcon('operations');" style="border-top-right-radius: 4px; border-bottom-right-radius: 4px;" data-toggle="tab">
                    <img id="imgOperations1" src="<%$ebFile:~/content/currenttheme/images/ic_all_operations.png%>" style="" alt="" runat="server" /></a></li>
            </ul>

            <div id="benefsTabContent" class="tab-content panel-content" style="border: 0; margin-left: 0px; padding: 0px 0px; background-color: #fff; margin-bottom: 20px;">
                <div id="operations" class="favoritList">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Always">
                        <ContentTemplate>
                            <div class="metro bx-wrapper-container bx-wrapper-container-selector" id="flwContainerDetailOperations" runat="server">
                                <asp:Repeater ID="rptOperations" runat="server" EnableViewState="true" OnItemDataBound="rptOperations_ItemDataBound">
                                    <HeaderTemplate>
                                        <div class="bx-wrapper-container-selector-separator"></div>
                                        <ul class="bxsliderFavorits">
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <li>
                                            <div id="aOper" class="panel-item" runat="server" tabindex="0" role="link">
                                                <div class="panel-image">
                                                    <img id="imgOperation" src="<%$ebFile:~/Content/currenttheme/images/benef_1.png%>" class="img-circle" alt="Operations" runat="server" />
                                                </div>
                                                <div class="panel-text">
                                                    <p>
                                                        <span id="spanName" runat="server">
                                                            <asp:Literal ID="litName" runat="server"></asp:Literal>
                                                        </span>
                                                    </p>
                                                </div>
                                            </div>
                                            <div class="clearBoth"></div>
                                        </li>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </ul>
                                   
                                   
                                   
                                    </FooterTemplate>
                                </asp:Repeater>
                                <div class="clearBoth"></div>
                            </div>
                            <div id="flwReuseEmpty" class="metro panel-content" style="height: 65px;" runat="server">
                                <p>
                                    <asp:Literal ID="Literal2" Text='<%$FrontEndResources:Reuse,EmptyMessage %>' runat="server"></asp:Literal>
                                </p>
                            </div>
                            <asp:Button ID="btnOperationSelectedChanged" runat="server" CssClass="hiddenImportant" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
            <div class="clearBoth"></div>
        </div>
    </div>
</div>
<asp:HiddenField ID="hdnOperationSelectedIndex" Value="" runat="server" />
<asp:HiddenField ID="_hidSelectedOperation" runat="server" />
<asp:HiddenField ID="_hidOperationArray" runat="server" />
<asp:HiddenField ID="hdnSelectedPanel" Value="" runat="server" />
<script type="text/javascript">
    var hdnSelectedPanel = $("#<%=hdnSelectedPanel.ClientID %>");

    var _hidOperationArray = $("#<%=_hidOperationArray.ClientID %>"); var _hidSelectedOperation = $("#<%=_hidSelectedOperation.ClientID %>");
    var hdnOperationSelectedIndex = $("#<%=hdnOperationSelectedIndex.ClientID %>"); var btnOperationSelectedChanged = "<%=btnOperationSelectedChanged.UniqueID %>";

    var liOperations = $("#<%=liOperations.ClientID %>");

    var imgOperations1 = $("#<%=imgOperations1.ClientID %>");
    var projId = "<%=ConfigurationManager.AppSettings["projectId"].ToString() %>";

    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        InitSlides();
    });

    InitSlides = function () {
    }

    $(document).ready(function () {
    /* InitSlides(); */
        $("img").each(function () {
            if ($(this).attr("alt") === undefined) {
                $(this).attr("alt", "");
            }
        });
    });


</script>
<script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("beneficiary-1.0.js".ResolveJsUrl("Services"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
