﻿function CloseModal() {
    event.preventDefault();
    eBankit.window.top.document.location.href = $("[id$=btnCancel]").attr("data-url");
}