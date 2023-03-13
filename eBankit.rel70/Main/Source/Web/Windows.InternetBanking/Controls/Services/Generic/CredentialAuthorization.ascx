<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CredentialAuthorization.ascx.cs" Inherits="CredentialAuthorization" %>


<div id="divContent" runat="server" class="transaction-content">
    <link id="hdCustomCss" runat="server" visible="false" rel="stylesheet" type="text/css" />
    <section class="content-message metro" style="background-color: #FBB040;">
        <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max clearPadding" style="position: static !important;">
            <div class="alert alert-warning_v2 fade in" id="MainContent_TransactionMainContent_divMessage" style="width: inherit;">
                <h4 class="alert-heading div-warning_v2">
                    <asp:Literal ID="litCredentialTitle" Text="<%$FrontEndResources:CredentialAuthorization,CredentialTitle%>" runat="server"></asp:Literal>
                </h4>
                <div class="clearBoth"></div>
            </div>
        </div>
    </section>

    <div class="clearBoth"></div>

    <it:FlowInnerContainer ID="flwCrdAuthenticationContainer" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction head-credential" Title="<%$FrontEndResources:otp,confirmation %>" runat="server">
        <div>
            <div id="containerPositionsTitle" class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max" style="position: static !important;" runat="server">
                <it:FlowInnerContainer ID="FlowInnerContainer2" CustomCssClass="col-max bs-reduced bs-inner-border" HideTitle="true" runat="server">
                    <div>
                        <section id="Section1" class="credential">
                            <h3 class="alert-heading">
                                <asp:Literal ID="litAlertTitle" Text="<%$GenericFrontEndResources:AttentionTitle%>" runat="server"></asp:Literal></h3>
                            <p style="font-size: 14px; color: #636363">
                                <asp:Literal ID="Literal2" Text="<%$FrontEndResources:CredentialNoAuthorization,NoCredentialMessage %>" runat="server"></asp:Literal>
                            </p>
                            <div class="clearBoth"></div>
                        </section>
                    </div>
                    <div class="clearBoth"></div>
                </it:FlowInnerContainer>
                <div class="clearBoth"></div>
            </div>
            <div class="clearBoth"></div>
            <div id="tabcontentinfo" runat="server">
                <div class="panel-info metro panel-line-info no-info-img" style="position: inherit;">
                    <asp:Literal ID="Literal1" Text="<%$FrontEndResources:CredentialAuthorization,TabContentInfo%>" runat="server"></asp:Literal>
                </div>
            </div>
            <div class="clearBoth"></div>

            <div id="containerPositions" style="background-color: transparent;" runat="server">
                <div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max padding: 0px; " style="position: static !important;">
                    <it:FlowInnerContainer ID="FlowInnerContainer3" CustomCssClass="col-max bs-reduced bs-head-metro bs-reduced-transaction head-credential" Title="<%$FrontEndResources:CredentialAuthorization,PositionsInfo %>" runat="server">
                        <div>
                            <section id="authentFormPassword" class="credential metro" runat="server">
                                <it:FlowInnerContainer ID="flHeaderTitle" CustomCssClass="col-max no-border" Title="" runat="server">
                                    <div class="items">
                                        <div class="item" style="width: 150px;">
                                            <asp:Label ID="lblPosition_1" CssClass="req" AssociatedControlID="txtPosition_1" runat="server"></asp:Label>
                                            <it:TextBoxControl ID="txtPosition_1" ValidationRequiredMessage=" " ShowLabel="false" IsRequired="true" Width="50px" TextMode="Password" MaxLength="1" runat="server"></it:TextBoxControl>
                                        </div>
                                        <div class="item" style="width: 150px;">
                                            <asp:Label ID="lblPosition_2" CssClass="req" AssociatedControlID="txtPosition_2" runat="server"></asp:Label>
                                            <it:TextBoxControl ID="txtPosition_2" ValidationRequiredMessage=" " ShowLabel="false" IsRequired="true" Width="50px" TextMode="Password" MaxLength="1" runat="server"></it:TextBoxControl>
                                        </div>
                                        <div class="item" style="width: 150px;">
                                            <asp:Label ID="lblPosition_3" CssClass="req" AssociatedControlID="txtPosition_3" runat="server"></asp:Label>
                                            <it:TextBoxControl ID="txtPosition_3" ValidationRequiredMessage=" " ShowLabel="false" IsRequired="true" Width="50px" TextMode="Password" MaxLength="1" runat="server"></it:TextBoxControl>
                                        </div>
                                        <div class="item" style="width: 150px;">
                                            <asp:Label ID="lblPosition_4" CssClass="req" AssociatedControlID="txtPosition_4" runat="server"></asp:Label>
                                            <it:TextBoxControl ID="txtPosition_4" ValidationRequiredMessage=" " ShowLabel="false" IsRequired="true" Width="50px" TextMode="Password" MaxLength="1" runat="server"></it:TextBoxControl>
                                        </div>
                                    </div>
                                </it:FlowInnerContainer>
                                <div class="clearBoth"></div>
                            </section>
                            <div class="clearBoth"></div>
                        </div>
                    </it:FlowInnerContainer>
                    <div class="clearBoth"></div>
                </div>
            </div>

            <div class="clearBoth"></div>


            <div id="divErrorPassword" class="panel-error hidden-panel">
                <asp:Label ID="lblPasswordError" Text="<%$FrontEndResources:CredentialAuthorization,SendPasswordErrorMsg%>" runat="server"></asp:Label>
            </div>

            <div id="containerMatrixCard" style="background-color: transparent;" runat="server">
                <div id="divMatrixCard" class="panel-heading ebankit-pointer-text clearPadding" runat="server">
                    <span class="metro" style="padding-left: 10px;">
                        <i id="collapseMatrixCardIcon" class="icon-down-arrow"></i>
                        <asp:Literal ID="lblMatrixCard" Text="<%$FrontEndResources:CredentialAuthorization,lblMatrixCard%>" runat="server" /></span>
                    <div class="clearBoth"></div>
                </div>

                <div id="collapseMatrixCard" hidden="hidden" runat="server">
                    <div class="panel-body row" style="padding-top: 10px;">

                        <div class="panel-info metro panel-line-info no-info-img" style="position: inherit;">
                            <asp:Literal ID="litPositionsInfo" Text="<%$FrontEndResources:CredentialAuthorization,PositionsInfo%>" runat="server"></asp:Literal>
                        </div>

                        <section id="authentFormMatrix" class="credential metro" runat="server">
                            <it:FlowInnerContainer ID="FlowInnerContainer4" CustomCssClass="no-border col-xs-12 col-sm-11 col-md-11 col-lg-9 col-centered" Title="" runat="server">

                                <div class="col-xs-12 col-sm-7 col-md-7 col-lg-6">
                                    <table class="pos-table metro">
                                        <thead>
                                            <tr>
                                                <th><span>&nbsp;</span></th>
                                                <th><span>1</span></th>
                                                <th><span>2</span></th>
                                                <th><span>3</span></th>
                                                <th><span>4</span></th>
                                                <th><span>5</span></th>
                                                <th><span>6</span></th>
                                                <th><span>7</span></th>
                                                <th class="pos-last-col"><span>8</span></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td class="pos-left"><span>A</span></td>
                                                <td id="pA1"><span></span></td>
                                                <td id="pA2"><span></span></td>
                                                <td id="pA3"><span></span></td>
                                                <td id="pA4"><span></span></td>
                                                <td id="pA5"><span></span></td>
                                                <td id="pA6"><span></span></td>
                                                <td id="pA7"><span></span></td>
                                                <td id="pA8"><span></span></td>
                                            </tr>
                                            <tr>
                                                <td class="pos-left"><span>B</span></td>
                                                <td id="pB1"><span></span></td>
                                                <td id="pB2"><span></span></td>
                                                <td id="pB3"><span></span></td>
                                                <td id="pB4"><span></span></td>
                                                <td id="pB5"><span></span></td>
                                                <td id="pB6"><span></span></td>
                                                <td id="pB7"><span></span></td>
                                                <td id="pB8"><span></span></td>
                                            </tr>
                                            <tr>
                                                <td class="pos-left"><span>C</span></td>
                                                <td id="pC1"><span></span></td>
                                                <td id="pC2"><span></span></td>
                                                <td id="pC3"><span></span></td>
                                                <td id="pC4"><span></span></td>
                                                <td id="pC5"><span></span></td>
                                                <td id="pC6"><span></span></td>
                                                <td id="pC7"><span></span></td>
                                                <td id="pC8"><span></span></td>
                                            </tr>
                                            <tr>
                                                <td class="pos-left"><span>D</span></td>
                                                <td id="pD1"><span></span></td>
                                                <td id="pD2"><span></span></td>
                                                <td id="pD3"><span></span></td>
                                                <td id="pD4"><span></span></td>
                                                <td id="pD5"><span></span></td>
                                                <td id="pD6"><span></span></td>
                                                <td id="pD7"><span></span></td>
                                                <td id="pD8"><span></span></td>
                                            </tr>
                                            <tr>
                                                <td class="pos-left"><span>E</span></td>
                                                <td id="pE1"><span></span></td>
                                                <td id="pE2"><span></span></td>
                                                <td id="pE3"><span></span></td>
                                                <td id="pE4"><span></span></td>
                                                <td id="pE5"><span></span></td>
                                                <td id="pE6"><span></span></td>
                                                <td id="pE7"><span></span></td>
                                                <td id="pE8"><span></span></td>
                                            </tr>
                                            <tr>
                                                <td class="pos-left"><span>F</span></td>
                                                <td id="pF1"><span></span></td>
                                                <td id="pF2"><span></span></td>
                                                <td id="pF3"><span></span></td>
                                                <td id="pF4"><span></span></td>
                                                <td id="pF5"><span></span></td>
                                                <td id="pF6"><span></span></td>
                                                <td id="pF7"><span></span></td>
                                                <td id="pF8"><span></span></td>
                                            </tr>
                                            <tr>
                                                <td class="pos-left"><span>G</span></td>
                                                <td id="pG1"><span></span></td>
                                                <td id="pG2"><span></span></td>
                                                <td id="pG3"><span></span></td>
                                                <td id="pG4"><span></span></td>
                                                <td id="pG5"><span></span></td>
                                                <td id="pG6"><span></span></td>
                                                <td id="pG7"><span></span></td>
                                                <td id="pG8"><span></span></td>
                                            </tr>
                                            <tr>
                                                <td class="pos-left pos-last-row"><span>H</span></td>
                                                <td id="pH1"><span></span></td>
                                                <td id="pH2"><span></span></td>
                                                <td id="pH3"><span></span></td>
                                                <td id="pH4"><span></span></td>
                                                <td id="pH5"><span></span></td>
                                                <td id="pH6"><span></span></td>
                                                <td id="pH7"><span></span></td>
                                                <td id="pH8"><span></span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>

                                <div class="col-xs-12 col-sm-5 col-md-5 col-lg-6">
                                    <div class="item">
                                        <it:TextBoxControl ID="lblPositionMatrix_1" ValidationRequiredMessage=" " IsRequired="true" Width="10px" TextMode="Password" MaxLength="1" runat="server"></it:TextBoxControl>
                                    </div>
                                    <div class="item">
                                        <it:TextBoxControl ID="lblPositionMatrix_2" ValidationRequiredMessage=" " IsRequired="true" Width="10px" TextMode="Password" MaxLength="1" runat="server"></it:TextBoxControl>
                                    </div>
                                    <div class="item">
                                        <it:TextBoxControl ID="lblPositionMatrix_3" ValidationRequiredMessage=" " IsRequired="true" Width="10px" TextMode="Password" MaxLength="1" runat="server"></it:TextBoxControl>
                                    </div>
                                </div>
                                <div style="clear: both;"></div>
                            </it:FlowInnerContainer>
                        </section>
                        <br />
                        <div class="panel-info metro panel-line-info no-info-img" style="position: inherit;">
                            <asp:Label ID="lblAttention" CssClass="panel-line-info-alert" Text="<%$GenericFrontEndResources:AttentionTitle%>" runat="server"></asp:Label>
                            <asp:Label ID="Literal3" Text="<%$FrontEndResources:CredentialAuthorization,PositionsInfo2%>" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>

            <div id="divErrorPositions" class="panel-error hidden-panel">
                <asp:Label ID="lblPositionsError" Text="<%$FrontEndResources:CredentialAuthorization,SendPositionErrorMsg%>" runat="server"></asp:Label>
            </div>

            <div id="containerHardToken" style="background-color: transparent;" runat="server" visible="false">
                <div id="divHardToken" class="panel-heading ebankit-pointer-text clearPadding" runat="server">
                    <span class="metro" style="padding-left: 10px;">
                        <i id="collapseHardTokenIcon" class="icon-down-arrow"></i>
                        <asp:Literal ID="lblHardToken" Text="<%$FrontEndResources:CredentialAuthorization,lblHardToken%>" runat="server" /></span>
                    <div class="clearBoth"></div>
                </div>
                <div id="collapseHardToken" runat="server">
                    <div class="panel-body row" style="padding-top: 10px;">

                        <div class="panel-info metro panel-line-info no-info-img" style="position: inherit; margin-bottom: 20px;">
                            <asp:Label ID="lblHardTokenMessage" Text="<%$FrontEndResources:CredentialAuthorization,HardTokenMessage%>" runat="server"></asp:Label>
                            <asp:Label ID="lblHardTokenAlert" CssClass="panel-line-info-alert" Text="<%$FrontEndResources:CredentialAuthorization,HardTokenAlert %>" runat="server"></asp:Label>
                        </div>

                        <section id="authentFormHardToken" class="sms-token metro" runat="server">
                            <it:FlowInnerContainer ID="FlowInnerContainer5" CustomCssClass="col-max no-border col-xs-9 col-sm-5 col-md-5 col-lg-4 col-centered" Title="" runat="server">
                                <it:TextBoxControl ID="txtHardToken" ShowLabel="false" MinLength="5" IsRequired="true" TextMode="Password" CssClass="field field-reg field-smsToken" runat="server" Watermark="<%$FrontEndResources:CredentialAuthorization,HardToken %>" />
                            </it:FlowInnerContainer>
                        </section>
                        <div class="clearBoth"></div>
                    </div>
                </div>
            </div>
            <div id="divErrorHardToken" class="panel-error hidden-panel">
                <asp:Label ID="lblHardTokenError" Text="<%$FrontEndResources:CredentialAuthorization,RequestHardTokenErrorMsg%>" runat="server"></asp:Label>
            </div>

            <div id="containerSmsToken" style="background-color: transparent;" runat="server">
                <div id="divSmsToken" class="panel-heading ebankit-pointer-text clearPadding" runat="server">
                    <span class="metro" style="padding-left: 10px;">
                        <i id="collapseSmsTokenIcon" class="icon-down-arrow"></i>
                        <asp:Literal ID="lblSmsToken" Text="<%$FrontEndResources:otp,identity%>" runat="server" /></span>
                    <div class="clearBoth"></div>
                </div>

                <div id="collapseSmsToken" hidden="hidden" runat="server">
                    <div class="panel-body row" style="padding-top: 10px;">

                        <div class="panel-info metro panel-line-info no-info-img" style="position: inherit; margin-bottom: 20px;">
                            <asp:Label ID="lblSmsTokenMessage" Text="<%$FrontEndResources:otp,description%>" runat="server"></asp:Label>
                        </div>

                        <section id="authentFormSMS" class="metro field field_v2 break" runat="server">
                            <it:FlowInnerContainer ID="FlowInnerContainer1" CustomCssClass="col-max no-border col-xs-9 col-sm-5 col-md-5 col-lg-4 col-centered" Title="" runat="server">
                                <it:TextBoxControl_v2 ID="txtSMSToken" ShowLabel="true" MinLength="5" ShowRequired="true" IsRequired="true" TextMode="Password" CssClass="field field-reg" runat="server" Label="<%$FrontEndResources:otp,code %>"  ValidationRequiredMessage="<%$FrontEndResources:otp,txtSMSTokenRequiredMessage %>" />
                            </it:FlowInnerContainer>
                        </section>
                        <div class="clearBoth"></div>
                        <br />
                        <br />
                        <br />
                        <div class="panel-info metro panel-line-info no-info-img" style="position: inherit; margin-bottom: 20px;">
                            <asp:Label ID="Label1" Text="<%$FrontEndResources:otp,resend1%>" runat="server"></asp:Label>
                            <asp:Label ID="Label2" Style="font-size: 15px !important" Font-Bold="true" CssClass="panel-line-info-alert resend-msg" Text="<%$FrontEndResources:otp,resend2 %>" runat="server"></asp:Label>
                        </div>
                    </div>

                    <div id="containerDeliveryType" class="js-deliveryType-container field field_v2 metro break" style="display: none;">
                        <div class="col-md-12 text-center modal-subtitle-textarea" >
                            <span><asp:Literal ID="DeliveryTypeTxt" Text="<%$FrontEndResources:CredentialAuthorization,OTPDeliveryTypeTxt%>" runat="server" /></span>
                        </div>
                        <div class="clearBoth"></div>
                        <it:DropDownListControl_v2 ID="ddlOTPDeliveryTypeInput" CssClass="field field_v2 metro break js-deliveryType-dropdown"
                            IsRequired="True" runat="server" Label="<%$FrontEndResources:CredentialAuthorization,OTPDeliveryTypeInput%>" />
                    </div>

                    <input id="hdnAccessCodeDeliveryType" type="hidden" value="" class="js-deliveryType-value" runat="server" />
                </div>
            </div>

            <div id="divErrorSMS" class="panel-error hidden-panel">
                <asp:Label ID="lblSMSError" Text="<%$FrontEndResources:CredentialAuthorization,SendSMSErrorMsg%>" runat="server"></asp:Label>
            </div>
            <div class="clearBoth"></div>

            <div id="containerThirdParty" style="background-color: transparent;" runat="server" visible="False">
            </div>
        </div>
    </it:FlowInnerContainer>

    <div style="display: block; margin-bottom: 20px;"></div>
    <asp:HiddenField ID="hdnGetPositions" runat="server" />
    <asp:Button ID="btnSendSMS" UseSubmitBehavior="false" Style="display: none;" runat="server" />
    <asp:Button ID="btnRequestToken" UseSubmitBehavior="false" Style="display: none;" runat="server" />
    <asp:HiddenField ID="hdnShowSMSPanel" Value="0" runat="server" />
    <asp:HiddenField ID="hdnShowHardTokenPanel" Value="0" runat="server" />

    <script type="text/javascript" src="<%= eBankit.Common.Sites.Utils.GetCacheVersion("/Scripts/Services/Generic/CredentialAuthorization.js", eBankit.Common.Sites.Utils.CacheVersionKey.JScript) %>"></script>

    <div class="clearBoth"></div>
</div>

