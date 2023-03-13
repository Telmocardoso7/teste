SchedulerControl = {};

SchedulerControl.TooglePanel = function () {

    var ddlEndSchedule = $('[id$=ddlEndSchedule_dlField]');
    var divScheduleSpecific = $('[id$=divScheduleSpecific]');
    var divScheduleEndDate = $('[id$=divScheduleEndDate]');

    if (ddlEndSchedule.val() === '1') {
        divScheduleSpecific.hide();
        divScheduleEndDate.hide();
    }
    else if (ddlEndSchedule.val() === '2') {
        divScheduleSpecific.show();
        divScheduleEndDate.hide();
    }
    else if (ddlEndSchedule.val() === '3') {
        divScheduleSpecific.hide();
        divScheduleEndDate.show();
    }
}

SchedulerControl.ToogleScheduleType = function (divId, divToHideId) {
    var div = $("#" + divId);
    var divToHide = $("#" + divToHideId);
    div.show();
    divToHide.hide();
};

SchedulerControl.ToogleScheduleTypeInner = function (divId, divToHideId) {
    var div = divId;
    var divToHide = divToHideId;
    div.show();
    divToHide.hide();
};



$(document).ready(function () {
    var chbScheduleType = $('[id$=frlScheduleType_tb]');
    var divPermanent = $('[id$=divSchedulePermanent]');
    var divEventual = $('[id$=divScheduleEventual]');
    var id = chbScheduleType.find('input:checked').val(); // selected value

    if (id !== undefined && id === 'P') {
        SchedulerControl.ToogleScheduleTypeInner(divPermanent, divEventual);
    }
    var hdnIsScheduleActive = $('[id$=hdnIsScheduleActive]');
    hdnIsScheduleActive.val(true);

    SchedulerControl.TooglePanel();

    var ddlEndSchedule = $('[id$=ddlEndSchedule_dlField]');

    ddlEndSchedule.change(function () {
        SchedulerControl.TooglePanel();
        SchedulerControl.ValidateDateRange();
    });
    //SchedulerControl.ValidateDateRange();
});


SchedulerControl.EndRequest = function () {
    var chbScheduleType = $('[id$=frlScheduleType_tb]');
    var divPermanent = $('[id$=divSchedulePermanent]');
    var divEventual = $('[id$=divScheduleEventual]');
    var id = chbScheduleType.find('input:checked').val();
    if (id !== undefined && id === 'P') {
        SchedulerControl.ToogleScheduleTypeInner(divPermanent, divEventual);
    }

    SchedulerControl.TooglePanel();
    var ddlEndSchedule = $('[id$=ddlEndSchedule_dlField]');
    ddlEndSchedule.change(function () {
        SchedulerControl.TooglePanel();
    });

    SchedulerControl.ValidateDateRange();

    var $scheduleSpecificNumber = $('[id$=txtScheduleSpecificNumber_txField]');
    if ($scheduleSpecificNumber.length > 0 && $scheduleSpecificNumber !== undefined) {
        $scheduleSpecificNumber.on("input paste", function (e) {
            this.value = this.value.replace(/^[\D]/g, '');
        });


        var validator = $("#aspnetForm").validate();
        $scheduleSpecificNumber.rules("add", { digits: true, min: 1 });
    }
}

var prm = Sys.WebForms.PageRequestManager.getInstance();
prm.add_endRequest(function () {
    SchedulerControl.EndRequest();
});

SchedulerControl.ValidateDateRange = function () {
    var $startDate = $('input[id$=dtPermanentScheduleStartDate_txField]');
    var $endDate = $('input[id$=dtPermanentScheduleEndDate_txField]');
    var $singleDate = $('input[id$=dtSingleScheduleDate_txField]');
    var ddlEndSchedule = $('[id$=ddlEndSchedule_dlField]');

    if ($startDate.val() && $endDate.val()) {

        jQuery.validator.addMethod("EndDateGreater",
            function (value, element, params) {
                var startDate = params[0].datepicker("getDate");
                var endDate = params[1].datepicker("getDate");
                if (params[2].val() == 3) {
                    if (!startDate || !endDate) {
                        return false;
                    } else {
                        return endDate >= startDate;
                    }
                }
                else
                    return true;

            }, top.eBankit.Presentation.GetResource("DateRangeLimits")
        );

        $startDate.rules('add', { EndDateGreater: [$startDate, $endDate, ddlEndSchedule] });
        $endDate.rules('add', { EndDateGreater: [$startDate, $endDate, ddlEndSchedule] });

        $endDate.change(function () {
            $endDate.valid();
            if ($startDate.val()) {
                $startDate.valid();
            }
        });

        $startDate.change(function () {
            $startDate.valid();
            if ($endDate.val()) {
                $endDate.valid();
            }
        });

        ddlEndSchedule.change(function () {
            $startDate.valid();
            if ($endDate.val()) {
                $endDate.valid();
            }
        });
    }

    if ($singleDate.val() !== undefined) {
        $singleDate.change(function () {
            $singleDate.valid();
        });
    }
};