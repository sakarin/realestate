
$(function () {
    $("#unit_feature_check_all").change(function () {
        if ($(this).is(':checked')) {
            $(".unit_feature_id_checkbox").attr("checked", "checked");
        } else {
            $(".unit_feature_id_checkbox").removeAttr("checked");
        }
    });
});

