<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PaymentEntityControl.ascx.cs" Inherits="eBankit.UI.Web.InternetBanking.PaymentEntityControl" %>

<style type="text/css">
	.scrollContainerEntities .prodsSliderContainer {
		margin-top: 0px;
		padding-top: 40px;
	}
</style>
<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max bs-reduced bs-head-metro bs-reduced-transaction transp">
	<h3 class="head">
		<asp:Literal ID="Literal1" runat="server" Text="<%$FrontEndResources:PAYMENTCONTROL,TitleProvider%>"></asp:Literal>
	</h3>
</div>
<div class="bs-reduced bs-head-metro bs-reduced-transaction transp" id="flwProvider">
	<div class="scrollContainerEntities" id="divContainerEntities">
		<div class="favorit-top-container">
			<div class="col-xs-12 col-sm-12 col-md-10 col-lg-8 col-max prodsSliderContainer">
				<div class="slickSliderprods">
					<asp:Repeater ID="rptPaymentEntities" runat="server" OnItemDataBound="rptPaymentEntities_ItemDataBound">
						<ItemTemplate>
							<div role="button" onkeydown="eBankit.Presentation.PaymentEntityControl.KeydownHandler(this, event);" onkeyup="eBankit.Presentation.PaymentEntityControl.KeyupHandler(this, event);">
								<div id="divPaymentEntity" class="panel-item entity-img-div" runat="server">
									<div id="divPaymentEntityImage" class="entityContent no-update-selector update-products" runat="server"></div>
								<asp:Label ID="lblPaymentEntityName" CssClass="neg-bot-text" runat="server" />
								</div>								
							</div>
						</ItemTemplate>
					</asp:Repeater>
				</div>
			</div>
		</div>
	</div>
</div>

<asp:HiddenField ID="hdnSelectedPaymentEntityId" runat="server" />
<asp:HiddenField ID="hdnSelectedCurrentEntity" runat="server" />
<asp:HiddenField ID="hdnScrollContentLenght" runat="server" />
<asp:Button ID="btnSelectedEntityChanged" runat="server" CausesValidation="false" CssClass="hidden" />
<script type="text/javascript">

	eBankit.Presentation.PaymentEntityControl = {}

	eBankit.Presentation.PaymentEntityControl.AccClk = function (entityId) {
		//
		var hdnSelectedEntity = $("#<%=hdnSelectedPaymentEntityId.ClientID %>");
		var btnSelectedEntityChangedID = "<%=btnSelectedEntityChanged.UniqueID %>";
		hdnSelectedEntity.val(entityId);
		__doPostBack(btnSelectedEntityChangedID, '');
	}

	METRO_AUTO_REINIT = true;

	var prm = Sys.WebForms.PageRequestManager.getInstance();
	prm.add_endRequest(function () {
		eBankit.Presentation.PaymentEntityControl.LoadSlick();
	});

	$(document).ready(function () {
		var selected = $('.selected-item:last');
		if (selected) {
			indexTeste = selected.attr("item-index");
		}
		eBankit.Presentation.PaymentEntityControl.LoadSlick();
	});

	eBankit.Presentation.PaymentEntityControl.KeydownHandler = function (elem, event) {
        if (event.keyCode === 32) {
            event.preventDefault();
        }
        else if (event.keyCode === 13) {
            event.preventDefault();
            eBankit.Presentation.PaymentEntityControl.PaymentEntityClick(elem);
        }
    }

    eBankit.Presentation.PaymentEntityControl.KeyupHandler = function (elem, event) {
        if (event.keyCode === 32) {
            event.preventDefault();
            eBankit.Presentation.PaymentEntityControl.PaymentEntityClick(elem);
        }
    }

	eBankit.Presentation.PaymentEntityControl.PaymentEntityClick = function (elem) {
		$(elem).find('div[id*=divPaymentEntity]')[0].click();
	}


	eBankit.Presentation.PaymentEntityControl.LoadSlick = function () {
		var posSlide = 0;
		var selectorWidth = $(".prodsSliderContainer").width();
		var nElements = 7;//default

		if (selectorWidth <= 340) { nElements = 1; }
		else if (selectorWidth <= 505) { nElements = 2; }
		else if (selectorWidth <= 670) { nElements = 3; }
		else if (selectorWidth <= 835) { nElements = 4; }
		else if (selectorWidth <= 1000) { nElements = 5; }
		else if (selectorWidth <= 1165) { nElements = 6; }
		else { nElements = 7 }
		var index = 0;

		var selected = $('.selected-item:last');
		if (selected.length > 0) {
			if (selected.prop("tagName") == 'DIV' && selected.attr("item-index") != null) {
				index = selected.attr("item-index");
				posSlide = Math.floor(parseFloat(index) / nElements);

				if (!(((parseFloat(index) / nElements) % 1) > 0) && index > 0) {
					posSlide = posSlide - 1;
				}
				//alert("posSlide: " + posSlide + "\nnElements: " + nElements + "\nval: " + ((parseFloat(index) / nElements) % 1) + "\nindex: " + index + "\nvalidation: " + (((parseFloat(index) / nElements) % 1) > 0));
			}
		}

		var options = {
			minSlides: 1,
			slideWidth: 160,
            slidesToShow: nElements,
            slideMargin: 5,
            infinite: false,
            initialSlide: posSlide,
			arrows: true,
            prevArrow: '<button type="button" class="slick-prev" aria-label="Previous Slide"></button>',
            nextArrow: '<button type="button" class="slick-next" aria-label="Next Slide"></button>',
            responsive: [
                {
                    breakpoint: 1000,
                    settings: {
                        slidesToShow: 5
                    }
                }, {
                    breakpoint: 835,
                    settings: {
                        slidesToShow: 4
                    }
                }, {
                    breakpoint: 670,
                    settings: {
                        slidesToShow: 3
                    }
				}, {
                    breakpoint: 505,
                    settings: {
                        slidesToShow: 2
                    }
				}, {
                    breakpoint: 340,
                    settings: {
                        slidesToShow: 1
                    }
                }]  
		};
		var slider = $('#divContainerEntities .slickSliderprods');
		slider.slick(options);

        if (parseInt(index) > (slider.length - options.slidesToShow)) {
            var value = parseInt(index) - (options.slidesToShow - 1);
            slider.slick('slickGoTo', value, true);
        }
        else if (options.slidesToShow <= index)
            slider.slick('slickGoTo', index, true);

        slider.on('keyup', function (e) {
            if (e.keyCode === 39)//arrowright
                $(this).find("button.slick-next").focus();

            if (e.keyCode === 37) // arrow left
                $(this).find("button.slick-prev").focus();
        });

     }
</script>
