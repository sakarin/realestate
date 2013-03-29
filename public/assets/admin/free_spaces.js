
$(function () {
    $("#free_space_check_all").change(function () {
        if ($(this).is(':checked')) {
            $(".free_space_id_checkbox").attr("checked", "checked");
        } else {
            $(".free_space_id_checkbox").removeAttr("checked");
        }
    });
});

