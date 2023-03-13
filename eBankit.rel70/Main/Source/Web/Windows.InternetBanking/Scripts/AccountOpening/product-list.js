var eBankit = eBankit || {};
eBankit.productList = eBankit.productList || {};

eBankit.productList.Init = function () {
    $(".product-item").on("click", function (event) {
        event.stopPropagation();
        event.preventDefault();
        var elem = $(this);

        if (elem.hasClass("show-modal-popup")) {
            
            itcore_ui.ShowTopPopupConfirm(eBankit.productList.ConfirmMsg, eBankit.productList.ConfirmTitle, "window.location.href = '" + elem.attr('data-button-redirect') + "'", eBankit.productList.ConfirmButton, eBankit.productList.CancelButton);
            return false;
        }
        window.location.href = elem.attr('data-button-redirect');
    });

    $(".btn-see-more").on("click", function () {
        if (this.classList.contains("expanded")) {
            this.value = eBankit.productList.ShowMoreBtn;
            this.classList.remove("expanded");
        } else {
            this.value = eBankit.productList.ShowLessBtn;
            this.classList.add("expanded");
        }
        var main = $(this).closest(".product-item-container");
        main.find(".collapsed-content").slideToggle();
        main.find(".overlay-product").toggleClass("overlay-active");
        
    });
    $(".product-item").on('keydown', function (e) {
        if (e.keyCode === 13) {
            $(this).click();
        }
    });
};


$(document).ready(function () {
    eBankit.productList.Init();
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(eBankit.productList.Init);
});




