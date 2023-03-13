<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01703_01.ascx.cs" Inherits="TRX01703_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>
<div id="divContent" runat="server" class="transaction-content">
    <div class="panel panel-detail">
        <div>
            <div id="divSearchCriteria" runat="server">
                <div class="metro" style="margin-left: 0px;">
                    <div class="panel" data-role="panel" id="divFilter" style="border: none; margin-bottom: 0px;">
                        <div class="listHeader">
                            <div class="col-lg-8 col-max panel-header panel-header-3">
                                <asp:Literal ID="Literal1" Text="<%$FrontEndResources:TRX01703,Search%>" runat="server"></asp:Literal>
                                <div class="img-search-panel">
                                    <img onclick="$('.panel-search').slideToggle();" src="<%$ebFile:~/Content/currenttheme/images/products/ico_search_transactions.png%>" style="margin-top: -12px;" runat="server" alt="search" />
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8 col-max panel-content panel-search" style="background-color: rgb(247, 246, 246);">
                            <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9 search-term">
                                <it:TextBoxControl_v2 ID="txtTerm" MaxLength="250" Label="<%$FrontEndResources:TRX01703,term%>" runat="server" />

                            </div>
                            <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3 text-right">
                                <asp:Button ID="linkSearch" ActionType="Conclusion" CssClass="btn btn-primary btn-margin" Text="<%$FrontEndResources:TRX00701,btnSearch %>" Style="color: #fff; padding: 10px; font-size: 15px; padding-left: 20px; padding-right: 20px;" runat="server" OnClick="ClickSearch" OnClientClick="return FilterSearch();" />
                            </div>

                            <div class="clearBoth"></div>
                        </div>
                    </div>
                </div>
                <div class="clearBoth"></div>
            </div>
        </div>
    </div>

    <asp:Panel ID="pnControls" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" runat="server">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div style="margin-top: 40px;">
                    <it:FlowContainer ID="FlowContainer1" HideTitle="true" runat="server">

                        <div class="col-lg-8 col-max">
                            <div>
                                <%--Categories--%>
                                <div class="col-xs-3 col-sm-3 col-md-3 col-lg-3 faq-tabs">
                                    <asp:Repeater ID="rptFaqCategories" runat="server" OnItemDataBound="RepeaterCategoryItemDataBound">
                                        <HeaderTemplate>
                                            <ul class="nav nav-tabs" role="tablist">
                                        </HeaderTemplate>



                                        <ItemTemplate>
                                            <li <%# Container.ItemIndex == 0 ? "class=\"active\"" : "" %>><a id="navCategory-<%# Container.ItemIndex %>" data-toggle="tab" href="#category-<%# Container.ItemIndex %>" data-category-index="<%# Container.ItemIndex %>"><%# Eval("CategoryDescription") %>
                                                <asp:Label ID="lblCount" runat="server" /></a></li>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </ul>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </div>
                                <%--Questions--%>
                                <div class="col-xs-9 col-sm-9 col-md-9 col-lg-9 clearPadding">
                                    <div class="faq-content tab-content">
                                        <asp:Repeater ID="rptFaqCategoriesSecond" runat="server" OnItemDataBound="RepeaterCategorySecItemDataBound">
                                            <HeaderTemplate>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <div class="tab-pane faq-panel <%# Container.ItemIndex == 0 ? "active" : "" %>" id="category-<%# Container.ItemIndex %>">
                                                    <div class="panel-group" id="accordion-category-<%# Container.ItemIndex %>">
                                                        <asp:Repeater ID="rptQuestions" runat="server" OnItemDataBound="RepeaterQuestionsItemDataBound">
                                                            <HeaderTemplate>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <div id="panel-default-<%# ((RepeaterItem)Container.Parent.Parent).ItemIndex %>-<%# Container.ItemIndex %>" class="panel panel-default">
                                                                    <div class="panel-heading">
                                                                        <h4 class="panel-title">
                                                                            <a data-toggle="collapse" id="accordion-category-<%# ((RepeaterItem)Container.Parent.Parent).ItemIndex %>-<%# Container.ItemIndex %>" data-category-index="<%# ((RepeaterItem)Container.Parent.Parent).ItemIndex %>" data-article-index="<%# Container.ItemIndex %>" data-parent="#accordion-category-<%# ((RepeaterItem)Container.Parent.Parent).ItemIndex %>" href="#collapse-<%# ((RepeaterItem)Container.Parent.Parent).ItemIndex %>-<%# Container.ItemIndex %>" class="collapsed">

                                                                                <asp:RadioButton ID="rbId" runat="server" CssClass="group" GroupName="ListQuestionIds" value='<%# DataBinder.Eval(Container.DataItem, "QuestionId")%>' />

                                                                                <span class="article-title-content">

                                                                                    <%# Eval("Question") %></span>

                                                                                <span class=""></span>

                                                                            </a>
                                                                        </h4>
                                                                    </div>
                                                                    <div id="collapse-<%# ((RepeaterItem)Container.Parent.Parent).ItemIndex %>-<%# Container.ItemIndex %>" class="panel-collapse collapse">
                                                                        <div class="panel-body">
                                                                            <div class=" textandtitle_container">
                                                                                <div class="textandtitle_textcontent size-medium">
                                                                                    <p><%# Eval("Response") %></p>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <hr>
                                                                </div>
                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                            </FooterTemplate>
                                                        </asp:Repeater>
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                <asp:Label ID="lblEmptyData" runat="server" Visible='<%# ((Repeater)Container.NamingContainer).Items.Count == 0 %>' Text="<%$FrontEndResources:Helpdesk,NoDataFound%>" />
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </it:FlowContainer>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

        <div class="clearBoth"></div>
    </asp:Panel>
    <script type="text/javascript">
        var idg = '<%=this.CurrentContext.SessionGUID %>';
        var interactionid = '<%=this.CurrentContext.InteractionContext.Interaction.InteractionId %>';

        FilterSearch = function () {
            return $("#aspnetForm").valid();
        };

        $(document).ready(function () {
            $("#FlowInnerContainer2").removeAttr('class');


            var hPanel = $(".panel-content");
            if (hPanel) {
                hPanel.hide();
            }

            // Search validation
            jQuery.validator.setDefaults({
                focusInvalid: false,
                onfocusout: false
            });
        });
    </script>
    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01703-1.0.js".ResolveJsUrl("Services/Transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>
    <link rel="stylesheet" type="text/css" href="<%= eBankit.Common.Sites.Utils.GetCacheVersion("TRX01703-1.0.css".ResolveCssUrl("services/transactions"), eBankit.Common.Sites.Utils.CacheVersionKey.CStyleSheet) %>" />
</div>
