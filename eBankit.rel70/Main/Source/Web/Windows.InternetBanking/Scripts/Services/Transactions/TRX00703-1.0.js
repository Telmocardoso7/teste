(function () {

    $(document).ready(function () {
        $('[data-toggle="tooltip"]').tooltip();

        $("img[id*='imgOperationType']").attr("alt", "");

        window.addEventListener('resize', function (event) {
            ResizeIframe();
        }, true);


        function ResizeIframe() {
            var iframe = window.parent.document.querySelector("#PopupMainIframe");

            $(iframe).css({
                height: document.querySelector("form").offsetHeight
            });
        }

        ResizeIframe();
    });

})();


