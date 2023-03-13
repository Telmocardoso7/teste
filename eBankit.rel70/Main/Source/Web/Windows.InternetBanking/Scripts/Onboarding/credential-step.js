var eBankit = eBankit || {};
eBankit.Onboarding = eBankit.Onboarding || {};
if (eBankit.Onboarding.Credentials == undefined) {
    eBankit.Onboarding.Credentials = (function () {


        function Init() {
            var txtUserName = $("[id$=txtUsername_txField]");

            if (txtUserName) {
                txtUserName.on("blur", Validate);
                txtUserName.on("keydown", Check);
                txtUserName.on("change", OnChange);
                txtUserName.on("keyup", OnKeyUp);

                var hdnUserNameValid = $("[id$=hdnValidUsername]");
                if (hdnUserNameValid && hdnUserNameValid.val() !== undefined && hdnUserNameValid.val().toUpperCase() === "TRUE") {
                    txtUserName.addClass("valid");
                }
                if (txtUserName.hasClass("error") || txtUserName.hasClass("error")) {
                    txtUserName.focus();
                    txtUserName.val(txtUserName.val());
                }
                else if (txtUserName.hasClass("valid")) {
                    txtUserName.addClass("valid-field");
                    $("[id$=txtPassword_txField]").focus();
                }
            }

            var txtPassword = $("[id$=txtPassword_txField]");
            var txtConfirmPassword = $("[id$=txtConfirmPassword_txField]");

            txtPassword.on("input", ClearPasswordErrors);
            txtConfirmPassword.on("input", ClearPasswordErrors);
            txtPassword.on("change", OnChangePassword);
            txtConfirmPassword.on("change", OnChangePassword);
        };

        function Validate(event) {
            event.stopPropagation();
            var elem = $(this);
            var pattern = new RegExp($("[id$=regexPattern]").val());

            if (elem.hasClass("has-error")) {
                elem.removeClass("valid");
                elem.addClass("error");
            }
            if (pattern.test(elem.val()) && elem.data("changed") === "true") {
                var username = elem.val().replace(" ", "");
                if (username.length > 0) {
                    elem.removeData("changed");
                    var btn = $("[id$=btnVerifyUserName]");
                    __doPostBack(btn.attr("name"), username);
                }
            }
        };

        function Check(event) {
            if (event.keyCode == 32) {
                event.preventDefault();
                return false;
            }
            var pattern = new RegExp($("[id$=regexPattern]").val());
            var txtusername = $("[id$=txtUsername_txField]");
            if (txtusername != null && pattern.test(txtusername.val())) {
                $("label.has-error[id='" + txtusername.attr("id") + "']:visible").hide();
                txtusername.removeClass("has-error error valid valid-field");
            }
        };

        function OnChange() {
            var elem = $(this);
            elem.val(function (i, v) { return v.replace(/ /g, ""); });
            elem.data("changed", "true");
        };

        function OnKeyUp() {
            var elem = $(this);
            var pattern = new RegExp($("[id$=regexPattern]").val());
            if (!pattern.test(elem.val()) && elem.val().length > 0) {
                eBankit.Presentation.InsertValidateMsg(elem, top.eBankit.Presentation.GetResource("ValidationInvalidInputChangeUsernameMessage"));
                elem.removeClass("valid");
                elem.addClass("error");
            }            
            else {
                eBankit.Presentation.RemoveValidateMsg(elem);
            }
        }

        function OnChangePassword() {
            var txtPassword = $("[id$=txtPassword_txField]");
            var txtConfirmPassword = $("[id$=txtConfirmPassword_txField]");

            if (txtPassword.val() && txtConfirmPassword.val() && !(txtPassword.val() === txtConfirmPassword.val())) {
                eBankit.Presentation.InsertValidateMsg(txtConfirmPassword, txtConfirmPassword.data("not-equal-password"));
                txtConfirmPassword.addClass("error").removeClass("valid");
            }
        };

        function ClearPasswordErrors() {
            var txtPassword = $("[id$=txtPassword_txField]");
            var txtConfirmPassword = $("[id$=txtConfirmPassword_txField]");

            eBankit.Presentation.RemoveValidateMsg(txtPassword);
            eBankit.Presentation.RemoveValidateMsg(txtConfirmPassword);
        };

        function ValidateForm() {
            var txtUsername = $("[id$=txtUsername_txField]");
            var hdnUserNameValid = $("[id$=hdnValidUsername]");
            var txtPassword = $("[id$=txtPassword_txField]");
            var txtConfirmPassword = $("[id$=txtConfirmPassword_txField]");

            eBankit.ProductSubscription.Validations.ValidateForm();
            var result = true;

            // Validate username
            result = !txtUsername.hasClass("error") && !txtUsername.hasClass("has-error") && hdnUserNameValid.val().toUpperCase() === "TRUE";

            // Validate password
            result = result // verify if default validations already set an error
                && !txtConfirmPassword.hasClass("error") && !txtConfirmPassword.hasClass("has-error")
                && !txtPassword.hasClass("error") && !txtPassword.hasClass("has-error");

            return result;
        }
        return {
            Init: Init,
            ValidateForm: ValidateForm
        };
    }());


    $(document).ready(function () {
        eBankit.Onboarding.Credentials.Init();
    });
}

$(document).ready(function () {
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_endRequest(function () {
        eBankit.Onboarding.Credentials.Init();
    });
});