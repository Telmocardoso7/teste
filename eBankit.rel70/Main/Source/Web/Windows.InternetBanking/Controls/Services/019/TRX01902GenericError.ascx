<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX01902GenericError.ascx.cs" Inherits="TRX01902GenericError" %>

<asp:Panel ID="pnControls" CssClass="col-xs-12 col-sm-12 col-md-12 col-lg-12 clearPadding" runat="server">
    <it:FlowInnerContainer CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" runat="server">
        <section class="grayContainer grayContainerWarning content-message metro">
            <div class="col-lg-12 col-max">
                 <div class="alert-danger fade in col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max">
                    <div class="div-icon-danger_v2"></div>
                    <h4 class="head-error" style="font-size: 17px;">
                        <asp:Literal ID="litTitleWarning" Text="<%$FrontEndResources:TRX01902,ErrorPageGenericMessageNew2 %>" runat="server"></asp:Literal>
                    </h4>
                     <span id="spanErrorDesc" runat="server"></span>
                  
                     <h3 style="font-size: 15px;">
                         <asp:Literal ID="Literal1" Text="<%$FrontEndResources:TRX01902,RedirectErrorMessage %>" runat="server"></asp:Literal>
                     </h3>
                </div>
            </div>
        </section>
    </it:FlowInnerContainer>
    <div class="clearBoth"></div>
</asp:Panel>
<div class="clearBoth"></div>
<style>
    .grayContainerWarning {
        height: 150px;
    }
</style>


