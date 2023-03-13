(function ($, undefined) {
	var _defaults = {
		color: "rgba(255, 255, 255, 0.8)",
		fontawesome: "fa-circle-o-notch fa-3x",
		size: "5%"
	};

    $.LoadingSpin = function (action, container,message) {
		container = $(container);
		if ($(container) != 'undefined' || $(container) != null) {
			switch (action.toLowerCase()) {
				case "show":
					var settings = $.extend(true, {}, _defaults);					
                    Show(container, settings, message);
					break;

				case "hide":
					Hide(container);
					break;
			}
		}

	};

    $.fn.LoadingSpin = function (action, container, message) {
		if ($(container) != 'undefined' || $(container) != null) {
			switch (action.toLowerCase()) {
				case "show":
					var settings = $.extend(true, {}, _defaults);
                    Show(container, settings, message);
					break;

				case "hide":
					Hide(container);
					break;
			}
		}
	}

    function Show(container, settings, message) {
        
		container = $(container);

		var spinDiv = $("<div>",
			{
                class: "loadingSpin",
				css: {
                    "position": "absolute !important",
                    "width": "auto !important",
                    "background-color": settings.color,
                    "display": "table"
				}
			});

        var spinContentDiv = $("<div>",
            {
                css: {
                    "height": "100px",
                    "display": "table-cell",
                    "vertical-align": "middle",
                    "text-align": "center"
                }
            });

        spinContentDiv.appendTo(spinDiv);
        
		var spinIcon = $("<i>",
			{
				class: "col-12 fa fa-spin " + settings.fontawesome
            });

        spinIcon.appendTo(spinContentDiv);
        var br = $("<br>");
        var br2 = $("<br>");
        br.appendTo(spinContentDiv);
        br2.appendTo(spinContentDiv);

        var spinMessage = $("<span>",
            {
                class: "col-12 loadingSpin-text"
            });
        spinMessage.text(message);
        spinMessage.appendTo(spinContentDiv);

		spinDiv.css({
			"position": "fixed",
			"width": '100%',
			"height": '100%',
			"z-index": 800
		});

		container.children(".loadingSpin").remove();
		spinDiv.prependTo(container);
	}

	function Hide(container) {
		container = $(container);
		container.children(".loadingSpin").remove();
	}


}(jQuery));
