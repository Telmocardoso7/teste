<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TRX03072_01.ascx.cs" Inherits="TRX03072_01" %>
<%@ Import Namespace="eBankit.Common.InternetBanking" %>


        <div id="secWarningArea" runat="server" visible="false">
            <section id="secWarning" class="section-warning content-message metro" runat="server">
                <div class="stPosition col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max clearPadding">
                    <div class="alert alert-warning_v2 fade in widthInherit">
                        <h4 class="alert-heading div-warning_v2">
                            <asp:Label ID="divGroup" runat="server" Text='<%$FrontEndResources:TRX03072,WarningMessage%>' />
                        </h4>
                        <div class="clearBoth"></div>
                    </div>
                </div>
            </section>
            <br />
        </div>
        <div class="fullWidth noFloatOfHidden landingAccountContainer clearPadding paddingTop20 paddingBottom20 bottomBorderInfoTopMessage">
            <div class="info-bottom-text col-lg-8 col-max">
                <asp:Label ID="Label2" Text="<%$FrontEndResources:TRX03072,InformativeMessage %>" CssClass="infoTopMessage" runat="server"></asp:Label>
            </div>
        </div>

        <div id="divContent" runat="server" class="transaction-content transaction-otp-delivery">
            <it:FlowInnerContainer ID="flwContainer" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction" Title="<%$FrontEndResources:TRX03072,flwData%>" runat="server">
                <div>
                    <it:FlowLabel_v3 ID="flwDeliveryType" Label="<%$FrontEndResources:TRX03072,OTPDeliveryType%>" Visible="false" runat="server" />
                    <div id="divForm" runat="server" class="field field_v2 metro break">
                        <it:DropDownListControl_v2 ID="ddlOTPDeliveryType" IsRequired="True" runat="server" Label="<%$FrontEndResources:TRX03072,OTPDeliveryType%>" />
                    </div>
                </div>
            </it:FlowInnerContainer>
            <div id="divActions" runat="server" class="trs_buttons col-lg-8 col-max">
                <it:LinkButtonControl ID="lBtnCancel" ActionType="Back" CustomCssClass="btn-default" OnClick="lBtnCancel_Click" Text="<%$FrontEndResources:TRX03072,Cancel%>" runat="server" />
                <it:LinkButtonControl ID="lBtnSubmit" ActionType="Conclusion" OnClick="lBtnSubmit_Click" Text="<%$FrontEndResources:TRX03072,Submit%>" runat="server" />
            </div>
            <div class="clearBoth"></div>
        </div>
