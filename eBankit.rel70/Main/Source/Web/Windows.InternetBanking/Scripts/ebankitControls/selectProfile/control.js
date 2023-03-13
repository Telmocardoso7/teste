var selectProfileControl = selectProfileControl || {};

selectProfileControl.searchValue = function (label, valuesArray) {
    for (var i = 0; i < valuesArray.length; i++) {
        if (valuesArray[i].startsWith(label)) {
            return true;
        }
    }
    return false;
};

selectProfileControl.replaceSpecialCharacters = function (str) {
    str = str.replace(/[àáâãäå]/g, "a");
    str = str.replace(/[èéê]/g, "e");
    str = str.replace(/[ìíî]/g, "i");
    str = str.replace(/[òóôõ]/g, "o");
    str = str.replace(/[ùúû]/g, "u");
    return str;
};

selectProfileControl.validateButton = function () {
    var container = $(".profile-control-container");
    var selectedProfile = container.find(".profile-slider-item.active");
    if (selectedProfile.length != 0) {
        var contractNumber = selectedProfile.find('[id*="ContractId"]')[0].textContent;
        __doPostBack('btnSelect', contractNumber);
        return false;
    }
    container.find(".ValidationMessage").show();
    return false;
};

selectProfileControl.init = function () {
    var container = $(".profile-control-container");
    container.find(".search-bar-container input").val('');
    container.find('.profile-slider-container').css("visibility", "visible");
    container.find('.profile-slider-container').css("height", "auto");

    $(".profile-slider-container").attr("dir", document.currentCultureDirection);

    var sliderContainer = $('.profile-slider-slick');
    if (sliderContainer.length > 0) {
        sliderContainer.slick({
            rtl: document.currentCultureDirection ? true : false,
            infinite: false,
            slidesToShow: 3,
            slidesToScroll: 2,
            accessibility: true,
            nextArrow: "<a class='bx-next slick-next' href='' aria-label='Next'></a>",
            prevArrow: "<a class='bx-prev slick-prev' href='' aria-label='Previous'></a>"
        });

        sliderContainer.on('afterChange', function () {
            if ($(".slick-prev").attr("aria-disabled") === "true")
                $(".slick-next").focus();

            if ($(".slick-next").attr("aria-disabled") === "true")
                $(".slick-prev").focus();
        });

        sliderContainer.on('keyup', function (e) {
            if (e.keyCode === 39)//arrowright
                $(".slick-next").focus();

            if (e.keyCode === 37) // arrow left
                $(".slick-prev").focus();
        });
    }

    container.find(".search-clear-icon").on("click keypress", function () {
        container.find(".search-bar-container input").val('');
        container.find(" .search-icon").show();
        $(this).hide();
        container.find(".profile-list-container").show();
        container.find(".output-message").hide();
    });

    container.find(".profile-slider-item").on("click keypress", function () {
        container.find(".profile-slider-item").removeClass("active");
        container.find(".ValidationMessage").hide();
        $(this).addClass("active");

    });

    container.find(".search-bar-container input").on("keyup", function () {
        var searchBar = $(this);

        if (searchBar.val().length > 0) {
            var countHidden = 0;
            container.find(".search-icon").hide();
            container.find(".search-clear-icon").show();
            container.find(".item-link").each(function () {
                var checkFind = false;
                var labelWords = selectProfileControl.replaceSpecialCharacters(this.innerHTML.toLowerCase()).split(" ");
                var valuesWords = selectProfileControl.replaceSpecialCharacters(searchBar.val().toLowerCase()).split(" ");
                valuesWords = $.grep(valuesWords, function (elem) { return elem.length > 0 });
                for (var i = 0; i < valuesWords.length; i++) {
                    if (!selectProfileControl.searchValue(valuesWords[i], labelWords)) {
                        checkFind = false;
                        break;
                    }
                    else {
                        checkFind = true;
                    }
                }
                if (!checkFind) {
                    $(this).closest(".profile-list-container").hide();
                    countHidden++;
                }
                else {
                    $(this).closest(".profile-list-container").show();
                    container.find(".output-message").hide();
                }

            });
            if (container.find(".item-link").length == countHidden) {
                container.find(".output-message").show();
            }
        }
        else {
            container.find(".search-icon").show();
            container.find(".search-clear-icon").hide();
            container.find(".profile-list-container").show();
            container.find(".output-message").hide();
        }
    });
    container.find("img").attr("alt", "");
};


selectProfileControl.btnProfileKeydownHandler = function (elem, event) { 
    if (event.keyCode === 32) {
        event.preventDefault();
    }
    else if (event.keyCode === 13) {
        event.preventDefault();
        selectProfileControl.btnProfileActivate(elem);
    }
}

selectProfileControl.btnProfileKeyupHandler = function (elem, event) { 
    if (event.keyCode === 32) {
        event.preventDefault();
        selectProfileControl.btnProfileActivate(elem);
    }
}

selectProfileControl.btnProfileActivate = function (elem) { 
    $(elem).find('div > a[id*=btnProfile]')[0].click();
}