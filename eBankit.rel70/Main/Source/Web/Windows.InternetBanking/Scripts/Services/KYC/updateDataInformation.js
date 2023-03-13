$(document).ready(function () {
    jQuery.validator.setDefaults({
        onkeyup: function (element) { $(element).valid() },
        onfocusout: function (element) { $(element).valid(); }
    });

    jQuery('input[id*=txtPhone_txField]').keyup(function () {
        this.value = this.value.replace(/[^0-9]/g, '');
    });

    document.querySelector(".btSaveDataInformation").addEventListener('click', function (event) {
        configureValidate();
        if (!$("#aspnetForm").valid()) {
            event.preventDefault();
            return
        }
    });
});

var configureValid = true;
function configureValidate() {
    if (configureValid) {
        $("[id*=selectCountry]").attr("data-msg-required", $("#resourceRequerid").val() + " " + $("span[id*=selectCountry]").text().replace("*", ""));
        $("[id*=selectCountry]").attr("required", "required");
        $("input[id*=txtPostCode]").attr("required", "required");
        $("input[id*=txtPostCode]").attr("data-msg-required", $("#resourceRequerid").val() + " " + $("span[id*=txtPostCode]").text().replace("*", ""));
        $("input[id*=txtAddressLine1]").attr("required", "required");
        $("input[id*=txtAddressLine1]").attr("data-msg-required", $("#resourceRequerid").val() + " " + $("span[id*=txtAddressLine1]").text().replace("*", ""));
        $("input[id*=txtCity]").attr("required", "required");
        $("input[id*=txtCity]").attr("data-msg-required", $("#resourceRequerid").val() + " " + $("span[id*=txtCity]").text().replace("*", ""));
        $("input[id*=txtPhone]").attr("required", "required");
        $("input[id*=txtPhone]").attr("data-msg-required", $("#resourceRequerid").val() + " " + $("label[id*=txtPhone]").text().replace("*", ""));
        $("input[id*=txtEmail]").attr("required", "required");
        $("input[id*=txtEmail]").attr("data-msg-required", $("#resourceRequerid").val() + " " + $("label[id*=txtEmail]").text().replace("*", ""));
        jQuery.extend(jQuery.validator.messages, {
            email: $("#fieldRequiredEmailJs").val(),
            minlength: $("#fieldRequiredMobileJs").val()
        });

        $("#aspnetForm").validate({
            rules: {
                ctl00$ctl00$MainContent$TransactionMainContent$flwContacts$txtEmail$txField: {
                    required: true,
                    email: true
                },
                ctl00$ctl00$MainContent$TransactionMainContent$flwContacts$txtPhone$txField: {
                    required: true,
                    minlength: 9
                }

            }
        });
    }
    configureValid = false;
}