

var eBankit = eBankit || {};
eBankit.ProductSubscription = eBankit.ProductSubscription || {};
if (eBankit.ProductSubscription.Validations == undefined) {
    eBankit.ProductSubscription.Validations = (function () {
        var constants = {
            mainFormSelector: "#aspnetForm",
            dataField: "validate-field",
            dataRequired: "validate-required",
            dataEmail: "validate-email",
            dataDate: "validate-date",
            dataRegex: "validate-regex",
            dataInvalid: "validate-invalid-message",
            dataMinDate: "validate-date-min",
            dataMinDateMessage: "validate-date-min-message",
            dataMaxDate: "validate-date-max",
            dataMaxDateMessage: "validate-date-max-message",
            dataRegexMessage: "validate-regex-message",
            defaultRegex: {
                "CONSTANT_NAME": /^[a-z\u00E0-\u00FC ]+$/i
            },
            actions: {
                continue: 'btn_action_1',
                saveForLater: 'btn_action_4'
            }

        };

        function Load() {
            $.validator.addMethod("validateRegex", function (value, element) {
                var regex = $(element).data(constants.dataRegex);
                if (constants.defaultRegex[regex]) {
                    return constants.defaultRegex[regex].test(value);
                }
                else {
                    return new RegExp(regex).test(value);
                }
            });

            $.validator.addMethod("validateEmail", function (value) {
                return eBankit.Presentation.ValidateEmailExp(value);
            });

            $.validator.addMethod("validateMinDate", function (value, element) {
                return eBankit.Presentation.ValidateMinDate(value, $(element).data(constants.dataMinDate));
            });

            $.validator.addMethod("validateMaxDate", function (value, element) {
                return eBankit.Presentation.ValidateMaxDate(value, $(element).data(constants.dataMaxDate));
            });

            $.validator.addMethod("validateDate", function (value) {
                return eBankit.Presentation.ValidateDateFormatExpV2(value);
            });
        }

        function LoadFormValidations() {
            var options = {
                rules: {},
                messages: {}
            }
            $("[data-validate-field]").each(function () {
                var elem = $(this);
                options.rules[this.name] = {
                    required: typeof elem.data(constants.dataRequired) !== 'undefined',
                    validateEmail: typeof elem.data(constants.dataEmail) !== 'undefined',
                    validateRegex: typeof elem.data(constants.dataRegex) !== 'undefined',
                    validateMinDate: typeof elem.data(constants.dataMinDate) !== 'undefined',
                    validateMaxDate: typeof elem.data(constants.dataMaxDate) !== 'undefined',
                    validateDate: typeof elem.data(constants.dataDate) !== 'undefined'
                };
                options.messages[this.name] = {
                    required: elem.data(constants.dataRequired),
                    validateEmail: elem.data(constants.dataEmail),
                    validateRegex: elem.data(constants.dataRegexMessage),
                    validateMinDate: elem.data(constants.dataMinDateMessage),
                    validateMaxDate: elem.data(constants.dataMaxDateMessage),
                    validateDate: elem.data(constants.dataInvalid)
                };
            });

            $(constants.mainFormSelector).removeData("validator");
            $(constants.mainFormSelector).validate(options);

            $("[data-validate-field].error").each(function () {
                eBankit.Presentation.InsertValidateMsg($(this), InvalidMessage(this));
            });

            $("[data-role='datepicker'] input").each(function () {
                var datepicker = $(this).datepicker();

                datepicker.off("hide").on("hide", function (e) {
                    $(this).focusout();
                });
            });
        }

        function CheckValidationStatus(sender, args) {
            var elem = $(args._postBackElement);

            if (elem.hasClass(constants.actions.continue) || elem.hasClass(constants.actions.saveForLater)) {
                args.set_cancel(!$(constants.mainFormSelector).valid());
            }
        }

        function ValidateForm() {
            $(constants.mainFormSelector).valid();
        }

        function InvalidMessage(elem) {
            elem = $(elem);
            if (elem) {
                return elem.data(constants.dataInvalid);
            }
        }
        function RequiredMessage(elem) {
            elem = $(elem);
            if (elem) {
                return elem.data(constants.dataRequired);
            }
        }

        return {
            Load: Load,
            LoadFormValidations: LoadFormValidations,
            CheckValidationStatus: CheckValidationStatus,
            ValidateForm: ValidateForm,
            InvalidMessage: InvalidMessage,
            RequiredMessage: RequiredMessage
        };
    }());

    $(document).ready(function () {
        eBankit.ProductSubscription.Validations.Load();
        eBankit.ProductSubscription.Validations.LoadFormValidations();

        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_endRequest(function () {
            eBankit.ProductSubscription.Validations.LoadFormValidations();
        });

        prm.add_initializeRequest(eBankit.ProductSubscription.Validations.CheckValidationStatus);

    });
}