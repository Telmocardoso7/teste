<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PhoneOperatorsControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.PhoneOperatorsControl" %>



<style type="text/css">
    .operatorContent {
        position: relative;
        width: 111px;
        height: 111px;
        background-repeat: no-repeat;
        border: 4px solid transparent;
    }

    .scrollContainerOperators .operatorContent.selected {
        /*border: 4px #41b063 solid;*/
        border-color: #41b063;
    }

    .scrollContainerOperators .operatorContent.selected:after {
        position: absolute;
        display: block;
        border-top: 28px solid #41b063;
        border-left: 28px solid transparent;
        right: 0;
        content: "";
        top: 0;
        z-index: 101;
    }

    .scrollContainerOperators .operatorContent.selected:before {
        position: absolute;
        display: block;
        content: "\e08a";
        color: #fff;
        right: 0;
        font-family: iconFont;
        font-size: 9pt;
        font-weight: normal;
        z-index: 102;
        top: 0;
    }


.scrollContainerOperators .bx-wrapper .bx-controls-direction a {
	margin-top: -36px;
}


    /*.metro .operatorContent.selected:after {
        position: absolute;
        display: block;
        border-top: 28px solid #6FB1C7;
        border-left: 28px solid transparent;
        right: 0;
        content: "";
        top: 0;
        z-index: 101;
    }

    .metro .operatorContent.selected:before {
        position: absolute;
        display: block;
        content: "\e08a";
        color: #fff;
        right: 0;
        font-family: iconFont;
        font-size: 9pt;
        font-weight: normal;
        z-index: 102;
        top: 0;
    }*/


    .scrollContainerOperators .bx-viewport {
        left: 0px;
        height: 151px !important;
    }

    .neg-bot-text {
        position :absolute;
        bottom: -44px;
        width:100%;
        text-align: center;
        text-wrap: normal;
        display: block;
        height:40px;
    }
</style>




<div id="divContainerOperators" class="scrollContainerOperators fullWidth" style="overflow: hidden;">
<%--    <asp:UpdatePanel ID="flwContainerOperators" runat="server">
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="btnSelectedOperatorChanged" />
        </Triggers>
        <ContentTemplate>--%>
            <ul class="bxslider">
                <asp:Repeater ID="rptPhoneOperators" runat="server" OnItemDataBound="rptPhoneOperators_ItemDataBound">
                    <ItemTemplate>
                        <li>
                            <div id="divOperator" class="operatorContent" runat="server">
                                <asp:Label ID="lblOperatorName" CssClass="neg-bot-text" runat="server" />
                            </div>
                        </li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>

            <div id="divOtherOperator" class="operatorContent clearBoth" runat="server" style="background-image: url('/Content/images/phoneOperators/operator_2.png'); margin-top: 15px; margin-bottom: 40px; display: none;" onclick="eBankit.Presentation.PhoneOperatorsControl.AccClk('other');">
                <asp:Label ID="lblOtherOperatorName" CssClass="neg-bot-text" runat="server" />
            </div>
<%--        </ContentTemplate>
    </asp:UpdatePanel>--%>
</div>


<asp:HiddenField ID="hdnOperatorsArray" runat="server" />
<asp:HiddenField ID="hdnSelectedOperatorId" runat="server" />
<asp:HiddenField ID="hdnSelectedOperator" runat="server" />
<asp:HiddenField ID="hdnSelectedCurrentOperator" runat="server" />

<asp:HiddenField ID="hdnScrollContentLenght" runat="server" />
<asp:Button ID="btnSelectedOperatorChanged" runat="server" CausesValidation="false" CssClass="hidden" />



<script type="text/javascript">

    eBankit.Presentation.PhoneOperatorsControl = {}

    eBankit.Presentation.PhoneOperatorsControl.AccClk = function (operatorId) {
        //
        var hdnSelectedOperator = $("#<%=hdnSelectedOperatorId.ClientID %>");
        var btnSelectedOperatorChangedID = "<%=btnSelectedOperatorChanged.UniqueID %>";
        hdnSelectedOperator.val(operatorId);
        __doPostBack(btnSelectedOperatorChangedID, '');
    }

    eBankit.Presentation.PhoneOperatorsControl.ShowScroll = function () {
        //
    }

    eBankit.Presentation.PhoneOperatorsControl.CloseSelector = function () {
        var hPanel = $("#pnSelectHeader");
        if (hPanel) {
            setTimeout(function () {
                hPanel.click();
            }, 1);
        }
    }

    //METRO_AUTO_REINIT = true;

    $(function () {
        eBankit.Presentation.PhoneOperatorsControl.CloseSelector();

        $('#scroolContent').mousewheel(function (event, delta) {
            this.scrollLeft -= (delta * 30);
            event.preventDefault();
        });
    });


    //$(document).ready(function () {

    //    $('#flwContainerOperators .bxslider').bxSlider({
    //        minSlides: 1,
    //        maxSlides: 8,
    //        slideWidth: 111,
    //        infiniteLoop: false,
    //        hideControlOnEnd: true,
    //        slideMargin: 32
    //    });
    //});


    METRO_AUTO_REINIT = true;

    eBankit.Presentation.PhoneOperatorsControl.LoadSlider = function () {
        $('#divContainerOperators .bxslider').bxSlider({
            minSlides: 1,
            maxSlides: 8,
            slideWidth: 111,
            infiniteLoop: false,
            hideControlOnEnd: true,
            slideMargin: 32
        });
    }

    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        eBankit.Presentation.PhoneOperatorsControl.LoadSlider();
    });

    $(document).ready(function () {
        eBankit.Presentation.PhoneOperatorsControl.LoadSlider();
    });
</script>
