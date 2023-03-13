eBankit = eBankit || {};
eBankit.Presentation = eBankit.Presentation || {};
eBankit.Presentation.Dashboard = (function () {
    addLoading = function (container) {

        if (container) {
            container.hide();
            container.after("<div class='loading text-center'><img src='" + loading_image + "' alt='loading' /></div>");
        }
    };

    removeLoading = function (container) {

            
        if (container) {
            container.fadeIn(1000);
            container.next(".loading").html("");
        }
    };

    triggerPostBack = function (elem, params) {

        var container = elem.closest(".dashboard-widget-wrapper");
        var trigger = container.closest(".dashboard-wrapper").find(".dashboard-trigger");

        var data = {
            controlId: container.data("widget-id"),
            path: container.data("widget-path"),
            p1: container.data("widget-p1"),
            p2: container.data("widget-p2"),
            p3: container.data("widget-p3"),
            params: JSON.stringify(params)
        };

        __doPostBack(trigger.attr("name"), JSON.stringify(data));
    };

    loadControl = function (container) {

        if (container.html().length <= 0) {
            addLoading(container);
            return $.ajax({
                cache: false,
                url: "/Security/ControlContainer/ControlContainer.aspx",
                method: "GET",
                data:
                {
                    controlid: container.data("widget-id"),
                    path: container.data("widget-path")
                }
            }).done(function (data) {
                var cleanResult = $().add(data).find(".controlcontainer").html();
                container.html(cleanResult);
            }).always(function () {
                removeLoading(container);
            });
        }
    }; 

    loadControlMovs = function (container) {

        

        if (container.html().length <= 0) {
            addLoading(container);
            return $.ajax({
                cache: false,
                url: "/Security/ControlContainer/ControlContainer.aspx",
                method: "GET",
                data:
                {
                    controlid: container.data("widget-account-id"),
                    path: container.data("widget-path"),
                    p1: container.data("widget-p1"),
                    p2: container.data("widget-p2"),
                    p3: container.data("widget-p3")
                }
            }).done(function (data) {
                var cleanResult = $().add(data).find(".controlcontainer").html();
                container.html(cleanResult);
            }).always(function () {
                removeLoading(container);
            });
        }
    };

    loadControlAssoc = function (container) {



        if (container.html().length <= 0) {
            addLoading(container);
            return $.ajax({
                cache: false,
                url: "/Security/ControlContainer/ControlContainer.aspx",
                method: "GET",
                data:
                {
                    controlid: container.data("widget-assoc-id"),
                    path: container.data("widget-path"),
                    p1: container.data("widget-p1"),
                    p2: container.data("widget-p2"),
                    p3: container.data("widget-p3")
                }
            }).done(function (data) {
                var cleanResult = $().add(data).find(".controlcontainer").html();
                container.html(cleanResult);
            }).always(function () {
                removeLoading(container);
            });
        }
    };

    return {
        addLoading: addLoading,
        removeLoading: removeLoading,
        triggerPostBack: triggerPostBack,
        loadControl: loadControl,
        loadControlMovs: loadControlMovs,
        loadControlAssoc: loadControlAssoc
    };
})();

$(document).ready(function () {
    $("[data-widget-id]").each(function (index) {
        eBankit.Presentation.Dashboard.loadControl($(this));
    });
    
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        $("[data-widget-id]").each(function (index) {

                     
                eBankit.Presentation.Dashboard.loadControl($(this));
            
            
        });
    });
});