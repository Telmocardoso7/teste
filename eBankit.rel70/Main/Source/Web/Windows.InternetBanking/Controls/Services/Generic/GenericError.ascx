<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="GenericError.ascx.cs" Inherits="GenericError" %>

<asp:Panel ID="pnControls" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" runat="server">
    <it:FlowInnerContainer CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
        <section class="grayContainer content-message metro">
            <div class="col-lg-8 col-max">
                <div class="alert-danger fade in col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                    <div class="div-icon-danger_v2"></div>
                    <h4 class="head-error" style="font-size: 17px;">
                        <asp:Literal ID="litTitleWarning" Text="<%$FrontEndResources:ErroPage,GenericMessageNew2 %>" runat="server"></asp:Literal>
                    </h4>
                    <h3 style="font-size: 15px;">
                        <asp:Literal ID="Literal2" Text="<%$FrontEndResources:ErroPage,SubMessage %>" runat="server"></asp:Literal></h3>
                </div>
            </div>
        </section>
    </it:FlowInnerContainer>
    <div class="clearBoth"></div>
</asp:Panel>
<div class="clearBoth"></div>

