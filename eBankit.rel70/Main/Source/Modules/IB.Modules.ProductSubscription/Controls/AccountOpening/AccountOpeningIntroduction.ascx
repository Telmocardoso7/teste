<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AccountOpeningIntroduction.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Controls.AccountOpening.AccountOpeningIntroduction" %>

<%@ Register TagPrefix="it" Namespace="eBankit.UI.Modules.Web.ProductSubscription.Orchestration.BaseControls.DocumentList" Assembly="eBankit.UI.Modules.Web.ProductSubscription" %>

<div class="new-ui">
    <div id="divRightTransaction" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-left clearPadding" runat="server">
        <div class="header-container">
            <div class="bs-reduced metro">
                <span>
                    <div class="fullWidth spacer10"></div>
                    <hgroup class="title">
                        <h3 class="head head-top" title="" style="display: table;">
                            <asp:Literal ID="titleContainer" Text="<%$FrontEndResources:AccountOpening,MainTitle %>" runat="server"></asp:Literal>
                        </h3>
                    </hgroup>
                    <div class="clearBoth"></div>
                </span>
            </div>
        </div>

        <section class="ao-introduction-section">
            <div class="bs-head-metro ">
                <h3 class="head">
                    <asp:Label Text="<%$FrontEndResources:AccountOpening,SelectedProductTitle%>" runat="server" />
                </h3>

                <div id="productItem" class="col-xs-12 no-padding product-item-container" runat="server">
                    <div class="col-xs-12 clearPadding product-list-item">
                        <div class="col-xs-12 product-item-content">
                            <h3 class="col-xs-12 col-sm-8">
                                <asp:Literal ID="ltrProductTitle" Text="<%$FrontEndResources:AccountOpening,ProductListPlaceholderTitle%>" runat="server"></asp:Literal></h3>
                            <span class="col-xs-12 col-sm-8">
                                <asp:Literal ID="ltrProductDescription" Text="<%$FrontEndResources:AccountOpening,ProductListPlaceholderDescription%>" runat="server"></asp:Literal></span>
                            <div class="col-xs-12 col-sm-8 btn-more product-conditions-link">
                                <asp:LinkButton ID="btnChangeProduct" runat="server" Text="<%$FrontEndResources:AccountOpening,ChangeProductBtn %>"></asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div id="beforeStartConainer" class="before-start-conainer" visible="false" runat="server">
                <h3>
                    <asp:Literal ID="beforeStartTitle" Text="<%$FrontEndResources:AccountOpening,BeforeStartTitle %>" runat="server" />
                </h3>

                <p>
                    <asp:Literal ID="beforeStartSubTitle" Text="<%$FrontEndResources:AccountOpening,BeforeStartSubTitle %>" runat="server" />
                </p>

                <p>
                    <asp:Literal ID="Literal1" Text="<%$FrontEndResources:AccountOpening,BeforeStartDescription %>" runat="server" />
                </p>

                <it:documentrepeater id="documentsContainer" readonly="true" runat="server">
                <FooterTemplate>
                    <hr />
                </FooterTemplate>
            </it:documentrepeater>
            </div>

            <div class="btn-actions-orchestrator-container">
                <div class="btn-action-orchestrator-container" runat="server">
                    <asp:LinkButton ID="Cancel" CssClass="btn_action_3 btn-action-orchestrator" Text="<%$FrontEndResources:AccountOpening,CancelButton %>" runat="server" />
                </div>
                <div class="btn-action-orchestrator-container" runat="server">
                    <asp:LinkButton ID="Start" CssClass="btn_action_1 btn-action-orchestrator" Text="<%$FrontEndResources:AccountOpening,StartButton %>" runat="server" />
                </div>
            </div>
        </section>
    </div>
</div>
