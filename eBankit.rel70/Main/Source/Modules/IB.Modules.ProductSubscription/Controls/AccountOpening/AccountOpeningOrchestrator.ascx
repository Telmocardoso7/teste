<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AccountOpeningOrchestrator.ascx.cs" Inherits="eBankit.UI.Modules.Web.ProductSubscription.Controls.AccountOpening.AccountOpeningOrchestrator" %>

<div class="new-ui">
    <div id="divRightTransaction" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-left clearPadding" runat="server">
        <div class="header-container">
            <div class="bs-reduced metro">
                <span>
                    <div class="fullWidth spacer10"></div>
                    <hgroup class="title">
                        <h3 class="head head-top" title="" style="display: table;">
                            <asp:Literal ID="titleContainer" runat="server"></asp:Literal>
                        </h3>
                    </hgroup>
                    <div class="clearBoth"></div>
                </span>
            </div>
            <div>
                <it:ps_breadcrumbscontrol id="breadcrumbs" resources="true" displaymode="3" cssclasses="breadcrumbs-normal" runat="server" />
            </div>
        </div>
    </div>

    <it:ps_outputmessagecontrol id="outputMessage" runat="server" />

    <asp:Panel runat="server" ID="AccountOpeningOrchestratorMain">
        <div id="StepContainer" runat="server">
            <asp:PlaceHolder ID="stepPlaceholder" runat="server"></asp:PlaceHolder>
        </div>

        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-left clearPadding">
            <asp:PlaceHolder ID="phDocuments" runat="server">
                <it:ps_documentlistcontrol id="documentContainer" runat="server" />
            </asp:PlaceHolder>
        </div>

        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max col-left clearPadding">
            <div>
                <it:ps_actioncontainercontrol id="actionContainer" runat="server" />
            </div>
        </div>
    </asp:Panel>
</div>
