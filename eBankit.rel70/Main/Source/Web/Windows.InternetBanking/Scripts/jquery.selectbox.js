jQuery.fn.extend({

	selectbox: function (options) {

		return this.each(function () {

			new jQuery.SelectBox(this, options);

		});

	}

});

jQuery.fn.extend({

	selectbox_v2: function (options) {

		return this.each(function () {

			new jQuery.SelectBox_v2(this, options);

		});

	}

});



jQuery.SelectBox = function (selectobj, options) {

	options = jQuery.extend({
		disponivel: "Disponivel",
		autorizado: "Autorizado",
		auxiliar1: ""
	}, options);

	var opt = options || {};

	opt.inputClass = opt.inputClass || "selectbox";

	opt.containerClass = opt.containerClass || "selectbox-wrapper";

	opt.hoverClass = opt.hoverClass || "current";
	opt.currentClass = opt.selectedClass || "selected-option";

	opt.debug = opt.debug || false;


	var elm_id = selectobj.id;

	var active = -1;

	var inFocus = false;

	var hasfocus = 0;

	//jquery object for select element

	var $select = $(selectobj);

	// jquery container object

	var $container = setupContainer(opt);

	//jquery input object 

	var $input = setupInput(opt);

	// hide select and append newly created elements

	$select.hide().before($input).before($container);




	init();



	$input

	.click(function () {

		if (!inFocus) {

			$container.toggle();

		}

	})

	.focus(function () {

		if ($container.not(':visible')) {

			inFocus = true;

			$container.show();

		}

	})

	.keydown(function (event) {

		switch (event.keyCode) {

			case 38: // up

				event.preventDefault();

				moveSelect(-1);

				break;

			case 40: // down

				event.preventDefault();

				moveSelect(1);

				break;

				//case 9:  // tab                 

			case 13: // return

				event.preventDefault(); // seems not working in mac !
				$('li.' + opt.hoverClass).trigger('click');

				break;
			case 27, 9: //escape
				hideMe();
				break;

		}

	})

	.blur(function () {



	});

	$("li", $container).children('a').keydown(function (event) {

		switch (event.keyCode) {

			case 38: // up

				event.preventDefault();

				moveSelect(-1);

				break;

			case 40: // down

				event.preventDefault();

				moveSelect(1);

				break;

			//case 9:  // tab                 

			case 13: // return

				event.preventDefault(); // seems not working in mac !
				$('li.' + opt.hoverClass).trigger('click');

				break;
			case 27, 9: //escape
				hideMe();
				break;

		}

	});



	function hideMe() {

		hasfocus = 0;

		$container.hide();

	}



	function init() {

		$container.append(getSelectOptions($input.attr('id'))).hide();
		//        var width = $input.css('width');

		//        $container.width(width);

	}



	function setupContainer(options) {

		var container = document.createElement("div");

		$container = $(container);

		$container.attr('id', elm_id + '_container');

		$container.addClass(options.containerClass);



		return $container;

	}



	function setupInput(options) {

		var input = document.createElement("input");

		var $input = $(input);

		$input.attr("id", elm_id + "_input");

		$input.attr("type", "text");

		$input.addClass(options.inputClass);

		$input.attr("autocomplete", "off");

		var labelID = $("label[for='" + elm_id + "']").attr('id');
		if (labelID.length > 0) //if showlabel == true
			$input.attr("aria-labelledby", labelID);
		else
			$input.attr("aria-label", $select.attr("aria-label"));

		$input.attr("readonly", "readonly");

		$input.attr("tabIndex", $select.attr("tabindex")); // "I" capital is important for ie



		return $input;

	}



	function moveSelect(step) {

		var lis = $("li", $container);

		if (!lis) return;



		active += step;



		if (active < 0) {

			active = 0;

		} else if (active >= lis.length) {

			active = lis.length - 1;

		}



		lis.removeClass(opt.hoverClass);



		$(lis[active]).addClass(opt.hoverClass);
		$(lis[active]).children('a').focus();

	}

	function truncateString(str, length) {
		return str.length > length ? str.substring(0, length - 3) + '...' : str
	}


	function setCurrent() {
		var li = $("li." + opt.currentClass, $container).get(0);
        //var str = $(".selected-option span:first").html().replace(/(<.*?>)/ig, ";").replace("&lt", "<").replace("&gt", ">").replace("&amp", "&");
        var acc = $(".selected-option .acc").text();
        var numb = $(".selected-option .numb").text();
		var ar = ('' + li.id).split('_');
        var el = ar[ar.length - 1];
		$select.val(el);
		$select.trigger("change");
        $input.val(acc.substring(0, (acc.length - numb.length)) + " - " + numb);
		//$input.val(truncateString(str.split(';')[0], 50) + " - \u200E" + str.split(';')[1]);
		return true;
	}


	function setCurrentFid() {

		var li = $("li." + opt.currentClass, $container).get(0);
		var str = $("#" + li.id + " span:first").html().replace(/(<.*?>)/ig, ";");
		var ar = ('' + li.id).split('_');

		var el = ar[ar.length - 1];

		$select.val(el);

		$input.val(str.split(';')[0]);

		return true;

	}


	// select value

	function getCurrentSelected() {

		return $select.val();

	}



	// input value

	function getCurrentValue() {

		return $input.val();

	}



	function getSelectOptions(parentid) {
		var select_options = new Array();

		var ul = document.createElement('ul');

		//var lid = document.createElement('li');
		//lid.setAttribute('id', parentid + '_0');

		//if (options.auxiliar1 != "")
		//    lid.innerHTML = "<span class=\"acl tit\">" + options.auxiliar1 + "</span><span class=\"sl tit\">" + options.disponivel + "</span><span class=\"scs tit\">" + options.autorizado + "</span>";
		//else
		//    lid.innerHTML = "<span class=\"acc tit\"></span><span class=\"sd tit\">" + options.disponivel + "</span><span class=\"sc tit\">" + options.autorizado + "</span>";

		//ul.appendChild(lid);

		$select.children('option').each(function (index) {
			var elem = $(this);
			if (index == 0 && elem.is(':selected')) {
				$input.val(elem.text());
			}
			else if (elem.attr("acl") != undefined) {

				var li = document.createElement('li');
				li.setAttribute('id', parentid + '_' + elem.val());

				li.innerHTML = "<a tabindex=\"-1\" href=\"#\"><span class=\"acl\">" + elem.attr("acl") + "</span><span class=\"sl\">" + elem.attr("sl") + "<span class=\"numb\">" + elem.attr("aux1") + "</span></span></a>";


				if (elem.is(':selected')) {

					$input.val(elem.attr("acc"));

					$(li).addClass(opt.currentClass);

				}

				ul.appendChild(li);
			}
			else if (elem.attr("acc") != undefined) {

				var li = document.createElement('li');
				li.setAttribute('id', parentid + '_' + elem.val());

				li.innerHTML = "<a tabindex=\"-1\"  href=\"#\"><span class=\"acc\">" + elem.attr("acc") + "<span class=\"numb\">" + elem.attr("acn") + "</span></span><span class=\"sd\">" + elem.attr("sd") + "</span></a>";


				if (elem.is(':selected')) {

					if (elem.attr("acn") != undefined)
						$input.val(elem.attr("acc") + " - \u200E" + elem.attr("acn"));
					else
						$input.val($elem.attr("acc"));

					$(li).addClass(opt.currentClass);

				}

				ul.appendChild(li);
			}
			$(li)

			.mouseover(function (event) {

				hasfocus = 1;

				if (opt.debug) console.log('over on : ' + this.id);

				//jQuery(event.target, $container).addClass(opt.hoverClass);

			})

			.mouseout(function (event) {

				hasfocus = -1;

				if (opt.debug) console.log('out on : ' + this.id);

				//jQuery(event.target, $container).removeClass(opt.hoverClass);

			})

			.click(function (event) {
				var fl = $('li.' + opt.hoverClass, $container).get(0);

				if (opt.debug) console.log('click on :' + this.id);
				$('li.' + opt.currentClass).removeClass(opt.currentClass);

				$(this).addClass(opt.currentClass);

				if (opt.auxiliar1 == "")
					setCurrent();
				else if (opt.auxiliar1 != "")
					setCurrentFid();

				hideMe();

			});

		});

		return ul;

	}
	$(document).on("click", function (e) {

		if (!($container.closest(".centerField-wrapper"))[0].contains(e.target)) {
			hideMe();
		}
	});


};

jQuery.SelectBox_v2 = function (selectobj, options) {

	options = jQuery.extend({
		disponivel: "asha",
		autorizado: "asfj",
		auxiliar1: ""
	}, options);

	var opt = options || {};

	opt.inputClass = opt.inputClass || "selectbox_v2";

	opt.containerClass = opt.containerClass || "selectbox-wrapper selectbox-wrapper_v2";

	opt.hoverClass = opt.hoverClass || "current";
	opt.currentClass = opt.selectedClass || "selected-option"

	opt.debug = opt.debug || false;


	var elm_id = selectobj.id;

	var active = -1;

	var inFocus = false;

	var hasfocus = 0;

	//jquery object for select element

	var $select = $(selectobj);

	// jquery container object

	var $container = setupContainer(opt);

	//jquery input object 

	var $input = setupInput(opt);

	// hide select and append newly created elements

	$select.hide().before($input).before($container);




	init();



	$input

	.click(function () {

		if (!inFocus) {

			$container.toggle();

		}

	})

	.focus(function () {

		if ($container.not(':visible')) {

			inFocus = true;

			$container.show();

		}

	})

	.keydown(function (event) {

		switch (event.keyCode) {

			case 38: // up

				event.preventDefault();

				moveSelect(-1);

				break;

			case 40: // down

				event.preventDefault();

				moveSelect(1);

				break;

				//case 9:  // tab                 

			case 13: // return

				event.preventDefault(); // seems not working in mac !
				$('li.' + opt.hoverClass).trigger('click');

				break;
			case 27, 9: //escape
				hideMe();
				break;

		}

	})

	.blur(function () {



	});





	function hideMe() {

		hasfocus = 0;

		$container.hide();

	}



	function init() {

		$container.append(getSelectOptions($input.attr('id'))).hide();
		//        var width = $input.css('width');

		//        $container.width(width);

		$("li", $container).children('a').keydown(function (event) {

			switch (event.keyCode) {

				case 38: // up

					event.preventDefault();

					moveSelect(-1);

					break;

				case 40: // down

					event.preventDefault();

					moveSelect(1);

					break;

				//case 9:  // tab                 

				case 13: // return

					event.preventDefault(); // seems not working in mac !
					$('li.' + opt.hoverClass).trigger('click');

					break;
				case 27, 9: //escape
					hideMe();
					break;

			}

		});

	}



	function setupContainer(options) {

		var container = document.createElement("div");

		$container = $(container);

		$container.attr('id', elm_id + '_container');

		$container.addClass(options.containerClass);



		return $container;

	}



	function setupInput(options) {

		var input = document.createElement("input");

		var $input = $(input);

		$input.attr("id", elm_id + "_input");

		$input.attr("type", "text");

		$input.addClass(options.inputClass);

		$input.attr("autocomplete", "off");

		$input.attr("readonly", "readonly");

		$input.attr("tabIndex", $select.attr("tabindex")); // "I" capital is important for ie



		return $input;

	}



	function moveSelect(step) {

		var lis = $("li", $container);

		if (!lis) return;



		active += step;



		if (active < 0) {

			active = 0;

		} else if (active >= lis.length) {

			active = lis.length - 1;

		}



		lis.removeClass(opt.hoverClass);



		$(lis[active]).addClass(opt.hoverClass);
		$(lis[active]).children('a').focus();

	}



	function setCurrent() {

		var li = $("li." + opt.currentClass, $container).get(0);
		var str = $(".selected-option span:first").html().replace(/(<.*?>)/ig, ";");
		var ar = ('' + li.id).split('_');

		var el = ar[ar.length - 1];

		$select.val(el);
		$select.trigger("change");

		$input.val(el);

		return true;

	}


	function setCurrentFid() {

		var li = $("li." + opt.currentClass, $container).get(0);
		var str = $("#" + li.id + " span:first").html().replace(/(<.*?>)/ig, ";");
		var ar = ('' + li.id).split('_');

		var el = ar[ar.length - 1];

		$select.val(el);

		$input.val(str.split(';')[0]);

		return true;

	}


	// select value

	function getCurrentSelected() {

		return $select.val();

	}



	// input value

	function getCurrentValue() {

		return $input.val();

	}



	function getSelectOptions(parentid) {

		var select_options = new Array();

		var ul = document.createElement('ul');

		//var lid = document.createElement('li');
		//lid.setAttribute('id', parentid + '_0');

		//if (options.auxiliar1 != "")
		//    lid.innerHTML = "<span class=\"acl tit\">" + options.auxiliar1 + "</span><span class=\"sl tit\">" + options.disponivel + "</span><span class=\"scs tit\">" + options.autorizado + "</span>";
		//else
		//    lid.innerHTML = "<span class=\"acc tit\"></span><span class=\"sd tit\">" + options.disponivel + "</span><span class=\"sc tit\">" + options.autorizado + "</span>";

		//ul.appendChild(lid);

		$select.children('option').each(function () {
			if ($(this).attr("acl") != undefined) {

				var li = document.createElement('li');
				li.setAttribute('id', parentid + '_' + $(this).val());

				li.innerHTML = "<a tabindex=\"-1\" href=\"#\"><span class=\"acl\">" + elem.attr("acl") + "</span><span class=\"sl\">" + elem.attr("sl") + "<span class=\"numb\">" + elem.attr("aux1") + "</span></span></a>";


				if ($(this).is(':selected')) {

					$input.val($(this).attr("acc"));
					
					$(li).addClass(opt.currentClass);

				}

				ul.appendChild(li);
			}
			else if ($(this).attr("acc") != undefined) {

				var li = document.createElement('li');
				li.setAttribute('id', parentid + '_' + $(this).val());

				li.innerHTML = "<a tabindex=\"-1\"  href=\"#\"><span class=\"acc\">" + $(this).attr("acc") + "</span></a>";


				if ($(this).is(':selected')) {

					$input.val($(this).attr("acc"));

					$(li).addClass(opt.currentClass);

				}

				ul.appendChild(li);
			}
			$(li)

			.mouseover(function (event) {

				hasfocus = 1;

				if (opt.debug) console.log('over on : ' + this.id);

				//jQuery(event.target, $container).addClass(opt.hoverClass);

			})

			.mouseout(function (event) {

				hasfocus = -1;

				if (opt.debug) console.log('out on : ' + this.id);

				//jQuery(event.target, $container).removeClass(opt.hoverClass);

			})

			.click(function (event) {
				var fl = $('li.' + opt.hoverClass, $container).get(0);

				if (opt.debug) console.log('click on :' + this.id);
				$('li.' + opt.currentClass).removeClass(opt.currentClass);

				$(this).addClass(opt.currentClass);

				if (opt.auxiliar1 == "")
					setCurrent();
				else if (opt.auxiliar1 != "")
					setCurrentFid();

				hideMe();

			});

		});

		return ul;

	}
	$(document).on("click", function (e) {

		if (!($container.closest(".centerField-wrapper"))[0].contains(e.target)) {
			hideMe();
		}
	});



};
