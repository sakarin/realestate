
$(function () {
    $("#furniture_check_all").change(function () {
        if ($(this).is(':checked')) {
            $(".furniture_id_checkbox").attr("checked", "checked");
        } else {
            $(".furniture_id_checkbox").removeAttr("checked");
        }
    });
});

